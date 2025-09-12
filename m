Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D800CB54B78
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC1610EC28;
	Fri, 12 Sep 2025 11:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvQWuptq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C351510EC28
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:48:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fF7r015095
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GToV4QE6cCKItMQsLrIeSPhG
 neO7K5k2i2q1jGRtV+I=; b=UvQWuptqKdBsydqZVnOxBAy2NHjQMB4PcIhj2s2J
 hP5GPM73YQX3/bjE5eZENftiDyxAixdB0O0kORIFVnWbNcel7vpUsB7I44qnUNeZ
 NepM9rpBTdNPOBDUc4r60Nfc10odNSPIYR2Mr6V35b6He5QVTRMBKARIJHv/83TL
 jvGUlhIaz6uMhi0xU5ftuM6X+JgGzW45ctb55uf7DMhF5wESOseibbdKRq0/LgKo
 KpLeR3ZDWc9YxuJUof2mr5zf7WIn8eO6GdtTCy2Fh9qBvSChNarq2nDlI/5BzSwv
 tSNjHnIkxYu+YKkA+aYUhfj9eWVMHmWHPpYDUTZYEe9wQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapusj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:47:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7654126cc2cso29319686d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677679; x=1758282479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GToV4QE6cCKItMQsLrIeSPhGneO7K5k2i2q1jGRtV+I=;
 b=jLxWiAhCZLpcyj9wgVRtRUB5tIATNSmKY/KZq9pvLwCMbJ12Rin4re+6jV1yAb+cBN
 9DDh7OOG6JIkzGgZ+F4eyb7LkKbR4F8+nwtOD1dh7u21rpmlQmIWVcS6eosXeA80boMQ
 ELfDbO3gMKM7jtt1fQFoZndPawcy8Wuenk3xfslPunGZnX9DLBWqoFMbSBOmQxMRSEnB
 GIzmezh2qet6xElFhgFuJrNwK9q33AN6BhlZf1WUSga5jVEjKKFy1ZZR9CH3J9WPuWom
 ZcYa+yAo3RqSInWfpVHW9rR7iWp2zREHQAg4bhcABKBvytkdacCbkNf9P+BP323u+oSN
 aJ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEkTyRxWuim4SvRDWDFzC0pSBFefcGNdMVKI+u6VmEHd/u/jzIDrSPaAPeEIOEeBz9cGkPOseJQAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR+4CVL9YqAjpuQZtPsYenwS1kjcZp04Mi+6iVmsdepqGv2Zt7
 rt4PmeZlr3tthxAIcfaQZLLvcPZqvYReO/ptFaRcFOS9js+ZhcdJysaDziUsndydPJlZUkDo9rS
 /qPjQOweGKR5gkz1MNUiAHAC0v9/mEtlhDzOHR+UrcNQsuYLCFVrkyUYSTgWlYfbNzQda3Lc=
X-Gm-Gg: ASbGncvFeud9hGs5+GIpIvemtWzhlrIvMyM5807rBZWwuKz3ferNqD9oBimsQAFzurg
 r+yB1PO0Tvq0C2iHZ8BX53IEBaSMHeMaXFy9H0if6Yoyg3RSFrcigPZPef5ZuuVsi8dn1NHjskW
 fCvFSl9DcBpntW4AQjg5ecO2AGzxKW8zPX92viyOL560fQUAvztP7Cp/tGg39nDa0hejeorwAoX
 8JlzYsbZjr2M4RKnUI4+eFET2vHJPyNrk0Naj/gdetVTsUOBTMqviC/AzPZ4EO7FCwPgA63kNnf
 HeOL9ajoix4eAmG6JSQZXQU0CZA4b/akn+wcI2t/+8tNJVrPxjsqIgk/hY/h80jHhJ7Dcsx8upS
 rYuH04WoDx9dpWUU+5WMOAIrDj9QDafSYhyVZpVhvzf5n7RV8xU4T
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id
 6a1803df08f44-767c3772553mr34660596d6.47.1757677679084; 
 Fri, 12 Sep 2025 04:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOipAh7umVQHV6wn1IWs32WNBot8nat+cTmZungdIIqqFVBnoEtURSnSYREkpzlbIAflY9Sg==
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id
 6a1803df08f44-767c3772553mr34660316d6.47.1757677678632; 
 Fri, 12 Sep 2025 04:47:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1c014cb1sm8425911fa.62.2025.09.12.04.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:47:57 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:47:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
Message-ID: <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c4086f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2HRO-YaP1JHyyBiP0YUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: aZCFjkaUgdn-VVgsYK5uSh8S57VFzgN4
X-Proofpoint-ORIG-GUID: aZCFjkaUgdn-VVgsYK5uSh8S57VFzgN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX7nwxmeoYcfS9
 yGFSQqY10AZrwklqFeYjaOa/BRXI1u0v0dYnWZ3w5K0yseLgHppYbyfLYaNRjdDkXOxLn0W5ZHU
 K9ncD0IQLlFyziKTfVOSoSRkmlqNswPkAbSBvIJ6qEJkP3P+Ystl3Zwis5cSYXLuz3NcgiCJKQ9
 0qt1REJzsnyD27KYFDjxVhQw7zjm1mSNvi5/rUpu8EY466sqUDnwBMoYQtdcdVJhLbq0z8a1x+k
 yFra1tmeBTtThpmAOuLjD5p0PA77OKz72qWqmlyQmKfKuUF80i/tybNeIgzyssORs4uvUGFRO33
 0RsEfjEgqyy80rPrEs+z23mGy+emx9VkJLh2IqDNeu8hfgqREtOOPlLuOcop4ZjZBreMggU4elU
 fP4jOmDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
> Add support for SM6150 DisplayPort controller, which shares base offset
> and configuration with SC7180. While SM6150 lacks some SC7180 features
> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it

SM6150 supports MST as far as I can see.

> explicitly ensures future compatibility.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
