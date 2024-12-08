Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B639E83AC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 06:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA9C10E08E;
	Sun,  8 Dec 2024 05:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ibGpmUWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D610E31A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 05:42:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ffbf4580cbso34009061fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 21:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733636534; x=1734241334; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a+doQWgfaFt++i4Az41xe87IRcSeKOzxE+Pwbb6t85Q=;
 b=ibGpmUWTPHpUUfIt97+pt1qux8+nGN0Aqb4K1mlfAuBlxZVLCM1wOF9ipMB/h7DIHU
 Z8E7XJFHkEQaNEhewXZgcr2AXcacK8lOWYAB8CyGbVlUxNiQ6OSnEJGp0yysNSi9I3v5
 q9JSOHSyHqFA3ifRojV7pqWAqCrsfVNJS46rSxwd/lgmTizV0cImBd6Fc/MaW8VsC8/m
 g699ieoryT+i/N8AFReYfnCaEaS5+MypAoiJHq14v5kbQ+OG3cIzAsbaC0omWHzNByNQ
 Us39PCtLvvAVo3zUKTO747imv1cYkaOgkveCj1QcWZ9R+Ut4c5taRC3eMsc9nczP+N2c
 9GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733636534; x=1734241334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+doQWgfaFt++i4Az41xe87IRcSeKOzxE+Pwbb6t85Q=;
 b=Np+S87lZqTLoUVUi9eNNoIxOPojE4ZOB+S9Q/0fdaVdumXviA/Gv6qrQ8HylQhzJ15
 fsiYWfXwlHzDn2Ms4goVy/q2jAIPmHGNuJ2Uu6DziOink5sAHIHBGyJzj+GmIk9F7uaf
 Gah8myILtfX0raAq0I4/xL76m+C44iQZXWmCF1KWjWWbtdvULkCTgfWr2hV1tOhmEiTV
 SrJzwUI5ghbOfTHLxuLAc5wSwgYNJBIYBSbRY9z4eXHuLgRi64hhj1Miy9eqD92/sS6Q
 sx3B1QB4rulZtzhtdcOjMDFSQqhb7dPwndPWF2mnbnoI8EcAELtFoUbCZs2ynnrdR9CE
 LfwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfUH/g6LW7ll7sspy2uiwdQFHGIJUA9Mnsp2tGXI4Zd5FfzH5FXvqAvCkjrp/D+S0hIfzjMr99DyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy651oFVazQLtu0E5d6oKpW5sx/n8HNeQui/5H7tPf1QmmEj2V+
 itWoBeD81t3K+HFwJ+88DWCK8QwuWli8/gPnUToAD0dHXjOoioU7M+Yc6w04gec=
X-Gm-Gg: ASbGnctL9qmLNDSDRq/Ea23pcD1ntIR3Pjjs69nYi1kk7wuCrtrZxYR9RGGeLF9NYuf
 w5rfl4choxixW8VkoMpngwx1TBalj3rtOhGkDs5PU9O6Yb1s8nrg4yGw0ZsqQHQzI4jVd1QwIWY
 btVxzbgNnK9YLOT7F2lMdIrN3yIKLmWFJ0fM2e4rkpWMkgXFlC+F04CWeaZQwwtcwlyVA4ZBj3z
 RFll8RDbrSipJeQU5EkFx7QzL/4Q0BRTkT3+0G/jcbhqrJ5B86+D5CGHdsZ24w0qaH8w4oEsjbJ
 Wt6FSFgZB2wIhxWXD6Z+CzquXNF3OQ==
X-Google-Smtp-Source: AGHT+IGyzwqKRBcFOmxNeKJUuAFxvUPPAjz2mJfQWvWsM5egP50HJCrHNum4yCNnuaA+FdARgORrPQ==
X-Received: by 2002:a05:6512:23a1:b0:53e:391c:e983 with SMTP id
 2adb3069b0e04-53e391cec2fmr2500270e87.3.1733636534275; 
 Sat, 07 Dec 2024 21:42:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93369b98sm283528e87.280.2024.12.07.21.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 21:42:13 -0800 (PST)
Date: Sun, 8 Dec 2024 07:42:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
> Use the dp_panel's stream_id to adjust the offsets for stream 1
> which will be used for MST in the dp_catalog. Also add additional
> register defines for stream 1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
>  5 files changed, 99 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index ee7f2d0b23aa034428a01ef2c9752f51013c5e01..e6f6edf617898241c74580eb0ae6bc58f06a154f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -457,10 +457,20 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
>  					u32 test_bits_depth)
>  {
>  	u32 misc_val;
> +	u32 reg_offset = 0;
> +
>  	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>  				struct msm_dp_catalog_private, msm_dp_catalog);
>  
> -	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +	if (msm_dp_catalog->stream_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid stream_id:%d\n", msm_dp_catalog->stream_id);
> +		return;
> +	}

Please drop extra-protective handling. How can stream_id become invalid?

> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +
> +	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + reg_offset);
>  
>  	/* clear bpp bits */
>  	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> @@ -470,7 +480,7 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
>  	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>  
>  	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
> -	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
> +	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>  }
>  
>  void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
> @@ -500,10 +510,21 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
>  	unsigned long den, num;
> +	u32 mvid_reg_off = 0, nvid_reg_off = 0;
>  
>  	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>  				struct msm_dp_catalog_private, msm_dp_catalog);
>  
> +	if (msm_dp_catalog->stream_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid stream_id:%d\n", msm_dp_catalog->stream_id);
> +		return;
> +	}
> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1) {
> +		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
> +		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
> +	}
> +
>  	if (rate == link_rate_hbr3)
>  		pixel_div = 6;
>  	else if (rate == 162000 || rate == 270000)
> @@ -545,9 +566,14 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>  		nvid *= 3;
>  
>  	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> -	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
> -	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
> -	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> +
> +	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
> +	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
> +		msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
> +	else
> +		msm_dp_write_p1(catalog, MMSS_DP_DSC_DTO, 0x0);
>  }
>  
>  int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
> @@ -910,13 +936,20 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
>  	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>  				struct msm_dp_catalog_private, msm_dp_catalog);
>  	u32 reg;
> +	u32 offset = 0;
> +
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
> +		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
>  
> -	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
> -	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
> -	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
> -	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
> +	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER + offset, total);
> +	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
> +	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
> +	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
>  
> -	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
> +		reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
> +	else
> +		reg = msm_dp_read_p1(catalog, MMSS_DP_INTF_CONFIG);
>  
>  	if (msm_dp_catalog->wide_bus_en)
>  		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
> @@ -926,7 +959,11 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
>  
>  	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
>  
> -	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
> +		msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
> +	else
> +		msm_dp_write_p1(catalog, MMSS_DP_INTF_CONFIG, reg);
> +
>  	return 0;
>  }
>  
> @@ -936,18 +973,22 @@ static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_cata
>  	u32 header[2];
>  	u32 val;
>  	int i;
> +	u32 msm_dp_generic_offset = 0;
>  
>  	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>  
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
> +		msm_dp_generic_offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
> +
>  	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>  
> -	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
> -	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
> +	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0 + msm_dp_generic_offset, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1 + msm_dp_generic_offset, header[1]);
>  
>  	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>  		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>  		       (vsc_sdp->db[i + 3] << 24));
> -		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
> +		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i + msm_dp_generic_offset, val);
>  	}
>  }
>  
> @@ -955,13 +996,17 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
>  {
>  	struct msm_dp_catalog_private *catalog;
>  	u32 hw_revision;
> +	u32 sdp_cfg3_offset = 0;
>  
>  	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>  
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
> +		sdp_cfg3_offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
> +
>  	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
>  	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
> -		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> -		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> +		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x01);
> +		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x00);
>  	}
>  }
>  
> @@ -969,18 +1014,27 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
>  {
>  	struct msm_dp_catalog_private *catalog;
>  	u32 cfg, cfg2, misc;
> +	u32 misc_reg_offset = 0;
> +	u32 sdp_cfg_offset = 0;
> +	u32 sdp_cfg2_offset = 0;
>  
>  	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>  
> -	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
> -	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
> -	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
> +	if (msm_dp_catalog->stream_id == DP_STREAM_1) {
> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
> +	}
> +
> +	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg |= GEN0_SDP_EN;
> -	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
> +	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>  
>  	cfg2 |= GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
> +	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>  
>  	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
>  
> @@ -990,7 +1044,8 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
>  	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
> +
> +	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>  
>  	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index edeebf1f313f50e9c54feee1e5aa6aa2dbba3058..c020b7cfa008241e937f6a53764b136431f1dbd9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -47,10 +47,6 @@ enum msm_dp_catalog_audio_header_type {
>  	DP_AUDIO_SDP_HEADER_MAX,
>  };
>  
> -struct msm_dp_catalog {
> -	bool wide_bus_en;
> -};
> -
>  /* stream id */
>  enum msm_dp_stream_id {
>  	DP_STREAM_0,
> @@ -60,6 +56,11 @@ enum msm_dp_stream_id {
>  	DP_STREAM_MAX,
>  };
>  
> +struct msm_dp_catalog {
> +	bool wide_bus_en;
> +	enum msm_dp_stream_id stream_id;
> +};
> +

The same can be achieved by moving enum msm_dp_stream_id up in one of
the earlier patches.

>  /* Debug module */
>  void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 0648831df956dfc7afa1cbfb0dea2c32b02ff74e..ba39b009032dd6f5cb708988963cd6acb6838e4a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -179,6 +179,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  						struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 cc, tb;
> +	ctrl->catalog->stream_id = msm_dp_panel->stream_id;
>  
>  	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>  	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
> @@ -2062,7 +2063,9 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_d
>  	struct msm_dp_ctrl_private *ctrl;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +	ctrl->catalog->stream_id = dp_panel->stream_id;
>  	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +
>  }
>  
>  void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
>  
>  	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	catalog = panel->catalog;
> +
>  	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
> +	catalog->stream_id = msm_dp_panel->stream_id;

Why is it a proper place to set catalog->stream_id? It doesn't looks
like it to me.

>  
>  	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..6c534fde6034fced2cb428e9a29de31ed5c5fcc4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -138,13 +138,17 @@
>  #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>  
>  #define REG_DP_SOFTWARE_MVID			(0x00000010)
> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
>  #define REG_DP_SOFTWARE_NVID			(0x00000018)
> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
>  #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>  #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>  #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>  #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
> -
>  #define REG_DP_MISC1_MISC0			(0x0000002C)
> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> +
>  #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> @@ -211,8 +215,11 @@
>  #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
>  
>  #define MMSS_DP_SDP_CFG				(0x00000228)
> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
>  #define GEN0_SDP_EN				(0x00020000)
>  #define MMSS_DP_SDP_CFG2			(0x0000022C)
> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> +
>  #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>  #define GENERIC0_SDPSIZE_VALID			(0x00010000)
> @@ -221,6 +228,8 @@
>  #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
>  
>  #define MMSS_DP_SDP_CFG3			(0x0000024c)
> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +
>  #define UPDATE_SDP				(0x00000001)
>  
>  #define MMSS_DP_EXTENSION_0			(0x00000250)
> @@ -270,6 +279,8 @@
>  #define MMSS_DP_GENERIC1_8			(0x00000348)
>  #define MMSS_DP_GENERIC1_9			(0x0000034C)
>  
> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> +
>  #define MMSS_DP_VSCEXT_0			(0x000002D0)
>  #define MMSS_DP_VSCEXT_1			(0x000002D4)
>  #define MMSS_DP_VSCEXT_2			(0x000002D8)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
