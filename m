Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4773C00FB6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A509410E3EA;
	Thu, 23 Oct 2025 12:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERRuSMqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0BB10E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:07:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CFAT024844
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=goeKdp/WYHhJWHlaAy8C59qV
 Sxphru8lrJomaYpY0h0=; b=ERRuSMqzetasBthM5RxIR9p9b2FPm8/Zi9gQWLY0
 SWJKLQH3qGe3Mq76R8uVPpVyCGW6AW4M+wZYJS71aQ53AZ+Nf/5DX9OLRbl5YVyW
 6qwP1S9MqpLVA0Twp8C7onzazAZ7yLPI4VIwdcN37Ve+vNEmQZhurqmqh7mpB45T
 2lSiqaiSCf7Uxy5HbdFZ4D2n9ujUKPqm0fjLd4M1R6tiEWB9MrI5FMxCphd0eb4+
 8Iq0Ow4f6r4c9YyLla5aA5Qj2ChVclZVYiHAdvpK8Ybxhcvi6xc4XhKNcT2x4pt3
 jF8MdXeQ5d+4ji3YvPL4ROa5SEEAWvGxM48KJyDiXqbwFg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w88adn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:07:25 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7c2814222e1so3629328a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221244; x=1761826044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goeKdp/WYHhJWHlaAy8C59qVSxphru8lrJomaYpY0h0=;
 b=AlDm56Au9NzMCmATikLX4PqNCRgdiOjYtmUcg735WOVbrNqwQcEq4PGQskvlImt0tl
 8UP3dy5xPNa9JamTTrrtz5wYRDd3UIBFa9hgpjVCT0EPOAvcphLZq/148zqyuam45qu1
 73+XVDE27QWe+J8PIdotkSge8UogfcEJs+OvdEuRnrqPmKuRNd2li6mxp8xb+11OCWyX
 bncAjkFCyN3v5oh0aq/KWfI+XKt8ApZQXAlez73oAw16s67TuJnzShcg9DQhp9EsjbRS
 kAt/nNA9zQ2ONzC0h65NYq4dUaK6p9a1TzZMIOaBtyYc4KiKD8TEVqx6mY8YUrkM9H4S
 T6bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTazTruGHkHWlmT0HyZO83mdwIPKvC9b6CghLWFpqQhdZE0wOzgUEhXoil9FwUlY0Rb9epiqBfHIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+rTcVAPUqlamGwfChgT3144F7GuS7gthq+h7ygGaipCj304T5
 wE45tXMMXc3gA6Yu+lb23eMEq0LZDwcEQd1RXbmXe7iWBe7pTFYUng75Xe4YBnoBMtGSmsfeIGq
 TuGxLfHbgOzs7D6tGde5DMNRAHwWXkjDCLt7CeGfeT+ElMmRFSaG0nxDgIGptJmuG1KdOOgM=
X-Gm-Gg: ASbGncu3x8JDqurmTiZmOzCpZSP60DY2uBG/hsGVUitPvSvHnTlEat3/f4dLRVJuLtN
 OXRTqE2CBA7FVPy9pACwLJE8jfWkudbdPVhQwMrEHZx8KQ5hCQF+zuZU9/sictTs1FZZw5q35v0
 PXaSfLfreZCp7gds7Yvo7LzhIhlQjT19rCZIS1Uly1gdf7bpLkovGwGQqsAJrnpmOTm92gYEiwe
 vAahaLvtmznSF2ZdY4dNx0sLq2zpC+Qu/hrNr1122JICiOYnZu25+AttTWQX9hLOjvEKiCnlpts
 8iKUUrzAW4BfLDrGPvrj9gI9oMxZ0hRTUJLvJW5kk7SB6GmvMTIxFrB4eL3ZtybwFS8GwURWiP/
 e2mpSqk42uKqRqcQVUNLtrw6dJhcdQPiVp5lL7gkQ2GxH8rr5uRDI7Epn0jJYbviCxS+B+GPQ9K
 T0Zk1cyHp4FeBS
X-Received: by 2002:a05:6122:c457:10b0:54a:8deb:21a7 with SMTP id
 71dfb90a1353d-556a1fe00b0mr1375555e0c.4.1761220877840; 
 Thu, 23 Oct 2025 05:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYxrTX1ih+hGngZciP+iHFYfeFoyaVhepsbpmQ8PJc+gldudoSg8FgGhwuto7pKkQZUsY/ew==
X-Received: by 2002:a05:6122:c457:10b0:54a:8deb:21a7 with SMTP id
 71dfb90a1353d-556a1fe00b0mr1375509e0c.4.1761220877262; 
 Thu, 23 Oct 2025 05:01:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d66bbd08sm4052251fa.4.2025.10.23.05.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:01:16 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 04/12] drm/msm/mdss: Add support for Kaanapali
Message-ID: <7yrjpxx2uqb7ox6yk55hsdj2cgexvcoqjjutmhnjokciy7pnl4@a3zdvmn7wmto>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX/5zoWh1FzR3e
 WMVt15ilEuf7nQ6rgHM+pRL5X3MRFJY/GHAti+aSTGsXXPMfw70J8UyzsMDX9dC60QUXJ7LeGch
 4WWk0kczHI6ysTYNAmdO2O+EjP6IvZGrYBiCTyXy/32LzIGBU2jzNq+HnW/VLiv+mN6+V1zUapD
 gX0DPB7zN151LSjpSPNEYRFTJ+qt1VCPaxhEHRwwT217hTnXibBaK5sHjB4jmgKI/CksnN8CPvJ
 yRJOOdDDXFplqUSMyxxR8ThXQ+mIHMYGtJTe7igmX2XD62NkGXVbbKvA4DgJXxgSE6U6N5lOBhA
 ILC8RQ5tzIbOxewsh9GujlDQma3F8STC43QvZSK2C3qPKIhheYE53OwpwP00JIROCmde23wVGkS
 w1mJiFZLTvR/8NOJVBYcmgVdDKDZUg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fa1a7d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FJEgi42wPuteDVaKdBsA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: NaClVBDFkv5HEN2cLjAR6q0robMDskLd
X-Proofpoint-ORIG-GUID: NaClVBDFkv5HEN2cLjAR6q0robMDskLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Thu, Oct 23, 2025 at 03:53:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 23 insertions(+)

Where can I find the UBWC config for Kaanapali?

> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 2d0e3e784c04..665751d2b999 100644
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
>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
>  	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index 1ed8b1b16bc9..0a4edfe3d96d 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
>  #define UBWC_4_0 0x40000000
>  #define UBWC_4_3 0x40030000
>  #define UBWC_5_0 0x50000000
> +#define UBWC_6_0 0x60000000

This should be tied with the ubwc config changes as this chunk goes into
a different subsystem.

>  
>  #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
>  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
