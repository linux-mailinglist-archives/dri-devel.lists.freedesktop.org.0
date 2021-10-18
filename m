Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194694317C4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5226E9DA;
	Mon, 18 Oct 2021 11:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3416E0D6;
 Mon, 18 Oct 2021 11:46:15 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id bl14so15019583qkb.4;
 Mon, 18 Oct 2021 04:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MmeKk08TSs7bRjJ5MxCz8dFyhSFfnwP05dCVlXuAOs4=;
 b=IxbDjLv3A3UqjGwt85UhpmB4W493nMZKFRzEz4IkcyPuDOHpMqXHexcwzRuMHfL3KL
 gfajlU0xXfT4NJROYNOURYHb9qLxeT1+RjEdZSYBYCIHo9sAF83tBdlLJGQ6M4td0Gki
 GOP5DY0XZQAfELdZxLMy+xaQYdNmFSa6qmL2YDqnn5QuLbrKAc7FcgDLuyhSvtTujCm8
 /Rg7P/Vmx3G3Mo2DhkNTQFSkqw1StA1x9C3yAI4ZDibBNxqilmCP0m8OaEOdiwhFQuSe
 +2FoXMXCv9DrNvRGINbJGbcKAnh8IJpCJ+K/85BfBb5WNndaAP80ixZdcdQlpF83Foqx
 Uifg==
X-Gm-Message-State: AOAM5308Srpnx3wCdeby1R9xbZJJGjAUk3SNtLjfaNgw38OjZZxEIvaL
 T5z6vQdrLrAHiR4koE+R6WRaQMdFhf71BF8H
X-Google-Smtp-Source: ABdhPJx2hik5HsDjt39EO1Q8Iy+j014PUJmACLIAKTBhEtL/peQeOPA9kMJ0rjZNKGUQJutd9frfvw==
X-Received: by 2002:a37:6194:: with SMTP id
 v142mr21813667qkb.351.1634557573973; 
 Mon, 18 Oct 2021 04:46:13 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id 128sm6374969qkl.111.2021.10.18.04.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:46:13 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id a7so264360yba.6;
 Mon, 18 Oct 2021 04:46:13 -0700 (PDT)
X-Received: by 2002:a9f:29a5:: with SMTP id s34mr19126482uas.122.1634557103412; 
 Mon, 18 Oct 2021 04:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org>
 <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
In-Reply-To: <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Oct 2021 13:38:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
Message-ID: <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@linaro.org>, Akhil P Oommen <akhilpo@codeaurora.org>, 
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Mon, Oct 18, 2021 at 1:37 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> > phy code is left out, which results in a link failure:
> >
> > ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined refe=
rence to `msm_hdmi_phy_8996_cfg'
> >
> > This was only exposed after it became possible to build
> > test the driver without the clock interfaces.
> >
> > Make COMMON_CLK a hard dependency for compile testing,
> > and simplify it a little based on that.
> >
> > Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   drivers/gpu/drm/msm/Kconfig  | 2 +-
> >   drivers/gpu/drm/msm/Makefile | 6 +++---
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f5107b6ded7b..cb204912e0f4 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -4,8 +4,8 @@ config DRM_MSM
> >       tristate "MSM DRM"
> >       depends on DRM
> >       depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> > +     depends on COMMON_CLK
> >       depends on IOMMU_SUPPORT
>
> We also need a "depends on MMU" here because some automated test is now
> trying to compile the driver on parisc as well.
>
> I have absolutely no idea how a platform can have IOMMU but no MMU
> support but it indeed seems to be the case here.

Huh?

Parisc has config MMU def_bool y?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
