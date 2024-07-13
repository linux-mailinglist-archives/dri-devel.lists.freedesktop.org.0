Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EE930782
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 23:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A81A10E02F;
	Sat, 13 Jul 2024 21:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hSXe+Oqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F310E0D5;
 Sat, 13 Jul 2024 21:45:24 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b5f4c7f4fbso19534776d6.2; 
 Sat, 13 Jul 2024 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720907123; x=1721511923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4779INmo7oX2Brk3wPdsCqYd8M38qMXjWNHByl5qIpw=;
 b=hSXe+OqbjrohXSwpYKFhVKuav04JoBhCkMccf5Ti4s/uYaoi7/cdVW8gU/sJQl3jsd
 cuFpReEIudT5dhRD7Zb8rcLDK4ts13Stk471UypUmYmuz/7IcBXaAi3Z+16XfyIDTbVt
 SESt1YtDP1xA9xukzDfnJRtXDpK8/FGD5S3AjdzZp6ElGvnkKCN1pQ++yH2itqVF37rZ
 I6wF967k54btUma8wZuY1og6E5zJQ0c54ZxVHB/MghA0zUtNruJX93qPZANzzPV4SlNL
 Nj2nX1nkjXGxAQ8cp7s4g81lZmocgkSVmJZLOnozMf24TA/G1NzCyj3kpnhIxSnUt4U5
 VB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720907123; x=1721511923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4779INmo7oX2Brk3wPdsCqYd8M38qMXjWNHByl5qIpw=;
 b=fFb+xA2LbkSitWljk8oDKzwpNCfwq1ex/Z+15nOWJBgBG9ame2HwT1q8jupO0zDPKK
 yfYpQrXCxa0O/cXTPp1meopDrsyh7W+6XsjjresztuMif0WNjFdLqq+lfRoxbiKv1RrK
 N3y5StHkGQvI2YgUtKVFqtIemDKxObqeXR2R7/Qx/LMnnwbAMCa5pbgkcqthRtdQait1
 meQxsqCLks9StL8WQ6tqXRPGJ/ZRlnIKS4UgV7VVx4Mt+R64R5plozpZVxFhXdX6Iuk+
 /Z4FCjTkrRuVX2CdhmYLCrUSX15viGZp1JZNJJiwWjjPUfAJZ01ZFIpUm0vwQtRaiNfD
 lSAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBQoV+z+6ormFcceN7VRBd1F6sygnNCi1cIpimGKM9jA+771TcsLger0pmSMZMubZuNNQ79G7s3NaEGfDKz3DTCUJ1nd+nfxm67Fd/VdLqvItvP4NidvVN2xbBHURLOueFHXxNbztmvkG4cNnSa2QR1ON5FOqpcJCnWKrHkFc65Z1aLQvaYvSvSnmpvXhdPIC0nm3KpjkAXe4wACfUpb3HUdPxrb0FEqQkMqnlS4n5JREm7IQ=
X-Gm-Message-State: AOJu0YyXd/6jA+Sw0R5eepDmZckSFzu5mVMIQEPEM7+UcwZQT8KHDvVi
 xeb/LkSXiB+a7IBsMj7vetp6XwI9rXoH/7JA9ETmHRGH/ID8G0x02ZHFaeU3k3NbTSblZtjaf8U
 /6+4utcsJAYer2OWWSvzuj8VxWEw=
X-Google-Smtp-Source: AGHT+IECwGe1XPnVjL8bL7fgHx3vmwrkrBhM9n+vGphssGZ6Q8QmFWuPB6qYS/3zcotMT35Kj9aVE9yPMKl7T4oT6/4=
X-Received: by 2002:a05:6214:2a83:b0:6b7:4319:ad6f with SMTP id
 6a1803df08f44-6b74319b2admr142352906d6.36.1720907123486; Sat, 13 Jul 2024
 14:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
 <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
 <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
In-Reply-To: <CALwA+NbUCfEj_DzT5eMQ7_pSNpyp-zBe6PEL2XnMZrb303J4_Q@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Sat, 13 Jul 2024 15:44:57 -0600
Message-ID: <CAJfuBxzeYWWV1ikYagFpyFHdAQU4ReYPirksQFHbEzDxhXCfHA@mail.gmail.com>
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com
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

On Fri, Jul 12, 2024 at 9:44=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chromi=
um.org> wrote:
>
> On Wed, Jul 3, 2024 at 12:14=E2=80=AFAM <jim.cromie@gmail.com> wrote:
> >
> > On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.=
org> wrote:
> > >
> > > On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > > > This fixes dynamic-debug support for DRM.debug, added via classmaps=
.
> > > > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> > > >
> > > > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.debu=
g=3Dval
> > > > was applied when drm.ko was modprobed; too early for the yet-to-loa=
d
> > > > drivers, which thus missed the enablement.  My testing with
> > > > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd opti=
ons
> > > > obscured this omission.
> > > >
> > > > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> > > > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for driver=
s.
> > > > The distinction allows dyndbg to also handle the users properly.
> > > >
> > > > DRM is the only current classmaps user, and is not really using it,
> > > > so if you think DRM could benefit from zero-off-cost debugs based o=
n
> > > > static-keys, please test.
> > > >
> > > > HISTORY
> > > >
> > > > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg=
 parts
> > > > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm pa=
rts
> > > >
> > > > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > > > greg k-h says:
> > > > This should go through the drm tree now.  The rest probably should =
also
> > > > go that way and not through my tree as well.
> > >
> > > Can't this just be defined as a coccinelle smpl patch? Must easier
> > > to read than 53 patches?
> > >
> >
> > perhaps it could - Im not sure that would be easier to review
> > than a file-scoped struct declaration or reference per driver
> >
> > Also, I did it hoping to solicit more Tested-by:s with drm.debug=3D0x1f=
f
> >
> > Jim
> >
>
> Jim,
>
> When testing different combinations of Y/M for TEST_DYNAMIC_DEBUG and
> TEST_DYNAMIC_DEBUG_SUBMOD in virtme-ng I spotted test failures:
>
> When the TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING,
> TEST_MOD_SUBMOD selftests passed
> When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM -
> BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> TEST_PERCENT_SPLITTING selftest fails with ": ./dyndbg_selftest.sh:270
> check failed expected 1 on =3Dpf, got 0"
> When the TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY -
> BASIC_TESTS, COMMA_TERMINATOR_TESTS selftests passed, however
> TEST_PERCENT_SPLITTING selftest fails also with ":
> ./dyndbg_selftest.sh:270 check failed expected 1 on =3Dpf, got 0"
>
> Have I missed something ?
>

I am not seeing those 2 failures on those 2 configs.

most of my recent testing has been on x86-defconfig + minimals,
built and run using/inside virtme-ng

the last kernel I installed on this hw was june 16, I will repeat that,
and report soon if I see the failure outside the vm

I'll also send you my script, to maybe speed isolation of the differences.

> Thanks,
> Lukasz
>
> > >   Luis
> > >
