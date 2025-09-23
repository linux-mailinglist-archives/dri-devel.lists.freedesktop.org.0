Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A42B93C08
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 02:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFB210E07B;
	Tue, 23 Sep 2025 00:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpq/IUVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3514810E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 00:53:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHFra3004892
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 00:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=A0ejDteovNx3lutfqEZ0wERW
 05YuCdNkebjmQBOXb0g=; b=gpq/IUVUQeuJL29Sk9CaWGVUYqwfP4WdpIRvhTAF
 DGtqU5bpSnPDIFJ0xfnym2lQvxnN2xaf6HS4MCk/BAZlEb4e6cQf2uwqZ8xncyr+
 Ev716gHbvECMHcvaZ5GcEym/6Bf0aWUReZHV/uFqoHp24zP2AVKXE0whJ0BUFdNh
 vd4pXmThgaDkqgDSSaRLt0SXPiNzAC6UG72qEI6Ip62svVwx8a74Ms3RjL/F1vgT
 XqMzumsgN4BVlfomQ+9OKYNvpUHlDTUtFjkhWZmy/Q9GviB55q73k5Mcoshpbzv0
 rVqX8A/3N3g4mGkvwYN9/K3liaFlCuFiGNgsIrlWHzlMIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnpxdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 00:53:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-795cd25af0aso47525966d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 17:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758588820; x=1759193620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0ejDteovNx3lutfqEZ0wERW05YuCdNkebjmQBOXb0g=;
 b=qJYD66jgGXTFqTU7wCZxsQQIlOuXATOOiX3HDOdg7SQC8mKymiqW4mPpriokKA+3lY
 51f+tT2775tTeNPDqmB3wsL7WSTOvcVFh2TGIg2rxeLEfXMBaa8f+HWDCi1GUtEK6YNO
 YGVkrYNtksQcFV4adwAHvMokSdTrh4Wk6vKVVt5FYAcQ4WDUfrWpX60Y4LmcAmqhhc6j
 OT+P7V2vQ4fhn+kdPPqmxXBJvHA0GQVVPyF/QIE7g5gycVJ2wi1Sfy2ZlSj53b9HDIKS
 0jcwrHqRKsZbxMKdW27RFDL2OYtytfqRKL/sfwfNpnFRbfP8yy9U0EVSrronyLS/Euzd
 VGJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhi6uvRidGMqR7Hw2PakSGg+BPxcIUEIuhZYNFiZBlJztFbt490OEM9AKOpdWpelSsyv14iLlv0sQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy98kikRKJP2jh186RlO0v+0+D7Bx2h2I+TY3lv39YZ0SyCm2sc
 chBrfWXVONapE15/a06ANj33qTmivEI4MLqa8r+WtJylfcIH67xdTPn6EYHNyRyvg2qtaNLWOLO
 gcMRKJlcVTSIHBeXKL8LoS6ppGS+DVuObw8bY0wteh7F8oBKMYyp36IN/0jex7DjJ5uUkTa8=
X-Gm-Gg: ASbGnctWA/J0c5R4Smd8cjzb7M838RpRorSImXmJa0wvkZnFbnjv/nmZmNpNfGyludc
 2b950T/+dl6kMOTiQnxynUnNwGQ4gz8iSsudpBQquG/X+tx6VZpjkow3V3kq5ztWFLPlgJgHDhc
 e/9tx7eVNOcx9O9TR2U+DTXys+LYmoZmtHpyrC7mgjDQcIeNxMMM+IO/MDeYCOvTLzMKwSuIr+5
 VAGfueFtPB8kKHzB2UjX/sWlml5p1Gc0FgnJnOyi1uJkS8YGahSLBxapTnZvwsAbN/1tjCE57Zp
 CnXF2Oz5vhNdSeNnvojkrrDBiYIWgpn8025KTP2yDgpo4jowe8BW9U1ZmnK9mWMyQ6miX4Klejm
 691J2symqRbiadDMsJUF+UGnnQT3MFh44DIQakAtZzdLu0I560cyY
X-Received: by 2002:a05:6214:dac:b0:792:50bd:2fa8 with SMTP id
 6a1803df08f44-7e7027cf866mr10593226d6.30.1758588820089; 
 Mon, 22 Sep 2025 17:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCVW+jgFymH6ugT8RZ+VX3dkHRF5VrlyFvp+GIT+bYXUiMJUgbOusL9ZRVnMDthCoKsQIBCA==
X-Received: by 2002:a05:6214:dac:b0:792:50bd:2fa8 with SMTP id
 6a1803df08f44-7e7027cf866mr10592946d6.30.1758588819402; 
 Mon, 22 Sep 2025 17:53:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b7e33b78bsm2160908e87.45.2025.09.22.17.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 17:53:38 -0700 (PDT)
Date: Tue, 23 Sep 2025 03:53:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <a46szgmjrwgqhv5issuijyvih4tof3xa45tdhxv4qjplekszpz@55tgbkeby7zr>
References: <20250921083446.790374-1-uwu@icenowy.me>
 <20250921083446.790374-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921083446.790374-4-uwu@icenowy.me>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d1ef95 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=UYI74FSAo_19EvzY_j0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: cl7Snqw8a00xaL-30_HarqEDgyWYl55Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzSSFnth0Xtv7
 Zd0PAoC7RpyTeM6q+1xd92RxzcGzQtZSGs4gU/+2ReL4aZFW5FWRg9JzotG/wO3op6k9DhEJvrr
 FweKTN8sVyS4QIDMAsA9E5zJGmJIqTEC4tZWu8SzFfymxqwb6jchIMri9WOZkC3ZtrAxRrrlIcf
 8K/VACSvPhbqT48jqAP4oOFtwNjhdr0qtn+0xhiVK91zxROzoQ+sl9LC7DwFbMgIQqD+0MkU4og
 jqf0wFl9Akrd/9Gsd5Vo6ZAuI+VgrRLBuvNylKTVa7BXlKBP+U+CseYSiIW4AITXtKVQH/66V3d
 bbh/KU8uuy2H+v2vhpfA9+DGDoANSNdz1ZxCInrKlNL2eOYSESVojryjg1VkJ2WtsCZEhYDpeba
 5MOXSp4N
X-Proofpoint-GUID: cl7Snqw8a00xaL-30_HarqEDgyWYl55Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
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

On Sun, Sep 21, 2025 at 04:34:41PM +0800, Icenowy Zheng wrote:
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
> 
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
> 
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Changed some Control flows according to previous reviews.
> - Added missing of_node_put when checking of endpoints for output type.
> - Switched all userspace-visible modeset objects to be managed by drmm
>   instead of devm.
> - Utilize devm_drm_bridge_alloc() in internal bridge.
> - Prevented the usage of simple encoder helpers by passing a NULL funcs pointer.
> - Let devm enable clocks when getting them.
> - Removed explicit `.cache_type = REGCACHE_NONE` in regmap config.
> - Fixed a debug print using a variable before initialization.
> - Fixed a wrong index when using bulk to handle resets.
> - Added missing configuration for DPI format (currently fixed RGB888).
> 
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
>  drivers/gpu/drm/verisilicon/Makefile          |   5 +
>  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
>  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
>  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
>  drivers/gpu/drm/verisilicon/vs_dc.c           | 205 +++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
>  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
>  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
>  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
>  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
>  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
>  .../gpu/drm/verisilicon/vs_primary_plane.c    | 157 +++++++++
>  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
>  21 files changed, 1789 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> 
> +
> +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> +	    !vs_bridge_out_dp_fmt_supported(bridge_state->output_bus_cfg.format))
> +		return -EINVAL;

I still think that it's better to have per-interface type bridge funcs
rather than checking for the interface type inside the function.

> +
> +	vbridge->output_bus_fmt = bridge_state->output_bus_cfg.format;
> +
> +	return 0;
> +}
> +
> +
> +	bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
> +				       &vs_bridge_funcs);
> +	if (!bridge)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bridge->crtc = crtc;
> +	bridge->intf = intf;
> +	bridge->next = next;
> +
> +	if (intf == VSDC_OUTPUT_INTERFACE_DPI)
> +		enctype = DRM_MODE_ENCODER_DPI;
> +	else
> +		enctype = DRM_MODE_ENCODER_NONE;

Nit: DRM_MODE_ENCODER_TMDS ?

> +
> +	bridge->enc = drmm_plain_encoder_alloc(drm_dev, NULL, enctype, NULL);
> +	if (IS_ERR(bridge->enc)) {
> +		dev_err(drm_dev->dev,
> +			"Cannot initialize encoder for output %u\n", output);
> +		ret = PTR_ERR(bridge->enc);
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->enc->possible_crtcs = drm_crtc_mask(&crtc->base);
> +
> +	ret = drm_bridge_attach(bridge->enc, &bridge->base, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(drm_dev->dev,
> +			"Cannot attach bridge for output %u\n", output);
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->conn = drm_bridge_connector_init(drm_dev, bridge->enc);
> +	if (IS_ERR(bridge->conn)) {
> +		dev_err(drm_dev->dev,
> +			"Cannot create connector for output %u\n", output);
> +		ret = PTR_ERR(bridge->conn);
> +		return ERR_PTR(ret);
> +	}
> +	drm_connector_attach_encoder(bridge->conn, bridge->enc);
> +
> +	return bridge;
> +}

Other than that LGTM.

-- 
With best wishes
Dmitry
