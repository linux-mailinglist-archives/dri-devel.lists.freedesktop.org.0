Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A41C85859
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C4D10E41C;
	Tue, 25 Nov 2025 14:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSN1UBh3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j87xzNWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7C10E422
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APE0X1G3706626
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0OtSc4Iv//RzAZHCwgmMh85n
 iL32lnUpnwK33iA2iag=; b=WSN1UBh3oO4OzK6Tk0pSjA/1hOqvHqA+hgShwSyY
 4lexRVBlWAb9QBTO49fkLvldQx1SGHMy6wxOVQS5UgCvW/CHvqey4Yvgzwm+78wK
 HNSx9R5lHaGDmDkicvwhBAHfMooi/jvzINeKlgjoV0ci42xssMQzO1FuDq+ACL+j
 0ODcZ1LtuhOdkSSYneaUm1KWvKUrkrqik/t9TJ5O55NFhJRzMr3SVGhHT7EQHuQK
 tZzxmcTAn+vS+gr8mLJ3WIUPuT5ohHVekm5ONva7jeI14Q3uKKPm8CZO/rGxq7c0
 +y9Rsfh6H+f0liX3mynCkWBF8X8wCNq6KNMXtU3zqn8Aug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufr4cw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2e235d4d2so2062741285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082034; x=1764686834;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
 b=j87xzNWk4+Ma4i1+04YtHPLOJt4aY6fizIdiwisUq12qlZRNpY6Wk6ASEh0m/6BJlk
 f9+xBNiYA7vCzX00zI980PCGlbNj2TV+zg/F2cHGFplfKNgazHKLk6Pe7ElyznuILyBy
 QtlxBWo/fLIdhj1BN/RWI/E8loPJlLC1yzsNNl1G8yw9DBa9WxQjfCWuQaRjWo1dFXiX
 klJC/oQN5+AF2GgUpWxjvnh9L6dA4Ba9chGc9zzAO9KzQsdYdmew56FdtABvpbbZAE7q
 IGZkKxmsXjfQZuPp5ET+rENv2i5pmb3IJ1fMW/LM9ffU/aQeaOjorAB1Q04o/QMUw3tu
 T9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082034; x=1764686834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
 b=rTyRBTjNj+/aMw+pJ8uQITB9hmYMHhjtbaD31TpmuofKXsgWTj/XjYEaer8zGcBGVz
 4ybpZTMcsvilwLa1/OoWWP/7QUrPIMO8RKdZds9SBpRzWbQszlP6AD1Cb7XvmaDCYLlH
 uLmQ2Q1NTdKB1S81KW+AOGVs5ccg44RByjQY2mxVtyOxb0tZTTFZX9WvqrCC1nCEy+ci
 Icbur3Q7Rxfd+Jc2DAGvEsT8Qi3gQ6/tnoNHN5+k99IjpJ1pwX8WyhH6vlhWjhSJ2Q4q
 8ocwkys+lpBBNEDw3gM79GrgP0Nv+OrIVdZK1CwBdB38vos5eNxPqQ3u6nCUSwTnSX+l
 zrsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmpstRHGxkxqr9ESoGoBMYJX7+3AQg+dB6wqhjcCCq9+JKpKpy6rkMALJFYPJtSkp1jBKIRZQ90nE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDwc5xYqnYlWHAj7hZaFVYKUI49m1Ma657hmpK/iyCFJdgUGap
 EfMsBYaJpl6OoL5TheOnRRbYkBAmkbZqlacObezfR9ze+Os1g4BQURgJUosz8qBNC7Fb5TP36iG
 5DnGEd5+WeFHr0eDeO1ubBp9BU3HRATnQAuS7ua9OajNZ0hQrB1thvsdZ3hAGF03A6xjykic=
X-Gm-Gg: ASbGncvr3viTkALNuTFXaRXBHrQELydBLb9P0+8m++tiiRMqWXDC+atRWNCDM/u6lvu
 BNRIxJeP5We6aqJF9VxySm+AhrntohfHsVaapDnHiDpzy9/JT7qyw9o/EelTvJw40582U7Kk2uI
 GvwlTUFtyIz/rWmsHiyYjmr/j7wa3o+hJjs+r4R87P5idNzfsljJnD8OpaBeXC5GtmmrBlQ4Gfh
 oFx+ruXNAGY7Lb5SAu+4nHxqujjMU9GXPEU1B5iY3l1eTeIAnzwFnrTCP/WzbYaM+kTCsIzzC/h
 cNR01AQH6wcT3tEt7LsvouCjlvM7BRN3ztsPHTsnLpXoJjfgN/hWq3A/cqRLTnl/WBibXN5/m6/
 H90xDtRvhfNloX9VkIN8sXH4O6UPrFnW7jUtgthKJRvpgEZlgDgvf0fdKJuEt3/vjUc53j+QNus
 jQmbjrOI4aUb+6ZAZCSKhg0lk=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id
 af79cd13be357-8b33d4a72c3mr1768051585a.46.1764082034124; 
 Tue, 25 Nov 2025 06:47:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG7UOLRXXghJiqS+TfOorFOsx005dRphXTelmvvYi2z9s+6NL/AWnFV8TeVC1x1Pw/DIRsiw==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id
 af79cd13be357-8b33d4a72c3mr1768044685a.46.1764082033476; 
 Tue, 25 Nov 2025 06:47:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db88f71sm5301984e87.34.2025.11.25.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:47:11 -0800 (PST)
Date: Tue, 25 Nov 2025 16:47:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Message-ID: <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6925c173 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-U1_elcvvKRzM9PYnLcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX4nBkfVuxyKAn
 qHa1AxzGSdxRHv69hwk9VMaLMu3y0f9Rp7JjcnXxeKYfQG3CiTxHMCx8+d3eBTaYj4QHKjI2qob
 6es58kfqtvA3jD1YED2W8nNTI4Utl0ojIgwT9xRd548IXlJkcBPtWogRKQZGQU6RScTQLrq/KhP
 d9ySINo+DbancALgXOl95QXkjAmqRM7fkrau2RN3eltlAsa0YCcO06r3YIrem2HFBOX5VwV12eo
 CkznYjNc2Cl2yEtJ7og2HDQ5sZsHVuOXqaPPygeRTHTzBzPfe9kx8f4yyz0HRbNUs+KFHM+n8Tt
 uvXB7bSqEA9rm1FQdq4Aze+cVR+iKAQ1jkjUeh347k2VQlbM1HaxhqIputlvm16JYJ1WChCKhHX
 /9ou1IbW49fBsSejNPATFdDkUmRPaQ==
X-Proofpoint-ORIG-GUID: QTcjT9ZXXVc-rWc2MChpfLtRyjx05GLB
X-Proofpoint-GUID: QTcjT9ZXXVc-rWc2MChpfLtRyjx05GLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index bf9a33e925ac..797ef134e081 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> +{
> +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> +}

Can we please merge this with 4.0 and 5.0 functions?

> +
>  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  {
>  	int ret, i;
> @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },

After glymur, please.

>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
