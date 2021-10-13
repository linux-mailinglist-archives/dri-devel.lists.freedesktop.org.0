Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98C42BDE7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 12:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108716E86C;
	Wed, 13 Oct 2021 10:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDAE6E86B;
 Wed, 13 Oct 2021 10:55:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0370610C9;
 Wed, 13 Oct 2021 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634122504;
 bh=cHJwlE/4hKjsg8N9PIPkUgBxfg4CYIeT2a/7mtQ0gV4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gvd6nNUOzZ1UK/F83pyQaR5TauDo53BnYMnJejta47hA700Gc4nEjGIFnHwmjOADo
 AKNy+aONpGH/0IsqLm0Dcpm6wjEJavnew940SDLuN/5a6FYUw3ELyYcU0A3Q/NRQek
 QfoThQlCQv7p+iOVnXWOAHkCznwBtAwOy+ujza96o7WAaFxFjrC8XZ1wckA/fZVTbk
 VwI4mJWJKdlfyh1Lt6ftM0G3FhFyxA8FUoE+m7e14+8RRL2PlJvv9hf7Oz7NJ/FAwC
 wgr7gidywOLH4DV+TxM46MeGP/by3gM7M3FjX3pF1U7UjvwkkKAPLPGpJwUDxBDIsM
 sv3E+u1PeyN3A==
Received: by mail-wr1-f50.google.com with SMTP id r10so6803147wra.12;
 Wed, 13 Oct 2021 03:55:04 -0700 (PDT)
X-Gm-Message-State: AOAM530KfVMYNbT0I3mgSvnjuKMHKvpcL0uZ9gBkGjX/v35fLfi3J6JQ
 IRPxLOq5Lt7b0lt91XDoXju/fKJ6Tge1VTT2IIo=
X-Google-Smtp-Source: ABdhPJzW6QwF+fpri3xax3BToB6ExyXZ9H+Kw/HXMbby5km4lbFfKsXJq/EA3ZMCLu9RmweZx7YA8FnfMM0PPRf9Pg4=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr9273874wmq.82.1634122503094; 
 Wed, 13 Oct 2021 03:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211006025350.a5PczFZP4%akpm@linux-foundation.org>
 <58fbf2ff-b367-2137-aa77-fcde6c46bbb7@infradead.org>
 <20211006182052.6ecc17cf@canb.auug.org.au>
 <f877a1c9-1898-23f3-bba3-3442dc1f3979@amd.com>
 <CAMuHMdV3eMchpgUasU6BBHrDQyjCc2TrqJ+zJgFhgAySpqVGfw@mail.gmail.com>
In-Reply-To: <CAMuHMdV3eMchpgUasU6BBHrDQyjCc2TrqJ+zJgFhgAySpqVGfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 13 Oct 2021 12:54:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LLABstZ2rPYpsXRTxMdbSTrh0y753vrfGbRovv9fS8A@mail.gmail.com>
Message-ID: <CAK8P3a1LLABstZ2rPYpsXRTxMdbSTrh0y753vrfGbRovv9fS8A@mail.gmail.com>
Subject: Re: mmotm 2021-10-05-19-53 uploaded
 (drivers/gpu/drm/msm/hdmi/hdmi_phy.o)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, 
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 Linux-Next <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.cz>,
 mm-commits@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
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

On Thu, Oct 7, 2021 at 11:51 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> On Wed, Oct 6, 2021 at 9:28 AM Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> > Am 06.10.21 um 09:20 schrieb Stephen Rothwell:
> > > On Tue, 5 Oct 2021 22:48:03 -0700 Randy Dunlap <rdunlap@infradead.org=
> wrote:
> > >> on i386:
> > >>
> > >> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined r=
eference to `msm_hdmi_phy_8996_cfg'

I ran into the same thing now as well.
E_TEST) && COMMON_CLK
>
> I'd make that:
>
>     -        depends on DRM
>     +       depends on COMMON_CLK && DRM && IOMMU_SUPPORT
>             depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>     -        depends on IOMMU_SUPPORT
>     -       depends on (OF && COMMON_CLK) || COMPILE_TEST
>     +       depends on OF || COMPILE_TEST
>
> to keep a better separation between hard and soft dependencies.
>
> Note that the "depends on OF || COMPILE_TEST" can even be
> deleted, as the dependency on ARCH_QCOM || SOC_IMX5 implies OF.

Looks good to me, I would also drop that last line in this case, and maybe
add this change as building without COMMON_CLK is no longer possible:

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 904535eda0c4..a5d87e03812f 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -116,10 +116,10 @@ msm-$(CONFIG_DRM_MSM_DP)+=3D dp/dp_aux.o \
  dp/dp_power.o \
  dp/dp_audio.o

-msm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D msm_fbdev.o
-msm-$(CONFIG_COMMON_CLK) +=3D disp/mdp4/mdp4_lvds_pll.o
-msm-$(CONFIG_COMMON_CLK) +=3D hdmi/hdmi_pll_8960.o
-msm-$(CONFIG_COMMON_CLK) +=3D hdmi/hdmi_phy_8996.o
+msm-$(CONFIG_DRM_FBDEV_EMULATION) +=3D msm_fbdev.o \
+ disp/mdp4/mdp4_lvds_pll.o \
+ hdmi/hdmi_pll_8960.o \
+ hdmi/hdmi_phy_8996.o

 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) +=3D hdmi/hdmi_hdcp.o

Has anyone submitted a patch already, or should I send the version
that I am using locally now?

        Arnd
