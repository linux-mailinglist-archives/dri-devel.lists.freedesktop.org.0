Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A41B2BB42
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 09:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827410E547;
	Tue, 19 Aug 2025 07:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxHxocTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909410E545
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILf3fJ024196
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3vU6X6UmptKEeubZXKONa3UV
 WPBKyO0rvUIh820/nkI=; b=AxHxocTuLdMKi6qPApw02H8p2uKc9/gCfFXp6JIk
 Wxrg9EWZNdMQHKdQ/GGv2JYKe7qTS8dWUR+Rtq93OIlUSzsxpfRzW3p3XtVepfcX
 JpVfAr7f4hw1dJaVE0fuIuL6Na32UrtXQ1xJPFyzQomZHGJ2ialZ88e659HAadkN
 LPlO8t4dh/z0HIlDM/3GgStv0OZoihhuG0ZlG/jvLX0V4dDByjjU2F15jWqb5D7h
 P/JPGcAxltYQo8Y1D+X47NJx3vaEa7Ij643UlrkqccUo0l/EoJ/d1n//w26XENCm
 PF0mlMyRL+L94jXit2BEne4DdAtI+3tEKqM9ks2bk3fpAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5hd1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:59:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88dd0193so114823106d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 00:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755590375; x=1756195175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vU6X6UmptKEeubZXKONa3UVWPBKyO0rvUIh820/nkI=;
 b=joxj3WcvEziJWU+zwsqLQC9L9axZgdsRgeNaNEVHaastdXslLUGMDib/GTyAdXPSVT
 NMLDokG3aBnnTecbG3ARBOBYFld0QptnQ6j2L0c+2cyZIV8sL2d6DLDl0tv4BEjT/IBy
 lk2uAsuAUtE2ryuPHMDQ3htCk+L9irSFtJeZFsbJbhfP1IYpFfpUCffksuNEZenmR4B+
 P6FReAmEkUdTEHfxqw8ScRWstDTqUtoRi1At2wI98WJfww5TDgahOhUkIXs+isu9lJKm
 XUqxNZ1E+TsSVz9DIp369MqknC1oKou4JFX66iBuoPPiG/bwkAJgvlfVVzlCArw6AotZ
 98uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTg+a3qKeLcMnEedFROYuZapZzRQk2GeiuN2TW3OsiUhzQNPppoUdDJ+q9JZ8IXxvtvw3aIdogoro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSZ1Mxr/NJeYfkQ9AHQLTeL5fPtae4KuZqXq4dhTqMFgLWkj7x
 1eZc+UbuW3n2uPGem+UgQgGFq1PVNBZHS/TtufdT63PAucrQwy1ZJMkFBuNKOMIRkB5qXZxI3/C
 6yNaGkANVJbh/fPBTpYRupRlqIGOkMD60SO3Fc6l+MQ5jlsqXaDoiT9Bfh9KL4X+N3XcbFFA=
X-Gm-Gg: ASbGncu78LVNEF7Yof0TBdJUF5a3BgOq3lhAzqa3J8J9kY1vCWr/KPnBTikC63VuhCL
 5igxBPR1GXTPtbI8mDzuUCIMVBKrSgOvROs2uZBnqgGqu31WixORnDWZQghOl6AYyt03oP9tgNv
 cAO+T//Cp4DMlKUzEsTLiJRVkkzO54/DZSMUUxZY+7ja6ERBCseWMa5re80xXuBxajoE2e+w5G2
 Pj0xabMoRNHCE7u6Vr9qSqB5d2wIwAQo7uGgsgcEMVltN7NQhCGpLXE3GTw6YyRc+yjrEvypeea
 6+wK7XwkL5TNX2WZEBoelnReyGwwJO1rH5eTy9/1xUWxIZLwDJWWZKdJVhcMrRppiccShYfyULm
 CsZ/sKeWOxd3zUJo2Z+L4HrwtarnBg8so0cQoBvHROVLyZxUC0YSP
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70c35c1f06amr21420386d6.45.1755590374851; 
 Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiMVGZQHvFNLcaq5/1TlbULCLv9YgylRXF8bOeajYtu4DRaeBUMTeUknrqEQR/YcjE19k0Pg==
X-Received: by 2002:a05:6214:2249:b0:709:8742:e46e with SMTP id
 6a1803df08f44-70c35c1f06amr21420206d6.45.1755590374394; 
 Tue, 19 Aug 2025 00:59:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3932sm1968059e87.109.2025.08.19.00.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 00:59:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:59:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
Message-ID: <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a42ee8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Yr_zk0diUUozgDP3y_gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: I-0Sq740UYWgzmvpkeU-QelMLF1h0bgX
X-Proofpoint-GUID: I-0Sq740UYWgzmvpkeU-QelMLF1h0bgX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX5po2A4qEULXi
 bKvxJOlgYGZG2ec5dIGsljU/inkLIld9qfv20Jhrpxzb1yiWazSn32/jgHNGUDAWBNG9pca1iLH
 3PSn2JxeYYYLSZdqGjKySrZ5nrdLyfYHCFbLPNm5cRcJZGE51XoToQyShLStwhsMeqoeeuPe8uK
 3iLTvigFe+uQsKvFuXpYY09DaZQHlrwHjXgYEv7oGzCvJQiZOzuDHTRUAzYXPQYf+q5GI6h9csE
 vL+YHLf91lVOqzfEYLWO+1Z6Yc8VU55mAq9heBqf79yWRKZNkQfwtlmTlqW+LBGQ1yaqFIWP9/Q
 iahHUccRLLCR+m3f53LcdMMA21794T6CsOa4xbInWpJF4dLafc2xzwatH7iwG5pv5X2eJG6ZiBJ
 I5j6vQ/R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
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

On Tue, Aug 19, 2025 at 11:33:33AM +0800, Yongxing Mou wrote:
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.

Hmm, no, you are not using SM8650 as a fallback. You are using the data
structure for SM8650 for QCS8300. That's a different thing. It would
have been using SM8650 as fallback, if you had declared device with two
compatibles, qcom,qcs8300-dp and qcom,sm8650-dp, and then relied on the
second entry (only) to provide a match and data.

Exactly the same comment applies to the UBWC patch.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>  };
>  
>  static const struct of_device_id msm_dp_dt_match[] = {
> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>  	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
