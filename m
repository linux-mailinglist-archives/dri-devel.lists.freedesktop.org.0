Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC790C2DE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 06:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199110E168;
	Tue, 18 Jun 2024 04:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5Ba35v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6407F10E168;
 Tue, 18 Jun 2024 04:34:05 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57a4d7ba501so6210836a12.2; 
 Mon, 17 Jun 2024 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718685243; x=1719290043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIwHA+mxDZIARtoB5DwfNg0Gfwpm3V2PRBL0EbC93+0=;
 b=N5Ba35v5NFnNWVu5OTLLFtOnsBSG0FD/OVH/T1TrRU239VV9Gx/VTR0S82Shoy17Q0
 av1fT5RGaak/CpKThiTpcOSGDvv5h07/CV9R49mJA3h84A19AQee+yXO0lMpe5dAu0xd
 AfW2z6f469TUD8/8S1BDBbxMoAF7GfHnjR/KU7/AJoBMNEiDKnZxqaYU4JgEEWff6Ynk
 0numpijOIRt8FUPV35DGRq+XE9cRJniScr0S5PeZ1umrx1ll4DqK8evTOVwg1lh5crmH
 9k2hql7DdHUlRQY3jYLWpHaebmnOEqVQqTIvKvkekb37uD3idZmIfNhe1HiUHrPwfT3y
 k45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718685243; x=1719290043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIwHA+mxDZIARtoB5DwfNg0Gfwpm3V2PRBL0EbC93+0=;
 b=CjXtPFRj0xyK6Y0BP1CoHLKQAUd2XhkLAfx6gFRxns4apIMFJ0Vovf4iiIvzE7kAEN
 d8sY0tguWOpYgEQgV3FWqfCjHIs02vSZ4AWGcbzJCJRw8fTdr5GKAJ7wqkc31TSo8Rr2
 +C0mmbMNy9mRgQfxjdYztpZXtw0UDlwFHu9mym/8dKRK5GfVp38abcRCgXYzrXQGsbHt
 0qPUGt1Ah4M9PTarNfQpuYSsnAKCIwUeVLPKlyP6JPpBOUxWwaVTwp/7e0GVs9s5xCCd
 T8Iit93PzWqAaeLW4IwfVaerLUaVWmtVDz6YANaU0VcSt/N5R8WMxfs8LPuH7xKPWME/
 AY4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnHKA9neIm1Vw4/VFggmWFgrpknRjTmzpRHIn2rGCG0qQcacKEHa3Tw2q1dFpsJPbLYuRCxnUnza2slfg5TpmD3egaUSM7ExWlJA==
X-Gm-Message-State: AOJu0YxqaXZBLjrQkcFIt+MYG2rR5StevRSOFffGUNyHIUJMLbX9MdO+
 2lzzVCaq2vx8/1yezsv+ELxBSTM0MWcMlSK1aTjI6dDMWdlj//3iyRUeWyAekGHNABvVi1ixAsP
 8OhKhtW10eZGGvlqDNV/2ekiDNik=
X-Google-Smtp-Source: AGHT+IEvIyNa10vntkg70/P22cvrLRrQaET/PryqCiwiAaxtddZK8JGlqlKFD8nYwOFg282VPsumofyXlGoruVft9M0=
X-Received: by 2002:a17:906:4ac4:b0:a6f:493d:5b9f with SMTP id
 a640c23a62f3a-a6f60d3f4aamr803279566b.35.1718685242877; Mon, 17 Jun 2024
 21:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
In-Reply-To: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 18 Jun 2024 12:33:50 +0800
Message-ID: <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
To: Dragan Simic <dsimic@manjaro.org>
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org, 
 Philip Muller <philm@manjaro.org>,
 Oliver Smith <ollieparanoid@postmarketos.org>, 
 Daniel Smith <danct12@disroot.org>, stable@vger.kernel.org
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

I see the problem that initramfs need to build a module dependency chain,
but lima does not call any symbol from simpleondemand governor module.

softdep module seems to be optional while our dependency is hard one,
can we just add MODULE_INFO(depends, _depends), or create a new
macro called MODULE_DEPENDS()?

On Tue, Jun 18, 2024 at 4:22=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Lima DRM driver uses devfreq to perform DVFS, while using simple_ondemand
> devfreq governor by default.  This causes driver initialization to fail o=
n
> boot when simple_ondemand governor isn't built into the kernel statically=
,
> as a result of the missing module dependency and, consequently, the requi=
red
> governor module not being included in the initial ramdisk.  Thus, let's m=
ark
> simple_ondemand governor as a softdep for Lima, to have its kernel module
> included in the initial ramdisk.
>
> This is a rather longstanding issue that has forced distributions to buil=
d
> devfreq governors statically into their kernels, [1][2] or may have force=
d
> some users to introduce unnecessary workarounds.
>
> Having simple_ondemand marked as a softdep for Lima may not resolve this
> issue for all Linux distributions.  In particular, it will remain unresol=
ved
> for the distributions whose utilities for the initial ramdisk generation =
do
> not handle the available softdep information [3] properly yet.  However, =
some
> Linux distributions already handle softdeps properly while generating the=
ir
> initial ramdisks, [4] and this is a prerequisite step in the right direct=
ion
> for the distributions that don't handle them properly yet.
>
> [1] https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/=
-/blob/6.7-megi/config?ref_type=3Dheads#L5749
> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/7f64e287e7732c9eaa029=
653e73ca3d4ba1c8598/main/linux-postmarketos-allwinner/config-postmarketos-a=
llwinner.aarch64#L4654
> [3] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=
=3D49d8e0b59052999de577ab732b719cfbeb89504d
> [4] https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be51=
2f6d8f4489054668ad
>
> Cc: Philip Muller <philm@manjaro.org>
> Cc: Oliver Smith <ollieparanoid@postmarketos.org>
> Cc: Daniel Smith <danct12@disroot.org>
> Cc: stable@vger.kernel.org
> Fixes: 1996970773a3 ("drm/lima: Add optional devfreq and cooling device s=
upport")
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  drivers/gpu/drm/lima/lima_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 739c865b556f..10bce18b7c31 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -501,3 +501,4 @@ module_platform_driver(lima_platform_driver);
>  MODULE_AUTHOR("Lima Project Developers");
>  MODULE_DESCRIPTION("Lima DRM Driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_SOFTDEP("pre: governor_simpleondemand");
