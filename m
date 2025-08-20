Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F476B2DAD6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6110E6F2;
	Wed, 20 Aug 2025 11:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pkTjb6l/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF210E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:24:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAB5Ci024931
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EuD+Bc6KdiQI4X6+HM5Q47sW
 /v3v69hO/DD7lycWQNc=; b=pkTjb6l/5sHY7Nta+gekct4ANscCgigVpoFzyGwV
 u3kPDnBbdIq0RT9odv2wBpXPPRUVzxAMOSsBFcqFqBr3OVi/JmwA/5ncHJGcWsgw
 d13ZJ3Wbpl7ApBJbNhfe0/EK+TgcS/7WzIUAUEvMTdCcfAPLVk0+NmQMtqx3Oy5T
 0hRGw1uvPRIApF0F1z/uwKJtyRAwCdb8Plr/ZN1K3RZElolv5TGU1Bc1SB+kVEgz
 cUcpEz3A1jOCkH1oMZFdJFoDa8hqMrYu2gB9RJDIx0r6q3hjiATsoduRUZIBd3uc
 ixHKOOg/ulWMVBMsuY88qHjlYnYVOUzHHwwd4Vnk3nqryQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291h8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:24:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso6294776d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689043; x=1756293843;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuD+Bc6KdiQI4X6+HM5Q47sW/v3v69hO/DD7lycWQNc=;
 b=JgQXH7cZOdbWK0Mo4LWRKyPMX6aNVfObQNHAxyU3iHE+/eUWOvLdYaXVwZSESUbw5f
 LaisIeles9wRVMXbIYp43RLZP5CMkyCyP0q2ojkBEWe2mbJIKpx9hNhafDe/sOzdlHFk
 03rcTVsMQkEGQLbCxNluWWsMpbKUOnYMG6aGcTrtWR1Bk27TCXWaj8SIR/g8p7O4C0Wv
 HhA5RKaqfvN9oKymJ4jTW+1Iy1M4Ua7oseLIWcL/nh6Xj8hsR+sQUKnRATlYOGNK0ZN5
 052o+gf6l+lbSmlSduQ6HZ/e2zsSC/V7GLoXkL0ncbmynQA4UUmWIB7IJhS9wYb6U2cS
 AwOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA3I+Sgh9VzAUAxjYxNsq74Da7P7O4jaYuNDeFBcKssiCqtlwOglXgjZLUf0ym9mnw63ZIhAC8C3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF+p1lmEJ7yvWZewLCXTXoACJ3HaHwmBdYh8SNOADKkfOdz18n
 saZuUq/JGmiHEE0rpOMIbUJGi5LutE7RjPYqOT9KkTMN0NAx2ZyeB7H8LLLE2QJGGRNqg1/RNqQ
 a/QckGrQi5LFep5qUslwpkNOED7z39uiFEFhBCxz8POAld1BA1GPXEkVCzAtIWd2R1CtHxJk=
X-Gm-Gg: ASbGncvedZnTmG0HokiUhg5IAFWU+3EeYWGu8CrRX91JcrhnBWP8zBBGDASamdgNoiI
 ldMoSdLbikDUCrB90cnqpN8lEjbJ362K8T+7E+f61p4q+AOPQkGywxB8A/sFjRWXyBW2HJW5yzo
 umvqrG+ijz9izHiCE/6U5liuUDpmdSE3hLUqSVXW4DDFdbfjScX0yANsFaTvG3pD5RcfMtehgRL
 WdogDSEeqVS5uwkwohcKUKtZMXZQ+9fd56UVfamnB2JqKIy8a17IvWtQZHYvLnk/9jZ89BsdVCK
 n+oFYV/9tiwLBCdpYnjPEmvSREVm5L14wSwtIP/Aap2ghG4fjA+5BBEIqqZNDHDipjisdlJTl3G
 5FqD4Bvc55xdbA5rNablAc8pOEU1Cvw1mjNoV3Sd4PciLJcOZH6u3
X-Received: by 2002:ad4:5e85:0:b0:707:5c72:c5bc with SMTP id
 6a1803df08f44-70d770c81dbmr22798186d6.35.1755689043198; 
 Wed, 20 Aug 2025 04:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSZE8hAQdMQJuBZplbqJNg6TajC1+Oy2DlFMUSP4YrC9/AQfNI69mKEaoGj7BYpityTg8m9Q==
X-Received: by 2002:ad4:5e85:0:b0:707:5c72:c5bc with SMTP id
 6a1803df08f44-70d770c81dbmr22797566d6.35.1755689042574; 
 Wed, 20 Aug 2025 04:24:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e033fc2e8sm623386e87.59.2025.08.20.04.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:24:01 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:24:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 10/14] phy: qcom: qmp-usbc: Add TCSR parsing and
 USB/DP mode mutex handling
Message-ID: <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a5b054 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=zOceuAXpaMaZHB4uI4oA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zyJlgmcG4jBQR0QN_WS0kIc0ZH8EfZOV
X-Proofpoint-GUID: zyJlgmcG4jBQR0QN_WS0kIc0ZH8EfZOV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6LRt+IXtlWUc
 Y6axAjjJHHsCd1ouAgoBZKoreybR3WL7yT5QK5n7Jh2q+UY3cF/7U3Ep3xzFafRLc090SvmBx7W
 MgCl8t/MtyIxkJpys7aa4lbEKksNLi/vcNFGSEii89SAyG01glPoiWD+cI4oo9DPRFCmsX9p4hI
 S6X1qBs4kuoQt7j3EbTQmGuKfHd+pMXX7ynWF04uTIV0qlATWlDvJWOUGCLGhro7+u8nmL0g3Bc
 xyM7NIh8rlwHaKcoI3x3CtAr3IMpYrBzPN+euL4PfOKNvNfzFgUFEukZ2HS2dUEIpEfIwTGsDdS
 MgEt62VQp3uJh2uC1Qq3Hl6BNGTbRejcp476I6DuJHup3/Hj+gZXHmM96N9M3iwLKDAdLqsqaOg
 /tWCEjq6wIdejtzm1VomCSSECWbIbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:52PM +0800, Xiangxu Yin wrote:
> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
> Introduce mutual exclusion between USB and DP PHY modes to prevent
> simultaneous activation. Also update com_init/com_exit to reflect DP
> mode initialization and cleanup.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 60 +++++++++++++++++++++++++-------
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index a1495a2029cf038bb65c36e42d0a4f633e544558..821398653bef23e1915d9d3a3a2950b0bfbefb9a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -674,7 +674,7 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>  	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>  };
>  
> -static int qmp_usbc_com_init(struct phy *phy)
> +static int qmp_usbc_com_init(struct phy *phy, bool is_dp)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -704,15 +704,20 @@ static int qmp_usbc_com_init(struct phy *phy)
>  	if (ret)
>  		goto err_assert_reset;
>  
> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> +	if (!is_dp) {
> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);

Why? Don't we need to program those bits for DP PHY too?

If not, move them to USB init call.

>  
>  #define SW_PORTSELECT_VAL			BIT(0)
>  #define SW_PORTSELECT_MUX			BIT(1)
> -	/* Use software based port select and switch on typec orientation */
> -	val = SW_PORTSELECT_MUX;
> -	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
> -		val |= SW_PORTSELECT_VAL;
> -	writel(val, qmp->pcs_misc);
> +		/* Use software based port select and switch on typec orientation */
> +		val = SW_PORTSELECT_MUX;
> +		if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
> +			val |= SW_PORTSELECT_VAL;
> +		writel(val, qmp->pcs_misc);
> +	}
> +
> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);

Write this reg directly from USB / DP init.

>  
>  	return 0;
>  
> @@ -733,6 +738,9 @@ static int qmp_usbc_com_exit(struct phy *phy)
>  
>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>  
> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);

Why?

> +
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  
>  	return 0;
> @@ -1045,6 +1053,17 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> +{
> +	if ((is_dp && qmp->usb_init_count) ||
> +	    (!is_dp && qmp->dp_init_count)) {
> +		dev_err(qmp->dev, "%s PHY busy\n", is_dp ? "USB" : "DP");

"PHY is configured for %s, can not enable %s\n"

> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_enable(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> @@ -1052,7 +1071,11 @@ static int qmp_usbc_usb_enable(struct phy *phy)
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> -	ret = qmp_usbc_com_init(phy);
> +	ret = qmp_check_mutex_phy(qmp, false);
> +	if (ret)
> +		goto out_unlock;
> +
> +	ret = qmp_usbc_com_init(phy, false);
>  	if (ret)
>  		goto out_unlock;
>  
> @@ -1103,7 +1126,11 @@ static int qmp_usbc_dp_enable(struct phy *phy)
>  
>  	mutex_lock(&qmp->phy_mutex);
>  
> -	ret = qmp_usbc_com_init(phy);
> +	ret = qmp_check_mutex_phy(qmp, true);
> +	if (ret)
> +		goto dp_init_unlock;
> +
> +	ret = qmp_usbc_com_init(phy, true);
>  	if (ret)
>  		goto dp_init_unlock;
>  
> @@ -1467,7 +1494,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>  		qmp_usbc_usb_power_off(qmp->usb_phy);
>  		qmp_usbc_com_exit(qmp->usb_phy);
>  
> -		qmp_usbc_com_init(qmp->usb_phy);
> +		qmp_usbc_com_init(qmp->usb_phy, false);
>  		qmp_usbc_usb_power_on(qmp->usb_phy);
>  	}
>  
> @@ -1602,13 +1629,13 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> -static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
> +static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  {
>  	struct of_phandle_args tcsr_args;
>  	struct device *dev = qmp->dev;
>  	int ret;
>  
> -	/*  for backwards compatibility ignore if there is no property */
> +	/*  for backwards compatibility ignore if there is 1 or no property */
>  	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
>  					       &tcsr_args);
>  	if (ret == -ENOENT)
> @@ -1623,6 +1650,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>  
>  	qmp->vls_clamp_reg = tcsr_args.args[0];
>  
> +	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
> +					       &tcsr_args);
> +	if (ret == -ENOENT)
> +		return 0;
> +
> +	qmp->dp_phy_mode_reg = tcsr_args.args[0];
> +
>  	return 0;
>  }
>  
> @@ -1665,7 +1699,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_usbc_parse_vls_clamp(qmp);
> +	ret = qmp_usbc_parse_tcsr(qmp);
>  	if (ret)
>  		return ret;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
