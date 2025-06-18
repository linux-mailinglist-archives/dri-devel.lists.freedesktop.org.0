Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC8ADF885
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA1C10E95B;
	Wed, 18 Jun 2025 21:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBlN9mV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAFD10E95A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:13:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IIjioH024471
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vAAxqdVUwT/NilX9Bt7mr2vF
 kHGSU/5O/o5StSNmHJQ=; b=DBlN9mV7tnepeJZoR8w9nLi8VkKWRC8deKWDNvvT
 SEZXTN4SL8+tJbspoDTR+lS3SOnN6+/zyf4VkYmChl6SPXAC4kMc5MsCJmeQXxWr
 225K9CI6Uirv0YK//5zU3dj3HYYJ4K5TyD5ov+evnA6fqXTVu90xEfVlqXMZ5Eol
 7KFBlD/0Q34VLNVdrYfLRTdWcKzbRgXKXiBBK+qOMH+AaTe1XYm2j9wrha9UT2Ti
 nzvNY+Vs5T8oNUbbo59VxZxjYrQLkuMXNrNYHfhgWdKg6fy7PjxE+/SZ/JcesEMf
 M0/lMzB0V/YRP/gWFQoWbGP4izry5QL7862FtsvHPZ7Xrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca5rep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:13:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3dcac892bso12677585a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750281180; x=1750885980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAAxqdVUwT/NilX9Bt7mr2vFkHGSU/5O/o5StSNmHJQ=;
 b=cKIjOZcrhLMnrLK6xv5quiAScMp89MIuVwZCC8LUhTCouojyWB/bSPKZ6I5vFUrvww
 rC+4F/ynoJnViiAvMLlpcVAE3SeR/JZRgqztZS0Fn0BY/kwaGeghtEEsh4b04Raf/kwP
 DDCl51TbTMOUgA2Oe+ENOGHfJXhk9uivaCxxYS0Te1JPei/9NvJaubioAN4SZd3PVb6+
 c+HaOqubTTs7OBHr3Fl4e/7ZnxzXPSG5vFGwGtfW5aaGUXQNsYuStIcXNlevCCzkIQzU
 /Forwmv6AN/QZCUJgPk8ncldGb3V/2FsAS+yfd/jvTexdGrPzWvT+fh+KF8+Q6DJEhzW
 /V4g==
X-Gm-Message-State: AOJu0Yz13PGF00MDLgOOmF02xFqjTZ9PKDk8/S3W5PzX2Qfr9JpDOoiw
 eIKtU9BPjEuRX9LuHNJ9QNNLeRzzYSLPXeHlyhoNh9OJVlg0Mv8nFrPl7S3H13R6uD3IqVio6Lt
 ogjHWujMQ/YQ7v4n2vM6DFYk6ZaxDfEyAY+8Zp0EySmUBJiA5NwXAzht6LWjSbZy2oSfuVfQ=
X-Gm-Gg: ASbGncuWEHxe2PVtUmPQ6/PhIAZtB+EJ/BNKxAMzs3MfHp0ldrPMmEv35bZsYnl1hIl
 rhv8n7chrGMYeaq/ZAS2Vdwf4ndttrnVzA7k7Vai2GUuer/yPSMTUvXzTWB6Yc7K1sjPyUOZIqx
 wzSs8a8TNLkjjr/i8xPAeTe26ZKnmQSkbO6Tdt9oThDQgXlA10Hp8rAgS7pEwvd3SY8MOdSYKNw
 yXGnPm8yiVrhsVgG4ou2dtghX7/9bkpdxCZZ8gHvd92Zq9LPVmpLPTzoB/fEr2mAd8jl6XyNRtS
 MpfympgHjZMsMEmum9fvjvpuIUfz6iyxCEFI92wh04+MjSLtszXQQpNNsbSTeiOWZVkVMIa0PTe
 +V9I60733+6ZBYle+BFwwvbXjhaRosWBMQhY=
X-Received: by 2002:a05:620a:3916:b0:7d3:a7d9:1120 with SMTP id
 af79cd13be357-7d3f171a794mr150270085a.24.1750281180400; 
 Wed, 18 Jun 2025 14:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWKEnrbepBya0uwa5jSkfJilu/p3G/it5YTcJBjQ7HDOe2F37TDMySY4hQYkuerHFFgN7znw==
X-Received: by 2002:a05:620a:3916:b0:7d3:a7d9:1120 with SMTP id
 af79cd13be357-7d3f171a794mr150267185a.24.1750281180019; 
 Wed, 18 Jun 2025 14:13:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553cdef7fdasm650322e87.245.2025.06.18.14.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 14:12:59 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Message-ID: <iiacxuckhp277b5kurmzd7m3v4insvsr2jzgimxt3k6zs2vnei@hzqjdvmsgeej>
References: <20250617185611.2965223-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617185611.2965223-1-rdunlap@infradead.org>
X-Proofpoint-GUID: v3vhF0OxCQV5M0Hdt-EwNelpbN7YKTVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MSBTYWx0ZWRfXxFUJg43AneU0
 kAaRvcV2o3siFv0jLyvNIJZwuOMJu0D94ovEhG0YfC3fLZvDsabqCZdJNi8n0fApCDXeFzo0rR0
 byVSX88iqF/wWQUdM+7Lxl0TzYeLZ3S/iSR8ldfJJ7xg+JWm4iqaBGDGxY1irZM1zRlHl+FsyOD
 QoJG0R6unxsEvJrYGjIYKETYVmZ7eD43tBhXYgnMLBMUvSM+RCekrZf7zRjjwgMJAPNlWJOBSc3
 Op8/b7J4+ChhOo75xkVXsRvpWJR1WrW80VhymAgfSVrq7OVJ6YFTZkEUj4165yYmCClDnITFHLQ
 hr/TNwoJ+04J/RTVKnFCEFDEGtyRDu5btZ5T5gp08fwVTWqJHgjmBeOPimNkuNc2NOkAy8KOGil
 VzKcmwg78ySucnhgLxOqwtKHOoUJEQLnHad2B0/hhFhmZ/vdoqDKkcadhqluf07mYvBrseDw
X-Proofpoint-ORIG-GUID: v3vhF0OxCQV5M0Hdt-EwNelpbN7YKTVM
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68532bdd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8
 a=4IBLwaYKg0Bczh402C0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=774
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180181
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

On Tue, Jun 17, 2025 at 11:56:11AM -0700, Randy Dunlap wrote:
> Add <linux/io.h> header to pull in readl/writel and friends.
> This eliminates the following build errors:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>    43 |         writel(data, panel->link_base + offset);
> 
> Fixes: d7e3bee925bd ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c |    2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
