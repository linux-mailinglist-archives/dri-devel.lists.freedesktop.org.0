Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42DAC9685
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 22:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC3A10E22B;
	Fri, 30 May 2025 20:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZxLVRXoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356010E1A5;
 Fri, 30 May 2025 20:26:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3108652400cso318525a91.1; 
 Fri, 30 May 2025 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748636769; x=1749241569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flpFqUKLM2wJe1GS/z/DSdiWKrIaoRvufNvuehZ0Jt8=;
 b=ZxLVRXoopl3sMU4RGELWiq2rWP0moG2+EjnlkoOCU5ebrWHqGB2GrYJv03iNzycoyR
 hm9ry3m9AjeP9tG9Phn5uKbmFCs+tsdxWc+mIzhDsowjtIl+mlIB6YLqtHg91t/i/Jyu
 ar7aWheI9D161tZJakNbEJXXbpHv0kfL7TDdBbGUU7zYRxVMlOAp9Wsqgp+0Q5mkWT9j
 iAL6zf+Hr3AA1E7bbuFXhOBqy83Qhz4uOoom1AYwpJw3XmcyuDer5/mpuZk01Ct/leJB
 nl8rRIAyDq53hJ1k7uTrGLR7JCcwlkOeR8DIiC5NWnSZdzbE+yuiydO+KU/sI0eG3cz+
 /gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748636769; x=1749241569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flpFqUKLM2wJe1GS/z/DSdiWKrIaoRvufNvuehZ0Jt8=;
 b=oLugx40ul6nKvtTp/Dwb083zPWQ/liJzssl2i582qJLyNS6prrPHMJmuMYmdB0BQpc
 TsS0n0x9q0lh3RFiJICOKDse9KbGMKs1OSeJ0Uzm4D2YKyiF2sGcsRixPC3LwQlsA0hd
 GP5rD9NOiICln2yKb6o6TJeez6vZ8ogk2cr4sUzMuT3SMLgr/EfgzF0vgZPm5rnYk3Kn
 JhB4eNhTBQdiNtH/yKUgkQPl5aMVRt/Cmo+gFulVj8ahFtU4aY5/3Octqs9Owo5b7oRs
 ANRHgEGvaPnLCYEtbXxOBXfUrvGA7gIzzNurqAyjdkTZbQe69BP9DvRkJjITiUvCp0gx
 uV/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/UgUplcwzO94TFi+CAhYd7IPWw2/zys5Cyx+24X2uo6DtZl1SXsLvhfDhj3IVyTKkp7ac+zZQ@lists.freedesktop.org,
 AJvYcCXrGxLFK/LIPkeUWk5evoKV14E/7tKrvgitfUu70OJxVftIkIyUF4gqAJnLNWGo8J0Z104s3faP14A1@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws2QBi9A2Wnvp+r17WHV8owXcKWtJXxEEoQw0vLSJrS4FxoiUE
 8sc+rmvBcwNFvMChJNPNh2GvWlbwhHgUCpedA2ijtqhVbsioo9g9FNaoBCvVu9zS/Y6RaXo5uhc
 oNEgFr+ufW8iXIVW+o4porsG1MrHWHbYiHQ==
X-Gm-Gg: ASbGnct93YA1twujMv8x+/fcreCGJWqe1c0fj12wyFIliyGLOw+oSzzd/xnBiMQE2oB
 UTjZD6/FhzmQnG1Y8Bf+vPQ/w2xi/kJPF8NNDA1IRtzr9mA9tYBu6xDTiZvPYfKbm++GvZer/+a
 Y05yo/WyfVJSsmfcQkPccABcKhU4eeQmE/CQ==
X-Google-Smtp-Source: AGHT+IEEqPFu27tVsd7CtGRfMimvE7u2d+i+Pguv/eM7ydzb+2Us3v27PrZ0A03GNiTjSfTVnWdUAAi2kFrQWEya3d4=
X-Received: by 2002:a17:90b:3146:b0:312:1e41:3a51 with SMTP id
 98e67ed59e1d1-3124d37bf8amr2073130a91.1.1748636769243; Fri, 30 May 2025
 13:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
 <01100196f7d63f35-a7b596e2-fbb8-49e5-8645-e67ca6a0048d-000000@eu-north-1.amazonses.com>
 <CABH-8xdDjLv9c+E7OdTFjtoEHT5Q2-oQGouOpygi_5c-W3cyvQ@mail.gmail.com>
 <01100196f7e25204-35c40c23-8070-4aaf-ae45-7ac2625cbf90-000000@eu-north-1.amazonses.com>
 <CABH-8xd1Nr1PpsPJnoNsur1LEEhphX6+WzKE14rc-ub_N7eS7Q@mail.gmail.com>
 <01100196f7f553bc-1cd7e537-430c-4138-b447-c432eaf77f33-000000@eu-north-1.amazonses.com>
In-Reply-To: <01100196f7f553bc-1cd7e537-430c-4138-b447-c432eaf77f33-000000@eu-north-1.amazonses.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 16:25:56 -0400
X-Gm-Features: AX0GCFvUnAZ0vEU5pkcJxa6-8TptnB2D8YLYla7QmAUozo4lsFTFp0cRX02Ox1g
Message-ID: <CADnq5_MbwMv1Hr6+N-SLK9WtGCyzsRquaPZa0JxreL5ssuoHMw@mail.gmail.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: Ozgur Kara <ozgur@goosey.org>
Cc: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Tao Zhou <tao.zhou1@amd.com>,
 Yan Zhen <yanzhen@vivo.com>, Greg KH <gregkh@linuxfoundation.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 22, 2025 at 8:39=E2=80=AFAM Ozgur Kara <ozgur@goosey.org> wrote=
:
>
> Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 15:15 tarihinde =C5=9F=
unu yazd=C4=B1:
> >
> > I'm using dual monitors. I disconnected the HDMI to test with a single
> > screen, but the result was the same. I also swapped the HDMI ports,
> > but the issue still persisted.
> > I'm not using DisplayPort =E2=80=94 in fact, it's a bit weird: I conver=
t VGA
> > to HDMI and connect it to the graphics card. I'm not an expert of
> > course, but since there were no issues on the LTS kernel and the
> > problems started with kernels after 6.7, it made me think it might be
> > a kernel issue.
> > If needed, I=E2=80=99ll set dpm=3D0 when I install (i don't know when) =
Linux
> > again and test it.
> > If I remember correctly, when I added amdgpu.dc=3D0 to GRUB, nothing
> > changed =E2=80=94 the system still froze after GRUB.
> >
>
> Hello,
>
> i suspect this is related to latest patch rather than a kernel bug so
> i will add Aurabindo because you may be affected after cfb2d41831ee
> commit.
> first of all, is there any chance you can revert this commit and test ker=
nel?
>
> $ git revert cfb2d41831ee

That patch has been reverted (it's included in my -fixes PR this
week), but we are in the middle of the merge window so it may take a
bit for the revert to land and make its way back to stable.

Alex

>
> So after commit, dmcub ring calls became much higher and some power
> states became unstable i dont know i'm not expert but  these usually
> have to do with things like dmcub firmware and  power gating (gfxoff)
> or post-reset ring buffer access.
> maybe this commit is that  vmin/vmax update call may now be made much
> more frequently and this may cause dmcub to not synchronize properly
> some power states to become unstable or firmware to crash.
>
> we might need to look at the contents of
> /sys/module/amdgpu/parameters/force_vmin_vmax_update but  vmin vmax
> potential call height might be giving an error.
>
> So I added Aurabindo Pillai, should have added you after 3 different
> bug reports.
>
> Regards
>
> Ozgur
>
>
> > On Thu, May 22, 2025 at 3:05=E2=80=AFPM Ozgur Kara <ozgur@goosey.org> w=
rote:
> > >
> > > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:58 tarihinde =
=C5=9Funu yazd=C4=B1:
> > > >
> > > > Hey, thanks for the reply, but I don't use Linux anymore, so I can'=
t
> > > > provide any logs or test it further. Also, FYI, this bug has been
> > > > around since kernel v6.7. If I install Linux again soon, I'll try t=
o
> > > > test it. Could you please advise what I should do about amdgpu.dpm?
> > > > Should it stay at 0 or be set to 1? When I try booting with 1, the =
PC
> > > > freezes right after the grub screen. I've used Linux for 2-3 months
> > > > but still don=E2=80=99t really know how to debug these kinds of err=
ors
> > > > properly. Thanks!
> > > >
> > >
> > > Hello,
> > >
> > > not problem maybe we should talk about this separately but kernel
> > > lists are progressing complicated with too many development patch
> > > content that is not very suitable for this.
> > > we can also see it as a problem with kernel, gpus or amd company and
> > > too many firmware and drivers.
> > >
> > > if it is hardware based especially gpu related, kernel doesnt
> > > intervene fully at this point.
> > > the system can be opened with amdgpu.dpm=3D0 but this is not correct =
and
> > > you did a very good job reporting it.
> > > maybe by adding amdgpu.dc=3D0 the display core is disabled but this
> > > prevents you from getting 144 mhz.
> > >
> > > we should make sure that there is the correct firmware under
> > > /lib/firmware/amdgpu.
> > > did you use DisplayPort and did you get 144 mhz output?
> > >
> > > $ journalctl -b -1 will give you some information.
> > > $ glxinfo | grep OpenGL can also give you the problem or error.
> > >
> > > So kernel developers and AMD developers should look into this issue
> > > but i think it is most likely a firmware blockage on the AMD side not
> > > a kernel side.
> > >
> > > Regards
> > >
> > > Ozgur
> > >
> > > > On Thu, May 22, 2025 at 2:52=E2=80=AFPM Ozgur Kara <ozgur@goosey.or=
g> wrote:
> > > > >
> > > > > Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:27 tarihind=
e =C5=9Funu yazd=C4=B1:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > did you get a message in dmesg from kernel, for example an error =
like this?
> > > > >
> > > > > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1106268
> > > > >
> > > > > The dmesg command will give you an output maybe journalctl output=
 or
> > > > > mesa (glxinfo) output would also be sufficient because we need to=
 know
> > > > > which upstream it is affected by.
> > > > > and thanks for report.
> > > > >
> > > > > Note: because there are two similar errors i added the necessary
> > > > > maintainers for upstream.
> > > > >
> > > > > Regards
> > > > >
> > > > > Ozgur
> > > > >
> > > > > > I'm experiencing a critical issue on my system with an AMD RX 4=
70 GPU.
> > > > > > When booting with recent kernel versions (6.7.x or newer), the =
system
> > > > > > fails to boot properly unless I explicitly disable Dynamic Powe=
r
> > > > > > Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
> > > > > >
> > > > > > When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's th=
e
> > > > > > default), the system either freezes during early boot or fails =
to
> > > > > > initialize the display. However, using the LTS kernel (6.6.x),
> > > > > > everything works as expected with DPM enabled.
> > > > > >
> > > > > > This seems to be a regression introduced in kernel 6.7 or later=
, and
> > > > > > it specifically affects older GCN4 (Polaris) GPUs like the RX 4=
70.
> > > > > > Disabling DPM allows the system to boot, but significantly redu=
ces GPU
> > > > > > performance.
> > > > > >
> > > > > > Things I=E2=80=99ve tried:
> > > > > > - Confirmed that the latest `linux-firmware` is installed.
> > > > > > - Verified correct firmware files exist under `/lib/firmware/am=
dgpu/`.
> > > > > > - Tested multiple kernels (mainline and LTS).
> > > > > > - Using Mesa with ACO (Radeon open driver stack).
> > > > > > - System boots fine with LTS kernel (6.6.x) + DPM enabled.
> > > > > >
> > > > > > System info:
> > > > > > - GPU: AMD RX 470 (GCN 4 / Polaris)
> > > > > > - Distro: Arch Linux
> > > > > > - Kernel (working): linux-lts 6.6.x
> > > > > > - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
> > > > > >
> > > > > > Thanks in advance,
> > > > > > Durmus Ozaltay
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
> >
> >
