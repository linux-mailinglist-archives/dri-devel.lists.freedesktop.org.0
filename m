Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C536CC943
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BA810E473;
	Tue, 28 Mar 2023 17:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637F210E976
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:31:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p34so7431248wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680024671; x=1682616671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+WXrxWsYnTDYG2SISRRmpGpGojXT5EzYX4eznbJOHg4=;
 b=b3M7Vay4WCW6bVov3pJhb4dOFmMQhzHb9K9TbCRRDwH6GwxIBCXzNO++pvOjt7qbpn
 05xksO/ct1dWRz7RBGgpjA9BmpsK8LKjPfje6/rsLahg/YTDYL+IX4/iwR+d04o0P8b2
 KY3WTWnYstRfCxwFULA1jYBlMiLJUmBywmmZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024671; x=1682616671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WXrxWsYnTDYG2SISRRmpGpGojXT5EzYX4eznbJOHg4=;
 b=8MinwK1+84Z+zS3iEybiZvWRQ3cE2krcMRh7cRZrJJOnCR5j5qCArQ4PjyUZ5Ibexr
 01Ygy1R3w/2xhtG7LORGSCoXXegr+nQsLT2HZ/ajZBkReurKOwc58yHI+QOPPCGjvJcp
 zcXJZ/+99tmj/h4tilM1EiVcjyH+liQr3fYnNc15O5FhAIWH0/WpMFutyMtZSMcdvWIA
 TZfigWzbJHFLMPGa+KffiqWzv5bAuupQlE9lum29c+o1NEb1qJWSGEJG6EhkxVR2tuh2
 o9kHLNBnINn1BpLoc3vmLl/Kz5CxNEl85lWQwNvpVjwaGEuko+7q+4E71qT32MGDD6RK
 96AA==
X-Gm-Message-State: AO0yUKXwiTN1DHqwoBuJaRu8kJbUo49JZnhwzj/BVoDZDdEWtMScstdm
 tvJfclTnzcedSLco5hrzEeJLPA==
X-Google-Smtp-Source: AK7set8Es9R+WYKMYNTLSTbN0FL3YB2/XpWd0Smb5zeO3g5QU2UsoyFaK0G79+N9O9l6sEw0KYaBUg==
X-Received: by 2002:a05:600c:1550:b0:3ed:d2ae:9adb with SMTP id
 f16-20020a05600c155000b003edd2ae9adbmr14814003wmg.0.1680024670792; 
 Tue, 28 Mar 2023 10:31:10 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003ed2433aa4asm18000071wml.41.2023.03.28.10.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:31:10 -0700 (PDT)
Date: Tue, 28 Mar 2023 19:31:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-next
Message-ID: <ZCMkXPW5vdps3xQE@phenom.ffwll.local>
References: <CGME20230328040524epcas1p270b050efedfe53d8e59c7e9103d5b84c@epcas1p2.samsung.com>
 <20230328040524.49278-1-inki.dae@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328040524.49278-1-inki.dae@samsung.com>
X-Operating-System: Linux phenom 6.1.0-6-amd64 
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 01:05:24PM +0900, Inki Dae wrote:
> Hi Dave and Daniel,
> 
>    Just one patch series that moves the existing Exynos DSI driver
>    to drm/bridge directory to support both SoCs family - Exynos
>    and I.MX - because same Exynos MIPI DSI ip can be used by the two
>    different SoC family.
> 
>    Of course, there are some concerns about this patch series because Exynos
>    and I.MX SoCs have different HW characteristic but use the same HW driver.
>    However, I believe that there should be no problem as Exynos and I.MX
>    developers have conducted tests and reviews enough for about a year
>    since last April.
> 
>    This would be the first case that we allow different vendor SoCs to use
>    same device driver at least in DRM world so we anticipate experiencing
>    and resolving new issues through ongoing maintenance, and ultimately,
>    the experiences gained here will undoubtedly be able to contribute
>    the development of the community as well.
> 
>    Please kindly let me know if there is any problem.
> 
> Thanks,
> Inki Dae
> 
> The following changes since commit 46f28427f6f824b6cff06fa025a55350b7de454a:
> 
>   Merge tag 'drm-rcar-next-20230325' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-next (2023-03-27 18:20:20 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.4

Merged, but usually all drm bridge stuff goes through drm-misc, least so
that there's some amount of collaboration and not so much inter-tree
syncing.

Please apply for drm-misc commit rights (at least a quick check shows no
one from samsung) and land future bridge patches through that tree.

Cheers, Daniel

> 
> for you to fetch changes up to b2cfec52feb3bb737c4b65018ef4bfe9789e4be8:
> 
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support (2023-03-28 09:05:41 +0900)
> 
> ----------------------------------------------------------------
> A patch series for moving MIPI-DSI driver for Exynos DRM to drm/bridge
> directory so that I.MX SoC family can also share the same device driver.
> Samsung MIPI DSIM device is a common IP that can be used by Exynos and I.MX8M
> Mini/Nano/Plus SoC. Regarding this, this patch series has added several
> things below to existing MIPI DSI driver,
> 	- Add exynos_dsi_type enum type to provide controller data from different
> 	  platforms.
> 	- Add two pipeline detection ways support - existing Exynos DSI child node
> 	  and I.MX family of-graph port or ports.
> 	- Consider component and bridged based DRM drivers.
> 	- Add device tree binding support of I.MX family.
> 
> ----------------------------------------------------------------
> Jagan Teki (14):
>       drm: exynos: dsi: Drop explicit call to bridge detach
>       drm: exynos: dsi: Lookup OF-graph or Child node devices
>       drm: exynos: dsi: Mark PHY as optional
>       drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>       drm: exynos: dsi: Introduce hw_type platform data
>       drm: exynos: dsi: Add atomic check
>       drm: exynos: dsi: Add input_bus_flags
>       drm: exynos: dsi: Add atomic_get_input_bus_fmts
>       drm: exynos: dsi: Consolidate component and bridge
>       drm: exynos: dsi: Add host helper for te_irq_handler
>       drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>       drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>       dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
> 
> Marek Szyprowski (1):
>       drm: exynos: dsi: Handle proper host initialization
> 
> Marek Vasut (1):
>       drm: bridge: samsung-dsim: Add i.MX8M Plus support
> 
>  .../bindings/display/exynos/exynos_dsim.txt        |    2 +
>  MAINTAINERS                                        |    9 +
>  drivers/gpu/drm/bridge/Kconfig                     |   12 +
>  drivers/gpu/drm/bridge/Makefile                    |    1 +
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 1967 ++++++++++++++++++++
>  drivers/gpu/drm/exynos/Kconfig                     |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 1813 +-----------------
>  include/drm/bridge/samsung-dsim.h                  |  115 ++
>  8 files changed, 2191 insertions(+), 1729 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>  create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
