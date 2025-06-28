Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1820AEC93C
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B810E1B1;
	Sat, 28 Jun 2025 17:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZyGq40R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76F10E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:08:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCVWRK012576
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bmUsQShKav07IpbuEzrm2WqB
 NCF27pNKrvaOiyVpJf4=; b=LZyGq40RdUpBNMyGZA6lU2ylG2ydrM70qHxP83d6
 q2XPlhEC+2FGMHgq7fVSn2Ajk5lDRkVs+galwJ0Gsa4yPys6drJuqN04LNHfwjXI
 j3uZ3twcVBjFcncug1E8A0+7GMsrcbyiOXt6d9PDw1tIUpHQNjwS4TsPPxEV1gs0
 In/yscNcuf5uzie47iAt+bfULQopnq9/mzgdDf8XFM4ZO/VHsrO45RndAtPe5Zns
 OECi85TZFvq9dSIrBCN0vUOWY/TsFnHUOGmlMCOciJLo0l0aWd2Kna8d6tvtTvh/
 J5FmAxalC6GD2/2T6wKlp5KzPdht7CZf5f/P0w0hme+MvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm0yjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:08:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d446ce0548so153803585a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130500; x=1751735300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmUsQShKav07IpbuEzrm2WqBNCF27pNKrvaOiyVpJf4=;
 b=LXpAL+JJPoh+yq98UFD/Nt7bW3uKjigMyZUUVYVBUxDT0Q/d7Fy4bewrCyWV9AvdX2
 OvpCQM+itMLqbNkNbby6XumCP90VUyi+vQZk0VVn9MfYmQx9/uxlec3g/57LnzI90EFe
 xCoCwKpUsiVb5ZEvZmHYJ2RSgMHZ31fr2MeWybaUb8RyAWJ462kibit66lN/gIBKV8ZP
 h6lqXiqYM+YklCISBZGHYsyBQOC32fCAs5eIvOWDGed9rYS98ejb0hKn1tgbZQ8mYRJq
 e4FE6lbaqfYzKKwDNnfmYaUr2wgWnxM/Yw6lFqgXMfkLtYkhR9ZfJmvvp486j9XqZXJW
 2tQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRr9A80jgoRh1GeC0laUxTjgEk0ziaG7NA3cqBqredwLZt0QkQMndLdWNomQVoEjSxcCvRp9Eo6cE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5JhOWiE3WQQcuc9p8RadDLLVqoXoZQn43XjTWtFVDsQu5O8UV
 Fzfq+jAb7G2zBeMWcALLCIzgPbvnphgw17Sb0dsc1kTU/UOxxPO7x1hQ6QtqLMrRDugI+ieeGqD
 fym69SwCoJVSsKnDOdKWSSfh52rMJQhEemFCu73nnzcDy79msDqYi0myOx9i/JId/rfEmXI8=
X-Gm-Gg: ASbGncu/hwW69KpbQPo2SEwKte2/a7WO2x28BqCnY1wQqP3vPuSMqKJpIlfRLWN1A5S
 B4pB7XvTg3/QYSKTbObdgaQvbiqDBbxX66eeYM+1ZygyFOM91fB3Q012Cs2Qe8u23zs15xGcFXC
 1emQaBN2AGlLZ8AQ2akeqrg9YdLUnxXsgWogdwj1ZXa/SC6XIfDbQXc+K5rC/+eFoDzICMcjXxs
 f1+SSDTrQGljm7EaAcsP7oF/5S3Zn9NOI4Wzt5srqR7hHnNkLRen005fBkJOd7xpZUh/BNw9NwD
 mvlNwUVpG++FJjOSAcvqmwWF/r/O/1/N0yyNz01ptNVE2Jpxkda5zijCB6HxR7MsiG++lIoYfsc
 WSAlcBavYboVU50fTfXAQ1oaoYAXXUhwIVmE=
X-Received: by 2002:a05:620a:c92:b0:7d4:4b09:e326 with SMTP id
 af79cd13be357-7d44b09e491mr498357385a.30.1751130499645; 
 Sat, 28 Jun 2025 10:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG32SmCiU2DxD+I2ui+UyKd0ZrfAGlnYEyPPkg8jIAJgdMtGWswgxyTItcl+rq6FIMhUqwcYQ==
X-Received: by 2002:a05:620a:c92:b0:7d4:4b09:e326 with SMTP id
 af79cd13be357-7d44b09e491mr498354385a.30.1751130499142; 
 Sat, 28 Jun 2025 10:08:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2d7c4dsm852389e87.207.2025.06.28.10.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:08:18 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:08:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 08/10] drm/hisilicon/hibmc: fix no showing when
 no connectors connected
Message-ID: <d3d23wf72e66e2lyj3jqsmajuskx5zbqok33o2sx3wrd3nipje@wavrn6adtbtx>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-9-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-9-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68602184 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=L7FkTbdyDGPqRg8DWXAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zDLLfdiNHXXKRyOMIdLtWXsu4khZG3OR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfX68I6vvUVsoQ0
 brLGWR4deCQyOrzRj04/sK9F6eTEWD6xA4TGQjmEPwKYBCo+B0jpQ+FizXWGFAzHxebM2CxM8Eu
 u4pM7vmgQkxmKm1vvsjpBoeygcLdrDze+i4oJaZXMsrYEtvngPYUrsmVKmsZ5yulTug4esC4Otx
 j4Tgv3On9jlKhiU28qNQE+5YCfqq8eSjvd4HYmhAABDHfQhDfmDkvXogXVDGfG61EfS6RqriQVz
 CrhbHJvFIVtA7E3QFVE1P04LbQ7MBLFLOvOEX7l6NOs8NXY17PZjk4hNbnQOU6gLXfOvkrEg4oM
 tkNk3gwUCJmORnNGV+RNNW8Xef5qdLCVJX89UN8MY1Y0QLXoI4JmmvhwkzUJXakqalPXv3YMtxG
 FGpGqxqZqLyng0SMOvEsEssgyriQPg2WomfEH8VBuV5iECgEmkITcgEpyEcKLD1za2krh/FC
X-Proofpoint-GUID: zDLLfdiNHXXKRyOMIdLtWXsu4khZG3OR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280143
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

On Fri, Jun 20, 2025 at 05:31:02PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Our chip support KVM over IP feature, so hibmc driver need to support
> displaying without any connectors plugged in. Deleting the detect_ctx()
> of VGA to make it connected when no connector is detected.

I think, there is more than that. Please see how AST driver handles the
same issue. I think you need something similar.

> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 841e81f47b68..953474d04b5c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -60,7 +60,6 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>  static const struct drm_connector_helper_funcs
>  	hibmc_connector_helper_funcs = {
>  	.get_modes = hibmc_connector_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
>  };
>  
>  static const struct drm_connector_funcs hibmc_connector_funcs = {
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
