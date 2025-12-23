Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E05CDA82D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 21:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273610E1CE;
	Tue, 23 Dec 2025 20:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTLYo+gh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Exa5U6uC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CECC10E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:31:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNBRwwS702677
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4yTVMLxBUXz2CKuwVwliNlCR
 EofHqymY8nVV9CVfBco=; b=NTLYo+ghkVY3NoHrMcq+VeAlcZ77iHAfH8Le/LeC
 Tflsjyif2npVjh/H33xLZkqVr504NG6E5+xqv1sn0951bMLjnADSp/eFm4F0J9sp
 C+euByLRthWqa47IjYbbAOeP/R1AuAvQ7gW3zb4NRK2Ml0zYWXofO+Bhg/hBD+qn
 MRFwTDRuBaG9CBMYazT7eTulPYlEaXHIfYJxxJpWpYs2Opb/GYUWylSjj06SC3Lv
 I73MuvKxytl9I3g3HxWn4TO07XaChpInDpFbh5XF7h09V3JivpChGcQB8l5QqGhb
 wv6AvOFQauimwNcG2LzjAqc/Ye2pLKHa9AcfAC94LmGrHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jsmwg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 20:31:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0995fa85so149506941cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 12:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766521860; x=1767126660;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4yTVMLxBUXz2CKuwVwliNlCREofHqymY8nVV9CVfBco=;
 b=Exa5U6uCXG/XdZdj3dxXxvlweXIPCKq+nn8tnZsCjcgv/qoCUe4f5XWUKf/yadZfzc
 mRVPPT87JAiKXT9holOW+whtYSeHqwR5cOXVPh0xbdtWobvFUH6GWDIN2behh8mW7o5v
 nc1lwvw03waPKCv8Lf9F7pU/TJTJmivA7ypC/hufPQ8Kra7utj05iDUx4MvRXCyF8Pla
 Yy3OfPwZgRMqLSaviml3tumNOWeoKFrkadym/fc/Ae5QLYQvkWharzzM+hvFJ7YmbRQf
 7/aC7/z9ctUGb/SIlqgi8VGXeHcojPwlpvrYPVzR/gDqARHVTh8wB5N12llenRc9DWJL
 SK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766521860; x=1767126660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yTVMLxBUXz2CKuwVwliNlCREofHqymY8nVV9CVfBco=;
 b=rA28nDvW22dC/31JQ0urGgOUtCn6d1klNk7mK7gHTu6H2fDI4znNRBMS4v7beE0Jij
 IPu6dYBCIXiIGIY5Ps6gAlU6hJdDNI9dZY7pQV2XYFUXuxgD8a8/3nd0oRZx+BKUuUzE
 9skgGAsNu81ENiAIJnM9CeqFxY8BwxWlYT4Xog/XZ/xOdD613K2+7Frtdb5SavYJed+J
 YbzKhJ/h8kTyWYyTmhvCBReHHVDlLYWw+OG+WmoovNWbRXghR3nonSGcGcdkRU0YtPR8
 8Uxc128DCx+AqXNH4XHQY6Ie7ZklU5JPLl6AVWQ8WFFC065/sEkFM7x8GGxYXrNDcETl
 X6rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8iEFIR+kIuFwg/VPw8N0rnkBu0l0bXXnq23vi7geXYNXOLGxWmvBF92Y1syY0xGaaJlxMRo9NUzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvjMNTkuWmSg8bcrSfeVH89AZQAXEAee508TYV5MpIinpwwrUH
 vTfpzhooy6VGYyu1P2De3wiHglZ7r7Pgp/bvtnMuWFGc9cNgNa9UFeq8FS1EpszSsolHubgWWVT
 Ts9c2Y9Occ6EZwLGBbwGmJsoxMpmZW1/SoN9GmRM+waWPOqQvNR7qNRRvmvrNKfmNxZa5zec=
X-Gm-Gg: AY/fxX6tlXwd/BUX0fDaYlXbtShMi5i3TribttssfYtQA0KygudfMpAAReM/LxFVuSS
 Xem6FCVXHssTZLKxQuAy4FiH4XtFLJ6wxIC4kOpHBcti4EHWG0LaXvIq/ZzMB2X3hwAOJS+NtQP
 L6p6D0K+0HcTU8sosCEKfEkVtwGIT9Qpd4xmA0gnuSgFNkiLdW1EKutsYwUmNN7vLboSF6vFt/k
 2Mo9aCSpH1liDn0HRfqaywAvRntRJE4kQKvngjuN0tzKxpU6b5lmoob+BVHLOAGX8IAeM3jz7I0
 RWNiXpSb0U+htUjp1wcd9q6a9YmNb2MY3CrVpalpearrkO1oMXjRH+5gBTNdeFXCrMFecK/UaD8
 D9hMaO9shriF+Opw8sueZTXaCwFBnbYfgpPutg0cU67TTsmIxFJSSrlDfr+j0M1u9Y/lSBs0MAV
 6qQ+QAHE8lM/OHGh5HTP1ZkaE=
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id
 d75a77b69052e-4f4abd6fd05mr238717451cf.43.1766521859689; 
 Tue, 23 Dec 2025 12:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkymYoqedGNX8RtCYK8eQPHwf5IoC9fyqOpxWcuOypEFxU4OUDP0i1kmyNmN0ZGRkzYM4p+w==
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id
 d75a77b69052e-4f4abd6fd05mr238716991cf.43.1766521859184; 
 Tue, 23 Dec 2025 12:30:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm4377066e87.69.2025.12.23.12.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 12:30:58 -0800 (PST)
Date: Tue, 23 Dec 2025 22:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 10/11] drm/msm/dpu: Add Kaanapali SSPP sub-block support
Message-ID: <fto47ksvr6i4fxl52yqcdgatut7oqepgc7d2slrn4gr7yi2xei@s3bnte4sdk5f>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MiBTYWx0ZWRfX7xYzb6OpuveS
 SDOqvZrCIFJoopBkhsKqeyXyC4CxPCYzRWyfwkSbTkO4/zw/IzDG42rkj++gW13hFcP+3B7I/IV
 0vUwD9of+rkti1TIWZKYnt7GsLvbhP4pE5sclsCLoaKv1fpzv2GuTj61wdKKpMXDkJKQqWM0ijD
 XQirwBhSfBt3uwiI4YgFIrRBafzTcOpgYAWrHDSVEbYIj0OD8BI7Y5Ng7CBLB6mvr6abII54Aap
 pMjPf/7VN5bDYDXPr8g7h9WScZfFvl++YJVo1kaL7XC5cWvSgmwPcPTyV3hY66yzKXB0/zEWPV8
 ls3p49UoBipLqf64hinE/A2BW4GFOsIoeRYBw6ID2xSaBe3FumrhRKSqSj9OYubSzvs/61dVdQS
 Z3kJB9WmBF6FHN37cUJjXkkd2QP//8hq0UJTBrfNUfMrMdoEERRlxElPJhf0CHZc5qP0hdVsGwN
 wt+gwgfA0yi4iR1ojVw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694afc04 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=T7gXAn62BuYQ5x_KxX0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: AZCJTdosyZMBLrqUCnzMf5lLMeqWyqWT
X-Proofpoint-ORIG-GUID: AZCJTdosyZMBLrqUCnzMf5lLMeqWyqWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230172
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

On Mon, Dec 22, 2025 at 06:23:59PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Kaanapali platform SSPP sub-blocks, which
> introduce structural changes including register additions,
> removals, and relocations. Add the new common and rectangle
> blocks, and update register definitions and handling to
> ensure compatibility with DPU v13.0.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  13 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
>  7 files changed, 371 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 

> @@ -291,9 +292,10 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
>  		if (MSM_FORMAT_IS_UBWC(fmt))
>  			opmode |= MDSS_MDP_OP_BWC_EN;
>  		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
> -		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> -			DPU_FETCH_CONFIG_RESET_VALUE |
> -			ctx->ubwc->highest_bank_bit << 18);
> +		if (core_major_ver < 13)
> +			DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> +				DPU_FETCH_CONFIG_RESET_VALUE |
> +				ctx->ubwc->highest_bank_bit << 18);

I'd prefer if this is pulled into dpu_hw_sspp_setup_format().

>  		switch (ctx->ubwc->ubwc_enc_version) {
>  		case UBWC_1_0:
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 478a091aeccf..006dcc4a0dcc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c

This commit was about SSPPs. Why are you touching WB?

> @@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>  			      cfg);
>  }
>  
> +static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
> +					struct dpu_hw_qos_cfg *cfg)
> +{
> +	if (!ctx || !cfg)
> +		return;
> +
> +	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
> +}
> +
>  static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>  				const struct msm_format *fmt,
>  				bool enable)
> @@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>  	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
>  		ops->setup_roi = dpu_hw_wb_roi;
>  
> -	if (test_bit(DPU_WB_QOS, &features))
> -		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	if (test_bit(DPU_WB_QOS, &features)) {
> +		if (mdss_rev->core_major_ver >= 13)
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
> +		else
> +			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
> +	}
>  
>  	if (test_bit(DPU_WB_CDP, &features))
>  		ops->setup_cdp = dpu_hw_wb_setup_cdp;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
