Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F7CAA0AB
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 05:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63210EBE4;
	Sat,  6 Dec 2025 04:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H18/e4ux";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Raa7JdOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5A10EBE4
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 04:26:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B63QbVj2575049
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 04:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ognPUSg0ypp1iSasBEkkG0+y
 XPls6MuScMwxxjxW6Z8=; b=H18/e4uxN+1Z65eAK3Mv4WzVO9CmFRc5JVfOu2W6
 3D3tV90s8K/5Ag29zrnXOnwFqLVX34d/re6Qp45j44MAc6g5FKp5mMWQ0SaiZn+Q
 KEHFPOJe1CgIZcgRg14L2HgkeddYfrqyqYKrW/JjD0ZxZH1lGMsfcM0lNGEUFKXl
 lFQqr/AYse3SDwlXl71+SyVocAxh1clXnOoIuqSk5XJCFe+5tEbzQNi/J+QvmdED
 kXAyj+HQUAI1+sGkkN8VPZD6Up7gJhBwqJvDnKyIEqhlfBLXbqVLM2Ho5bHIQteJ
 YCzmId2T+ZXHp10VVOR5dg/OIiKP96XQRLK+d9bsdZN16w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjv82ru-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 04:26:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b6963d1624so53812085a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764995159; x=1765599959;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ognPUSg0ypp1iSasBEkkG0+yXPls6MuScMwxxjxW6Z8=;
 b=Raa7JdOGjzzgdyo+HgYPzfxq7d+d60l/ElmOB0qNOH4V6jQHsLGiYPCstmeq122Any
 XMlXw7qf3xZjfqA9qePlNNqAtQkTAEtF8itGbLW+L6yL4YHW2hosGichOwiaM3y1cpx2
 6tuth9U7trw+t0eiW8IUPrO4g5+4G0BqdaJL+C6Mu0nMztGkbHZVdr+HTxdr8S53+I57
 oUhyGwDz5VE2qayY2EpLx0cIkTD3SILfng3iCup8tzFRclHUzOsUmt/yL51bJz27ouAn
 bzl5rLeyV8XBW09AKbo0iOCliS/MuaZZOj9NMiViNeW3ai8K//Fo3QQsfmAa5BXyGa6c
 knKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764995159; x=1765599959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ognPUSg0ypp1iSasBEkkG0+yXPls6MuScMwxxjxW6Z8=;
 b=CTFP1FRXI773T88Mw+NBh2F7ge5he6BncLRQX+Xiw6pBTD9N974dXvmFNusa82ApqD
 snO6HMwzfMIqxjLENdQ8Qpg2+JFGZV0djzEKT7oT3SRrH4ZE1gBZzKq7CKfy882Wi8xl
 BGnGOCFcrY57AlrigBhyJ5mD937ybHyDnoLcz5zLdiuurfacrdlKqWATdln1mtRwFal3
 nmKiR7PLJ14SJTrzpulXVdMDwFYwTP0zh6j1s8HVh7Fq9pEXJ4ZtX7xOBXkXri6pWy3F
 G4Od4HZcAIDyCvmQkjem0Qpa/rOpw3GCCsdEpldmwLNZ0Tst63cNjKaZxHBbBRmlk5rX
 bdPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyDQfLhfuXeOoLcMc6t7yu/qLR20U0jaBkT+K2OPSW+Zoa4v2zNvyF+PEY+Gn9lYCvQJoi0z3KM9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+jiSkaob23qmwt/tpWzz0yYHA2+IMUhmhvE5SEnpLMGPxW5N0
 c1+au7xUHXVnOiD6tDpFbNEl+vMzMotcnFmtulhe5xq2tzE5rU6OjTGYIMAaBD1qvPIY5N4fICP
 3siIXTaUbOmfh3Y7N9xcL6aw5T7ANDb6Ak0sI8Sq9W8L0+jM04mjUpZaw9KD2FIoeqE4uqYc=
X-Gm-Gg: ASbGnctieDMTiZeTv7cDqHSfoJiVM4bMVxLll77p5yTn3e1c5GmOxVRSI0oUn/nbPJP
 Vq27UyhT9B8K9yFe5U3zFcn9uI0mSPlun1BCbEGXvhD264GNhPNZeoVBl0h6VyAdBoSV4P4ITdx
 erYNibBRPRnVrTZEmlSNP6jfxvy45Yn+ZnLrLmMDh51L/m9CcI2ZASBqfp3fSL924wVE2kk+FPU
 8WFq3vjImnO5ts+gO4XClF7DxnyMNrulI08OND16y+HkUUVFyAnt38OiQ/oI+87R1HdmSwpsHiL
 uKm0xl6DrCtlG8fXKQTMvJjunwruvBM2TW2H7b+3kzRsH7L55MoisvIf2WEkzPo4/ViTFwlluid
 Q6AnvOuI89r+sm2Q9J5aw3DElXaWEfcGBkr59Hh2gsgWo9lqY4olTlVLaxYQtXYNG+zk57rDPc3
 qlqSdDoCvfCpngexha2fj9yuc=
X-Received: by 2002:a05:620a:3181:b0:89f:27dc:6536 with SMTP id
 af79cd13be357-8b6a23d3ce7mr198628385a.54.1764995159384; 
 Fri, 05 Dec 2025 20:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZLXHLgEMHcj/4gWSWWforl0+eBSPgONjDyYevRp8h1TrRuz9KnFaSPg9m3taHQ5GRofi9PQ==
X-Received: by 2002:a05:620a:3181:b0:89f:27dc:6536 with SMTP id
 af79cd13be357-8b6a23d3ce7mr198625585a.54.1764995158921; 
 Fri, 05 Dec 2025 20:25:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a7dbsm2067046e87.20.2025.12.05.20.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 20:25:58 -0800 (PST)
Date: Sat, 6 Dec 2025 06:25:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
Message-ID: <jqgwmjet2ncit5bqilvuqldxrtcapiozmpbk5klc5tybwbfezi@4muxgno7do45>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6933b058 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dyG3DeJWMbf1Z_p6H2UA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMyBTYWx0ZWRfX2OFqR9ECjlau
 E/twXWY/tv3pLya0AeFitVXeMrkqK0oJhxC7U4j5drGBAHZ3zKieOQ9uiyzewz/U5sNYAVf0sif
 SJO07nR1WTqdqBjqAGh0gc/U3nw8GbV9dSnXy4OgvZUaXj+PL61r3c8f1Tvea0DnMfnS+utRynY
 3AXl275Dm/3rH6oI7vaWfjc8Za+oad09t8hoMPq8ax2hBCWHXZlNERlZOstW3Jxio38Ju5rkm3L
 WCtbtKwTc7SOgBYQcrCU3OmP+hneN2HzaexjnRHZm5ajXKaM5KouRwuoiqGechJ4aNw2l8qB3L0
 q3BGkqgnrvk6U6SID78S2Rtn1ITY+o/on/Pax+LdxilChCDdAJDcRUKyK1OOvWfmM+eQgLZ1eqD
 K9qG454pSn3br8CwJ5O1Kmd9n0r3jQ==
X-Proofpoint-ORIG-GUID: LYQKCIYk7PkuUOizi1Va-o7oanTkBVQV
X-Proofpoint-GUID: LYQKCIYk7PkuUOizi1Va-o7oanTkBVQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060033
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

On Tue, Nov 25, 2025 at 09:29:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce enable(), disable() and reset() functions.
> 
> The enable() and disable() callbacks keep the symmetry in the commands
> sent to the panel and also make a clearer distinction between panel
> initialization and configuration.

This also makes those to to be executed after starting the DSI stream.
Is it fine?

> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index dcca7873acf8e..20217877e107f 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -38,11 +38,10 @@ static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
>  	return container_of(panel, struct sw43408_panel, base);
>  }
>  
> -static int sw43408_unprepare(struct drm_panel *panel)
> +static int sw43408_disable(struct drm_panel *panel)
>  {
>  	struct sw43408_panel *sw43408 = to_panel_info(panel);
>  	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
> -	int ret;
>  
>  	mipi_dsi_dcs_set_display_off_multi(&ctx);
>  
> @@ -50,19 +49,55 @@ static int sw43408_unprepare(struct drm_panel *panel)
>  
>  	mipi_dsi_msleep(&ctx, 100);
>  
> +	return ctx.accum_err;
> +}
> +
> +static int sw43408_unprepare(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *sw43408 = to_panel_info(panel);
> +	int ret;
> +
>  	gpiod_set_value(sw43408->reset_gpio, 1);
>  
>  	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
>  
> -	return ret ? : ctx.accum_err;
> +	return ret;
>  }
>  
> -static int sw43408_program(struct drm_panel *panel)
> +static int sw43408_enable(struct drm_panel *panel)

Please move it below sw43408_program() to ease code review.

>  {
>  	struct sw43408_panel *sw43408 = to_panel_info(panel);
>  	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
>  	struct drm_dsc_picture_parameter_set pps;
>  
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 50);
> +
> +	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
> +
> +	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
> +
> +	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	/*
> +	 * This panel uses PPS selectors with offset:
> +	 * PPS 1 if pps_identifier is 0
> +	 * PPS 2 if pps_identifier is 1
> +	 */
> +	mipi_dsi_compression_mode_ext_multi(&ctx, true,
> +					    MIPI_DSI_COMPRESSION_DSC, 1);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int sw43408_program(struct drm_panel *panel)
> +{
> +	struct sw43408_panel *sw43408 = to_panel_info(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
> +
>  	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
>  
>  	mipi_dsi_dcs_set_tear_on_multi(&ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> @@ -97,26 +132,19 @@ static int sw43408_program(struct drm_panel *panel)
>  	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
>  	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xca);
>  
> -	mipi_dsi_dcs_set_display_on_multi(&ctx);
> -
> -	mipi_dsi_msleep(&ctx, 50);
> -
> -	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -
> -	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
> -
> -	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
> +	return ctx.accum_err;
> +}
>  
> -	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
> +static void sw43408_reset(struct sw43408_panel *ctx)
> +{
> +	usleep_range(5000, 6000);
>  
> -	/*
> -	 * This panel uses PPS selectors with offset:
> -	 * PPS 1 if pps_identifier is 0
> -	 * PPS 2 if pps_identifier is 1
> -	 */
> -	mipi_dsi_compression_mode_ext_multi(&ctx, true,
> -					    MIPI_DSI_COMPRESSION_DSC, 1);
> -	return ctx.accum_err;
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
>  }
>  
>  static int sw43408_prepare(struct drm_panel *panel)
> @@ -128,14 +156,7 @@ static int sw43408_prepare(struct drm_panel *panel)
>  	if (ret < 0)
>  		return ret;
>  
> -	usleep_range(5000, 6000);
> -
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> -	gpiod_set_value(ctx->reset_gpio, 1);
> -	usleep_range(1000, 2000);
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> +	sw43408_reset(ctx);
>  
>  	ret = sw43408_program(panel);
>  	if (ret)
> @@ -208,6 +229,8 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
>  }
>  
>  static const struct drm_panel_funcs sw43408_funcs = {
> +	.disable = sw43408_disable,
> +	.enable = sw43408_enable,
>  	.unprepare = sw43408_unprepare,
>  	.prepare = sw43408_prepare,
>  	.get_modes = sw43408_get_modes,
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
