Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03A42500F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 11:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA836F3E8;
	Thu,  7 Oct 2021 09:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E056F3E8;
 Thu,  7 Oct 2021 09:28:19 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id bb12so421903vkb.5;
 Thu, 07 Oct 2021 02:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzHW72Ay3gWV8fEJFQ+iu6g37baZLnF8PQ8Ot4oxoaI=;
 b=tOJ9Zo8CdOc9pOAjAQi/tpIdfhrXLUW8JbtJKNo0Fr7Wc6mkTepwxpCiRakSJ+zpVo
 2oiQBT820NZVLf5X3bDZ2fTVAcd+3/SaCSdtiVBlQ/F+oliGDVHhDckr9jBpp7Yd/uS0
 rqRhOvncq+F2ZbbKJ0aQnBaT+sOkMTYsqlb9rkWqybI89S391O+AwM1tnxbMJaxC/wD2
 8JynPb90B7dxAOoBD9XSEDkEh2F5b9AtyGdSg7YWdUgHBXh9LheuR17YF/lFdoBU9VJc
 0RpNrjr0Uu5OFgFNYUmIzOw8mM8QKC1yYpWeu6LsvKNAV+0/00O1H4TMpYGC8dokasqd
 gyrw==
X-Gm-Message-State: AOAM532Y/y8QY54C3fvfi6XHZYpmlFtenNat7OigczzQZas5I6nei0fQ
 JO3NrAQhlkDu4sFJ+veaCcb38ba75Cnwb5xyGhzrrpPXT7k=
X-Google-Smtp-Source: ABdhPJxa3fwE1gntWrjljDsvFH6UlsS62TRi8FeltjZ+YAQFTMpawuIEL6cDelrBaNePH9pbfBWO3F+KAs1dSlBCJEY=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr2286297vka.19.1633598898975; 
 Thu, 07 Oct 2021 02:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211006025350.a5PczFZP4%akpm@linux-foundation.org>
 <58fbf2ff-b367-2137-aa77-fcde6c46bbb7@infradead.org>
 <20211006182052.6ecc17cf@canb.auug.org.au>
 <f877a1c9-1898-23f3-bba3-3442dc1f3979@amd.com>
In-Reply-To: <f877a1c9-1898-23f3-bba3-3442dc1f3979@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Oct 2021 11:28:07 +0200
Message-ID: <CAMuHMdV3eMchpgUasU6BBHrDQyjCc2TrqJ+zJgFhgAySpqVGfw@mail.gmail.com>
Subject: Re: mmotm 2021-10-05-19-53 uploaded
 (drivers/gpu/drm/msm/hdmi/hdmi_phy.o)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, 
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 Linux-Next <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.cz>,
 mm-commits@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>
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

Hi Christian,

On Wed, Oct 6, 2021 at 9:28 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 06.10.21 um 09:20 schrieb Stephen Rothwell:
> > On Tue, 5 Oct 2021 22:48:03 -0700 Randy Dunlap <rdunlap@infradead.org> =
wrote:
> >> on i386:
> >>
> >> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined ref=
erence to `msm_hdmi_phy_8996_cfg'
> >>
> >>
> >> Full randconfig fle is attached.
> > This would be because CONFIG_DRM_MSM is set but CONFIG_COMMON_CLOCK is
> > not and has been exposed by commit
> >
> >    b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> >
> > from the drm-misc tree.
>
> Good point, how about this change:
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 5879f67bc88c..d9879b011fb0 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -5,7 +5,7 @@ config DRM_MSM
>          depends on DRM
>          depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>          depends on IOMMU_SUPPORT
> -       depends on (OF && COMMON_CLK) || COMPILE_TEST
> +       depends on (OF || COMPILE_TEST) && COMMON_CLK

I'd make that:

    -        depends on DRM
    +       depends on COMMON_CLK && DRM && IOMMU_SUPPORT
            depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
    -        depends on IOMMU_SUPPORT
    -       depends on (OF && COMMON_CLK) || COMPILE_TEST
    +       depends on OF || COMPILE_TEST

to keep a better separation between hard and soft dependencies.

Note that the "depends on OF || COMPILE_TEST" can even be
deleted, as the dependency on ARCH_QCOM || SOC_IMX5 implies OF.

>          depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
>          depends on QCOM_LLCC || QCOM_LLCC=3Dn
>          depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
