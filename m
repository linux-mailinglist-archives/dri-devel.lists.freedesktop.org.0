Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5EDB9BD43
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 22:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CE910E257;
	Wed, 24 Sep 2025 20:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8/loSfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020710E257
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:17:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCkQq6029712
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rNscl5fXPcxVylZp5rvGQzAn
 4wkFIbURvBdkFv3nYKA=; b=H8/loSfSik35YsP20ovZE7rZYpmzfKcrfLqog1aw
 kXmw6xU3Xoa9owShkrAz+Xqv5GsUl9OZLMAN8sp83mUnjtDO6d/S+saLAphokrWG
 N8+fmmznGR8geaEXUtvJ+xhwR0CxkvB2FsoZXlH4grpmtB35mACqxuzNuXEAX4o9
 Pk7wuoprtLKWkU+eoBfdL/eQcITVXB/3DH+0hzLHHFxQqVW5oV938WXiF1sOF8dq
 tDFlUk8KAIqaHRuQUkUXjGoFJaFKpH+g938ZuMTUSxtqcqQ0SXEbdQm/JOfaP8+b
 ypFK+x7tpMkGd2Y7+MdoSHVErnqCLzwevtfLUY301Qz6BQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnhg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 20:17:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d77ae03937so5991041cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 13:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758745054; x=1759349854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNscl5fXPcxVylZp5rvGQzAn4wkFIbURvBdkFv3nYKA=;
 b=jlNOhgRyWv3k50Uytj2JsmS10j2xWW1CcmZ70GY5X4ZEmMtZTmYrjHZIurICYchN+J
 PG6iwS4hK/kO5n99lfHWYyri1RRwHhEqO3oK5Au+5yjLjkNJhbPI5CcDan09zN7MP8Oe
 2gQlG0faUa7r4tUdRfKLS8Xmxx2xfpEJ1tLbHJLcSVPXZgq2Zb3Dm7XDMNaSM2gqKg/m
 QxDIDp+9InEirilskPowYvRFeQWqlOeLESojZ3O/3NdpO8eM/iFnp6MovQ+xCjPC9O54
 RFI3hi315sg+gllyv2nH7929f8o+ogh/fvRDF0RsORNYT8gWZ1jCZkRVFBO6dyMJ9un5
 mKBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWruoCNRtCYSDUAyPne1AYMdHIOZY0RHug1jC9Ig4+2yTNCu3VIkBcBcdywF5i+E9eg8LcKpt97FF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHDGYkYXLVg+zWRCSJAiT6K1bdSP7z4lR3c5l2rgPADW1NGR/p
 /HYcDVyFrD2pyIz+MY3vx3El+L5zLDFmD6KjqYKyijw3VRf5JrZC6Q1x0xApKHFT2WpLsRvYjH5
 uCX21aivbccCnFJ8r2GgHOfz7Abu2AB8mcX/m24S+8MV3KX82XDpPdQLz0J2BtXp2tb9gjJo=
X-Gm-Gg: ASbGncvL4C/ikGox8/EBNFOwQbsGUt+XY2h83joYftxyAk3H7ilicM2X1BZtklYja5U
 773N5XxAcmpdLlicHifdDjpoTExn14OHtyS56ePj7FI6F7OtmjRkPKSPCvGbI/Xk0m/6lXWZron
 poECOEAmmlOJyHz3UzkwkkUrF/nvkL0wlJW7VK9KTC1QR547FJufnZILVkgNxJIU9+/WqXU083U
 oCZU2lIqrXQa0qrGZ+YLSHPrcm2Z2rYnk/ywBg3b3plvbrgMGSLBrusXrGc2uxS+eMaRJoLmV6F
 RdV1OBFZmod39blog+SAK+N6FD1EE89Lt4+3/kTfurhWqSIeXyuMCmzxLWoaxusZA/lpDYeAJdf
 Hb7rlBFZkNbdVgZrvMWj4OSdVKPmEAECkFVL98D/x9xlXoSwJXYiR
X-Received: by 2002:ac8:57c9:0:b0:4b5:da5f:d9b7 with SMTP id
 d75a77b69052e-4da4e09ba07mr14293531cf.78.1758745054139; 
 Wed, 24 Sep 2025 13:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8fbq+QXzg7RxLwLK5HpzuaTx1WyIg89KWF8NF6iS/V7e/38Tey51cL9lzdyOFvS6uwyzg7Q==
X-Received: by 2002:ac8:57c9:0:b0:4b5:da5f:d9b7 with SMTP id
 d75a77b69052e-4da4e09ba07mr14293071cf.78.1758745053560; 
 Wed, 24 Sep 2025 13:17:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57ef9b9bdf7sm2651004e87.146.2025.09.24.13.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 13:17:32 -0700 (PDT)
Date: Wed, 24 Sep 2025 23:17:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <zopgbudg67lygconkv3bl43xogzl6rncif7wdpclbyc4wblan2@n7v75dbnaqqd>
References: <20250924085804.34183-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924085804.34183-1-liujianfeng1994@gmail.com>
X-Proofpoint-ORIG-GUID: EM-ZTFOu_6t2jtG8jxV9Y6vvd2DZKNPT
X-Proofpoint-GUID: EM-ZTFOu_6t2jtG8jxV9Y6vvd2DZKNPT
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d451df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=bYjh5Db1ZrtGeT73nCYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX2gwDCQKSBXGH
 aO15SLc5UMz/Yp7/Bq0bIoOYyRJ+9CM7tOwoUsd0uPt5ZUbe/EpcbgPrGF52vbp81gkcv0QOLfx
 Jho0bHvqpIZCCHUjZ00BYxUf5qjdAHMoDGl8SjBOZYlo2e8sBduijDR/DIDTqSKzWNmzMe1SsdT
 emvZSjI7EJ4s68trYRdUQOcVJD5wJ39QuKQS0bRvj8fb2tLAz2ykgF2A0ReaYae9xA6opauwDrl
 hCzD589qSPzmnkifafYhhap3/tfBfffWPsEhHgsdElAFrDLWTOhKAiJif8jul5jZv+K4QhucD7y
 f1T8XNF5urSyUH2OYS42fwqrPZ9Xm2cK8WuuwaPDVp7EG5bRHOttRiRnKw+mljJ3mYWYAiGTSCg
 dPSlJSMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

On Wed, Sep 24, 2025 at 04:57:43PM +0800, Jianfeng Liu wrote:
> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> use msm_dp_audio_prepare instead. While userspace is still calling
> hw_params to do audio initialization, and we get the following errors:
> 
> [ 784.904566] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> [ 784.912185] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> [ 784.918927] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> [ 784.929947] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> 
> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> and runs hw_params. This commit will add hw_params callback function
> same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
> work with userspace alsa.

I think something is wrong here. The prepare callback also should be
called. Is it that the prepare callback is called too late?

> 
> Tested with Radxa Dragon Q6A.
> 
> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c1446..6ca1c7ad0632 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>  
>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>  	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.hw_params = drm_connector_hdmi_audio_prepare,
>  	.prepare = drm_connector_hdmi_audio_prepare,
>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
