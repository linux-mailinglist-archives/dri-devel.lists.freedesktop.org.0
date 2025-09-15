Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F5B577A1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37FD10E089;
	Mon, 15 Sep 2025 11:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1P/07yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3F110E089
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:07:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgGs002161
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iy7dHwFbB9mlukI3Ou72qI0f
 7dnuKHmyAiJ34kl7Ncg=; b=A1P/07ypox8+isQgmAWNVctZOqq8d7ZbVcZkE4yf
 nmEkWGq6eK+/0Gtv9VNHo8BlIcJ2haTTgKbIunh+kxiziIrk/CsgO7TZ7WfAmreC
 qnOlwqWC1S0CJRrEcCxdnG4IlOKrW9eIqKpWS8wXy3Vz6LH3v1KKpSH4jR3+SkYO
 oajM78Muw/erHAIauK8hN1UTcpiiXeVaG1WQQG4kL4Zs2dOEbrpV56+Ybm+Y+D9W
 JiQjUld8UT1p2r+C0jKhVDLeNetYnEnnFZ/7IiP9BpvbbPvNIIHwPLFlP3r2DQ2d
 Nu/sEMJJQeYTF3hIexn0b7QUiJ6kbchekpAXsJS3MSZdPw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9915q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:07:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso80959606d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757934423; x=1758539223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iy7dHwFbB9mlukI3Ou72qI0f7dnuKHmyAiJ34kl7Ncg=;
 b=neUljvGXxHnO/4CoTT3Fqsxq/uXkwkpTjV7JD6sHK0fqSgjREeoNxe8zjaZs3tbLZ7
 7Qb3iec0NBSE8R85+Nh5uyMkNU+qiqqluLNosAgnxWl3+Ba8S5Z9twIu/Ra9FDt58W/V
 geCXnahbtYZGUat8QsP2BSM02m2/b9DjwJUxlvgyMsweXcJQFupCCknjaZL3V+FAXyn3
 0vwmP1OJKbBieRejRTFoYKyggJYzNVMPOpBbQXCIlS2pnRx8f+4mf5XwNli77c83rS70
 Ta9QxsgN+peb7D6YHIVUDZMb4GRlz8fYcZqjrYO9tnOZT7Qywybahd5NdTBq4pJ5zKw4
 UBJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFeoy7hySCu47dlIyz7gPiAVaQzLKUWs+6CQtqyajGLzOAEZy2sO5j3ACWgAUcBTs4SbYakL6hXL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiwzpIRyyAvmluFy1i8B9dhqc/z1QWjYGnRXbPQCElaCTizty1
 ctBQfVvKlh3n/Xz1U7nWPxK0kwkQEQSjGTZsjl7603yYW04Z4+vCVxTvSl4H2U0agJo/f6LR7+D
 cQuH5QnuIrimNC7CS2rPoqQf3SYURRoN0YtDrHtaDXVQUi68yODiiOP40kXRTWhMGFotK1Fk=
X-Gm-Gg: ASbGncvmpFOY8quAFQ9rj8IttjkpCWntv7wTZVS0wpqOrMALLSoqGWad/DXBMGeADJm
 Tjw+IBcgwnOOqxg0eplRoTvrq/N/nsbLB9z5AiXaDFPC2i97EDhFKy2RNGXvWpN8ni2ny4uyqmM
 zqKNcKlqJUB/vMAvarFpB74MteuQU7BWrToOf1x9fxtUgPGq+XbI5H450faVKeePaWaprxokuJk
 WEb4x8Bn6HQxQeedFNS9BWBYujSAduNcinZHWo0CN4pQYXZIul7x667gXWERxil977nQa+oulNC
 T19tTKBPy68ASa8dNyyF1bhdD/jIojjsB/ysgMtwOLvkkju1SqiPKvP6BvPCVRgm0f4tUx1fptw
 USUd6SIX1W4oXOmQB4NWrva46Akl7b0eTFLTmpGNNo6N5/uAUZbka
X-Received: by 2002:a05:6214:226b:b0:71a:e4c5:72c7 with SMTP id
 6a1803df08f44-767ba278d78mr142969256d6.7.1757934422842; 
 Mon, 15 Sep 2025 04:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyd8YN64F1p1Hr2L71UKnLlOabO3ZBbpW3VBIJ+ZbWMqfkiYywNER3QB1wQjjJR3jOe5JCHw==
X-Received: by 2002:a05:6214:226b:b0:71a:e4c5:72c7 with SMTP id
 6a1803df08f44-767ba278d78mr142968106d6.7.1757934421662; 
 Mon, 15 Sep 2025 04:07:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1b4920acsm25925161fa.58.2025.09.15.04.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:07:00 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:06:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sjakhade@cadence.com, yamonkar@cadence.com,
 lumag@kernel.org, dianders@chromium.org, jani.nikula@intel.com,
 luca.ceresoli@bootlin.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add support for DSC
 and FEC
Message-ID: <pwd4hocrxrnfymby6szzp7irlveoa36er7yn5ivlht5mwxrpdz@r237bd3epols>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
 <20250915103041.3891448-3-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915103041.3891448-3-h-shenoy@ti.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7f358 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Br2UW1UjAAAA:8 a=sozttTNsAAAA:8 a=urovRqgsND8H0WWsOIkA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: DvoN5_pBR0WCD80sle60geOzb5VXoNYr
X-Proofpoint-ORIG-GUID: DvoN5_pBR0WCD80sle60geOzb5VXoNYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfXwZ/BWy1MIDwe
 gK5D1TzF2WCNnCUVjhgemcFtDajk4oFnFxYVZKcvBGanxAL6uTVQUe6ODrVtWK2MmZ9stGdWgtX
 T614QDEujekaS6vboTN2eWXM4ITW//l6cE179IvDQyFpxEIPIB5XDfC3I1I+BFNE057Ymw0SM/P
 mp+dL8ukAIpG/Z+OX5iPdDsTqfXWDuGKJ8zqHaetxOi3SylMQGcndwgamKAA0Yx6soQp8WOGVsv
 zQ6UyGw01M7z/MfWI+2iBP8dlJm2SfT1GVXm1iEB/O8KOKoMb/62Ivget3aXeaWmCJfrgSGHYbr
 gMZOFgXgAEiC0OZ70iFYm64TH1+tUWOI8auIktskMBlKYTHtHpUXwRQJQwG6UWSldCia/YnBqVq
 wFUQA3Ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Mon, Sep 15, 2025 at 04:00:41PM +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Enable support for Display Stream Compression (DSC) in independent
> mode with a single stream, along with Forward Error Correction (FEC)
> in the Cadence MHDP8546 DisplayPort controller driver.
> 
> FEC is required when DSC is enabled to ensure reliable transmission
> of the compressed stream.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 367 ++++++++-
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  68 ++
>  .../drm/bridge/cadence/cdns-mhdp8546-dsc.c    | 695 ++++++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-dsc.h    | 285 +++++++
>  5 files changed, 1392 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> index c95fd5b81d13..7957fbdc1b78 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -3,5 +3,5 @@ obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  cdns-dsi-y := cdns-dsi-core.o
>  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
>  obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
> -cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> +cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o cdns-mhdp8546-dsc.o
>  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index a614d1384f71..df8bbf8919b2 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -50,6 +50,7 @@
>  #include <linux/unaligned.h>
>  
>  #include "cdns-mhdp8546-core.h"
> +#include "cdns-mhdp8546-dsc.h"
>  #include "cdns-mhdp8546-hdcp.h"
>  #include "cdns-mhdp8546-j721e.h"
>  
> @@ -545,6 +546,116 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
>  	return ret;
>  }
>  
> +static int cdns_mhdp_wait_for_fec(struct cdns_mhdp_device *mhdp,
> +				  bool expected_status)
> +{
> +	u32 fec_status;
> +	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
> +
> +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FEC_STATUS, &fec_status);
> +	while (((fec_status & CDNS_DP_FEC_BUSY) != expected_status) &&
> +	       time_before(jiffies, timeout)) {
> +		cdns_mhdp_reg_read(mhdp, CDNS_DP_FEC_STATUS, &fec_status);
> +		cpu_relax();
> +	}
> +
> +	if (time_after_eq(jiffies, timeout)) {
> +		DRM_DEV_ERROR(mhdp->dev, "Timeout while waiting for FEC\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cdns_mhdp_fec_sink_support(struct cdns_mhdp_device *mhdp)
> +{
> +	int ret;
> +	u16 dpcd_buffer;
> +
> +	ret = drm_dp_dpcd_read(&mhdp->aux, DP_FEC_CAPABILITY, &dpcd_buffer, 1);
> +	if (ret < 0)
> +		goto err;

Only since DP 1.4 if I'm not mistaken.

> +
> +	if (!(dpcd_buffer & DP_FEC_CAPABLE)) {
> +		ret = -EOPNOTSUPP;
> +		DRM_DEV_ERROR(mhdp->dev, "sink does not support FEC: %d\n", ret);

This is too loud.

> +		goto err;
> +	}
> +
> +	if (ret > 0)
> +		return 0;
> +err:
> +	return ret;
> +}

Consider extracting a common helper and using it here and in the Intel
DP driver. Also please use new DPCD helpers which return 0 instead of
size.

> +
> +static int cdns_mhdp_fec_sink_set_ready(struct cdns_mhdp_device *mhdp,
> +					bool enable)
> +{
> +	int ret;
> +	u8 dpcd_buffer;
> +
> +	ret = drm_dp_dpcd_read(&mhdp->aux, DP_FEC_CONFIGURATION, &dpcd_buffer, 1);
> +	if (ret < 0)
> +		goto err;

No need to read it back, it's controlled by DPTX and you don't set
anything else.

> +
> +	if (enable)
> +		dpcd_buffer |= DP_FEC_READY;
> +	else
> +		dpcd_buffer &= ~DP_FEC_READY;
> +
> +	ret = drm_dp_dpcd_write(&mhdp->aux, DP_FEC_CONFIGURATION, &dpcd_buffer, 1);
> +
> +	if (ret > 0)
> +		return 0;
> +err:
> +	DRM_DEV_ERROR(mhdp->dev, "cannot set sink FEC ready: %d\n", ret);
> +	return  ret;
> +}
> +
> +static int cdns_mhdp_fec_set_ready(struct cdns_mhdp_device *mhdp, bool enable)
> +{
> +	int ret;
> +
> +	ret = cdns_mhdp_fec_sink_support(mhdp);
> +	if (ret)
> +		goto err;
> +
> +	ret = cdns_mhdp_fec_sink_set_ready(mhdp, enable);
> +	if (ret)
> +		goto err;
> +
> +	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_FEC_CTRL, 1, 1, enable);
> +	if (ret)
> +		goto err;
> +
> +err:
> +	return ret;
> +}
> +
> +static int cdns_mhdp_fec_enable(struct cdns_mhdp_device *mhdp, bool enable)
> +{
> +	int ret;
> +	u32 resp;
> +
> +	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
> +	if (ret < 0)
> +		goto err;
> +
> +	if (!(resp & CDNS_DP_NO_VIDEO_MODE)) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_FEC_CTRL, 0, 1, enable);
> +	if (ret)
> +		goto err;
> +
> +	return cdns_mhdp_wait_for_fec(mhdp, enable);
> +err:
> +	DRM_DEV_ERROR(mhdp->dev, "set fec enable failed: %d\n", ret);
> +	return ret;
> +}
> +
>  /**
>   * cdns_mhdp_link_configure() - configure a DisplayPort link
>   * @aux: DisplayPort AUX channel
> @@ -1407,6 +1518,13 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
>  	amp[1] = DP_SET_ANSI_8B10B;
>  	drm_dp_dpcd_write(&mhdp->aux, DP_DOWNSPREAD_CTRL, amp, 2);
>  
> +	if (cdns_mhdp_fec_set_ready(mhdp, true)) {
> +		mhdp->fec_enabled = false;
> +		dev_info(mhdp->dev, "Cannot set FEC ready.\n");

If DPRX doesn't support FEC, we've just got several messages for no
particular reason. It's an optional feature.

> +	} else {
> +		mhdp->fec_enabled = true;
> +	}
> +
>  	if (mhdp->host.fast_link & mhdp->sink.fast_link) {
>  		dev_err(mhdp->dev, "fastlink not supported\n");
>  		return -EOPNOTSUPP;
> @@ -1494,10 +1612,14 @@ static int cdns_mhdp_connector_detect(struct drm_connector *conn,
>  	return cdns_mhdp_detect(mhdp);
>  }
>  
> -static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
> +static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_device *mhdp)
>  {
> +	struct cdns_mhdp_display_fmt *fmt = &mhdp->display_fmt;
>  	u32 bpp;
>  
> +	if (mhdp->dsc_params.compression_enable)
> +		return mhdp->dsc_params.compressed_bpp;
> +
>  	if (fmt->y_only)
>  		return fmt->bpc;
>  
> @@ -1533,7 +1655,7 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
>  	 * units of the rate parameter.
>  	 */
>  
> -	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> +	bpp = cdns_mhdp_get_bpp(mhdp);
>  	req_bw = mode->clock * bpp / 8;
>  	max_bw = lanes * rate;
>  	if (req_bw > max_bw) {
> @@ -1693,6 +1815,74 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> +static int cdns_mhdp_dsc_set_stream_compressed(struct cdns_mhdp_device *mhdp,
> +					       int stream_id, bool compressed)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_VB_ID(stream_id), &reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (compressed)
> +		reg_val |= CDNS_DP_VB_ID_COMPRESSED;
> +	else
> +		reg_val &= ~CDNS_DP_VB_ID_COMPRESSED;
> +
> +	return cdns_mhdp_reg_write(mhdp, CDNS_DP_VB_ID(stream_id), reg_val);
> +}
> +
> +static int cdns_mhdp_dsc_wait_for_completion(struct cdns_mhdp_device *mhdp,
> +					     u8 event_bit, int stream_id)
> +{
> +	u32 dsc_ctrl;
> +	int ret;
> +	unsigned long timeout;
> +
> +	ret = cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_DSC_CTRL(stream_id),
> +				      event_bit, 1, true);
> +	if (ret)
> +		return ret;
> +
> +	timeout = jiffies + msecs_to_jiffies(1000);
> +
> +	do {
> +		cdns_mhdp_reg_read(mhdp, CDNS_DP_DSC_CTRL(stream_id), &dsc_ctrl);
> +		cpu_relax();
> +	} while (((dsc_ctrl & (1 << event_bit)) != 0) && time_before(jiffies, timeout));
> +
> +	if (time_after_eq(jiffies, timeout)) {
> +		DRM_DEV_ERROR(mhdp->dev, "Timeout while waiting for event %d\n", event_bit);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cdns_mhdp_dsc_reset(struct cdns_mhdp_device *mhdp)
> +{
> +	/* Setting reset bit in any stream resets entire DSC. Stream 0 may always be used for it. */
> +	return cdns_mhdp_dsc_wait_for_completion(mhdp, CDNS_DP_DSC_CTRL_SW_RST_BIT, 0);
> +}
> +
> +static int cdns_mhdp_dsc_update(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	return cdns_mhdp_dsc_wait_for_completion(mhdp, CDNS_DP_DSC_CTRL_REG_UPDATE_BIT,
> +						 stream_id);
> +}
> +
> +static int cdns_mhdp_dsc_enable(struct cdns_mhdp_device *mhdp, int stream_id, bool enable)
> +{
> +	return cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_DSC_CTRL(stream_id),
> +				       CDNS_DP_DSC_CTRL_EN_BIT, 1, enable ? 1 : 0);
> +}
> +
> +static int cdns_mhdp_dsc_sink_enable(struct cdns_mhdp_device *mhdp, bool enable)
> +{
> +	return drm_dp_dpcd_writeb(&mhdp->aux, DP_DSC_ENABLE, enable) != 1;
> +}
> +
>  static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  				      const struct drm_display_mode *mode)
>  {
> @@ -1702,7 +1892,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  		front_porch, back_porch, msa_h0, msa_v0, hsync, vsync,
>  		dp_vertical_1;
>  	u8 stream_id = mhdp->stream_id;
> -	u32 bpp, bpc, pxlfmt, framer;
> +	u32 bpp, bpc, pxlfmt, framer, dp_byte_count;
>  	int ret;
>  
>  	pxlfmt = mhdp->display_fmt.color_format;
> @@ -1716,7 +1906,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  	     pxlfmt == DRM_COLOR_FORMAT_YCBCR422) && mode->crtc_vdisplay >= 720)
>  		misc0 = DP_YCBCR_COEFFICIENTS_ITU709;
>  
> -	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> +	bpp = cdns_mhdp_get_bpp(mhdp);
>  
>  	switch (pxlfmt) {
>  	case DRM_COLOR_FORMAT_RGB444:
> @@ -1765,6 +1955,9 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
>  
> +	if (mhdp->dsc_params.compression_enable)
> +		bnd_hsync2vsync |= CDNS_IP_VIF_ALIGNMENT_LSB;
> +
>  	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
>  			    bnd_hsync2vsync);
>  
> @@ -1792,8 +1985,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  			    CDNS_DP_FRONT_PORCH(front_porch) |
>  			    CDNS_DP_BACK_PORCH(back_porch));
>  
> -	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
> -			    mode->crtc_hdisplay * bpp / 8);
> +	if (mhdp->dsc_params.compression_enable) {
> +		dp_byte_count = (((mhdp->dsc_config.slice_chunk_size / mhdp->link.num_lanes) + 1) <<
> +				CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT) |
> +				((mhdp->dsc_config.slice_chunk_size / mhdp->link.num_lanes) + 1);
> +	} else {
> +		dp_byte_count = (mode->crtc_hdisplay * bpp / 8);
> +	}
> +	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id), dp_byte_count);
>  
>  	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
>  	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
> @@ -1852,6 +2051,9 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  				(mode->flags & DRM_MODE_FLAG_INTERLACE) ?
>  				CDNS_DP_VB_ID_INTERLACED : 0);
>  
> +	if (mhdp->dsc_params.compression_enable)
> +		cdns_mhdp_dsc_set_stream_compressed(mhdp, stream_id, true);
> +
>  	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
>  	if (ret < 0) {
>  		dev_err(mhdp->dev,
> @@ -1860,7 +2062,6 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
>  		return;
>  	}
>  	framer |= CDNS_DP_FRAMER_EN;
> -	framer &= ~CDNS_DP_NO_VIDEO_MODE;
>  	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
>  }
>  
> @@ -1869,20 +2070,67 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
>  {
>  	u32 rate, vs, required_bandwidth, available_bandwidth;
>  	s32 line_thresh1, line_thresh2, line_thresh = 0;
> -	int pxlclock = mode->crtc_clock;
> +	int ret, pxlclock = mode->crtc_clock;
> +	u32 vs_f, framer, pxl_repr;
>  	u32 tu_size = 64;
>  	u32 bpp;
>  
>  	/* Get rate in MSymbols per second per lane */
>  	rate = mhdp->link.rate / 1000;
>  
> -	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> +	if (mhdp->fec_enabled) {
> +		if (cdns_mhdp_fec_enable(mhdp, true))
> +			mhdp->fec_enabled = false;
> +	} else {
> +		cdns_mhdp_fec_enable(mhdp, false);
> +	}
> +
> +	if (mhdp->dsc_supported && !cdns_mhdp_dsc_sink_support(mhdp)) {

Should be happening only if FEC is supported and enabled.

> +		ret = cdns_mhdp_dsc_reset(mhdp);
> +		if (ret)
> +			dev_err(mhdp->dev, "DSC reset failed. ret = %d\n", ret);
> +
> +		mhdp->dsc_params.compressed_bpp = 8;
> +		mhdp->dsc_params.slice_count = 10;

Why is it 10?

> +
> +		ret = cdns_mhdp_compute_dsc_params(mhdp);
> +		if (ret < 0) {
> +			mhdp->dsc_params.compression_enable = false;
> +			dev_err(mhdp->dev, "DSC params computation failed. ret = %d\n", ret);
> +		} else {
> +			mhdp->dsc_params.compression_enable = true;
> +			/* Write config for stream 0 */
> +			cdns_mhdp_dsc_write_enc_config(mhdp, 0, mode);
> +			cdns_mhdp_dsc_update(mhdp, 0);
> +			cdns_mhdp_dsc_write_config(mhdp);
> +		}
> +	} else {
> +		if (mhdp->dsc_params.compression_enable) {
> +			cdns_mhdp_dsc_sink_enable(mhdp, false);
> +			cdns_mhdp_dsc_set_stream_compressed(mhdp, 0, false);
> +		}
> +		mhdp->dsc_params.compression_enable = false;
> +	}
> +
> +	/* Enable DSC for stream 0 */
> +	if (mhdp->dsc_params.compression_enable) {
> +		cdns_mhdp_dsc_enable(mhdp, 0, true);
> +
> +		if (cdns_mhdp_dsc_sink_enable(mhdp, true))
> +			dev_err(mhdp->dev, "Cannot enable DSC in sink.\n");
> +		cdns_mhdp_dsc_send_pps_sdp(mhdp, 0);
> +	}
> +
> +	bpp = cdns_mhdp_get_bpp(mhdp);
>  
>  	required_bandwidth = pxlclock * bpp / 8;
>  	available_bandwidth = mhdp->link.num_lanes * rate;
>  
> -	vs = tu_size * required_bandwidth / available_bandwidth;
> -	vs /= 1000;
> +	vs_f = tu_size * required_bandwidth / available_bandwidth;
> +	if (mhdp->fec_enabled)
> +		vs_f = (vs_f * 1024) / 1000;	//2.4%
> +	vs = vs_f / 1000;
> +	vs_f = vs_f % 1000;
>  
>  	if (vs == tu_size)
>  		vs = tu_size - 1;
> @@ -1907,6 +2155,70 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
>  						   0 : tu_size - vs));
>  
>  	cdns_mhdp_configure_video(mhdp, mode);
> +
> +	if (mhdp->dsc_params.compression_enable) {
> +		cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_PXL_REPR(0), &pxl_repr);
> +		pxl_repr &= ~CDNS_DP_FRAMER_PXL_REPR_M;
> +		pxl_repr &= ~CDNS_DP_FRAMER_PXL_REPR_DIFF;
> +		pxl_repr |= (((vs_f / 10) << CDNS_DP_FRAMER_PXL_REPR_M_SHIFT)
> +				& CDNS_DP_FRAMER_PXL_REPR_M) |
> +				(((100 - (vs_f / 10)) << CDNS_DP_FRAMER_PXL_REPR_DIFF_SHIFT)
> +				& CDNS_DP_FRAMER_PXL_REPR_DIFF);
> +		cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(0), pxl_repr);
> +	}
> +
> +	/* Enable video mode */
> +	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
> +	framer &= ~CDNS_DP_NO_VIDEO_MODE;
> +	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
> +}
> +
> +static int cdns_mhdp_configure_car(struct cdns_mhdp_device *mhdp, bool enable)
> +{
> +	u32 dptx_car, source_pkt_car;
> +	int ret;
> +
> +	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &dptx_car);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = cdns_mhdp_reg_read(mhdp, CDNS_SOURCE_PKT_CAR, &source_pkt_car);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "Failed to read CDNS_SOURCE_PKT_CAR %d\n", ret);
> +		goto out;
> +	}
> +
> +	if (enable) {
> +		dev_dbg(mhdp->dev, "%s: Enable clocks for VIF and PIF\n", __func__);
> +
> +		/* Enable VIF clock for stream 0 */
> +		cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> +				    dptx_car | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
> +
> +		/* Enable PKT clock */
> +		cdns_mhdp_reg_write(mhdp, CDNS_SOURCE_PKT_CAR,
> +				    source_pkt_car | CDNS_PKT_DATA_CLK_EN
> +						   | CDNS_PKT_DATA_RSTN
> +						   | CDNS_PKT_SYS_CLK_EN
> +						   | CDNS_PKT_SYS_RSTN);
> +	} else {
> +		dev_dbg(mhdp->dev, "%s: Disable clocks for VIF and PIF\n", __func__);
> +
> +		/* Disable VIF clock for stream 0 */
> +		cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> +				    dptx_car & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
> +
> +		/* Disable PKT clock */
> +		cdns_mhdp_reg_write(mhdp, CDNS_SOURCE_PKT_CAR,
> +				    source_pkt_car & ~(CDNS_PKT_DATA_CLK_EN
> +						   | CDNS_PKT_DATA_RSTN
> +						   | CDNS_PKT_SYS_CLK_EN
> +						   | CDNS_PKT_SYS_RSTN));
> +	}
> +out:
> +	return ret;
>  }
>  
>  static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
> @@ -1919,8 +2231,7 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>  	struct drm_connector_state *conn_state;
>  	struct drm_bridge_state *new_state;
>  	const struct drm_display_mode *mode;
> -	u32 resp;
> -	int ret;
> +	int ret = 0;
>  
>  	dev_dbg(mhdp->dev, "bridge enable\n");
>  
> @@ -1935,16 +2246,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
>  		mhdp->info->ops->enable(mhdp);
>  
> -	/* Enable VIF clock for stream 0 */
> -	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> +	/* Enable clocks for video and packet interfaces */
> +	ret = cdns_mhdp_configure_car(mhdp, true);
>  	if (ret < 0) {
> -		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
> +		dev_err(mhdp->dev, "Failed to enable clocks %d\n", ret);
>  		goto out;
>  	}
>  
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> -			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
> -
>  	connector = drm_atomic_get_new_connector_for_encoder(state,
>  							     bridge->encoder);
>  	if (WARN_ON(!connector))
> @@ -2020,10 +2328,8 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>  
>  	cdns_mhdp_link_down(mhdp);
>  
> -	/* Disable VIF clock for stream 0 */
> -	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> -	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> -			    resp & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
> +	/* Disable clocks for video and packet interfaces */
> +	cdns_mhdp_configure_car(mhdp, false);
>  
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
>  		mhdp->info->ops->disable(mhdp);
> @@ -2119,7 +2425,7 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_connector_state *conn_state)
>  {
>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> -	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  
>  	mutex_lock(&mhdp->link_mutex);
>  
> @@ -2139,6 +2445,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  	if (mhdp->info)
>  		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
>  
> +	//TODO For DSC. Might need proper handling. 1920x1080 mode doesn't work without this.
> +	mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +
>  	mutex_unlock(&mhdp->link_mutex);
>  	return 0;
>  }
> @@ -2426,6 +2736,15 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>  		mhdp->hdcp_supported = true;
>  	}
>  
> +	mhdp->dsc_regs = devm_platform_ioremap_resource_byname(pdev, "dsc");
> +	if (IS_ERR(mhdp->dsc_regs)) {
> +		mhdp->dsc_supported = false;
> +		dev_info(dev,
> +			 "Failed to get DSC memory resource, DSC not supported\n");
> +	} else {
> +		mhdp->dsc_supported = true;
> +	}
> +
>  	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
>  	if (IS_ERR(mhdp->phy)) {
>  		dev_err(dev, "no PHY configured\n");
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bad2fc0c7306..c8f8071776d7 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -16,6 +16,7 @@
>  #include <linux/spinlock.h>
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dsc.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
>  
> @@ -66,18 +67,30 @@ struct phy;
>  #define CDNS_VIF_CLK_EN				BIT(0)
>  #define CDNS_VIF_CLK_RSTN			BIT(1)
>  
> +#define CDNS_SOURCE_PKT_CAR			0x00918
> +#define CDNS_PKT_DATA_CLK_EN			BIT(0)
> +#define CDNS_PKT_DATA_RSTN			BIT(1)
> +#define CDNS_PKT_SYS_CLK_EN			BIT(2)
> +#define CDNS_PKT_SYS_RSTN			BIT(3)
> +
>  #define CDNS_SOURCE_VIDEO_IF(s)			(0x00b00 + ((s) * 0x20))
>  #define CDNS_BND_HSYNC2VSYNC(s)			(CDNS_SOURCE_VIDEO_IF(s) + \
>  						 0x00)
>  #define CDNS_IP_DTCT_WIN			GENMASK(11, 0)
>  #define CDNS_IP_DET_INTERLACE_FORMAT		BIT(12)
>  #define CDNS_IP_BYPASS_V_INTERFACE		BIT(13)
> +#define CDNS_IP_VIF_ALIGNMENT_LSB		BIT(14)
>  
>  #define CDNS_HSYNC2VSYNC_POL_CTRL(s)		(CDNS_SOURCE_VIDEO_IF(s) + \
>  						 0x10)
>  #define CDNS_H2V_HSYNC_POL_ACTIVE_LOW		BIT(1)
>  #define CDNS_H2V_VSYNC_POL_ACTIVE_LOW		BIT(2)
>  
> +#define CDNS_DP_DSC_CTRL(s)		        (CDNS_SOURCE_VIDEO_IF(s) + 0x14)
> +#define CDNS_DP_DSC_CTRL_EN_BIT			0
> +#define CDNS_DP_DSC_CTRL_SW_RST_BIT		1
> +#define CDNS_DP_DSC_CTRL_REG_UPDATE_BIT		2
> +
>  #define CDNS_DPTX_PHY_CONFIG			0x02000
>  #define CDNS_PHY_TRAINING_EN			BIT(0)
>  #define CDNS_PHY_TRAINING_TYPE(x)		(((x) & GENMASK(3, 0)) << 1)
> @@ -121,6 +134,10 @@ struct phy;
>  
>  #define CDNS_DP_ENHNCD				0x02304
>  
> +#define CDNS_DP_FEC_CTRL			0x02310
> +#define CDNS_DP_FEC_STATUS			0x02314
> +#define CDNS_DP_FEC_BUSY			BIT(0)
> +
>  #define CDNS_DPTX_STREAM(s)			(0x03000 + (s) * 0x80)
>  #define CDNS_DP_MSA_HORIZONTAL_0(s)		(CDNS_DPTX_STREAM(s) + 0x00)
>  #define CDNS_DP_MSAH0_H_TOTAL(x)		(x)
> @@ -178,6 +195,10 @@ struct phy;
>  #define CDNS_DP_FRAMER_YCBCR422			BIT(2)
>  #define CDNS_DP_FRAMER_YCBCR420			BIT(3)
>  #define CDNS_DP_FRAMER_Y_ONLY			BIT(4)
> +#define CDNS_DP_FRAMER_PXL_REPR_M		GENMASK(22, 16)
> +#define CDNS_DP_FRAMER_PXL_REPR_DIFF		GENMASK(30, 24)
> +#define CDNS_DP_FRAMER_PXL_REPR_M_SHIFT		16
> +#define CDNS_DP_FRAMER_PXL_REPR_DIFF_SHIFT	24
>  
>  #define CDNS_DP_FRAMER_SP(s)			(CDNS_DPTX_STREAM(s) + 0x50)
>  #define CDNS_DP_FRAMER_VSYNC_POL_LOW		BIT(0)
> @@ -198,6 +219,38 @@ struct phy;
>  #define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
>  #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
>  
> +#define CDNS_SOURCE_PACKET_IF(s)		(0x30800 + ((s) * 0x40))
> +#define CDNS_SOURCE_PIF_WR_ADDR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x00)
> +
> +#define CDNS_SOURCE_PIF_WR_REQ(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x04)
> +#define SOURCE_PIF_WR_REQ_HOST_WR		BIT(0)
> +
> +#define CDNS_SOURCE_PIF_RD_ADDR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x08)
> +#define CDNS_SOURCE_PIF_RD_REQ(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x0c)
> +#define CDNS_SOURCE_PIF_DATA_WR(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x10)
> +#define CDNS_SOURCE_PIF_DATA_RD(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x14)
> +#define CDNS_SOURCE_PIF_FIFO1_FLUSH(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x18)
> +#define CDNS_SOURCE_PIF_FIFO2_FLUSH(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x1c)
> +#define CDNS_SOURCE_PIF_STATUS(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x20)
> +#define CDNS_SOURCE_PIF_INT_SOURCE(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x24)
> +#define CDNS_SOURCE_PIF_INT_MASK(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x28)
> +
> +#define CDNS_SOURCE_PIF_PKT_ALLOC_REG(s)	(CDNS_SOURCE_PACKET_IF(s) + 0x2c)
> +#define SOURCE_PIF_PKT_ALLOC_REG_ACTIVE_IDLE_TYPE	BIT(17)
> +#define SOURCE_PIF_PKT_ALLOC_REG_TYPE_VALID		BIT(16)
> +#define SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE		GENMASK(15, 8)
> +#define SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE_SHIFT	8
> +#define SOURCE_PIF_PKT_ALLOC_REG_PKT_ALLOC_ADDR		GENMASK(3, 0)
> +
> +#define CDNS_SOURCE_PIF_PKT_ALLOC_WR_EN(s)	(CDNS_SOURCE_PACKET_IF(s) + 0x30)
> +#define SOURCE_PIF_PKT_ALLOC_WR_EN_EN		BIT(0)
> +
> +#define CDNS_SOURCE_PIF_SW_RST(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x34)
> +#define CDNS_SOURCE_PIF_PPS_HEADER(s)		(CDNS_SOURCE_PACKET_IF(s) + 0x38)
> +
> +#define CDNS_SOURCE_PIF_PPS(s)			(CDNS_SOURCE_PACKET_IF(s) + 0x3c)
> +#define SOURCE_PIF_PPS_PPS			BIT(0)
> +
>  /* mailbox */
>  #define MAILBOX_RETRY_US			1000
>  #define MAILBOX_TIMEOUT_US			2000000
> @@ -354,6 +407,7 @@ struct cdns_mhdp_hdcp {
>  struct cdns_mhdp_device {
>  	void __iomem *regs;
>  	void __iomem *sapb_regs;
> +	void __iomem *dsc_regs;
>  	void __iomem *j721e_regs;
>  
>  	struct device *dev;
> @@ -412,6 +466,20 @@ struct cdns_mhdp_device {
>  
>  	struct cdns_mhdp_hdcp hdcp;
>  	bool hdcp_supported;
> +
> +	struct drm_dsc_config dsc_config;
> +
> +	/* Display Stream Compression state */
> +	bool dsc_supported;
> +	struct {
> +		bool compression_enable;
> +		bool dsc_split;
> +		u16 compressed_bpp;
> +		u8 slice_count;
> +		u8 dsc_cap[DP_DSC_RECEIVER_CAP_SIZE];
> +	} dsc_params;
> +
> +	bool fec_enabled;
>  };
>  
>  #define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
> new file mode 100644
> index 000000000000..e540e8f2dd4a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
> @@ -0,0 +1,695 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Cadence Design Systems, Inc.
> + *
> + * Author: Swapnil Jakhade <sjakhade@cadence.com>
> + */
> +
> +#include "cdns-mhdp8546-core.h"
> +#include "cdns-mhdp8546-dsc.h"
> +
> +void cdns_mhdp_dsc_write_config(struct cdns_mhdp_device *mhdp)
> +{
> +	u32 main_conf = 0;
> +
> +	main_conf = CDNS_DP_COM_MAIN_CONF_INPUT_MODE |
> +				CDNS_DP_COM_MAIN_CONF_AUTO_DB_UPDATE;
> +
> +	if (mhdp->dsc_params.dsc_split) {
> +		main_conf |= CDNS_DP_COM_MAIN_CONF_MUX_MODE |
> +					 CDNS_DP_COM_MAIN_CONF_SPLIT_PANEL;
> +	}
> +
> +	writel(main_conf, mhdp->dsc_regs + CDNS_DP_COM_MAIN_CONF);
> +}
> +
> +static u8 cdns_mhdp_dsc_compute_initial_lines(struct cdns_mhdp_device *mhdp)
> +{
> +	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
> +	unsigned long k1, real_bpp;
> +	u8 initial_lines;
> +
> +	real_bpp = (unsigned long)dsc_cfg->bits_per_pixel / 16;
> +
> +	if (dsc_cfg->bits_per_component == 8)
> +		k1 = 296;
> +	else
> +		k1 = 320;
> +
> +	if (mhdp->dsc_params.dsc_split) {
> +		initial_lines = (u8)DIV_ROUND_UP
> +				((k1 + (unsigned long)dsc_cfg->initial_xmit_delay +
> +				((((unsigned long)dsc_cfg->slice_chunk_size * 8) + 144) /
> +				real_bpp)), (unsigned long)dsc_cfg->slice_width);
> +	} else {
> +		initial_lines = (u8)DIV_ROUND_UP
> +				((k1 + (unsigned long)dsc_cfg->initial_xmit_delay +
> +				((DIV_ROUND_UP(((1 - (real_bpp / 48)) *
> +				((unsigned long)dsc_cfg->slice_chunk_size * 8)), 1) + 144) /
> +				real_bpp)), (unsigned long)dsc_cfg->slice_width);
> +	}

Is there a way to make it possible to comprehend?

> +
> +	return initial_lines;
> +}
> +
> +static void write_enc_main_conf(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	if (mhdp->dsc_config.convert_rgb)
> +		reg_val |= CDNS_DP_ENC_MAIN_CONF_CONVERT_RGB;
> +
> +	reg_val |= (mhdp->dsc_config.line_buf_depth <<
> +		   CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH_SHIFT) &
> +		   CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH;
> +
> +	reg_val |= (mhdp->dsc_config.bits_per_pixel <<
> +		   CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL_SHIFT) &
> +		   CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL;
> +
> +	if (mhdp->dsc_config.block_pred_enable)
> +		reg_val |= CDNS_DP_ENC_MAIN_CONF_BLOCK_PRED_EN;
> +
> +	reg_val |= CDNS_DP_ENC_MAIN_CONF_VIDEO_MODE;
> +
> +	reg_val |= (cdns_mhdp_dsc_compute_initial_lines(mhdp) <<
> +		   CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES_SHIFT) &
> +		   CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES;
> +
> +	if (mhdp->dsc_config.bits_per_component == 10)
> +		reg_val |= 0x1;
> +	else if (mhdp->dsc_config.bits_per_component != 8)
> +		dev_err(mhdp->dev, "Unsupported bits_per_component = %d\n",
> +			mhdp->dsc_config.bits_per_component);
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_MAIN_CONF(stream_id));
> +}
> +
> +static void write_enc_picture_size(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = (mhdp->dsc_config.pic_width &
> +		   CDNS_DP_ENC_PICTURE_SIZE_WIDTH);
> +
> +	reg_val |= (mhdp->dsc_config.pic_height <<
> +		   CDNS_DP_ENC_PICTURE_SIZE_HEIGHT_SHIFT) &
> +		   CDNS_DP_ENC_PICTURE_SIZE_HEIGHT;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_PICTURE_SIZE(stream_id));
> +}
> +
> +static void write_enc_slice_size(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = (mhdp->dsc_config.slice_width &
> +		   CDNS_DP_ENC_SLICE_SIZE_WIDTH);
> +
> +	reg_val |= (mhdp->dsc_config.slice_height <<
> +		   CDNS_DP_ENC_SLICE_SIZE_HEIGHT_SHIFT) &
> +		   CDNS_DP_ENC_SLICE_SIZE_HEIGHT;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_SLICE_SIZE(stream_id));
> +}
> +
> +static void write_enc_misc_size(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = ((mhdp->dsc_config.slice_width + 2) % 3) &
> +		   CDNS_DP_ENC_MISC_SIZE_LAST_GRP_SIZE;
> +
> +	reg_val |= (DSC_OUTPUT_BUFFER_MAX_ADDRESS <<
> +		   CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR_SHIFT) &
> +		   CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR;
> +
> +	reg_val |= (mhdp->dsc_config.slice_chunk_size <<
> +		   CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE_SHIFT) &
> +		   CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_MISC_SIZE(stream_id));
> +}
> +
> +static void write_enc_hrd_delays(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = (mhdp->dsc_config.initial_xmit_delay &
> +		   CDNS_DP_ENC_HRD_DELAYS_INIT_XMIT_DELAY);
> +
> +	reg_val |= (mhdp->dsc_config.initial_dec_delay <<
> +		   CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY_SHIFT) &
> +		   CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_HRD_DELAYS(stream_id));
> +}
> +
> +static void write_enc_rc_scale(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = (mhdp->dsc_config.initial_scale_value &
> +		   CDNS_DP_ENC_RC_SCALE_INIT_SCALE_VALUE);
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_SCALE(stream_id));
> +}
> +
> +static void write_enc_rc_scale_inc_dec(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = (mhdp->dsc_config.scale_increment_interval &
> +		   CDNS_DP_ENC_RC_SCALE_INC_INTERVAL);
> +
> +	reg_val |= (mhdp->dsc_config.scale_decrement_interval <<
> +		   CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL_SHIFT) &
> +		   CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_SCALE_INC_DEC(stream_id));
> +}
> +
> +static void write_enc_rc_offsets(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +
> +	reg_val = (mhdp->dsc_config.first_line_bpg_offset &
> +		     CDNS_DP_ENC_RC_OFFSETS_1_FL_BPG_OFFSET);
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_1(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.nfl_bpg_offset &
> +		   CDNS_DP_ENC_RC_OFFSETS_2_NFL_BPG_OFFSET);
> +
> +	reg_val |= (mhdp->dsc_config.slice_bpg_offset <<
> +		   CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET_SHIFT) &
> +		   CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_2(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.initial_offset &
> +		   CDNS_DP_ENC_RC_OFFSETS_3_INIT_OFFSET);
> +
> +	reg_val |= (mhdp->dsc_config.final_offset <<
> +		   CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET_SHIFT) &
> +		   CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_OFFSETS_3(stream_id));
> +}
> +
> +static void write_enc_flatness_detection(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +
> +	reg_val = (mhdp->dsc_config.flatness_min_qp &
> +		   CDNS_DP_ENC_FLATNESS_DETECTION_MIN_QP);
> +
> +	reg_val |= (mhdp->dsc_config.flatness_max_qp <<
> +		   CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP_SHIFT) &
> +		   CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP;
> +
> +	reg_val |= (drm_dsc_flatness_det_thresh(&mhdp->dsc_config) <<
> +		   CDNS_DP_ENC_FLATNESS_DETECTION_THRESH_SHIFT) &
> +		   CDNS_DP_ENC_FLATNESS_DETECTION_THRESH;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_FLATNESS_DETECTION(stream_id));
> +}
> +
> +static void write_enc_rc_model_size(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +
> +	reg_val = (mhdp->dsc_config.rc_model_size &
> +		   CDNS_DP_ENC_RC_MODEL_SIZE_RC_MODEL_SIZE);
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MODEL_SIZE(stream_id));
> +}
> +
> +static void write_enc_rc_config(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +
> +	reg_val = (mhdp->dsc_config.rc_edge_factor &
> +		   CDNS_DP_ENC_RC_CONFIG_EDGE_FACTOR);
> +
> +	reg_val |= (mhdp->dsc_config.rc_quant_incr_limit0 <<
> +		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0_SHIFT) &
> +		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0;
> +
> +	reg_val |= (mhdp->dsc_config.rc_quant_incr_limit1 <<
> +		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1;
> +
> +	reg_val |= (mhdp->dsc_config.rc_tgt_offset_high <<
> +		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI_SHIFT) &
> +		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI;
> +
> +	reg_val |= (mhdp->dsc_config.rc_tgt_offset_low <<
> +		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO_SHIFT) &
> +		   CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_CONFIG(stream_id));
> +}
> +
> +static void write_enc_rc_buf_thresh(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +	int index = 0;
> +
> +	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_0);
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_1;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_2;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_3;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_0(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_4);
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_5;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_6;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_7;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_1(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_8);
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_9;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_10;
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_11;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_2(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_buf_thresh[index++] &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_12);
> +
> +	reg_val |= (mhdp->dsc_config.rc_buf_thresh[index++] <<
> +		   CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_13;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_BUF_THRESH_3(stream_id));
> +}
> +
> +static void write_enc_rc_min_qp(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +	int index = 0;
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
> +		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_0);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_1;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_2;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_3;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_0_RANGE_4;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_0(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
> +		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_5);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_6;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_7;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_8;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_1_RANGE_9;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_1(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_min_qp &
> +		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_10);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_11;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_12;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_13;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_min_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MIN_QP_2_RANGE_14;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MIN_QP_2(stream_id));
> +}
> +
> +static void write_enc_rc_max_qp(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +	int index = 0;
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
> +		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_0);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_1;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_2;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_3;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_0_RANGE_4;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_0(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
> +		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_5);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_6;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_7;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_8;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_1_RANGE_9;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_1(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_max_qp &
> +		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_10);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_11;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_12;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_13;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_max_qp <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_MAX_QP_2_RANGE_14;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_MAX_QP_2(stream_id));
> +}
> +
> +static void write_enc_rc_range_bpg(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	u32 reg_val;
> +	int index = 0;
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_0);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_1;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_2;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_3;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_4;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_5);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_6;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_7;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_8;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_9;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_1(stream_id));
> +
> +	reg_val = (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_10);
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_11;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_12;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_13;
> +
> +	reg_val |= (mhdp->dsc_config.rc_range_params[index++].range_bpg_offset <<
> +		   CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT) &
> +		   CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_14;
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_2(stream_id));
> +}
> +
> +static void write_enc_dpi_ctrl(struct cdns_mhdp_device *mhdp, int stream_id,
> +			       const struct drm_display_mode *mode)
> +{
> +	u32 reg_val = 0;
> +
> +	reg_val = ((mode->crtc_htotal * cdns_mhdp_dsc_compute_initial_lines(mhdp)) &
> +		  CDNS_DP_ENC_DPI_CTRL_OUT_DELAY_CYCLES);
> +
> +	writel(reg_val, mhdp->dsc_regs + CDNS_DP_ENC_DPI_CTRL_OUT_DELAY(stream_id));
> +}
> +
> +void cdns_mhdp_dsc_write_enc_config(struct cdns_mhdp_device *mhdp, int stream_id,
> +				    const struct drm_display_mode *mode)
> +{
> +	write_enc_main_conf(mhdp, stream_id);
> +	write_enc_picture_size(mhdp, stream_id);
> +	write_enc_slice_size(mhdp, stream_id);
> +	write_enc_misc_size(mhdp, stream_id);
> +	write_enc_hrd_delays(mhdp, stream_id);
> +	write_enc_rc_scale(mhdp, stream_id);
> +	write_enc_rc_scale_inc_dec(mhdp, stream_id);
> +	write_enc_rc_offsets(mhdp, stream_id);
> +	write_enc_flatness_detection(mhdp, stream_id);
> +	write_enc_rc_model_size(mhdp, stream_id);
> +	write_enc_rc_config(mhdp, stream_id);
> +	write_enc_rc_buf_thresh(mhdp, stream_id);
> +	write_enc_rc_min_qp(mhdp, stream_id);
> +	write_enc_rc_max_qp(mhdp, stream_id);
> +	write_enc_rc_range_bpg(mhdp, stream_id);
> +	write_enc_dpi_ctrl(mhdp, stream_id, mode);
> +}
> +
> +int cdns_mhdp_dsc_sink_support(struct cdns_mhdp_device *mhdp)
> +{
> +	int ret;
> +
> +	ret = drm_dp_dpcd_read(&mhdp->aux, DP_DSC_SUPPORT, &mhdp->dsc_params.dsc_cap,
> +			       DP_DSC_RECEIVER_CAP_SIZE);
> +	if (ret != DP_DSC_RECEIVER_CAP_SIZE) {
> +		DRM_DEV_ERROR(mhdp->dev, "cannot read sink DSC DPCD: %d\n", ret);
> +		goto err;
> +	}
> +	if (!(mhdp->dsc_params.dsc_cap[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)) {
> +		ret = -EOPNOTSUPP;
> +		DRM_DEV_ERROR(mhdp->dev, "sink does not support DSC: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = 0;
> +err:
> +	return ret;
> +}
> +
> +int cdns_mhdp_compute_dsc_params(struct cdns_mhdp_device *mhdp)
> +{
> +	struct drm_bridge *bridge = &mhdp->bridge;
> +	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
> +	struct drm_crtc_state *crtc_state = bridge->encoder->crtc->state;
> +	u8 *dsc_dpcd = (u8 *)&mhdp->dsc_params.dsc_cap;
> +	int ret;
> +
> +	dsc_cfg->pic_width = crtc_state->adjusted_mode.crtc_hdisplay;
> +	dsc_cfg->pic_height = crtc_state->adjusted_mode.crtc_vdisplay;
> +
> +	dsc_cfg->slice_width = dsc_cfg->pic_width;
> +	dsc_cfg->slice_height = DIV_ROUND_UP(dsc_cfg->pic_height,
> +					     mhdp->dsc_params.slice_count);
> +
> +	dsc_cfg->dsc_version_major = (dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
> +				      DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
> +	dsc_cfg->dsc_version_minor =
> +		min(DSC_SUPPORTED_VERSION_MIN,
> +		    (dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
> +		     DP_DSC_MINOR_MASK) >> DP_DSC_MINOR_SHIFT);
> +
> +	dsc_cfg->convert_rgb =
> +		dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] & DP_DSC_RGB;
> +
> +	dsc_cfg->vbr_enable = false;
> +
> +	dsc_cfg->block_pred_enable =
> +		dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
> +		DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
> +
> +	dsc_cfg->bits_per_pixel = mhdp->dsc_params.compressed_bpp << 4;
> +
> +	dsc_cfg->bits_per_component = mhdp->display_fmt.bpc;
> +
> +	if (mhdp->dsc_config.bits_per_component == 8)
> +		dsc_cfg->line_buf_depth = min(9, drm_dp_dsc_sink_line_buf_depth(dsc_dpcd));
> +	else if (mhdp->dsc_config.bits_per_component == 10)
> +		dsc_cfg->line_buf_depth = min(11, drm_dp_dsc_sink_line_buf_depth(dsc_dpcd));
> +
> +	drm_dsc_set_const_params(dsc_cfg);
> +	drm_dsc_set_rc_buf_thresh(dsc_cfg);
> +
> +	ret = drm_dsc_setup_rc_params(dsc_cfg, DRM_DSC_1_1_PRE_SCR);
> +	if (ret) {
> +		dev_err(mhdp->dev, "could not find DSC RC parameters");
> +		return ret;
> +	}
> +
> +	dsc_cfg->initial_scale_value = drm_dsc_initial_scale_value(dsc_cfg);
> +	dsc_cfg->slice_count = mhdp->dsc_params.slice_count;
> +
> +	return drm_dsc_compute_rc_parameters(dsc_cfg);
> +}

Please consider extracting code common with Intel driver.

> +
> +static void cdns_mhdp_write_data_packet(struct cdns_mhdp_device *mhdp, u32 *buf,
> +					int length, int stream_id)
> +{
> +	int i;
> +	u32 reg_val;
> +
> +	for (i = 0; i < length; i++) {
> +		reg_val = buf[i];
> +		writel(reg_val, mhdp->regs + CDNS_SOURCE_PIF_DATA_WR(stream_id));
> +	}
> +}
> +
> +static void cdns_mhdp_write_pps_header(struct cdns_mhdp_device *mhdp, u32 *buf,
> +				       int stream_id)
> +{
> +	writel(SOURCE_PIF_PPS_PPS, mhdp->regs + CDNS_SOURCE_PIF_PPS(stream_id));
> +	writel(*buf, mhdp->regs + CDNS_SOURCE_PIF_PPS_HEADER(stream_id));
> +}
> +
> +static int cdns_mhdp_write_pps_infoframe(struct cdns_mhdp_device *mhdp, int stream_id,
> +					 struct drm_dsc_pps_infoframe *pps_infoframe)
> +{
> +	u32 reg_val;
> +	u32 entry_id = 0;
> +
> +	writel(1, mhdp->regs + CDNS_SOURCE_PIF_FIFO1_FLUSH(stream_id));
> +
> +	cdns_mhdp_write_pps_header(mhdp, (u32 *)&pps_infoframe->pps_header, 0);
> +	cdns_mhdp_write_data_packet(mhdp, (u32 *)&pps_infoframe->pps_payload,
> +				    DP_DSC_PPS_SIZE / 4, 0);

sizeof(foo) / 4

> +
> +	/* Entry ID */
> +	writel(entry_id, mhdp->regs + CDNS_SOURCE_PIF_WR_ADDR(stream_id));
> +
> +	writel(SOURCE_PIF_WR_REQ_HOST_WR, mhdp->regs + CDNS_SOURCE_PIF_WR_REQ(stream_id));
> +
> +	reg_val = SOURCE_PIF_PKT_ALLOC_REG_ACTIVE_IDLE_TYPE |
> +		  SOURCE_PIF_PKT_ALLOC_REG_TYPE_VALID |
> +		  ((DP_SDP_PPS << SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE_SHIFT) &
> +		  SOURCE_PIF_PKT_ALLOC_REG_PACKET_TYPE) |
> +		  (entry_id & SOURCE_PIF_PKT_ALLOC_REG_PKT_ALLOC_ADDR);
> +
> +	writel(reg_val, mhdp->regs + CDNS_SOURCE_PIF_PKT_ALLOC_REG(stream_id));
> +
> +	writel
> +	(SOURCE_PIF_PKT_ALLOC_WR_EN_EN, mhdp->regs + CDNS_SOURCE_PIF_PKT_ALLOC_WR_EN(stream_id));

Ugh. Newline after comma, please.

> +
> +	return 0;
> +}
> +
> +int cdns_mhdp_dsc_send_pps_sdp(struct cdns_mhdp_device *mhdp, int stream_id)
> +{
> +	struct drm_dsc_config *dsc_cfg = &mhdp->dsc_config;
> +	struct drm_dsc_pps_infoframe dp_dsc_pps_sdp;
> +
> +	drm_dsc_dp_pps_header_init(&dp_dsc_pps_sdp.pps_header);
> +
> +	drm_dsc_pps_payload_pack(&dp_dsc_pps_sdp.pps_payload, dsc_cfg);
> +
> +	return cdns_mhdp_write_pps_infoframe(mhdp, stream_id, &dp_dsc_pps_sdp);
> +}
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
> new file mode 100644
> index 000000000000..c44d7e3d0002
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
> @@ -0,0 +1,285 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Cadence Design Systems, Inc.
> + *
> + * Author: Swapnil Jakhade <sjakhade@cadence.com>
> + */
> +
> +#ifndef CDNS_MHDP_DSC_H_
> +#define CDNS_MHDP_DSC_H_
> +
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/minmax.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_print.h>

Please don't include unnecessary headers through the header file. Use
forward declarations for structs where possible.

> +
> +#define DSC_SUPPORTED_VERSION_MIN			1
> +
> +#define DSC_OUTPUT_BUFFER_MAX_ADDRESS			3667U
> +#define DP_DSC_PPS_SIZE					128
> +
> +#define CDNS_DP_COM_MAIN_CONF				0
> +#define CDNS_DP_COM_MAIN_CONF_SPLIT_PANEL		BIT(0)
> +#define CDNS_DP_COM_MAIN_CONF_MUX_MODE			BIT(1)
> +#define CDNS_DP_COM_MAIN_CONF_MUX_SEL_OUT		BIT(2)
> +#define CDNS_DP_COM_MAIN_CONF_DE_RASTER_EN		BIT(3)
> +#define CDNS_DP_COM_MAIN_CONF_INPUT_MODE		BIT(4)
> +#define CDNS_DP_COM_MAIN_CONF_MUX_EOC_EN		BIT(5)
> +#define CDNS_DP_COM_MAIN_CONF_AUTO_DB_UPDATE		BIT(6)
> +
> +#define CDNS_DP_ENC_MAIN_CONF(d)			(0x120 + ((d) * 0x100))
> +#define CDNS_DP_ENC_MAIN_CONF_INPUT_BPC			GENMASK(1, 0)
> +#define CDNS_DP_ENC_MAIN_CONF_CONVERT_RGB		BIT(2)
> +#define CDNS_DP_ENC_MAIN_CONF_ENABLE_422		BIT(3)
> +#define CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH		GENMASK(7, 4)
> +#define CDNS_DP_ENC_MAIN_CONF_LINEBUF_DEPTH_SHIFT	4
> +#define CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL		GENMASK(17, 8)
> +#define CDNS_DP_ENC_MAIN_CONF_BITS_PER_PIXEL_SHIFT	8
> +#define CDNS_DP_ENC_MAIN_CONF_BLOCK_PRED_EN		BIT(18)
> +#define CDNS_DP_ENC_MAIN_CONF_VIDEO_MODE		BIT(19)
> +#define CDNS_DP_ENC_MAIN_CONF_ICH_RST_EOL		BIT(20)
> +#define CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES		GENMASK(31, 24)
> +#define CDNS_DP_ENC_MAIN_CONF_INITIAL_LINES_SHIFT	24
> +
> +#define CDNS_DP_ENC_PICTURE_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x4)
> +#define CDNS_DP_ENC_PICTURE_SIZE_HEIGHT			GENMASK(31, 16)
> +#define CDNS_DP_ENC_PICTURE_SIZE_HEIGHT_SHIFT		16
> +#define CDNS_DP_ENC_PICTURE_SIZE_WIDTH			GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_SLICE_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x8)
> +#define CDNS_DP_ENC_SLICE_SIZE_HEIGHT			GENMASK(31, 16)
> +#define CDNS_DP_ENC_SLICE_SIZE_HEIGHT_SHIFT		16
> +#define CDNS_DP_ENC_SLICE_SIZE_WIDTH			GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_MISC_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xc)
> +#define CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE		GENMASK(31, 16)
> +#define CDNS_DP_ENC_MISC_SIZE_CHUNK_SIZE_SHIFT		16
> +#define CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR		GENMASK(15, 2)
> +#define CDNS_DP_ENC_MISC_SIZE_OB_MAX_ADDR_SHIFT		2
> +#define CDNS_DP_ENC_MISC_SIZE_LAST_GRP_SIZE		GENMASK(1, 0)
> +
> +#define CDNS_DP_ENC_HRD_DELAYS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x10)
> +#define CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY		GENMASK(31, 16)
> +#define CDNS_DP_ENC_HRD_DELAYS_INIT_DEC_DELAY_SHIFT	16
> +#define CDNS_DP_ENC_HRD_DELAYS_INIT_XMIT_DELAY		GENMASK(9, 0)
> +
> +#define CDNS_DP_ENC_RC_SCALE(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0x14)
> +#define CDNS_DP_ENC_RC_SCALE_INIT_SCALE_VALUE		GENMASK(5, 0)
> +
> +#define CDNS_DP_ENC_RC_SCALE_INC_DEC(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x18)
> +#define CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL		GENMASK(27, 16)
> +#define CDNS_DP_ENC_RC_SCALE_DEC_INTERVAL_SHIFT		16
> +#define CDNS_DP_ENC_RC_SCALE_INC_INTERVAL		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_RC_OFFSETS_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x1c)
> +#define CDNS_DP_ENC_RC_OFFSETS_1_FL_BPG_OFFSET		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_OFFSETS_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x20)
> +#define CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET		GENMASK(31, 16)
> +#define CDNS_DP_ENC_RC_OFFSETS_2_SL_BPG_OFFSET_SHIFT	16
> +#define CDNS_DP_ENC_RC_OFFSETS_2_NFL_BPG_OFFSET		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_RC_OFFSETS_3(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x24)
> +#define CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET		GENMASK(31, 16)
> +#define CDNS_DP_ENC_RC_OFFSETS_3_FINAL_OFFSET_SHIFT	16
> +#define CDNS_DP_ENC_RC_OFFSETS_3_INIT_OFFSET		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_FLATNESS_DETECTION(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x28)
> +#define CDNS_DP_ENC_FLATNESS_DETECTION_THRESH		GENMASK(17, 10)
> +#define CDNS_DP_ENC_FLATNESS_DETECTION_THRESH_SHIFT	10
> +#define CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP		GENMASK(9, 5)
> +#define CDNS_DP_ENC_FLATNESS_DETECTION_MAX_QP_SHIFT	5
> +#define CDNS_DP_ENC_FLATNESS_DETECTION_MIN_QP		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MODEL_SIZE(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x2c)
> +#define CDNS_DP_ENC_RC_MODEL_SIZE_RC_MODEL_SIZE		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_RC_CONFIG(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x30)
> +#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO		GENMASK(27, 24)
> +#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_LO_SHIFT	24
> +#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI		GENMASK(23, 20)
> +#define CDNS_DP_ENC_RC_CONFIG_TGT_OFFSET_HI_SHIFT	20
> +#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1		GENMASK(17, 13)
> +#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_1_SHIFT	13
> +#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0		GENMASK(12, 8)
> +#define CDNS_DP_ENC_RC_CONFIG_QUANT_INC_LIM_0_SHIFT	8
> +#define CDNS_DP_ENC_RC_CONFIG_EDGE_FACTOR		GENMASK(3, 0)
> +
> +#define CDNS_DP_ENC_RC_BUF_THRESH_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x34)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_3		GENMASK(31, 24)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_2		GENMASK(23, 16)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_1		GENMASK(15, 8)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_0_THRESH_0		GENMASK(7, 0)
> +
> +#define CDNS_DP_ENC_RC_BUF_THRESH_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x38)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_7		GENMASK(31, 24)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_6		GENMASK(23, 16)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_5		GENMASK(15, 8)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_1_THRESH_4		GENMASK(7, 0)
> +
> +#define CDNS_DP_ENC_RC_BUF_THRESH_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x3c)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_11		GENMASK(31, 24)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_10		GENMASK(23, 16)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_9		GENMASK(15, 8)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_2_THRESH_8		GENMASK(7, 0)
> +
> +#define CDNS_DP_ENC_RC_BUF_THRESH_3(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x40)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_13		GENMASK(15, 8)
> +#define CDNS_DP_ENC_RC_BUF_THRESH_3_THRESH_12		GENMASK(7, 0)
> +
> +#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_3_SHIFT	24
> +#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_2_SHIFT	16
> +#define CDNS_DP_ENC_RC_BUF_THRESH_THRESH_1_SHIFT	8
> +
> +#define CDNS_DP_ENC_RC_MIN_QP_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x44)
> +#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_4			GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_3			GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_2			GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_1			GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MIN_QP_0_RANGE_0			GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MIN_QP_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x48)
> +#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_9			GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_8			GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_7			GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_6			GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MIN_QP_1_RANGE_5			GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MIN_QP_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x4c)
> +#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_14		GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_13		GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_12		GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_11		GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MIN_QP_2_RANGE_10		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MAX_QP_0(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x50)
> +#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_4			GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_3			GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_2			GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_1			GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MAX_QP_0_RANGE_0			GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MAX_QP_1(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x54)
> +#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_9			GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_8			GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_7			GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_6			GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MAX_QP_1_RANGE_5			GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_MAX_QP_2(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0x58)
> +#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_14		GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_13		GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_12		GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_11		GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_MAX_QP_2_RANGE_10		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_QP_RANGE_4_SHIFT			20
> +#define CDNS_DP_ENC_RC_QP_RANGE_3_SHIFT			15
> +#define CDNS_DP_ENC_RC_QP_RANGE_2_SHIFT			10
> +#define CDNS_DP_ENC_RC_QP_RANGE_1_SHIFT			5
> +
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x5c)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_4		GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_3		GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_2		GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_1		GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_0		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_1(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x60)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_9		GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_8		GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_7		GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_6		GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_5		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_2(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x64)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_14		GENMASK(24, 20)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_13		GENMASK(19, 15)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_12		GENMASK(14, 10)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_11		GENMASK(9, 5)
> +#define CDNS_DP_ENC_RC_RANGE_BPG_OFFSETS_0_10		GENMASK(4, 0)
> +
> +#define CDNS_DP_ENC_DPI_CTRL_OUT_DELAY(d)		(CDNS_DP_ENC_MAIN_CONF(d) + 0x68)
> +#define CDNS_DP_ENC_DPI_CTRL_OUT_DELAY_CYCLES		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_GENERAL_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa0)
> +#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_FULL_1	BIT(6)
> +#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_FULL_0	BIT(5)
> +#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_EMPTY_1	BIT(4)
> +#define CDNS_DP_ENC_GENERAL_STATUS_OUT_BUFF_EMPTY_0	BIT(3)
> +#define CDNS_DP_ENC_GENERAL_STATUS_FRAME_DONE		BIT(2)
> +#define CDNS_DP_ENC_GENERAL_STATUS_FRAME_STARTED	BIT(1)
> +#define CDNS_DP_ENC_GENERAL_STATUS_CE			BIT(0)
> +
> +#define CDNS_DP_ENC_HSLICE_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa4)
> +#define CDNS_DP_ENC_HSLICE_STATUS_ACTUAL_SLICE		GENMASK(31, 16)
> +#define CDNS_DP_ENC_HSLICE_STATUS_ACTUAL_LINE		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_OUT_STATUS(d)			(CDNS_DP_ENC_MAIN_CONF(d) + 0xa8)
> +#define CDNS_DP_ENC_OUT_STATUS_ACTUAL_SLICE		GENMASK(31, 16)
> +#define CDNS_DP_ENC_OUT_STATUS_ACTUAL_LINE		GENMASK(15, 0)
> +
> +#define CDNS_DP_ENC_INT_STAT(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xac)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_FULL_1		BIT(10)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_FULL_0		BIT(9)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_EMPTY_1		BIT(8)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_EMPTY_0		BIT(7)
> +#define CDNS_DP_ENC_INT_STAT_FRAME_DONE			BIT(6)
> +#define CDNS_DP_ENC_INT_STAT_FRAME_STARTED		BIT(5)
> +#define CDNS_DP_ENC_INT_STAT_CE				BIT(4)
> +#define CDNS_DP_ENC_INT_STAT_RC_BUFF_OVER_1		BIT(3)
> +#define CDNS_DP_ENC_INT_STAT_RC_BUFF_OVER_0		BIT(2)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_UND_1		BIT(1)
> +#define CDNS_DP_ENC_INT_STAT_OUT_BUFF_UND_0		BIT(0)
> +
> +#define CDNS_DP_ENC_INT_CLR(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb0)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_FULL_1		BIT(10)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_FULL_0		BIT(9)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_EMPTY_1		BIT(8)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_EMPTY_0		BIT(7)
> +#define CDNS_DP_ENC_INT_CLR_FRAME_DONE			BIT(6)
> +#define CDNS_DP_ENC_INT_CLR_FRAME_STARTED		BIT(5)
> +#define CDNS_DP_ENC_INT_CLR_CE				BIT(4)
> +#define CDNS_DP_ENC_INT_CLR_RC_BUFF_OVER_1		BIT(3)
> +#define CDNS_DP_ENC_INT_CLR_RC_BUFF_OVER_0		BIT(2)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_UND_1		BIT(1)
> +#define CDNS_DP_ENC_INT_CLR_OUT_BUFF_UND_0		BIT(0)
> +
> +#define CDNS_DP_ENC_INT_MASK(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb4)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_FULL_1		BIT(10)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_FULL_0		BIT(9)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_EMPTY_1		BIT(8)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_EMPTY_0		BIT(7)
> +#define CDNS_DP_ENC_INT_MASK_FRAME_DONE			BIT(6)
> +#define CDNS_DP_ENC_INT_MASK_FRAME_STARTED		BIT(5)
> +#define CDNS_DP_ENC_INT_MASK_CE				BIT(4)
> +#define CDNS_DP_ENC_INT_MASK_RC_BUFF_OVER_1		BIT(3)
> +#define CDNS_DP_ENC_INT_MASK_RC_BUFF_OVER_0		BIT(2)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_UND_1		BIT(1)
> +#define CDNS_DP_ENC_INT_MASK_OUT_BUFF_UND_0		BIT(0)
> +
> +#define CDNS_DP_ENC_INT_TEST(d)				(CDNS_DP_ENC_MAIN_CONF(d) + 0xb8)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_FULL_1		BIT(10)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_FULL_0		BIT(9)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_EMPTY_1		BIT(8)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_EMPTY_0		BIT(7)
> +#define CDNS_DP_ENC_INT_TEST_FRAME_DONE			BIT(6)
> +#define CDNS_DP_ENC_INT_TEST_FRAME_STARTED		BIT(5)
> +#define CDNS_DP_ENC_INT_TEST_CE				BIT(4)
> +#define CDNS_DP_ENC_INT_TEST_RC_BUFF_OVER_1		BIT(3)
> +#define CDNS_DP_ENC_INT_TEST_RC_BUFF_OVER_0		BIT(2)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_UND_1		BIT(1)
> +#define CDNS_DP_ENC_INT_TEST_OUT_BUFF_UND_0		BIT(0)
> +
> +void cdns_mhdp_dsc_write_config(struct cdns_mhdp_device *mhdp);
> +void cdns_mhdp_dsc_write_enc_config(struct cdns_mhdp_device *mhdp, int stream_id,
> +				    const struct drm_display_mode *mode);
> +int cdns_mhdp_dsc_sink_support(struct cdns_mhdp_device *mhdp);
> +int cdns_mhdp_compute_dsc_params(struct cdns_mhdp_device *mhdp);
> +int cdns_mhdp_dsc_send_pps_sdp(struct cdns_mhdp_device *mhdp, int stream_id);
> +
> +#endif /* MHDP_DSC_H_ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
