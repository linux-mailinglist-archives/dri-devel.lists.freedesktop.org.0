Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE5B290E0
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 00:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726CD10E301;
	Sat, 16 Aug 2025 22:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="anMot4ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6EC10E301
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:34:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GIfWpf020379
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Q4t4Yq7nWJACKnGzqsWuoGmd
 BNwwxCbWpfOo7w97CnI=; b=anMot4exsa8UK1ZlsR5eoepruRKhxrgGpSUcIbs+
 cXW279sNzixs4wvcGtUivhVnFbngvjNatnLVi2ZkVUimGnCwVBeFpvvAhoR7BEj8
 UUw3+shcz2I1mtV6D66z8Xjm0awFdYqkGT7koRMZDCoJJbw9gDPeaf4gVT8jSZ8N
 yxF77B37LbFH0fDJN5CSxSkotvHtlqszUO3PUQGkRdi7MEqd3PUF3MaEmsfLrLW+
 iUHPRLlc6jAh881Yn3ohaQFi1Llwc/Y748tmZIRY0VJKryfkcsgM2zgrM4wqgLba
 wcB7GI5OT3mV/XMYZkoz+4ENmYoqvWV1euiu7FXa9NRJJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjy9akd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:34:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9289280dso65725616d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755383642; x=1755988442;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4t4Yq7nWJACKnGzqsWuoGmdBNwwxCbWpfOo7w97CnI=;
 b=iK1eTYdcOJar2DCCo5NcUje9duT8KBstnmswt8kE1ndbfD3rapqBADC3uOP6N+R7pS
 VEF/snNxS0raT7yja4LpRgl9ti0B/Jpy3XRUH4GvH5HYieQUUu/5tKFLNgNJjG8N45zb
 3H1IhytCYBUwTyoFhPAWLLsmYg9CQlYfa2An07qTBZB3GaU9pU+9E1ESX4cD35XsMuU9
 3Unj92NdJ7auqLSJs3QWIpEEoqaxtsQ/tuy4VqoLqcUR6u+5PBqbkl6vdkCNesTFpdb3
 pqb6Dpy7LLSpT8TT/eaSyRtIeRus8x+jFkrrPDbUWRUcpGnqZQ0vNM8XfeRaaOy0coL+
 iaKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaxUyNmqCGl4pTiDO3hZ6w7zG9G6DV09Lk9QvojJ+W43CD7FXvmKib/VmUbcSG4QNS/0VDFqVRtS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWpJiU5Q/Ka2qBqfkXh3yYdS8f5JM2kEhEXbLMyh0WB+rGRD1O
 5QxjJTXLErczl22F7gKXEMeqs3AQ4qSxfkPbbO85nNHz4yOCB5bAGuk6YZz6X2op6HcTg0vwRiJ
 yu/N+QdW2TRlT+1aLKn+XxRfwdIGBDrqHsoIIttIx80qUY58I66MArRKG/HdhbExOm0WTP5w=
X-Gm-Gg: ASbGncsbFO/rdy9yAZijc+n9L0vuJmKsz9deJQTEK+my/Cla3zn272IMW7H2Ac66qqN
 PXZiIr2Eon/MDhYDaD0kMhSJC2p9aKZZQ4PJUN1ZYLbL1OLYCozcj6k56Pr23ujfMyCcdeq538y
 QBXafRNMKG0H9MqFwqpaDjBuOu8b2RvmriWVPY6V+6e8WJMUSvrypAHmrqnJBK/6U0ZzJf/U1bX
 N876Kzv9dk+QGd2sSTfq8faN7RU7V1vjA0+z8xXz9HzN2VGqgoTwwTTMwaEBKUq67i2QNksgvhS
 FrlWu9ibLoJcv4UHDP4eCb+I1f8ZIvNSyWF4tbjwyfwquyaueeboJsJijoWMjCU4e8M1n9Ns9R5
 IYX4jox2GgBkGZOnUuP2LnN0M9z2iRzyCYfhKqEwF4LFBEG1w+Bro
X-Received: by 2002:a05:6214:21a2:b0:709:f376:4633 with SMTP id
 6a1803df08f44-70ba7c3f8c5mr73425196d6.40.1755383642129; 
 Sat, 16 Aug 2025 15:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+7ayQ8Rky1f/DO4Bq30+OAnsmEz8AWyvR9WH7mytwag0di1uEUNMP9LjsZkcGzpWOZG//Sg==
X-Received: by 2002:a05:6214:21a2:b0:709:f376:4633 with SMTP id
 6a1803df08f44-70ba7c3f8c5mr73424976d6.40.1755383641738; 
 Sat, 16 Aug 2025 15:34:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f346bsm1023490e87.113.2025.08.16.15.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 15:33:59 -0700 (PDT)
Date: Sun, 17 Aug 2025 01:33:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 05/11] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <6yd7injgxprrwnvtl6rbmqyiglmxo7vhrkt5ntsxx5gza6dbkr@3ea7aqnynptn>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-6-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: Q1rqXmMuL0jiCLC84zzOISBMybCD3QOr
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a1075a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=iEpkLIqRWSW7oLCy194A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Q1rqXmMuL0jiCLC84zzOISBMybCD3QOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX4DFn9GdkXy0j
 DIW9C30qREqUFOIXFFVc1D2n+uyXpcuChQbVCBJo2vsJ20uGlHduFuVMusozZJHnRzuKJa5WNrV
 EzzNLbya7nwiRqH39nAG0uTD+giik/H1Jrqo0ar0rcmcVQquJZDrTTGJDZCno9kwDo/3gQ/9RGq
 qS/kXfl8MYqJikcB0c13h4Yt9ZfqbVX+Jymo24sCxqwHMzH5T5yPfOCU/D3MRax8KLvfOYqRyBL
 Of3KTeVr5ApX/ulKSxkXOBDV1UeFMig8TVdL5B7cwJYictwCPWaYDWUoD2Y1uICvs1Zhrm1ss5B
 TvvLa/vFpGIeOOnUfoFWuVO01aLmpGBXGMbLReYYbUNy2jQv/GuwDrmgMoVIYJZkj4Evvqdw8P7
 BJUUWGuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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

On Wed, Aug 13, 2025 at 05:42:32PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> In some case, the dp link training success at 8.1Gbps, but the sink's
> maximum supported rate is less than 8.1G. So change the default 8.1Gbps
> link rate to the rate that reads from devices' capabilities.
> 
> Fixes: 54063d86e036 ("drm/hisilicon/hibmc: add dp link moduel in hibmc drivers")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - remove non-related changes, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
