Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B188B29038
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 21:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD90310E01F;
	Sat, 16 Aug 2025 19:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV9ycCQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F1910E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:24:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GDS9fU024726
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h9FIIsmv/7ttG/eOuvbCp6ss
 2ccMsfkWjjZLaH87VIg=; b=BV9ycCQZMZA7pVI5vVpfzlDOejNePlKJzrabeD5O
 YIB2H3SWZc0mdXPr8j42QhqvS680Wzmu9N/wUK5PAjtctipmddUd3LAlOXmmHcNW
 E+3P1O1EqQE7IxVDbPgKnaEGI8Vwo5LJlnoUdJFsSYfUxXQnDBUXFe4lFizodd6N
 NFvrrtXnjk/KB8jYbBNU9kdn7Ps8jVx8WTqSmeDSM86tYTPUfLUQl+XTAkd//BvX
 Q8Ec9tQgxHnDCuvilj9BGLO3wPLCG3jaTcUsylOgrRn03KB6yoxgb8gQKfzV7/wg
 o8PBW+BBUXp4H0F9gsGOBhqJto/+W9CdZNuayrv9cSFkRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5m904x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 19:24:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a927f4090so65389146d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 12:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755372244; x=1755977044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9FIIsmv/7ttG/eOuvbCp6ss2ccMsfkWjjZLaH87VIg=;
 b=ln9Ir/GnJz2vvOv0LKLUacns2Yag+HYZdq3W5Kytr1T5TTCC209Pzj7dJx0VWJngMb
 BKiXT0L2NQcFUWfT+0+wojJLu3L9QmfGLBkB2/X3bYtZ3/kK17nfzKL/kNXrVaw36ZqH
 AUkgcEVJ7paeYeok9DTWDN25QrLOiGrzZU7wTXp6FCMnpi+BlSmlXVu+InZPGRb18ICq
 OIgM9d6mZq2jxFrGp82vehkc+9MYADos0KvKbFwaq8L/Ya9E6y2ELNdxDelLfvUEZeAB
 Mp2WqgjYH0CiRw3fybLECZpEoqEuHLMMjAmQWEdncACyhcWjDVo9vArPfE6xRk1uvfZK
 qCQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPNrW/up1EYpqqykXdBa4hANRwGZUJPjbioZr7cwh7OuCGyHzX5BrQzvH2LniqESeFzLeR9hNGER4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBP0bJj0jX5aj+ULqybFvAptDdJIAB4fMrQwBUuKzXr2/PtSeF
 Vs8Rl8AD8i7IJ8HpW3bDRvK/qvMgmFxdgyVIwDMIyW7JOHItxcfB7uW+Yr37cev3nYP/gdXv12U
 Wg4CwQTlzI1dhhLOsB2IuaCw6g8pDpsyS3goGkARlWkIKHh6Ui66VvxasdeZi7KwVG1NAxP0=
X-Gm-Gg: ASbGncveHjJmoRyq5yhud8PnX5TLBnaXsApOD9j9AkhRVUkn0Mu9TbiPrO5Jzb2XAgr
 clB4xxlFiVXApHNWiAOG2gaa0YW4qmTTP6rHa9SSEzT2ZoHFGcWmbACKm3PqzV1G/TWszstFQm1
 SwsUJdG/uPgEjah15qUbsaolGKwE7fn6yHdsOYoKxobc3a90l1HZWwwOGnevwYVXoUXPJ09viV3
 FSA2grQxPDZ4QEUtDquuPWQcwrtoIGTs5v9dFcQ6hu1PCjL2NMvnj3JY/9JpuXLDWGPjt2GzipE
 1TLFXY0nX9g5Xz591RzNK4+BUPydipvrb0fRNvk1avQFQZwbl1yKf4eDxHwB8jgYpfmeFAx0XH1
 b1Xnf0VEEPrU7/0AMVYsgLIFcL5d7bmTqFTIWH73ttoqq6agLjaH/
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id
 6a1803df08f44-70ba7cfedd2mr79180756d6.48.1755372243612; 
 Sat, 16 Aug 2025 12:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1T8GX9d3vlil2IFVf1gPtNRW4ZnXRmzfAHLK1FScZEwKU3dYeX2nuZnKX/AcDL+mnRIH2Q==
X-Received: by 2002:ad4:5c49:0:b0:709:e60f:660f with SMTP id
 6a1803df08f44-70ba7cfedd2mr79180376d6.48.1755372243146; 
 Sat, 16 Aug 2025 12:24:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a60452bsm10851301fa.46.2025.08.16.12.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 12:24:01 -0700 (PDT)
Date: Sat, 16 Aug 2025 22:23:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, afd@ti.com,
 tomi.valkeinen@ideasonboard.com, devarsht@ti.com
Subject: Re: [PATCH V3 2/4] drm/bridge: it66121: Drop ftrace like dev_dbg()
 prints
Message-ID: <bq2x74sityy4gxyrxaytkhtbjunenhwjv7tci73zhxqsoo3u5w@u5w6omfh2uhm>
References: <20250815034105.1276548-1-nm@ti.com>
 <20250815034105.1276548-3-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815034105.1276548-3-nm@ti.com>
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a0dad5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=PazEZd4TbqGcHQaGJ14A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: V761Ir1PuH8GrktHd0njMIBZmYceV31p
X-Proofpoint-GUID: V761Ir1PuH8GrktHd0njMIBZmYceV31p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfXwIQQ+gepO89n
 qLPfMOXq4ipjm67HFn7Y+abPp89Jwj6A5CCeAPFuxB133slHyQJuQAXl/Uv8PDc3R7SfoGyn33U
 0T2WCfQLOr8mHlJ5AFLyjD2dTpBGIXbOjJ/gKszgDnVblaEe8vM6vonqtY7TU8C8uQOiNQQKCOS
 fzB2XIdrtCz6zIk05mzKQE9XhFc0MQJreQ5k2503u88XGHYuHHnoDdc7katjJCJbtmcjarcGzGT
 26tHgh4+q/tR57BBjrajpmtKgYDwVnjUWBhmDL1jpzZghGPoLwMIp+CeSN4zoa1OvTBRiNlDvvw
 8rkX7zHepbEemzgjXcrusLyvzTgGPdP1PYq5LSc2gPGBcV78t4QOF4NiT0WyHqY3Y93lE8Szz/P
 8aD6hgG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
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

On Thu, Aug 14, 2025 at 10:41:03PM -0500, Nishanth Menon wrote:
> Drop the ftrace like dev_dbg() that checkpatch --strict complains about:
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> +	dev_dbg(dev, "%s\n", __func__);
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes in V3:
> * New patch
> 
>  drivers/gpu/drm/bridge/ite-it66121.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
