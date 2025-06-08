Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B7AD1206
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0794510E1DC;
	Sun,  8 Jun 2025 12:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRfq1nR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF4110E1DC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:44:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589RbHu007424
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iGiYE3kM5YZPUiuD1eTcOXlS
 Uq6N4NpuwGV5LvhG9Xo=; b=XRfq1nR+k9CCJnQAROM9lLWx2fQPr1OH+aarI/Ql
 pyO/pQr3xWeaM1QRXdhKN8Ab58h3BEOwGD+GVOkosDTo96QWLKA3EK5WNSoAjMlV
 yjlQRltWHTjtoP8mm+bxDb95SCLh9KeHZVIIPJtItXvoqk21FTyGjcr7h0P9+zec
 hrDeL5bnilqKEm78D5Jpe/1Hph/icYFCc2SXbCZuBhCn05HhPVK2xAz4Gfvb3OpQ
 SiT/QgB8KvpE57EIDGsblJaXFFSEdCm4crfu95piMmyYDuWyOTL7ZuwlmmKBQv0L
 eGiFk8IZakqkWdF7lv5hGbvFbBl+w7pNvRdZImQhiV+Xfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9jxnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:44:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c9305d29abso659882485a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749386680; x=1749991480;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGiYE3kM5YZPUiuD1eTcOXlSUq6N4NpuwGV5LvhG9Xo=;
 b=A6CiBfWwf1b5Gr++9v3lqpk0OqeULgElZExe31qBmlU7OR3rsrVOV7vSqU3DAmPtZo
 RyGF7ri78DAPThOoMPzCyEsN+6PdvaN1ntGi0GLfBdvHY+vnW1NayJpZOUSqvBUjJPho
 khReALkk0UoyDGLfpSy/1AbEOcfY+iptokRby7tBruVobzWQeUMPwZonem0iGM60zrRj
 SgtirZVd85iuWifca4nQ0rFyZYUI8lo06Pw5nXyUZfa/7JKXkoflPkLi/8rzo7ynSzmk
 98fqEsQ0VDHAhst3lj1MWYk9GtrEMmnE6ctubbbtRHDDzDAwcA78J0zM416S5Xt7LXuG
 xElg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXulU6jKUKpt+61yTlEJYEgSDgJHs4pin2IU4tgLS7oNGA52z4VEDDC74DXp0iec8zDoSb4a1Y5mtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgciiFRxJll7mV2JLIddvVLsWBQhaNas49rPirHvMnOtudYTk6
 H0QlhpaRKHQMZS92zsFOxBwcdOgIjbdp7qncaHC9l6c8iULg2eoOXhsQv5yV7fANS/A75iWGoZm
 KzN7R9BUNU6phsX0VbkUOPc3OqseYEfpcU+J9EENhUgJmYLikaEh1pYpYLNVTBB/qqjherao=
X-Gm-Gg: ASbGncsZ2oCS6MllAD5mx+YGJkeYhJgC3V+AsB0btGNTxHaQqLC1T/8N/xYdHPS9yaq
 p7u/X091oiigVih/WRcOS59X90YO0dAv/hkkYMYzC5Vyk1dhQVM7Yc9JWtLPQjDCcq5IAxdjdlD
 0AdvV7iuql169cCJNwruO5lqOSZPb0SbQ0mrqud+ALssEL73SQt8eeiG2GKxN5z30DkUyO/AwpD
 0JrYCuCWO3haV+v4DObdLVXXNFszigvi0oAO4qGPWV8Rqoj3ti/ojb3ZZn7DKOfBuWh9IscbgbY
 Tw0icktOEt7RaD2tOJaY43N+oyXgWnqS7EuEY49XgCW5kFl8xdHqLoj96whyL6nEqdyne3+Ot2I
 lMnDffAv+Rg==
X-Received: by 2002:a05:620a:60f2:b0:7d3:8ef8:186e with SMTP id
 af79cd13be357-7d38ef81ademr341903485a.14.1749386680682; 
 Sun, 08 Jun 2025 05:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQiEsdoeH+8RHm0slrLj8I9TSy7hvtZgmHk+h/uIyDaO7CapPiLSz8XD0SZvSal5zQRcDs5Q==
X-Received: by 2002:a05:620a:60f2:b0:7d3:8ef8:186e with SMTP id
 af79cd13be357-7d38ef81ademr341900585a.14.1749386680355; 
 Sun, 08 Jun 2025 05:44:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b0cf7fsm7200681fa.12.2025.06.08.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:44:39 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:44:37 +0300
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
Subject: Re: [PATCH drm-dp 08/10] drm/hisilicon/hibmc: fix DP no showing
 after HPD with VGA connected
Message-ID: <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-9-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-9-shiyongbang@huawei.com>
X-Proofpoint-GUID: vCQ7Rqoudk_hoFH3Ogy6IDcpKM5ECZOz
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=684585b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=qIQg4bjnobHRwzQDxS0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vCQ7Rqoudk_hoFH3Ogy6IDcpKM5ECZOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMCBTYWx0ZWRfX5tOfBTylLbDz
 vL2mi7zxWA3v5vrnT8qBaymPUiU5XOJN+tM1h9iY353xjom4Jv3JCgeWjHhHsKZCzxltGEVpToY
 bRT+WmMr+556HnUckd1bHuS2Di1tV5khBca9+AtgRVmranLqL/iobVp4tBlUrgncs/1nONJLAlm
 X+z+SVnxKB1h80IeeeCHK/XRnEoZ8ZgnN/Wx56IIjUPS4bIH5e5sQ7VrlxUJux0UDQwwuSUtK+L
 MI9TdAAIHG7slPEHkXuqeCbHUq7EnzaQlss5RrYUfc6VW5n2PoyMyahSmTxWKP7zb7j/Zb7+TXQ
 WA5ZauCe8eAuQb1fXvzRT7TaMkLSpcydN7Ihk52PsV3GNn9SZrMZtgbzmYS4xY9eMzs8LszLGFd
 E+0xd6Tsbhp3UD2/GYG9k+GkGk5UV++PqH/5MfeRWq7XqHZ3YS/36ItMh/MiB6xED8BfIhHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=651 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080100
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

On Fri, May 30, 2025 at 05:54:30PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If the system started with VGA connected, the desktop like GDM cannot get
> DP's CRTC when DP device is plugged in, because there is only one crtc
> sharing use of VGA and DP. So change VGA to disconnected when DP is
> connected.

NAK. I think we discussed this when the previous patch was submitted.

VGA and DP are independent. It should be user's choice whether to use
VGA or DP if both are connected.

> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

-- 
With best wishes
Dmitry
