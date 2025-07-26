Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26EB12B50
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DFA10E233;
	Sat, 26 Jul 2025 16:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgHK9p9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF7410E233
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:04:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QDUAUJ028652
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yfKbo7ad/8TebfDZw7J0Umhb
 3as7DBy4t8znbao/DKI=; b=cgHK9p9GDXKbG/9yE9/rwQJWG4fMX2wYRuFQI3/X
 ekekOReagAr/bivhqou99mSOk/xy5VRX1EDByhvd+9hUugSQ0fp73pDySwzjiR9B
 Jeb6uF9ZUaKox/gDFsNG4hO29iQQeB4ImOwN4RiYsPzr3ZUdk+9vtf2FTl7jca3e
 JV6YQc+Ky+PGddCHjT9jwPj5dLnP40VAC0FaLWfBF4zCG5ZSGenLG5vclp8/ewmu
 6bA+2r/FED840IiNYbj4H3EXAsww4cPZ02wgO35vatkRZuAmD6BGOVxjJ7laS5NG
 6xsLkSigTdjBALgCh3ECv2SawN5EsoVlP4guLdQKstziwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xgu5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:04:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e33af599bcso505496985a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 09:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753545864; x=1754150664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yfKbo7ad/8TebfDZw7J0Umhb3as7DBy4t8znbao/DKI=;
 b=aXY8lEG+6GtgxAzslpQI45xLDVn71QIWqUWPXYOeq3IQwotxlOaTDwL9cshTdBoFb7
 3wcPaogvxUNHcRAwJ1gWUa6RIy/BWYpGedOe0EcVHkfeS+x0AgfqT0oLb+gf1HIHniZX
 +UI8oteV8jXSE67Ehcv+lTW7ZqgGOsyGRqQcc4YoxZZFRAcr0dZaE5AEqQmiU3iYsdKV
 KgfB1xJquFVCTi7AI3vtJwk4vTaw4XHnWOmSTJPfYoK6UCNS1TtBsLYPWa/GpGlTlIDd
 fmmIVsjkH//TH0NpWoWsqdEabCzFzhkNPwu3xwhPcIm7f69wRU2LzBpTJoeKaeXBJYdY
 HlKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4DehUM6py02dqh4i3JQQ7tvwiGlHYLHDo0VaNnZhSASxoCf5mHyprCPQ3NxzIqdwlf3loHVmk5aM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHKNU1t4cGpjoYi8UNUoduvb2+1L87nXYgqG0l/Fym6hP1cEtE
 6Rk3NsI4e83w23OsC1ujfWVNigvX/S3ujus8ON4Cnib/S5eTKiGVa77jaVfLjm8Q+SuqaWNGa1w
 10xIPBFxvfx0SgIU8oVPIuqvV64NkGa2EE/gpFxVu0wDHxusI0quYGLT/uNjaNfzWjLr3Y5Y=
X-Gm-Gg: ASbGncsjG5akZdEVayrb3/WnMMpk9S0EUl2HZL/k73VzCimgpM8f6b6PWPst+MvgG9E
 jSFGzu69R1lF6am7aqhlV1TDyqzXjSa+sE+tLOWeu24h9CvrYPefafnDT/xBHHFTQqH8JuQ3fDr
 4yvy6aiQFwycFblryijkqP3WzqpQedmMGBexn2x4Jh/IlGdcOZqkgMnpnk0fXSjH4nsMsMt4UJ0
 wwd0kWXm9pzy6EpLZXnfJ7kyY6udYAy6OMOCfFb8RNF4/5/i7q0iWIFXlqzUdfnb5kyH+2iivxJ
 k2j5CLOHtHbQ9Kgk4xX/sFev66BNX0tqDXcR8J82Am1Z3k0sxySffMUliIVS0ivWVVdpGlyfg92
 qtBSm4NLYUdq9EOs7OpRPxG42vOVD4Z0WCj/MWc5a6T1B8XCtHz43
X-Received: by 2002:a05:620a:3950:b0:7e3:417a:9609 with SMTP id
 af79cd13be357-7e63bdf8e9emr775033685a.0.1753545863532; 
 Sat, 26 Jul 2025 09:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU5L67rpBaZNuPMlG+POX9P03Zj0lIztOTkguqEQNMXfCPAZFoSgTgA0DEfhrJVVgzeWEt2Q==
X-Received: by 2002:a05:620a:3950:b0:7e3:417a:9609 with SMTP id
 af79cd13be357-7e63bdf8e9emr775026085a.0.1753545862900; 
 Sat, 26 Jul 2025 09:04:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6318296csm485676e87.50.2025.07.26.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 09:04:22 -0700 (PDT)
Date: Sat, 26 Jul 2025 19:04:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 09/11] drm/hisilicon/hibmc: fix no showing
 problem with loading hibmc manually
Message-ID: <xfwtvau2z53lqeqyexcm24cmncjmae6wvgvtp4nswthklotyym@qm5swowhkyr2>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-10-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-10-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6884fc88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=grDN2ZGVdwoY-3k3008A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XT2iN-oOoXvVnOJ7MoyuRLfyQ8wWF6qm
X-Proofpoint-GUID: XT2iN-oOoXvVnOJ7MoyuRLfyQ8wWF6qm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDE0MCBTYWx0ZWRfXx8+48HAs5ut7
 DhdvJfQbMQ6d4KPUxgt/ZWVRR3a1k3jsLm3o5gv9+4l0C8677dhVr7g041Yy9Xe5dKrXgGGnGns
 2xkrBV5ZsyA0N+LHtJWdiqM40UWRhtk8WLmWjpjjJJdcTwSFrGbR/E9O8GKWBJMYc/PAEgKUFaH
 hvILA3LbftLlBscmlNBUwYyclgQUfJfykWScGNjj2nXtFt0XkxzaW1TIzK5WQpvt/YXjWQl6nl6
 IXC1eTs0aY/3tOTEEihazbdL1GE/gh7dXa1wZmgW/5x/KqxNNZ+nm8FkLQElEbx6rkpuwDcStEX
 hk2K5c5Nl0WDJgQZbwVZ5OAX6CQeLQNXSWJ5fw+qHcu53n6ojBlG5O6IyRaPQm2IUsutF12Y+Fa
 YS9hD/3X5aEbYpxz/4Su3GJVzw4l/54DK4TO3SNlw4d+gtYeINz0Z2lHAv77dLB+JcrBYwEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260140
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

On Fri, Jul 18, 2025 at 02:51:23PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When using command rmmod and insmod, there is no showing in second time
> insmoding. Because DP controller won't send HPD signals, if connection
> doesn't change or controller isn't reset. So add reset before unreset
> in hibmc_dp_hw_init().
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - fix the issue commit ID, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
