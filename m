Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98838D118C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 03:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10A10E11C;
	Tue, 28 May 2024 01:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XDD+ekOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13710E11C;
 Tue, 28 May 2024 01:45:15 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2bfb6668ad5so224323a91.0; 
 Mon, 27 May 2024 18:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716860715; x=1717465515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WZuzBn8quBWeOsvE1Lk2Z6AJ5TaLj0Zv5xeM9jkRkY=;
 b=XDD+ekOp4G2XgFUMnsbpR4Zekn+8g1m67e6ta6xEiHhfDSrMby7mGyrVLR5U0OtcPm
 L/ZdlSHyl7Q9myK66TKQaHv0n7hfwqd2gI6QzO4oFmkN5XuYIYFX9wKhjwk8ThoZYFV7
 yVMzkVL6EJCduyauPcrzdaPZ8L0dbF+1Fq4pfTiHuvL7+a4uVSvN7+4xZgEk0CHj0emS
 Qzpro84yBvxBCD72Q4YyUtH+Ekofyfw20Dd7rkRgl1TMjZw6rkg85yTSoP5mqsYCm7u1
 OlXcMQHRS4g2xNjOJ1n2UQBdSrKZSVrYiVvXU4AxMmNRsBlq45Hr8b/fWcg9FiQk3Lfz
 zsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716860715; x=1717465515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WZuzBn8quBWeOsvE1Lk2Z6AJ5TaLj0Zv5xeM9jkRkY=;
 b=KK/nBdBAMnbbG/IryWuynYwHD2cYs5hNcajTp417pvYBSHqvQUVDnVFo7swu0VyCch
 FA8TktD3aqrj/ojAMKEmRHO0x9chplozYiZ9qHa1nlneDUAoXX+ZBGFHYA8ZRgAo70j7
 dWMaaymHJBLFiNHAjDWb6JSfbHPDOrkXEvZ9zaA96fu9aZO1w2snj6yQlCYh+RlfRd0E
 oTsNNHyVCk8O/Qb4FdOW8w3tt09bVsboOSZqzodgY0qffjS9g4HJ8Efzr+iGlqJbULey
 L128auZgwmo/qGoCnejmNJQlm4/35Rq6YU+vFW27PLatkTlaQXdUY0H5PUPcnJMOgM0x
 Y8Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv8hcObo51qqJX6A+0yw9xcjbl5DkN/AGY9NufmwxyiWAKkR74+vD5O9KE0ozyBx+4nBhJYrYPqfHIPUFGu2jtqVPlHB7h6gLHKockE/eMdm4hN83/2prvliF5pioOhLklHcaJF1N7vAbsNccYsw==
X-Gm-Message-State: AOJu0YxWiCdcwPKqZbEz97Q5cLFi+maSjbA2Ztr6ONEIl28FsUQPAcoE
 8cCDM+Oy0uFA6zkXFf97dh1hLA/6q1fhM/QR0zd1bIdupkIPJqPpA1z0Txj8g1xIIidc5Mti9Qg
 eeOBd7Qv07DXwXhxmVkn1mNGFjGw=
X-Google-Smtp-Source: AGHT+IEoeAZtpR1+qNz/hWhSApB41CTHGMkY3r79faQLS6aa7Fl88PJ9rRkoYAH6sEGDE6IKTR44tV1Bv0/gNTmoUn0=
X-Received: by 2002:a17:90a:bc85:b0:2b2:6ede:5ce0 with SMTP id
 98e67ed59e1d1-2bf5f70f2d7mr9067767a91.39.1716860714620; Mon, 27 May 2024
 18:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240527012018.351223-1-zhouzhouyi@gmail.com>
 <c60b572e-12a8-49b1-a75a-b8a7b7ed674b@amd.com>
 <CAABZP2zGfhcYrn6UOhmkXEgtCAPLcN7bgCdbzAi1r+aNrToHKQ@mail.gmail.com>
In-Reply-To: <CAABZP2zGfhcYrn6UOhmkXEgtCAPLcN7bgCdbzAi1r+aNrToHKQ@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 28 May 2024 09:45:03 +0800
Message-ID: <CAABZP2ximP0kiSSXSw51fhrt0EuZMLUHeonzS2VGSUwm-QEF3w@mail.gmail.com>
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

Fix some error in my previous email

On Tue, May 28, 2024 at 9:36=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.com> =
wrote:
>
> Thanks for reviewing the patch
>
> On Mon, May 27, 2024 at 3:58=E2=80=AFPM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 27.05.24 um 03:20 schrieb Zhouyi Zhou:
> > > In r100_cp_init_microcode, if rdev->family don't match any of
> > > if statement,  fw_name will be NULL, which will cause
> > > gcc (11.4.0 powerpc64le-linux-gnu) complain:
> > >
> > > In function =E2=80=98r100_cp_init_microcode=E2=80=99,
> > >      inlined from =E2=80=98r100_cp_init=E2=80=99 at drivers/gpu/drm/r=
adeon/r100.c:1136:7:
> > > ./include/linux/printk.h:457:44: warning: =E2=80=98%s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]
> > >    457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##_=
_VA_ARGS__)
> > >
> > > Above warning is emitted during the rcutorture test in
> > > in PPC VM of Opensource Lab of Oregon State Univerisity.
> > >
> > > Enhance error handling in r100_cp_init_microcode, let r100_cp_init_mi=
crocode
> > > return with -EINVAL when none of chip families is matched.
> > >
> > > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > > ---
> > >   drivers/gpu/drm/radeon/r100.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r=
100.c
> > > index 0b1e19345f43..4f8a1bdd9365 100644
> > > --- a/drivers/gpu/drm/radeon/r100.c
> > > +++ b/drivers/gpu/drm/radeon/r100.c
> > > @@ -1055,6 +1055,11 @@ static int r100_cp_init_microcode(struct radeo=
n_device *rdev)
> > >                  (rdev->family =3D=3D CHIP_RV570)) {
> > >               DRM_INFO("Loading R500 Microcode\n");
> > >               fw_name =3D FIRMWARE_R520;
> > > +     } else {
> > > +             pr_err("radeon_cp: Failed to load firmware \"%d\"\n",
> > > +                     rdev->family);
> > > +             err =3D -EINVAL;
> > > +             goto out;
> > >       }
> > >
> > >       err =3D request_firmware(&rdev->me_fw, fw_name, rdev->dev);
> > > @@ -1067,6 +1072,8 @@ static int r100_cp_init_microcode(struct radeon=
_device *rdev)
> > >               release_firmware(rdev->me_fw);
> > >               rdev->me_fw =3D NULL;
> > >       }
> > > +
> > > +out:
> >
> > That looks superfluous, just return -EINVAL directly in the else case a=
bove.
> >
> > Apart from that this is for ~15year old hardware. I'm a bit reluctant
> > adding code for something that old even when this change here looks
> > harmless.
> >
> > Is there a plan to complain about that in an automated checker? If yes
> > then the change is probably justified, if no then I would rather not do=
 it.
> The warning is emitted when I invoke following commands in ubuntu
> 22.04 (ppc64le)
> linux$make allmodconfig
> linux$make drivers/gpu/drm/radeon/r100.o (a quick alternative to 'make -j=
$nproc)
the command should be make -j(number of CPUs in my machine), please don't i=
nvoke
'make -j$nproc' which is my mistake, this command is very dangerous,
and make my machine hung ;-(

Sorry for the trouble
Thanks again
Zhouyi
> But everything is OK when I invoke following commands in ubuntu 22.04 (pp=
c64le)
> linux$make allmodconfig LLVM=3D1
> linux$make drivers/gpu/drm/radeon/r100.o LLVM=3D1
>
> And I can't reproduce the warning in the x86 environment, so I guess
> this phenomenon
> is toolchain related ;-)
>
> Thanks again
> Regards,
> Zhouyi
> >
> > Regards,
> > Christian.
> >
> > >       return err;
> > >   }
> > >
> >
