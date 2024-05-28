Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A88D1175
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B3A10FDEB;
	Tue, 28 May 2024 01:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIv9N+G+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5292010FDEB;
 Tue, 28 May 2024 01:37:10 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2b9702e05easo214845a91.1; 
 Mon, 27 May 2024 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716860229; x=1717465029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zk9vV2YlMycmzWFDOTOhz2mFHoCHmz8RqkeX1scVZQ=;
 b=fIv9N+G+9PtcSe4C+v3sKVgEqSLBsJW7EKWv/DVpmTeAanjo4VKyikUB7GuDayIhuR
 +suT0/mYk8LL8pJleGjOZZN/BBqixxivCTp/QdaQoZNTlxekz8tq/S04BomkkkEugxq/
 cCGRmk9Lqy6bF+SmH3IrarD4oUfrteqaZS8fmY4lrdMyaWHsUHrcUqnuV/s4AOWkG2hj
 IMHnXecWlvfqJSvyutKUa2fd7obYGD3MpMexdNZ/1bJp3AQbXTkemNrWiIlI3wyUBxyy
 mCIMETVblxN/Hmgdf49io6cnlAnqQn7YRrfJAqo/Dkva3JKe06u4kib2Y2VWF3imIQcq
 1eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716860229; x=1717465029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zk9vV2YlMycmzWFDOTOhz2mFHoCHmz8RqkeX1scVZQ=;
 b=AXalxUm8apshMPWzvofkbn5XINg/usi3BIO7QRzqXrnGB9xwmv+kPzPyqoCaqbAb8S
 a2rzG+6KhQIHud9jPV8Rbl/WhHlSFE0ecKqWC2ZcxSBJNUtWMwlMN5+O6Ecbt6StcND5
 LwXstzvYtbVn4wLDKELhax2aftvLHvzVTxa5z5OdVTX5rgiXW+0eBAQceHYtkbpwm2Ft
 75G/qJtrPs2CM5bEFIKvdGfXvA/TB1DBnHTnEqT9UN8bOO+R2K3rLVc7YD+ZTBMfuFdO
 BzosUDNJim6LcKX/FnTT4CJ5825mlC+TpA+tE5Dwy9skBfDgCom/eelkAiVAu95aq8NN
 If5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4175HPPkgXQ3FoPoE2k3o1jd8WzpoZcJVPXLk+h+ibbnl8bPd9lKRqXjbuXeA+SkY9iJjKaaqAMFEpFF0gbHBt9VsiPYpaf3D4bu4Sy/HK4vZb0g1L7hIaS3lATJd7kViBtN9QpsIZsTkJkbGKg==
X-Gm-Message-State: AOJu0YxJ+gSBDfXGmcBxvEYC3K7xNY1YQtg1z4h/JixuBjXQHMB2u6PD
 wzplShfh3U1Bc13yyJ3C2Ht8HlKdfWKvDLBZYugjB/d5c6qN+hfR1Ochr8/0KyRV7JkIiL/UU6Z
 twKgi5zboqFsK4JCgUWrSC6PZapg=
X-Google-Smtp-Source: AGHT+IHNo0JD5HYAnIvsWqv6//ds5GCpX9miQ/PSD8IvV39sh/7bXFiVDS6KX+8DFMu7bg9EoCp8gdSH3bmQsucVq2g=
X-Received: by 2002:a17:90a:bb8c:b0:2bd:5deb:9d50 with SMTP id
 98e67ed59e1d1-2bf5f74e014mr9138711a91.39.1716860229503; Mon, 27 May 2024
 18:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240527012018.351223-1-zhouzhouyi@gmail.com>
 <c60b572e-12a8-49b1-a75a-b8a7b7ed674b@amd.com>
In-Reply-To: <c60b572e-12a8-49b1-a75a-b8a7b7ed674b@amd.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 28 May 2024 09:36:58 +0800
Message-ID: <CAABZP2zGfhcYrn6UOhmkXEgtCAPLcN7bgCdbzAi1r+aNrToHKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r100: enhance error handling in
 r100_cp_init_microcode
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, chris@chrisdown.name, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, lance@osuosl.org
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

Thanks for reviewing the patch

On Mon, May 27, 2024 at 3:58=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.05.24 um 03:20 schrieb Zhouyi Zhou:
> > In r100_cp_init_microcode, if rdev->family don't match any of
> > if statement,  fw_name will be NULL, which will cause
> > gcc (11.4.0 powerpc64le-linux-gnu) complain:
> >
> > In function =E2=80=98r100_cp_init_microcode=E2=80=99,
> >      inlined from =E2=80=98r100_cp_init=E2=80=99 at drivers/gpu/drm/rad=
eon/r100.c:1136:7:
> > ./include/linux/printk.h:457:44: warning: =E2=80=98%s=E2=80=99 directiv=
e argument is null [-Wformat-overflow=3D]
> >    457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__V=
A_ARGS__)
> >
> > Above warning is emitted during the rcutorture test in
> > in PPC VM of Opensource Lab of Oregon State Univerisity.
> >
> > Enhance error handling in r100_cp_init_microcode, let r100_cp_init_micr=
ocode
> > return with -EINVAL when none of chip families is matched.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
>
> > ---
> >   drivers/gpu/drm/radeon/r100.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r10=
0.c
> > index 0b1e19345f43..4f8a1bdd9365 100644
> > --- a/drivers/gpu/drm/radeon/r100.c
> > +++ b/drivers/gpu/drm/radeon/r100.c
> > @@ -1055,6 +1055,11 @@ static int r100_cp_init_microcode(struct radeon_=
device *rdev)
> >                  (rdev->family =3D=3D CHIP_RV570)) {
> >               DRM_INFO("Loading R500 Microcode\n");
> >               fw_name =3D FIRMWARE_R520;
> > +     } else {
> > +             pr_err("radeon_cp: Failed to load firmware \"%d\"\n",
> > +                     rdev->family);
> > +             err =3D -EINVAL;
> > +             goto out;
> >       }
> >
> >       err =3D request_firmware(&rdev->me_fw, fw_name, rdev->dev);
> > @@ -1067,6 +1072,8 @@ static int r100_cp_init_microcode(struct radeon_d=
evice *rdev)
> >               release_firmware(rdev->me_fw);
> >               rdev->me_fw =3D NULL;
> >       }
> > +
> > +out:
>
> That looks superfluous, just return -EINVAL directly in the else case abo=
ve.
>
> Apart from that this is for ~15year old hardware. I'm a bit reluctant
> adding code for something that old even when this change here looks
> harmless.
>
> Is there a plan to complain about that in an automated checker? If yes
> then the change is probably justified, if no then I would rather not do i=
t.
The warning is emitted when I invoke following commands in ubuntu
22.04 (ppc64le)
linux$make allmodconfig
linux$make drivers/gpu/drm/radeon/r100.o (a quick alternative to 'make -j$n=
proc)

But everything is OK when I invoke following commands in ubuntu 22.04 (ppc6=
4le)
linux$make allmodconfig LLVM=3D1
linux$make drivers/gpu/drm/radeon/r100.o LLVM=3D1

And I can't reproduce the warning in the x86 environment, so I guess
this phenomenon
is toolchain related ;-)

Thanks again
Regards,
Zhouyi
>
> Regards,
> Christian.
>
> >       return err;
> >   }
> >
>
