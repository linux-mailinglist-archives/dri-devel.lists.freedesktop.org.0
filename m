Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186EAEC8CA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 18:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E5010E023;
	Sat, 28 Jun 2025 16:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yh+mvyRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55A10E1CF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:32:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAwoTF015381
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O/9uvmDt4XBxG6SCGU/xOqs3
 nLga6puqazvT9x/dQ5I=; b=Yh+mvyRTYYXuaDNQmJsMeGmgE/B7YHONnIeJC7W+
 YhuntoGxEid5cIxOOKSY+RoJml9lH7nrbX0XRmzI70i5z3He8I8wNASQY4fpADRr
 a4dQ4rEXXilYeGLhhJL2uvq4G77PG3VeQ/ubGMUF88afvi3gKISprYyJU/AfjZ30
 Jw5lrJHslJbhnkdm8stCCMGrTo/TR9FhVuED3dxAFuLpF0s/AuLlEsL8FZ5Mg4pb
 m/tXtkJi1fgOIccxnAVAwD79SUTx4AOiaUFp82hAdEywU4HXQGQeIenjSUr7Wm5j
 wzJ9FjWtWQ23pTqHdBG/nXPyKyHqucxgh1wGsaFF8It0TQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq13ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 16:32:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4a58cd9b142so67188051cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 09:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751128372; x=1751733172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/9uvmDt4XBxG6SCGU/xOqs3nLga6puqazvT9x/dQ5I=;
 b=FRuwDGmTqfT+ghuO4wIdnNCwEspyW/+c+yHbjSAaH7ld43BCzsYrsGCcIFXo+8SHPi
 SUDS1e+j3H7hjUMpVqh+Td96pQnFIECjuW31Kwa9XAtMdHMaA3OZZd6qpTQ/UUcFChwK
 6RONTb3TGDHRr0BUhaH4TqTzvNGKwpLQ9ej43DzzJ54NOixHG+UU6+ecgfR0VhQxYSsP
 pxRjcN/lKcl7ynpn9Qwxl5IYf17AZmbuacCSrzNqfXfiExa8QUDYRqW0zni2gzE5/ebo
 FsCzCDF9uMXMOa0Sa7ZXKIn7GUk8unmx0zeK3m3KSKTFoJmJIaM6iIvA3IfGFNfHnITT
 kqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWdZpxWWi4UjM9zIS4uaa49sGf2XHNE9cLaxmrpccRe+hiz4IzSMqUxST4FtveM7yQn1XnbxO/NUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuLfTOw3ta2aTsQ6NZIODH04dl9dkf/FJQgZ8t5LnRoI2H7/Cc
 81S/DTz4Cd/Aoi8dpDWeV0ENPHUdF/4LZftFohBt6F6M/UuQuE69PwJoqp5X3X7CEJQ+853ncZ9
 wxMFSJvetpCGA6ZQ+7VR1GtTLOPydJMoyIl01o00NK3rutF38qzv5hW5SeiQhu/Zalx8gHUk=
X-Gm-Gg: ASbGncvkVY2vcbeHkuzBOhPesBng29IwrbJOuF7uv2lJ6o4cz2fxgrejZ9qvtn0KUvf
 LbnO5VAsxBe6kqy9GYnK4KJgKh0tzg6d9vUvdA6jblatMm3bmpa49kJ7CNcfQSRnSPXhfwHlxio
 xsQjkv91lCTu8stgodywt6zz2k2knaEZ+iasCNMIagoSrwQJOK8jvdFjsUJLrSQPXLVc0mXZ73u
 l8RiupR7HTRkPjJLHuHVouMsVveBt3q5A/QMS4aE0RpXC5+f8uYYezLjwtfInrgwxKATT2owX71
 DUYUc199xQL/9a/cwffz2w1/mnUWQCFsmJDXCtykA03O13/fyXAK6Uoav7L9x/Z6KZfXBr5PuRm
 XbGQX8FgQVXQ2aH7uyTAbMmr/KcnEMI+ANAg=
X-Received: by 2002:a05:620a:458a:b0:7d3:8a6b:d24d with SMTP id
 af79cd13be357-7d443935cecmr1009372585a.24.1751128372079; 
 Sat, 28 Jun 2025 09:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo0GfKgsNJw8nXHLBuEqgF0U39COSY3GWheDpTaSOZOsxKFVAGcrAeJOdBrxouiq1H04y34A==
X-Received: by 2002:a05:620a:458a:b0:7d3:8a6b:d24d with SMTP id
 af79cd13be357-7d443935cecmr1009368785a.24.1751128371652; 
 Sat, 28 Jun 2025 09:32:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b1ee164sm860240e87.0.2025.06.28.09.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 09:32:50 -0700 (PDT)
Date: Sat, 28 Jun 2025 19:32:49 +0300
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
Subject: Re: [PATCH v2 drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s
 irq name variable is local
Message-ID: <wdxfjpszopfpvjeu2ma7moun2raxgaamnw3tp4d4st5cz6onnt@hbjxnienyaaq>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-4-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: APw7C3j8-5Ap8YiWM7_ij5rqgbyl-qd0
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68601935 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=akGq69jt72y9FtjuzwkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: APw7C3j8-5Ap8YiWM7_ij5rqgbyl-qd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzOCBTYWx0ZWRfX0C9VKCHEFVFD
 JjAloAI2OGnNTolY4UsO34FxLWoNOX8adyskzL1CIz48robW7UEFP3DaA45t+OAK2Dd5iFo6p3Y
 uQiwROeRQm3+xa9xJXgQEPCLqUiFhWA/e6UpiQcqdoSk/U20C5XSNN53lfirGjH7YzJRhNwxFix
 iV4hqJHTe9jFjjO5pWIDKrVUW4qarA3CqzWp3PlqcXdII4lLgIXAAW2tIMpSCbxBT6hX6rH+XjO
 KR3UBIdnVpE3k8VY/R3p90FlaRRO6PQBpV2cS16kBxn6hv7GcL374jKpfglYKzlQB6YkSzQ3yLB
 MhHDYnpw5Z5K3ngLzzdgnTtlf7bBL7u3A87mYBcFj+tq9DyZR/sJg22iV051/cp7+FlAP8UsYuW
 y9b9sYFskfyej4x+B0UaEk3WGa4U0sqP5biT/7hTq9HslDOC9tGRKWgItlsfg2NhSjDGPw5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=917 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280138
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

On Fri, Jun 20, 2025 at 05:30:57PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The local variable is passed in request_irq (), and there will be use
> after free problem, which will make request_irq failed. Using the global
> irq name instead of it to fix.
> 
> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - add explanations in commit, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
