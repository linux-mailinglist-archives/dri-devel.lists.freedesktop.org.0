Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12CCB16836
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61B810E6DC;
	Wed, 30 Jul 2025 21:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbSxMTOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AE410E6DC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:18:41 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbAlE006526
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iTFx0yIQGaBEsSA2eGgyHdUl
 KsnDAMC5gY3BAJpA+RQ=; b=GbSxMTOCwrl1hTY9C7BjObrlN+PFJ07P/PSFUhJc
 0xhbEJubm1TUJBz2Gqn+JKIxuAe6GbxQUsHaEoruqO0ckfSnd/jqCypnTD0K4c+I
 ZWHqdIzE/DmXmWZ+FuxGLHuQ2TCz0PVJJklZ1vSxFIbfHkvZHXXPgoVNVTiGLgg0
 VAZShFL1feE6AJLfLGKR3IAfAM19EsLD/YfxLKu1FyV13px/rU0ocFVLeQ3VThRo
 1M4ZSrGTUF3ww4gliP33Jgo3F9UYpKgAZoZX8nbk9BVGvrRYzlDS596BVYzhIZ5j
 PA2n33FIuRSUd0Vzrh0gmcOHbnVZmydSAf2anQQYKXU3ug==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xjt2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:18:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70734e02839so4503266d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910319; x=1754515119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTFx0yIQGaBEsSA2eGgyHdUlKsnDAMC5gY3BAJpA+RQ=;
 b=WqsIPQ6WOq8d6dV01ygkXWRCw0/JglTpYGZrleg32wF+rTB4sREAaKgvSIgxIKHWKQ
 trucJg6K+6vdAipySan+noVr2pYZ+SNhWvRfQmo90FH0EVdgO8hG5Hu0DtFbOwWcFMBb
 GWnHzBKIlEUvQlB3fwczQM5RD8hNIMLI8FOWBA29NhReAe2wEdX5jUU57neWJdx6My6Q
 ycCBP0TOVRzxUtGapcfj5pC7PXYolGhbeWIf8t8MpZVnyPl+Z5QcYwyjH9fHkhMOxOla
 Kr+aCZVl5pIgQvxCA/IFqVqjmv/jSkPoGY9bqqQ5Xuw9O7Ur2whYE7opjQxw7J6NHH6C
 wV/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7PRw0o1DZFoHKf2gkq7aXReQg2XQMuwUazIHwGYISwlFUmCwFpQh4jwMaYrfZ663fBhEM9pBqwCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzYJOuqMUFo9r7kEn8f3QxcVzFn6Go3Qq6jX+g9KWVVVfZEiJI
 rfFpUQaYAJhOhMtobfbnGXdB+YY3iH0qcTXcdhGS7fmITxSKt9agWGT9mvAorcdVLYDuye67ov9
 K/zBpYJ1QgbVgW9Jq1VJatJPTeTiPUM35WBJ9uwsEI1UESFa2JqTGj1xDqRPIApB/qfxcLpY=
X-Gm-Gg: ASbGncu8c79prA4f/jKeQNf6t2reBryURmnM5m7m4X4jvjnyBu+5kaTm5s2MIz35Fib
 oPjWL84XEmffTMC8lR9FhhSCAhH8aq6CE64AGbT97323kQPBNdvVqqqE7sR8tiaJrzd+t6OYBlb
 NL2rANIRBLydinvBd8mv+Fw006HHvu8buibcP7MuIy83o6TR8VqS/W4nvUZrdKhVyCx2mGI2oWY
 XfuDnL7dtmKg62qBFeewRANUPK70qRwH35ime41GOq5fheTupBrnRR0o/oS9EloLlv68VA1yyRG
 fSeZLOTLyp+d+5bn8g5P3SFqtR8/RiXDGMniDHSiSNfFNod6DKNqzvHCWihiBKOT7p/dbgmTXHD
 R8TSjm2FpxFa0fs1TmgLZPSb4/8w7P5xkms3nUEdn0EJWDl+VyJgt
X-Received: by 2002:ad4:5763:0:b0:707:5df5:c719 with SMTP id
 6a1803df08f44-70767478e57mr83213526d6.17.1753910319145; 
 Wed, 30 Jul 2025 14:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm3RE9Af2E65UYXRV0BUAaT+4TSql/ZAXgKWlWoCrKvSZ6wgC6yly65rnstuTjmAzh0HHFHQ==
X-Received: by 2002:ad4:5763:0:b0:707:5df5:c719 with SMTP id
 6a1803df08f44-70767478e57mr83213176d6.17.1753910318773; 
 Wed, 30 Jul 2025 14:18:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b73f14178sm973838e87.80.2025.07.30.14.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 14:18:37 -0700 (PDT)
Date: Thu, 31 Jul 2025 00:18:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Heidelberg <david@ixit.cz>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2 RESEND] drm: bridge: Add support for Solomon
 SSD2825 RGB/DSI bridge
Message-ID: <p4svegtwyrjdcmq75d5qh55f3g4632sgwzontrp4adcvrs32m4@v3x3fvhncshd>
References: <20250730055424.6718-1-clamor95@gmail.com>
 <20250730055424.6718-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730055424.6718-3-clamor95@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE1NiBTYWx0ZWRfX7vRkDbReZv+E
 QiqaequE3wihmUeiMzVzrOp6jT2JEAUxsexojHzL5OiJJXmGGg0p5U+RVRqWjfF8XNP61sXeRkA
 BpG0t8IAXu3KLSWlTWVGwNGfVnEHhAdgO1uSIu+m5+cv/lqxP5x4TLU0slbbto7O+ft8pso8sFT
 bJ8jQ6arowO8Gh9r+yOxIt6W2y1u1HQkMoMUYacgGOCIofYSTcj32MXRhpsPM7JzzLKV7LA3KZh
 plK9qEp9Q6tPf7OYTn+uD4SHboW5BYI1Sl8a0kFiT043DA5eOTmdhRQc891ll/XUdAzs6l8KfHp
 550qLtxGcO2ftQYfP7JmusMHC2PHYVTslSx5MtPGT5ktrhKY+VnrwrJqJa+nZMlW55S1BUwW+rV
 SBrChU2e7FG2msN6sdMksCSJH53b49ddf56lmXsqwfTrJoqB1D0vtI7TM4+hODwvWY9+zXB0
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688a8c30 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=73frPc2hRq-d4gq3JOcA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: AlZSQ0q_GXDt3olFiDpHraaVMDUnMON8
X-Proofpoint-GUID: AlZSQ0q_GXDt3olFiDpHraaVMDUnMON8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=829 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300156
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

On Wed, Jul 30, 2025 at 08:54:24AM +0300, Svyatoslav Ryhel wrote:
> SSD2825 is a cost-effective MIPI Bridge Chip solution targeting mainly
> smartphones. It can convert 24bit RGB interface into 4-lane MIPI-DSI
> interface to drive display modules of up to 800 x 1366, while supporting
> AMOLED, a-si LCD or LTPS panel technologies for smartphone applications.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  13 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c | 775 +++++++++++++++++++++++++++++++
>  3 files changed, 789 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
