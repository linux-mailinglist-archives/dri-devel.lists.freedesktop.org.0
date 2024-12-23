Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C79FADB9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB4110E51F;
	Mon, 23 Dec 2024 11:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j2nNP42N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B6210E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:32:15 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so5428114e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734953534; x=1735558334; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
 b=j2nNP42NEyCrE8r4fiI9xkwEtVGMUuUdBoRqB8kc/v5OezZx9dwSIjfCXpJP4VZkja
 z53XpA6lvp4lKa9zhQBGQK4F+NbDMUWpdHRSEQn1bx1PpEc8RqlVslBCTNtRzxHlzUft
 hzXb2Ipr8b0x0XgjoNAi7iadTGF+CBOpq5ZxI+vrSnFFSnC0UZ1ZJ8hCDcF0haXlNJ1z
 riQGM8Cw28mwjcZLBvEOeMCwKtarbWMc7g1X1r2tZNG+EmOoix/j5PViU6RkhYZeG3oo
 ai+KYq6zxkpksqEa3OcOGIcoQ3vuje6SAFTfhLo9bVk0XnR7JQY67YrXJnnLoVyxc6Ka
 zwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734953534; x=1735558334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Io0aFnNNwQiWHsIlYK7BZZBTMpe4hxTbSGJahPhqnd0=;
 b=Dd/Ps9E33C9UC14+WbbRiaXQQaGCNxsynjwH9heFud33sfg99eBR0dXjE1X5g1PI8s
 7YgOtf4NLmtxyt/wrmdqnHuHIsq2rpl2dCBbz3giRommybocnyq1YUE1j9R8zRZjmy64
 B4K1/lfBVwonD7essPqho0F7mlDkTwJkK0SgGz+nS+17Zl/QLIE4s8dcsePn96GsMK05
 WOBthMR1BCBg2DwX0RozS3VFkTXS5CJ0WbwMM+A8T2o/RwVDZ+OcknrNoEBeIbt3be8Q
 3J6dUnTLJOCyJjQkVlGZOp6aseiQslWZ8JVxy/8ET3YJ239wRfK/SJj7GWwSo6AI4ZRZ
 +GkA==
X-Gm-Message-State: AOJu0YxN2CGdGGKHQO0piCn2+iSTpMJ1lCU+QM/N05wfR/i0rZB2whi2
 HPud/Ghqv00pAVFsAxrVhNpnsw/Fmo4BNhulkiRgoyS5ka8nJUodsKu8PV5SJos=
X-Gm-Gg: ASbGncutH2suDxXoxELxH3hVFRmybHJh35NB5694IqPBzPHNi4bnpIHzt8YsNLF3ZJ/
 d/QM1tqq3Qs0w5lw15X14W/wOBBaAQlIyrr6Kj1EQNDoaHMfyWEik/HgWxnwocwI/0ivDk1BA1o
 2akX21REFXbC15paympDtIV1C7RtfBpdKihyGR+C42/fK0+A056rMI3rtydfLSt5dY4mly99eo5
 EG2rh4heDZ/9WNiXsV5WdgLm6d16LfWWbDZFEsgfRjJqPfAdNm2PkABZOovwFAfK/x59KqSfw43
 bC7kg70jjeP1WJehh9q6XtQWRrGqPIYCrB2/
X-Google-Smtp-Source: AGHT+IFQAVVka8tfhQQLypKSuFFeZTfbXIdbwFKArHWMlABaOq9wX6sZw2Zp8LWAHfr0uv4tXZ5d1Q==
X-Received: by 2002:a05:6512:23a2:b0:542:1bdb:9a61 with SMTP id
 2adb3069b0e04-5422946f053mr3666830e87.19.1734953533962; 
 Mon, 23 Dec 2024 03:32:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223831fdesm1270675e87.241.2024.12.23.03.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 03:32:12 -0800 (PST)
Date: Mon, 23 Dec 2024 13:32:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
Message-ID: <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-13-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-13-victor.liu@nxp.com>
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

On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller(DC) is comprised of three main components that
> include a blit engine for 2D graphics accelerations, display controller for
> display output processing, as well as a command sequencer.  Add kernel
> mode setting support for the display controller part with two CRTCs and
> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
> registers of the display controller are accessed without command sequencer
> involved, instead just by using CPU.  The command sequencer is supposed to
> be used by the blit engine.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
> * Inline dc_crtc_check_clock(). (Dmitry)
> * Use global drm_dc->pe. (Dmitry)
> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
> * Define common IRQ handlers separately for each IRQs. (Dmitry)
> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
>   and correctly include drm/clients/drm_client_setup.h.
> * Collect Maxime's R-b tag.
> 
> v6:
> * No change.
> 
> v5:
> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
> 
> v4:
> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>   function calls from KMS routine to initialization stage. (Dmitry)
> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>   appropriate .h header files or .c source files. (Dmitry)
> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> * Drop dc_drm->pe_rpm_count. (Dmitry)
> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>   Instead, put it in struct dc_crtc.  (Dmitry)
> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>   (Dmitry)
> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> * Select DRM_CLIENT_SELECTION due to rebase.
> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>   rebase.
> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>   register dc_drm_component_unbind_all() action.
> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>   make sure next bridge is found first.
> 
> v3:
> * No change.
> 
> v2:
> * Find next bridge from TCon's port.
> * Drop drm/drm_module.h include from dc-drv.c.
> 
>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
>  9 files changed, 1342 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
> 


> +
> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
> +					struct drm_crtc_state *crtc_state)
> +{
> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> +	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
> +	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
> +		dc_plane_dbg(state->plane, "no off screen\n");
> +		return -EINVAL;
> +	}

Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?

With that in mind

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +
> +	return 0;
> +}
> +
-- 
With best wishes
Dmitry
