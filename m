Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50004AC0BC3
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3160510E82F;
	Thu, 22 May 2025 12:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQalo+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337F410E82F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:40:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8NV1R027725
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+EqEHGQsGLV7fMWgFHiDCICo
 9owZC5//Pie9xhLsJeQ=; b=VgQalo+0oOyORAiuezYHZYJqlNe7dZ4MnpprEVb9
 vwU8lKz3Z6m6Rli/ceqcyMqHNWDZTKZrwrQDJwEjJB9n+fQ46sFrHMYJy6UkK2oK
 Ic1SkaBhS3pPYcbwBAFu0JcGLJPjaIdpZdtUMH6kbvPKNcsvLCTCQXf+lal7bZ3N
 cWPNJJAgtyuEFAx4YeQ4+APzW/Gx9udZfw2ceEMM1W+v4rd2pz2qDK5tDkjtbBDK
 OuNfLY0VCMBLzk27BTvpEZFCX+YMR6tg21W1/OTTQ0HHCxHl0ZuKyCoMyJnTfEl3
 x0M0JcYU9q+VzC+xAp4bwjtdW7eHUWWOoG3bGigQivs1zg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9e8f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:40:13 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-604aa7573f9so6546805eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747917611; x=1748522411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EqEHGQsGLV7fMWgFHiDCICo9owZC5//Pie9xhLsJeQ=;
 b=OQbYKirnzuo331trRlZhAsuBMlDbHBichM11TfZevGp5+aYvVaAy1LFnxqx/R+X7gX
 lVgZqtf6RE/17hiKUblA5kXqrROivRYiuLX1RwAvPoXy1dIkTTAWd3lvf52+XrLf7WJd
 VG+WlazvM0e1aKeRzqanaj0k6GIiW6/Yi6uKTxCvO+w8TvGaj8HWb5m6nFiPJR0eZDTh
 eO1JMzB3//cp57RY5d94ZmxJ7rQfbrelus4+sZ1mi61bbrw3ktTbCPmk42UBf8ezmuN2
 IPVzdGfnJ/iqFLrSebpPY/YzaBZVr5Z9DdIUBkeVu5rKm9xzP7j/kTHtAmaSiATTlfeR
 7Hxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/jsgAmhsIOAH/KRcTatyXPtA+4eFzjenF5hiMb77R++074C/FMFtk//5/zHMR34chwbye2gnwyKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFAF9tZO1xtsuGleNeA3Hu/9jQhzVfFjTog+LiRcO+XtDKBrYV
 fQbaLeub39X/7hA2F4FbcHsmjObZ/tLBlqjn9bxJK0rV3plfnpaScZueDl+4Dsf4VqUmrIqSdtu
 D66TCeNcXm/rFycfGNyGcNkg/WX9UeuR6Xp0QCQl6nShp39wZoSLSO1Dl9zCqw3FE8b3zH6pRAd
 wsOQQ=
X-Gm-Gg: ASbGncvK8vxvNX++lNFEBs3+MAIPVYzKoU0xfgmOtMKbOMxhprDI3qejYZalVwZRyGH
 PgRpaCMFnyKOFn9UDPoUBZRwochlj57ZwIt+JUC+YF+qJ+DACXc/j6vcK4m58qNP37HSD+9Rg5A
 wmT7CxmECuXxNcDJFAD6s5gQfDnQauGXGLS1U9GawygVAre0WUlT2P+FmrVo/1Vx96ev/H+ijVq
 Y5D/ir7fLMBG+NJ8hXiBpqb922+KHFjJAn/SIX/H8R303Gr/FirCALtffTDnu/11ZZRKUN+Aq+X
 aIpd6Rav04glyGiFx4c46DnYmmeEbJQrxY3ziWwlWJn0PUiHrA01yQxzc5MpY3AbPH9PDN+IZy0
 =
X-Received: by 2002:a05:6820:a09:b0:60a:bee:497a with SMTP id
 006d021491bc7-60a0bee49fcmr9467389eaf.2.1747917610957; 
 Thu, 22 May 2025 05:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFve+8mofNSpVKLWwuMYBvia/xh0sTk8FAf6wyF/tDiY8jaMMruPUXYmConthQlvyqWvXyIXA==
X-Received: by 2002:ad4:5caa:0:b0:6f5:dd5:a594 with SMTP id
 6a1803df08f44-6f8b2cb94cemr428744686d6.5.1747917599863; 
 Thu, 22 May 2025 05:39:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e7017e6esm3376695e87.136.2025.05.22.05.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 05:39:58 -0700 (PDT)
Date: Thu, 22 May 2025 15:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
Message-ID: <tm2ogebkaxu3g6xdmrjkx3u6veac45qd7mtiruan4rcevs75xn@apubmfvg74nt>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
 <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
X-Proofpoint-ORIG-GUID: MI_8keBUII1Atjo1LBb8HB0GKMg4FYL7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfX9uvf+7xWVz/w
 HAHPb03MBGjDUC2Dkw/vN9WLjMlIBm+HcVg2u+4Aq/OhxoyYhiyN6Up+mdt+HJy/DAeyw3+QNEq
 NjmsS4JAWGdiXeFRxFdmWiOnYd4SmbWhz4ZVtAVy6KR757lk9VAf89c4fIN1lMmnepYQUuJAS5r
 vPSbHMBMpgP9LphA1WJcKwvggdWi4j5IqANS5dh4hDgeSl9ZbQI+w102PE3RKt32fpwJl/mZdXC
 aTbanJzDNerigL4M2l5GsouN3UaT4V+di9MMRuBr/xsI8DQGUvYzrLZ766kqh6WCstZ/0NouY/G
 ZzwsDn1S366W3XcG7cYWCzX0WW6ow03HeWJ0yqtKSXUkYr/MACS3J1qiTGcUFUyoOYl8lyHzkdp
 9KY3JXO++QKLuymogSU3H53seJ3HK6YqmQMD7f30BvtbpRzT2DBU0I/6RmtheLIO9/8/5/Y7
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f1b2d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kkxXnT2X172yt9C4ahEA:9
 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MI_8keBUII1Atjo1LBb8HB0GKMg4FYL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220127
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

On Thu, May 22, 2025 at 09:38:34AM +0200, neil.armstrong@linaro.org wrote:
> On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> > drivers allows better code sharing with the rest of the PHY system.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Makefile                     |   7 -
> >   drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
> >   drivers/phy/qualcomm/Kconfig                     |  21 +
> >   drivers/phy/qualcomm/Makefile                    |  14 +
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
> >   22 files changed, 2259 insertions(+), 2596 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -5,6 +5,7 @@
> >    */
> >   #include <linux/delay.h>
> > +#include <linux/phy/phy.h>
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_edid.h>
> >   #include <drm/display/drm_hdmi_helper.h>
> > @@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	struct drm_encoder *encoder = bridge->encoder;
> >   	struct drm_connector *connector;
> >   	struct drm_connector_state *conn_state;
> >   	struct drm_crtc_state *crtc_state;
> > +	union phy_configure_opts phy_opts;
> > +	int ret;
> >   	DBG("power up");
> > @@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	if (!hdmi->power_on) {
> > -		msm_hdmi_phy_resource_enable(phy);
> > +		phy_init(hdmi->phy);
> >   		msm_hdmi_power_on(bridge);
> >   		hdmi->power_on = true;
> >   	}
> > @@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > -	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> > +	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> > +	phy_opts.hdmi.bpc = 8;
> > +	phy_configure(hdmi->phy, &phy_opts);
> > +
> > +	ret = phy_power_on(hdmi->phy);
> > +	if (WARN_ON(ret))
> > +		return;
> > +
> > +	if (hdmi->extp_clk) {
> > +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
> > +
> > +		ret = clk_prepare_enable(hdmi->extp_clk);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
> > +	}
> 
> Why do you again set the extp_clk since it's already set & enabled in msm_hdmi_power_on() ?
> 
> Perhaps I missed a change but it's like that on next-20250521

Yes. And it was a part of the series beforehand. I will check, why it
was required or I will drop it.

> 
> >   	msm_hdmi_set_mode(hdmi, true);
> > @@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
> > @@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
> > -	msm_hdmi_phy_powerdown(phy);
> > +	if (hdmi->extp_clk)
> > +		clk_disable_unprepare(hdmi->extp_clk);
> > +
> > +	phy_power_off(hdmi->phy);
> >   	if (hdmi->power_on) {
> >   		power_off(bridge);
> >   		hdmi->power_on = false;
> >   		if (hdmi->connector->display_info.is_hdmi)
> >   			msm_hdmi_audio_update(hdmi);
> > -		msm_hdmi_phy_resource_disable(phy);
> > +		phy_exit(hdmi->phy);
> >   	}
> >   	mutex_unlock(&hdmi->state_mutex);
> >   }
> <snip>
> 
> Otherwise it looks fine even there's a lot to digest and hard to figure out
> the exact changes done to the PHY drivers.

Yes. I have been trying to find other ways to handle such move, but I
couldn't find any.

-- 
With best wishes
Dmitry
