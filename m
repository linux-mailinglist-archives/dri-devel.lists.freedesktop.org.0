Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB4B290E3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 00:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562B010E065;
	Sat, 16 Aug 2025 22:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzbsPxQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356C810E065
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:44:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GMBQag019735
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/EuIJSQVFipHZ8gh/mIF17Lq
 KU5ewaZXgNr+7RvbzUw=; b=DzbsPxQ0lXmlfah3RuV3nAP90tK+ivc2QoIV4QDd
 XA4b0wnLUeee/3ryNUaWx0WH9U5SBX4itRovfT3gmSig3PehjaOPeIw57Ja7TfrZ
 zn8ZlaXS/RUh9T112Y3amDR8K7oBta4J0vxEQWpeXUC59Vf7ia2Gr4vyPE9R4pSN
 rkUmXir7pQRjAtJxapFIxc6JMRzAhIGQ439F8qsDbDeoLYf2e4ZmCgjOughDtAOV
 ZVumldT/D6Y6epq0BKacXKqqqNh8lTutcejq2ocgdAIbtDU7CpHwAnH0XyaGGOI9
 kapq2gODvEMjrkH2LKYWzkBSCHNzMrenNO2Ws66i5JASIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagsbhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 22:44:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a94f3bbdbso63733356d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755384259; x=1755989059;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/EuIJSQVFipHZ8gh/mIF17LqKU5ewaZXgNr+7RvbzUw=;
 b=g6Wj1K5WiGelrUK8gGGNL/F46UdiKDyZySBN1MCUioI5yCJaUyOHQmjO7yD5lEhOkW
 Td+sfEDtV7cqpmopD7HerjWwExPxQoI+rTbc1fNnol/+PcnoTw+wDfP0Co0jfukPFRhT
 cm9k+dF1c50b12+op+7qsDK6TZXDdC8bvoDY2kEUaTJG6Lb/BreiEvzuZijy++kIsqd0
 BjPvrPMv+dfF2icO+i5et/3VJx08yqilJ9MaeW/Z1HR3mSAiUaz3QhhsqdmdmzMe4WU4
 e6XsZVF3qmVzEtElQFIATR/RP+8KOjorQi9Ac9UpegPD5DcAOV/+eH/PtM12NEb1WsIt
 5vKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm1qX8zAe70CVGIv/Lqgh4jqYZbZeoWfd8trlWeWdb2ZXYTgQ/fy19frXdb79Uo6KlThn87XQPkOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+2M6/1MhRCS6AP1h5XfxavO+OxjeWXT7TW93YNk6QnZixwPsO
 ZLheOUF2hlD4vKorgYktMzu0u10eOPhcjSmU6sLZhFo2bhG6P98I/sVXxhTtOCykd9s6tEL6Oe4
 MoA3z0MJDWiy7IgAP5fTeT9O7sTBSJ7bjEmOWV+1jPxtzjbfI8lsk0hYU7CFIiitw1jMY+Ns=
X-Gm-Gg: ASbGncuZL3Sr/bSM2oExx1zrQAp/7vlN2sz3zo5oCXv9nBZA+2kz+ww84+d7qRZjAiZ
 Oo4CxVt18sHRYkRgZsos8v8o/ERNkFS/bkv9kylZgnvkGMWC1m6mMTcMx/Zn5ufP3gNFLYmKt5p
 RZWBNPHLLr7px2sgfsYf1Kx5k+qVsUMRdI7dWP9PifO010fQ8dzE6kNs2Dw+wGwBit/iOZIK+0G
 1phq8lJkZ1LOfeePXHiSPhZi3bXxC0uZrB3g1zTFBAU/MZwo+e5qwTju+LBNRMj2t76IyUw30jr
 IXKn9Eu+t/H/2lzFSVYkZKnK0x3OdzLmkig01ABL+hcC5lDFL+oSwDBVR40dHN1hjiK20QumDkt
 05ye+GWieqBASYyJar/PsTrRzwo21EyM9YV36r+5yEVyRg9FKrrhb
X-Received: by 2002:ad4:5c8f:0:b0:707:63b8:3d46 with SMTP id
 6a1803df08f44-70bb060bb12mr45909336d6.30.1755384259416; 
 Sat, 16 Aug 2025 15:44:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/81Mu1hIcPhQHya8AuAZQxUdP6z5ibn/KOi+EOfMscEFQ+1FDg4x3XoqGsdUIB1vu/DSt3Q==
X-Received: by 2002:ad4:5c8f:0:b0:707:63b8:3d46 with SMTP id
 6a1803df08f44-70bb060bb12mr45909096d6.30.1755384259020; 
 Sat, 16 Aug 2025 15:44:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a625b9dsm11727581fa.56.2025.08.16.15.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 15:44:16 -0700 (PDT)
Date: Sun, 17 Aug 2025 01:44:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 07/11] drm/hisilicon/hibmc: fix dp and vga
 cannot show together
Message-ID: <4meqnxetljf2uafcx2qrtpw3pg7aggk7wqqsyrj2unffraww75@orlxyaplqg3w>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-8-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a109c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=1_qZpLKbntRvsT6nxJwA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: F7aSymOVRbGzeRfjvx0vwaKqojSqX1jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX+99/MCc2JtEV
 M7Uoiu1pqvWvlmccEuDUwtFmylXqwJwb7gVltmjQgQif9Djnzssu71qtp5BlBWsDPPIA3oQr4zb
 ij9LEFSVIGbWot9xBYQUl5igaSD3PjN39btSlp19NoHULFccloxdNbQUbu7/tqrjTe4ZRr0yqhW
 +GWOqZNp6uiwcVJsWJ2ga1cDWXmTDb4hlFAgiEQtC2VFMmTppyK24Nof6RUD5IJcFy7c+9yrEMv
 laJc9afvu0bOpAuXYxHspgRX7m8T+DYdxb2L2qYljdcjE0zb9q8Dc+Y7ZEgbZ+gfYL8Jcoxncdq
 M+JgD2ARlVycyLrep1/VlkPduitOCn7TidUX6T2DGzakQghQCj6FLF6BUm27Cg8Xh/AmD0/VB5d
 xTDjxV+y
X-Proofpoint-GUID: F7aSymOVRbGzeRfjvx0vwaKqojSqX1jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On Wed, Aug 13, 2025 at 05:42:34PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If VGA and DP connected together, there will be only one can get crtc.
> Add encoder possible_clones to support two connectors enable.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
