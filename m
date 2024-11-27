Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD199DA8B2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A686310EACF;
	Wed, 27 Nov 2024 13:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p4dpAM1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108610EAD0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 13:41:22 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so6140936e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 05:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732714880; x=1733319680; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+V0B8FgWwCZYmESnMjYEXbPLdTp7ON4XeU+NCnDG0sM=;
 b=p4dpAM1HIPudnB4sMJDbMRgPbLLxTj6Vskah3MEGILU2EQs1ZVlsY9UESuxLjQ8FFX
 iu1m4mSPMIKzu0SmRy2GNOonkHY8VESMFFo/5JeMlApWeqwKejoWLYJ8ch7ATy50GMz6
 6Pt8RJmvK/e9c81BClMW5jlU6vQDi9TMAbHddjZJntBfzXx9br77OiVJnggI9MkAeEVJ
 pKGOQpJpxxwJi8uclmv1Zk0tqz/l+41o7AyXu/jQuSVBjLIFJYP/S2KG8UoVu2bxmHnZ
 iaNkbCoYGp6RlbVOLDQIlgyqccSHpHsMcuijAkD2Afq77j+APJph4nSC57/8TqddN3Yt
 6gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732714880; x=1733319680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+V0B8FgWwCZYmESnMjYEXbPLdTp7ON4XeU+NCnDG0sM=;
 b=LdekLUKBZTLSEwn7dwJnZrrSdRzFdnidFygbqDs13EPTLmto8FW2ymJnT4XAZni0Xh
 BdDPLNhpkDiC6JtpOm17q49fMW9OBjl41jHkuJMsa5iOMzZzn/UFkcWGhbIFOIu7Dk9B
 9Ktxqy2BjLrhe+pjMlRyTk5oceJdzqi+8RoEcx+AOhoGYiBbcoqBGlNBARsdi6IqNR/h
 2MWLwv2dHnr/STU8bdxnYDh6QVNj6dCcM9wOc9mqNPK8eGn8laGs4Q5fSAYiCY1Yyo5K
 w0pqKjLb0nEsrQPAWJrzRzaLD52z1uSEiBYi+cjGUcvOh7soLeHKnjXI+GYEzXsEF/dZ
 OmRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/J8xhENCUpN+XZzkdCbs76czic3D/MQtZTUkGUCpw4s5weynu5oU7MqMdDnP4o9n2Ks0LgQ+IrYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs+2FWgQxnUl5YGoClJSdJw71iOagc7irJPr8zTmAf69T5aVWf
 JfTXFidReqELcY6WeqfwVYrM+TsNNUpU70QbXb9UXufDPIx/KN78qQ/HZcwaLc4=
X-Gm-Gg: ASbGncudFB+GVrEJPV90st+u+PuOnVlczs4OVCScyLfrAvXXKTLqkZLIAb8zXDPEtEc
 bz6Ai8bvEHcj7BbU4OLCh9ZwP2LtiCVSt/BJXuraXiB426jS+RmxWMRCnTDMtp3hzoFomY5LPYZ
 Mj+qQ0HtSTVarK5Ua24loBXCqf/CGLPXjM53Qi8OaS8tMw31JjkCgAPXOZ3UyLaJQi1eHk9Sb8o
 pMn5wedjRDTjhNo5yaoO95GZA/6pnsU3AYOh0tI3HehXcBVCwKXAuRRmFoJfbjvlNHrPCub6+gM
 bIddr7L3/6K8Sx55YsYKf5A9qkOG/g==
X-Google-Smtp-Source: AGHT+IG9BNVyGMPhRMDkSB666seeuc69CW+Jv5lBWbNwNRZPtIr56nhPI2eE0zoLaGS7x7+3k7cyFg==
X-Received: by 2002:a05:6512:3a8f:b0:53d:a4f3:29ed with SMTP id
 2adb3069b0e04-53df00dd707mr910972e87.27.1732714879617; 
 Wed, 27 Nov 2024 05:41:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd336a530sm2263130e87.142.2024.11.27.05.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:41:19 -0800 (PST)
Date: Wed, 27 Nov 2024 15:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: Re: [PATCH 2/4] phy: qcom: edp: Add support for eDP PHY on QCS8300
Message-ID: <new6hjxnwyuohetdprxwee3epf23uemwft2p7faym5f5zqv3og@fksrew4blk7p>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-qcs8300_dp-v1-2-0d30065c8c58@quicinc.com>
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

On Wed, Nov 27, 2024 at 04:15:49PM +0800, Yongxing Mou wrote:
> Add support for eDP PHY v5 found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index f1b51018683d51df064f60440864c6031638670c..90e0a399c25299ad1b2fb5df8512ba3888661046 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -532,6 +532,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>  	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
>  };
>  
> +static const struct qcom_edp_phy_cfg qcs8300_dp_phy_cfg = {
> +	.is_edp = false,
> +	.aux_cfg = edp_phy_aux_cfg_v5,
> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.ver_ops = &qcom_edp_phy_ops_v4,
> +};
> +
>  static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>  	.is_edp = false,
>  	.aux_cfg = edp_phy_aux_cfg_v5,
> @@ -1133,6 +1140,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
> +	{ .compatible = "qcom,qcs8300-edp-phy", .data = &qcs8300_dp_phy_cfg, },

If the setup is the same as SA8775p and you don't expect any
QCS8300-specific tunings, please reuse sa8775p as a fallback compat.

>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>  	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
>  	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
