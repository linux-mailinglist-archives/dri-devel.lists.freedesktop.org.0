Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35342BF36
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 13:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E7B6EA23;
	Wed, 13 Oct 2021 11:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561F96EA19;
 Wed, 13 Oct 2021 11:49:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 288EE610E6;
 Wed, 13 Oct 2021 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634125750;
 bh=08cmMCW6GG9gWIOhjxYfXSFIYClklm6HhvdpGKvi16g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a8/bDma6IeOw47+CVOZM0/AVmVmBWj1bzuEKec7UQcITca/iyIJH9GPAJIvAVnR2H
 gIj1lAPQWNgzGnxnDjDyDaF32C+R5o6fUz/YUAp3c1YZe/9hIP383TAgZJNW4BPXEl
 xYD+h/4uCsU8H8vRNmQD46ZYx8EtXiEsgIDmEbcLam7Kgy7p0D1CEyyWBZc8Oo5s4s
 mKx9gm2Et/G27qN8h5upJOFFpTZWaLQUyDXCOPY+Lk6JU5Ixx50zk5XTqJg6j3RoFm
 M2wBcpLSkUUaqE3EQb6QT7vjrO8+tWKwpsFH21EvMrrffZtKhX7xSJj6hkqXb9k04J
 n/uD/fERi9WNA==
Received: by mail-wr1-f44.google.com with SMTP id m22so7592356wrb.0;
 Wed, 13 Oct 2021 04:49:10 -0700 (PDT)
X-Gm-Message-State: AOAM532sDgnoLEgSjWWxKT9fDx4AQuQvEOi0KO8LC2+S9oLj7yk9qJP6
 TlQFVT1+cyVAwFcJcgDso72NDoTyOfJOJkM5Eq8=
X-Google-Smtp-Source: ABdhPJxAPtyVc3G/tOtzJ7z3+RdpcFSsTVHBBrdmAoAeaOD1MZ0LF/ObKmsWMXdtxVVGB9gwLelX+Cl/3S/Jhom+ziQ=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr12179996wmj.1.1634125748613; 
 Wed, 13 Oct 2021 04:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211006025350.a5PczFZP4%akpm@linux-foundation.org>
 <58fbf2ff-b367-2137-aa77-fcde6c46bbb7@infradead.org>
 <20211006182052.6ecc17cf@canb.auug.org.au>
 <f877a1c9-1898-23f3-bba3-3442dc1f3979@amd.com>
 <CAMuHMdV3eMchpgUasU6BBHrDQyjCc2TrqJ+zJgFhgAySpqVGfw@mail.gmail.com>
 <CAK8P3a1LLABstZ2rPYpsXRTxMdbSTrh0y753vrfGbRovv9fS8A@mail.gmail.com>
In-Reply-To: <CAK8P3a1LLABstZ2rPYpsXRTxMdbSTrh0y753vrfGbRovv9fS8A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 13 Oct 2021 13:48:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PoL4KMJfRyOB59tNYR6-cn3rWqDfqXeeW5ggMVGaeVg@mail.gmail.com>
Message-ID: <CAK8P3a1PoL4KMJfRyOB59tNYR6-cn3rWqDfqXeeW5ggMVGaeVg@mail.gmail.com>
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

On Wed, Oct 13, 2021 at 12:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Oct 7, 2021 at 11:51 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> -msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
> +msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o \
> + disp/mdp4/mdp4_lvds_pll.o \
> + hdmi/hdmi_pll_8960.o \
> + hdmi/hdmi_phy_8996.o
>
>  msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o

I fixed my local copy now after noticing that these should not go
after CONFIG_DRM_FBDEV_EMULATION but the top-level option:

@@ -23,8 +23,10 @@ msm-y := \
        hdmi/hdmi_i2c.o \
        hdmi/hdmi_phy.o \
        hdmi/hdmi_phy_8960.o \
+       hdmi/hdmi_phy_8996.o
        hdmi/hdmi_phy_8x60.o \
        hdmi/hdmi_phy_8x74.o \
+       hdmi/hdmi_pll_8960.o \
        edp/edp.o \
        edp/edp_aux.o \
        edp/edp_bridge.o \
@@ -37,6 +39,7 @@ msm-y := \
        disp/mdp4/mdp4_dtv_encoder.o \
        disp/mdp4/mdp4_lcdc_encoder.o \
        disp/mdp4/mdp4_lvds_connector.o \
+       disp/mdp4/mdp4_lvds_pll.o \
        disp/mdp4/mdp4_irq.o \
        disp/mdp4/mdp4_kms.o \
        disp/mdp4/mdp4_plane.o \

           Arnd
