Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C7228D12
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 02:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1012E6E135;
	Wed, 22 Jul 2020 00:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAF16E135
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 00:22:46 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u25so333990lfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 17:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bke+YfNGh2lqCQicsEXGSXnWzyR5TAW3UW4d27SxP1I=;
 b=iOcAVQzGby684J9yNtMEzC1fK+tJPsn/klPfhATFG1CUkYZqQZRl4Wna+I8pUZIJ3B
 XYSXqd00Dj4jib2TPffmzVM5jqiVqTdgZ/SqjRZDhGJAwGBL8YxEH3CyDvttJP3/5sKY
 swmbPI2jcNqpxVraVkEJCcYatA3b1j8jZhTBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bke+YfNGh2lqCQicsEXGSXnWzyR5TAW3UW4d27SxP1I=;
 b=GnM0C9csqgpUlUdcJsUz4S5V8jGQmPLbYWDVvknUKATXgXveTyJ97xig9+EoqeY0Mu
 E8+eu9Mwsy7qpcLAPzrnr1Cc2L2rkPBQLwMsD+mraZkom8tdff9YG4d1vBnuV6aZw7Xr
 C3BgZ8nQ1tTmOqFP8xmvgcSoliBFou2RtgXhM4naG6Z+x1afzn3iIoIG3BX4pl6bpNZq
 d8A4EwaJUnHTl35RoipmJb/gON94Ptr89Z5EPhQ8P14F1T8m+9UpAS4b14JmYr6IaN38
 kvLpOPLOw15S753mslUVTkHoaqR0AyF4afEsXwXhdGDVCt8VYe6x2sH1BjtDOW8bP0pB
 Gm3A==
X-Gm-Message-State: AOAM532BZGUr/o8wp8RvT9ki7BF4kewlRfJLesykI8n+fTKPh5LywdAS
 iZvRgkSrzYo4zE5qsxmJByDAmA4oDPs=
X-Google-Smtp-Source: ABdhPJwaZqdmd4nnRS8gIQlXJPs5OKRZl0mEgkhDiSaGwp3lTRTDj/ghncxirgRuEafQ9d3utY8j6Q==
X-Received: by 2002:a19:a8f:: with SMTP id 137mr3257409lfk.145.1595377364015; 
 Tue, 21 Jul 2020 17:22:44 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id n4sm6408996lfl.40.2020.07.21.17.22.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 17:22:43 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id s9so322936lfs.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 17:22:43 -0700 (PDT)
X-Received: by 2002:a19:4f5d:: with SMTP id a29mr4752873lfk.107.1595377362959; 
 Tue, 21 Jul 2020 17:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
In-Reply-To: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 21 Jul 2020 17:22:29 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
Message-ID: <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
Subject: Re: pages pinned for BO lifetime and security
To: christian.koenig@amd.com
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0106987378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0106987378==
Content-Type: multipart/alternative; boundary="000000000000010bb805aafcbd61"

--000000000000010bb805aafcbd61
Content-Type: text/plain; charset="UTF-8"

+Christian who added DMABUF_MOVE_NOTIFY which added the relevant blurb:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma-buf/Kconfig#n46

Currently, the user seems to amdgpu for P2P dma-buf and it seems to plumb
ttm (*move_notify) callback to dma-buf.  We're not sure if it's a security
issue occurring across DRM drivers, or one more specific to the new amdgpu
use case.

On Tue, Jul 21, 2020 at 1:03 PM Chia-I Wu <olvaffe@gmail.com> wrote:

> Hi list,
>
> virtio-gpu is moving in the direction where BO pages are pinned for
> the lifetime for simplicity.  I am wondering if that is considered a
> security issue in general, especially after running into the
> description of the new DMABUF_MOVE_NOTIFY config option.
>
> Most drivers do not have a shrinker, or whether a BO is purgeable is
> entirely controlled by the userspace (madvice).  They can be
> categorized as "a security problem where userspace is able to pin
> unrestricted amounts of memory".  But those drivers are normally found
> on systems without swap.  I don't think the issue applies.
>
> Of the desktop GPU drivers, i915's shrinker certainly supports purging
> to swap.  TTM is a bit hard to follow.  I can't really tell if amdgpu
> or nouveau supports that.  virtio-gpu is more commonly found on
> systems with swaps so I think it should follow the desktop practices?
>
> Truth is, the emulated virtio-gpu device always supports page moves
> with VIRTIO_GPU_CMD_RESOURCE_{ATTACH,DETACH}_BACKING.  It is just that
> the driver does not make use of them.  That makes this less of an
> issue because the driver can be fixed anytime (finger crossed that the
> emulator won't have bugs in these untested paths).  This issue becomes
> more urgent because we are considering adding a new HW command[1]
> where page moves will be disallowed.  We definitely don't want a HW
> command that is inherently insecure, if BO pages pinned for the
> lifetime is considered a security issue on desktops.
>
> [1] VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
>
> https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/include/uapi/linux/virtio_gpu.h#L396
>

--000000000000010bb805aafcbd61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Christian who added DMABUF_MOVE_NOTIFY which added the re=
levant blurb:<br><br><a href=3D"https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git/tree/drivers/dma-buf/Kconfig#n46" target=3D"_blank"=
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/dma-buf/Kconfig#n46</a><br><br>Currently, the user seems to amdgpu fo=
r P2P dma-buf and it seems to plumb ttm (*move_notify) callback to dma-buf.=
=C2=A0 We&#39;re not sure if it&#39;s a security issue occurring across DRM=
 drivers, or one more specific to the new amdgpu use case.<br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2=
1, 2020 at 1:03 PM Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" targe=
t=3D"_blank">olvaffe@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi list,<br>
<br>
virtio-gpu is moving in the direction where BO pages are pinned for<br>
the lifetime for simplicity.=C2=A0 I am wondering if that is considered a<b=
r>
security issue in general, especially after running into the<br>
description of the new DMABUF_MOVE_NOTIFY config option.<br>
<br>
Most drivers do not have a shrinker, or whether a BO is purgeable is<br>
entirely controlled by the userspace (madvice).=C2=A0 They can be<br>
categorized as &quot;a security problem where userspace is able to pin<br>
unrestricted amounts of memory&quot;.=C2=A0 But those drivers are normally =
found<br>
on systems without swap.=C2=A0 I don&#39;t think the issue applies.<br>
<br>
Of the desktop GPU drivers, i915&#39;s shrinker certainly supports purging<=
br>
to swap.=C2=A0 TTM is a bit hard to follow.=C2=A0 I can&#39;t really tell i=
f amdgpu<br>
or nouveau supports that.=C2=A0 virtio-gpu is more commonly found on<br>
systems with swaps so I think it should follow the desktop practices?<br>
<br>
Truth is, the emulated virtio-gpu device always supports page moves<br>
with VIRTIO_GPU_CMD_RESOURCE_{ATTACH,DETACH}_BACKING.=C2=A0 It is just that=
<br>
the driver does not make use of them.=C2=A0 That makes this less of an<br>
issue because the driver can be fixed anytime (finger crossed that the<br>
emulator won&#39;t have bugs in these untested paths).=C2=A0 This issue bec=
omes<br>
more urgent because we are considering adding a new HW command[1]<br>
where page moves will be disallowed.=C2=A0 We definitely don&#39;t want a H=
W<br>
command that is inherently insecure, if BO pages pinned for the<br>
lifetime is considered a security issue on desktops.<br>
<br>
[1] VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB<br>
<a href=3D"https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio=
-gpu-next/include/uapi/linux/virtio_gpu.h#L396" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virti=
o-gpu-next/include/uapi/linux/virtio_gpu.h#L396</a><br>
</blockquote></div>

--000000000000010bb805aafcbd61--

--===============0106987378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0106987378==--
