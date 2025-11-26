Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3FC8795F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE0B10E412;
	Wed, 26 Nov 2025 00:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7sF07ll";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu87IMab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371E610E412
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APKMB9h3255832
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5d2Twl82X5Ayvh+7UIeHN6bw
 AGRYFoh6iqVO8BoTiBA=; b=b7sF07lldsah+AE/bFv2zwvwlkm5K4/xA7Qskvh0
 hPJpgCAYiFy5Dvkwq+tvODejTa6UDL04p+fWpK0pqE47L1M0idCCF+HUCa12xcfN
 Tz3yCC91EhPcJBZl7lkGn/pDEhIwoMOOf4qedobnhXca7hGIR9OvsLmTzzdSCW2H
 6PVdN3NpxNXsVYNZt+IwaqJfC/HsLT8ji2ONVTkqVe9Ljo6zU4OffNDpnWWBwSrq
 QGS7d/Wi9vuiZ6u4PjFTN/DWVHNaNE8V+OC65zqCJjgz8ca92m83Ya5iaLTyB0Rl
 9DTAEx5ruMxGoZEAuWxa3E1x4YmE3D+DJLYo0u+8+AjPVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c20xy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-89eb8ee2a79so2963448685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764116739; x=1764721539;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
 b=cu87IMabkGCbDp86AyuA3Sdtv/MS6Nize5PqtVZHj3NAP9M3lSbC0BIzPTF6D+YWNp
 lr/YJK/SbTJeT5gTl2LB/AZ1WsSf9l0lhhRCgHLQcbP6Y5TKEcbq6PUY1Op/kS/4ZB76
 j5HljSC8VlLtUIBOnNnuq5YaGpbc7wDLdfxMcypXoH6S/KVKK6Wpmz0eW49OJnHGPAY6
 Mqfhw4q6OnHRbhRz7zdECqYJGUsyPoeIZSO6kF70D4UjOIf9RLZ0Am0JGU6x/OKaAclm
 0S6KBy1ITvelakzvMgn1rH5+fzKGUvShsWtC6i7bja8ZvbzY2OjZYBAKDmuVf2KdcgLU
 VeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764116739; x=1764721539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
 b=KV1WgifkDasoM2QkGIImSvnVNwnSpF1JnY81LiK+Tlj/GzoxhcBmKqNo+halQsopq3
 yrHARH8Ii1wwMrQGAD57CB3nUFwUNDnmXk8V31C/m5gbMufZ1NFKttC6OXt55jYXKIp+
 hMoi85j5FGPf7rxxTmUxr3C4CnRzHpEPk4/MbaeKPreu794+KmmxYJK9vDh2WS+Bcr29
 zI4sP+4uS3Y16SVBFJiwxrKe9wm9poF5k0i8JLapcInk6CXOeE0Kvtr9XzLnODd01Kb6
 LdmCmDbK0h074T8y7fY/HsR5sYAslAjEboCcnnv74TfzQQxZjHpWajcg5+LBZj0V8HXt
 z/bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7cVNLcXzh4r5q4EeeR2uvCN3ubbxl9d19Q9TEyKVjcffVDK0TUsvQYmtu5qcF6PXkMPpgJwORZ68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJPU3/MxNR7M+T2EeK8xuxcXODLS8JJjcGO/+fLSxzPAtCAhBh
 u4beMiqPGiH9hbAxlxIxQTpKCU8Z7XX3anFybrsCpDIa+NvAr+GFpiKvnhRycS9deS6nXbM0UtS
 +jvFI15zpa8q+KZxi2y95gt8zcBbH5v5nJQolCp8PM8Mr97plRrYviBB/avZGQS6Ydgf9z+k=
X-Gm-Gg: ASbGncvFDTs4q6RI/cpxk97FKSYS9HwYpsgZz4Lkah1qwUbAOGYcpcrpUt9EdCTeB7/
 sq5a2txBN0v6WbOBnh0EO3UgQJK3XSZIciKxl3cQM+AbTiV0B6LxzdbKlD9PEOV8nDaD7K03D2o
 D9cZundpggAb3kX9eKet7PUNAHGL8JL0AWffzKea2G/8T/Chb6V+WxOrM0Hbjj1vJvI7QMBpGym
 TC6FcsTngSgxIv9ixs2/YHM4XwarxKjjT3s/Z+V15SqLvKWZS0tk4Q3FHZhnfNdNXZG98ruzACX
 4iQ2FCN0NmJzwQ5/uFs3MTJ9IJZj/Uq88lnRnoaoh8IH4k9ltydzed8ukFdaLT0Os3uersCr6v3
 3CQogz18oCBOxFmOEhn6C7+1w8ZM7P5t7xENBwy7Cn1cRWbBuUGPSl/9QnKOhObH2NKgK3vij1O
 hqu2mtGs/mKIwHbu42pkAwlBY=
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id
 af79cd13be357-8b33d253d67mr2508840385a.39.1764116739414; 
 Tue, 25 Nov 2025 16:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvbrXdwT54hjBQEGfllxVr3ihkFARzZblVNPmDey2OxPwwIOmJzCrtTxhBTl+4NNXy/fGGgg==
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id
 af79cd13be357-8b33d253d67mr2508837085a.39.1764116738858; 
 Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbc5bf7sm5446600e87.77.2025.11.25.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Date: Wed, 26 Nov 2025 02:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
Message-ID: <bpiqx2ouerihm4jvrt6cv4yhd7d2pthryn22debqjeg4suz2x4@eod5ibcj54ld>
References: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
X-Proofpoint-GUID: lWTMr8N7tXXotQG3-5xagxmsfh5Ne0s9
X-Proofpoint-ORIG-GUID: lWTMr8N7tXXotQG3-5xagxmsfh5Ne0s9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX8cEIepd0XX8L
 3ulTy8Hzpw7Qn4FQdh79R9qVO15xxzu6jLphEMzKk3cYUIVIG8qnKtzMoRPHbSEtzGukLphqfz5
 qB8mE6XIAJbke4nX07oiGG+hoAccXeFckQkNlmvNNER2IBhx61nD18w1hhK5Wq+SfuqCRrLdJM2
 HYQpG8Lut9LSjfWSzFtq0WjocZd9gJiHCfRwgTrDAcYQ8x4xRQie/1GyBhDCdO0IQR+cxpL3vJx
 w0L5eeSbBRXRTyZehJs70qoMOtqVOlLkDXIGo+yIou0WgW/ZUohdg1WEIL4tZKMCADnCI2dltOm
 ymc4lbX3hROhgUVF2beSkJ3bipIXvMUtEc6xXwkMAkxLmHOgH3BZFDSPTc53e0IUMEU/kRF7FC7
 4vHXJu2i3yjXxaFMgvZy+LYI5CWHwA==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=69264904 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vAqZcY3_g_uuhliy_rEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260002
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

On Tue, Nov 25, 2025 at 08:55:07PM +0530, Prahlad Valluru wrote:
> Required vco rate is set by programming decimal and fraction
> from 64 bit calculation. This programmed rate is not exactly
> matching the requested rate and corresponding recalc_rate is
> having rounding error due to this delta.
> 
> When setting byte_clk and byte_intf_clk from this pll,
> set_rate on byte_intf_clk resulting in dividers getting
> reprogrammed, which are already set from byte_clk.
> Convert this recalc_rate to KHz and back to Hz to round up
> this delta in calculation.

Should the same fix be applied to other generations too?

> 
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..00f20c5a7c73 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	pll_freq += div_u64(tmp64, multiplier);
>  
>  	vco_rate = pll_freq;
> +	/*
> +	 * Recalculating the rate from dec and frac doesn't end up the rate
> +	 * we originally set. Convert the freq to KHz, round it up and
> +	 * convert it back to Hz.
> +	 */
> +	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
>  	pll_7nm->vco_current_rate = vco_rate;
>  
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> 
> ---
> base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
> change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
> 
> Best regards,
> -- 
> Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
