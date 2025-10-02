Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B5BB2904
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FB710E785;
	Thu,  2 Oct 2025 05:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIwqQBCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91C910E785
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 05:52:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic3ue017795
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 05:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WdABpfF7OkNfgDykEBK+TNid
 8dXX225sHpffd9eNLq8=; b=WIwqQBCokKCgNxQ3pI5lNTJaNOkRiWOC0T7idosG
 3A8ZMrvk6RGRfkgz9a7z/v4r+H5jnsw8rcvfQH12372nqpQ6xiIWJjUhA7vi0Cfn
 h9vWM8jyIbUJYLuUlpUnMtXWW0ebSXuCeawqSBqNaES8gCIPb/t4sqZgWDS2POYl
 gRLnD04bkekDvgGv/ZbU8W0yDfYg22BJoga+CZ0f8AA8iiAvGAijgbKtPP+UjzEw
 MiMUGWWsH4fNPIvjYwQcyrD+ZAjAam8ZpdAcYOgYbbwbsmWhRy0UHSFbMCuzw8aB
 HbK6H//2ubOI2fS1z7EobRVKS/PoJ9ol/j5Omai3Uhd+Iw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf8cqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:52:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4df60ea7a1bso14345301cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 22:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759384326; x=1759989126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdABpfF7OkNfgDykEBK+TNid8dXX225sHpffd9eNLq8=;
 b=wIQ9WwdDJURz21n/0ToZxD1F88nVXT9l3dFXWc8osOM7FnuhRbFic2mMUe2EeT5hGW
 MyKTyS9UUmUiq8i7BwR0XQhc3Jsi9ONu3rQsda6CF7dnkIep+NII1b2gL/LPypJZpNXV
 rf3Z9VTt6suj540tSjSdjSYX5tngTrHM/4ZHxJeLW2j/Ou3K2A80Zxi8hYsb9A0mvptg
 TCyecaReW47bRONHzJnU/w+apsvqq/+3B164QHZ2OCniMkufVjSq0ds2CcNvz7hsmcbS
 FHeLANyIwxuN2iKDmaYKltyAiEHZ0TqvHbsI22cQauttU2kpkaEEb+agBL35i7xtg1vk
 Y64A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6HcsbSdsZNwUqG/Runp2pfe67QEid7YqJbwmPJWgTWVVq3yg3dErtKnhrfe0zIqbDfJBYMQSGXO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmSC/zUOIWLcv0AhsKf36+xHjx7t7vH1VcW4IcdFsdPlkXu8uT
 e9cmk6EvsO9rZN0snj4wVPxYimCXgb3nN8Q2zrY7nlcDfIPAn3plky6b/+j7azyF80c1ed6Q9J4
 syvzHDgvbqVTH6ZunPz9zt32l2udF3jf1PliHNnRybjYXC+UfUmgJlvQ6wLAAEWSyZuyLtCU=
X-Gm-Gg: ASbGncvGhi7JVkLj8KA9xb0mun0z9Em8butLKr5kQMNIRKayniuiiPbSdHerr1JhVHr
 1vCxa2wXPPl+HUcco5oLuuWTaQ0LZ1Eol1wmrrwygXV7y5WTo6n4rxHjDiQRxoRzdTAAZ8s98rK
 9iLX35OsqmWs96vreq8p/YZHa/r8CgpLR8bbN0fJ7rBJB/qQAuCAnGXs8irXfSJ7dfWsMA4Cqu/
 YeuMdW15FjOdF+B7wH82SJNtZxODFo7cInI3m3ghAPBIoCbvFY+BD0LYNGRv8Sl/sC4rDpOpjga
 5CRFGjlHXspPTSUlu892ozHvyENQskWA52WFmod3rv3++jX5EyhAWN70fYfV04NMttwt/2861qV
 JWkGn6tj1htkTJxr764K49qNFyNVVM6NAx6ukWGrGsZF3HfIQ8HOHp5hIjQ==
X-Received: by 2002:ac8:4750:0:b0:4d8:afdb:1266 with SMTP id
 d75a77b69052e-4e41e15df2dmr63014361cf.45.1759384325993; 
 Wed, 01 Oct 2025 22:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7M3wajxRbMA9ybuJM3HAEueisvDG+vjhfv/Zrn+Q6Om5w1ydX1jy3VPsPX7ig1Lr6pViCDQ==
X-Received: by 2002:ac8:4750:0:b0:4d8:afdb:1266 with SMTP id
 d75a77b69052e-4e41e15df2dmr63014071cf.45.1759384325457; 
 Wed, 01 Oct 2025 22:52:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b01194e59sm523439e87.75.2025.10.01.22.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 22:52:04 -0700 (PDT)
Date: Thu, 2 Oct 2025 08:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v6 01/11] drm/fourcc: Add warning for bad bpp
Message-ID: <vj3budjobsehi3hl2mcmondt2f4giups6cxeiraeo2ensgw3du@smxivopyzfez>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
 <20251001-xilinx-formats-v6-1-014b076b542a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-xilinx-formats-v6-1-014b076b542a@ideasonboard.com>
X-Proofpoint-ORIG-GUID: rxgdBslwbII0NpV8feUUeTI1dfiz2trR
X-Proofpoint-GUID: rxgdBslwbII0NpV8feUUeTI1dfiz2trR
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68de1306 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=iDPJBouE--3TGtnIlUQA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXwyYMCktXNrDU
 aU5yAS9fr9WefSRSs0a9q4w5yNbdPgfulUHhC2Gjmdq0mMTD6rLyIz/z0+OZ17OQ01bhkvjedqX
 FesciC69EEOXHLiw7khFxV6/Gt/MYH84aTv+4ols50nlIcWrdAAFSg/TjIuQdFgb2Xok9dfWesS
 F9FIs0GrdJNz78vY0RsTyrj4iQG8iqcsXvF1cYFwmDcETfG2ZQ7xEF/sBMrDFoET6otX6NQkpxu
 h/xW5mNpMFHGtDadh3C7inLEID4QUbZ7pl2UqzYyCJ5rGcQ6RgFIJQNDHIgHSrjlTZsAz4UuodA
 Nf5k92n44Sg8dA/gAE2Q88OdRSA6OtvnFhDBhWEyeV0R/bFjdS2rxwv0VbCo3/S3BWrSA1Oyngc
 nJFz4TR8s92JSlQwm0zYHM8wFlgr1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Wed, Oct 01, 2025 at 04:22:13PM +0300, Tomi Valkeinen wrote:
> drm_format_info_bpp() cannot be used for formats which do not have an
> integer bits-per-pixel in a pixel block.
> 
> E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
> pixels (Y components), and two padding bits, in a 4 byte block. That is
> 10.666... bits per pixel when considering the whole 4 byte block, which
> is what drm_format_info_bpp() does. Thus a driver that supports such
> formats cannot use drm_format_info_bpp(),
> 
> It is a driver bug if this happens, but so handle wrong calls by
> printing a warning and returning 0.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
