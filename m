Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6961B9BAC9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 21:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2B510E7C7;
	Wed, 24 Sep 2025 19:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYt3irBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A510E7C7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD8TOP027477
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0iu1Wjnwv+f5AYYfHw58qhf/
 bG3HYMyGpWsuOD72KVE=; b=OYt3irBdhpx9aAiIMdbkqDlTw+/XKF7xO+0lhAON
 cEPYRnzCWanMF+8BQc0OnILdjgc9xSUkvQpbkXk+z8XSJ77l131fsYU6AaDvzqtd
 K4XSBQX5yz3mnzO8w9FBT6U0j1end7RQjLG5622rl8qYnGY6qUlMXuYoOQ8sl981
 yltphA8af1Bqh0PoOlEykCKHpJ+8v52Gjb859XYpOaAS0O67NWPIhBpvxDgGSGC3
 ewau2muRbr95q2NycC1Bwu806tZaERN4Ic8ZraY/bGk0sGhzc4Sc5OvJZuEr/Xpa
 P6kbDBGpUeoR+/x2jiBwU4o8BhxZAejcnzf+cy/IRrvW7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv15jdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:21:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d413127749so3974211cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 12:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758741710; x=1759346510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0iu1Wjnwv+f5AYYfHw58qhf/bG3HYMyGpWsuOD72KVE=;
 b=B18JeSE6I0DgbGO98XsZ9piftyqNfIdUjC4HzVrIixODsEfMCk+TNoUFbvUHnqL2Zi
 Ylk+z937edA0GMiqrPNnIf0kbtoDc1Ttu7P2Ft2c9mMnupkqx+V3DqrztMxcxGp61h1z
 Ho1FekTFI+tTnQxdWuzVIHl9bRVDIIcmO6STQrrcy7hieZSVqr5xodIKejP+X/mUC3nv
 BS0GBOVqGRpc0WjR6DjtlWBHNSsWzvR+wPZRWGrCAkI1xYdsNVqSKX8C5tuheMJzqk2A
 0TTgZAQgCYODngEKLx8R8zwK97p4Cb4nladaOo39spz1izoB5dQPw13JeuZ8A/PvTpTn
 4Z1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmSVpwI/FmJ6A2A1qFAjFQCQ9DWK0OgnzDdTDNYEmU2jB92MCsFOZLM6V/1v3HaCjUIzSC9bzwanU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj39wrXv8Ib6cqEjN7ADC+K0dnpv7v6UMoG33V5eRr1bBJK8Dw
 Pi879lwFoQI/LpPY/40gZyOvT/5f1YVhUNEc34OlLxvgflJUoYePea981qz3HDkUptfBiD6v2tg
 RcR6xsnFtCC2QGp0D/1SdBqysFn60oUGuc0JRsXpFEMKQMJz0wSCwHMdcJ0HMLms8+5HR3eA=
X-Gm-Gg: ASbGncvq0Kh2oF0ioyWYJB5F4eq4bhP2FMOclWmgVT+o1FMBEfabOdJh+4ChvF4+ip+
 GquLa1NTtts8bVpE+Nsp3CEsGD3cSDHWpryV0j6UgQDV/3A7nQr2FC7iyWeoE8mN1vaJQnlf8a/
 L2nAiBqr8HU1nWqiz7HD8bKh6n6cWGyvJz01Riwm2k0zptdQVPTsHYrVDiH4FYIATNf2AKCMGgs
 XKbFBsQcMn0z4TacaEzBTcB4+ZscfrLGNlQ60Hgpy8HyokuhD71I61YcBFjYSwR5t/0/wrV8QGK
 si+hf2gF923xgsulyWNS2aKIpZwQwXuffAN4ABdS12MZ37hr7yZR2GbnGEp72cXqASRWAXj/+LD
 CkmxwtIJ/GEv+DWmf91zlX8kbsRJ7itpMUxGr68n3FrccgKt6GGQg
X-Received: by 2002:ac8:7c42:0:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4da4b428df9mr11723661cf.47.1758741709954; 
 Wed, 24 Sep 2025 12:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaFsspAyH/V3Y+WNKmm+luXg2sxoUJuUxgT3PD4jQ2JdvLW6f6tdlPbuRxY0RMCgn1FJCFVg==
X-Received: by 2002:ac8:7c42:0:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4da4b428df9mr11723151cf.47.1758741709377; 
 Wed, 24 Sep 2025 12:21:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57f477153bdsm2419549e87.29.2025.09.24.12.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 12:21:48 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
X-Proofpoint-GUID: Fbb_qIwVX8IRXjY-ooo2Lss5zoefdkD_
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d444cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=BVByBJJp0cfCRiHu0pEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX4t3o+H8Pd2KG
 AuFuJQ4eBucBuXf1mcrBtP1VH4BvTErD0uKX7bSM4juqOeCj8yeQVS3a6PgYKLqSS9ZYwe2sEUi
 l4td94rGVEVJ+C70fbmD0nJFJ2K00HFqoQhFgfgUu4nCn1Lz6vjIQxb9hArvtjsDcL+8JZfZ82+
 1OQRVYyfMW8UzgyhosG/bhe/3nSuFzemp5Sv0+nnECFoZDfnkJYkWBHhV4TtrgR7astwUFhlgqz
 6n9zMhj8ZY6ERIcEeV8fjLS8OzAiFDToE637+zil0WwKR00Ga2C5QQaMNoqxAvaqnhsLdO3RtdN
 cagV0Jjad3LrYxf0nVuAg5V8owlnIEdCHNx9Y9mhFnrR/vQ/Dv8nZJNgAazQHW0FBvWL6mBEU+Q
 v/1HNR+W
X-Proofpoint-ORIG-GUID: Fbb_qIwVX8IRXjY-ooo2Lss5zoefdkD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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

On Wed, Sep 24, 2025 at 11:08:12PM +0800, Jun Nie wrote:
> Support a hardware configuration where two independent DSI panels are
> driven by a single, synchronous CRTC. This configuration uses a bonded
> DSI link to provide a unified vblank for both displays.
> 
> This allows application software to treat the two displays as a single,
> wide framebuffer with a synchronized refresh cycle, simplifying rendering
> logic for side-by-side panel arrangements.

I'd like to understand how is it framed on the overall system design
level. If it's a panel controlled over the DSI interface, it's fine
since we can broadcast commands over two DSI links. What if the panel
(or bridge) is controlled via I2C / SPI?

> 
> At the DSI host level, the frame width for each link must be that of an
> individual panel. The driver therefore halves the CRTC's horizontal
> resolution before configuring the DSI host and any DSC encoders, ensuring
> each panel receives the correct half of the framebuffer.

> 
> While the DSI panel driver should manage two panels togehter.
> 1. During probe, the driver finds the sibling dsi host via device tree
> phandle and register the 2nd panel to get another mipi_dsi_device.
> 2. Set dual_panel flag on both mipi_dsi_device.
> 3. Prepare DSC data per requirement from single panel.
> 4. All DSI commands should be send on every DSI link.
> 5. Handle power supply for 2 panels in one shot, the same is true to
>    brightness.
> 6. From the CRTC's perspective, the two panels appear as one wide display.
>    The driver exposes a DRM mode where the horizontal timings (hdisplay,
>    hsync_start, etc.) are doubled, while the vertical timings remain those
>    of a single panel. Because 2 panels are expected to be mounted in
>    left/right position.
> 
> To maintain synchronization, both DSI links are configured to share a
> single clock source, with the DSI1 controller using the clock provided
> to DSI0 as below.
> 
> &mdss_dsi1 {
>    assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> 		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
>    assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> }
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a51a0a3e3f96f6c3838 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -177,6 +177,7 @@ struct msm_dsi_host {
>  	bool registered;
>  	bool power_on;
>  	bool enabled;
> +	bool is_dual_panel;
>  	int irq;
>  };
>  
> @@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			return;
>  		}
>  
> -		dsc->pic_width = mode->hdisplay;
> +		if (msm_host->is_dual_panel)
> +			dsc->pic_width = hdisplay;
> +		else
> +			dsc->pic_width = mode->hdisplay;
>  		dsc->pic_height = mode->vdisplay;
>  		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>  
> @@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->lanes > msm_host->num_data_lanes)
>  		return -EINVAL;
>  
> +	msm_host->is_dual_panel = dsi->dual_panel;
>  	msm_host->channel = dsi->channel;
>  	msm_host->lanes = dsi->lanes;
>  	msm_host->format = dsi->format;
> @@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>  	if (!msm_host->dsc)
>  		return MODE_OK;
>  
> +	if (msm_host->is_dual_panel)
> +		pic_width = mode->hdisplay / 2;
> +
>  	if (pic_width % dsc->slice_width) {
>  		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>  		       pic_width, dsc->slice_width);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
