Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0CBBCF847
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 18:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302DA10E08B;
	Sat, 11 Oct 2025 16:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FMLfauyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143710E08B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:22:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BEomev021319
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g8FFHOPe9WZ0qfEDRJQ4s+Em
 qP5GvoOF3Cid2qQ3DFk=; b=FMLfauyvLPAMdTLUCHawYF3KQUCKFw1arN700rQz
 HFia4AXyBMSSSrpWAr+/6NSvwHPDmFLF/oBqsSTa6lcAyFOQHoddNdUdnX8tvQR0
 OrBnwH5KYkGY+++9HmOboyFhGez8Ifh1yReKD7xOE9Mrw0ojGR7XIphEpjYwv/xH
 hV7zW9jsSetAGVnmOMthRiJSknAvJBpLFOdA/kId/Q0FBEEZXLxa7Fm2ZET96dTT
 xOIq4BUroCiBmvdM1IFTuvoVXNz3fE5FnlFdb+fOWf6EvNFOKyXwMF/LcZ4vzFa6
 KX81UoxpOUjJl0bGeiMW0EWlCAGxbIyPJ6kd/dDJKDLMKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa80wet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 16:22:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8715f5037beso1566356185a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 09:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760199720; x=1760804520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8FFHOPe9WZ0qfEDRJQ4s+EmqP5GvoOF3Cid2qQ3DFk=;
 b=VWS/WSn6wHpaxm4HjkqZAYSRjhuerfQtKCJpPQRIwQzbkfiu+tGa6b3PQb8E2R+fre
 +I8nYd0B/AETJlTsPWWdfOduMSl1TuX6uNfzRxQkH5CI+n3L7yvYDx1r6cAmpiQzciNq
 8nhRzDC6YbWUx3T1uSUkpQI2UZRYGNJFhNFYwed+45SCKN8svZKRW+ymP+eVDHRU9U68
 IyiEvvlRaz9fWmMHycARuqww7ajkVlfW9mtqPpODDU4DOzXDbCduFD1uogjUQO/C6KIe
 +wOcTUO0XSgZWlQbOLaqRGDv6CMRWTHrcZtamTT4nQ2CaWIFzruEyrEGeLm9gqN3XU5h
 sJTQ==
X-Gm-Message-State: AOJu0Yx1Dzt15k+BGWZYg4k0N4D3dnFKpNKZJoG4QT3QMfDwHsR+D4GC
 3pVj1OhY2LaDdc0n9Fl40aicktuOpogaLH8S56WA0EcCCX1+JcR79xVJ5ZlY+1MXJO+zcz9UVTJ
 gAWK6bfglNPSciwtDNqCBiUUQkLSRO6To38NiKGvzSVXm9FXlJZFlYbn5JDYEnUGa8NK441A=
X-Gm-Gg: ASbGncspL/zvRaTEnxIghJXpbl0ao+y02Snsf5hxnh8AlPvZJmJe7UUUffZCt7sVDc3
 +vF+hhV2DqsZ0lY1oN77JaFy2u6Me5SMFwLvOro2jReHevzrprfwSt+hCFUiJz4SrtbBFMFIZjE
 g3PovXy9vlWQU5kBrslzE9hxAPmummB8lo7WvbTeZM7ZKrE8D7LKQbFHpqK5JW1xLvMcRYSuoJE
 PsKpqUEQSkcs/9OcTf4v7+WQmN0tC5/tuj2VAFHQKo6VeoFHYq147vHChFJgjqDayMoPxMylp2c
 TCSD90FaN7prCqlp5J+Rty0fYLA9YcgUepoFYYE9F4miLllFSF5l/rr/cdV8WtHuDNepme2xYGs
 ilLXx/qlIkDz5dT4xCNMJqfDEVaUNQzHJDJxJN3HII04biHyM4y9U
X-Received: by 2002:a05:620a:178b:b0:857:82f:baf1 with SMTP id
 af79cd13be357-88354ea76d4mr2288479485a.41.1760199720552; 
 Sat, 11 Oct 2025 09:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMIiofGBSU0RdNKFge6LmV+r/Eyul+acpIzJv3v86Lmfj2bEPzd0LpxRs5pSdc7dbXWfgojQ==
X-Received: by 2002:a05:620a:178b:b0:857:82f:baf1 with SMTP id
 af79cd13be357-88354ea76d4mr2288475685a.41.1760199720095; 
 Sat, 11 Oct 2025 09:22:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7b4cc4sm15171841fa.18.2025.10.11.09.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 09:21:58 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:21:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: lt9211: Drop check for last nibble of
 version register
Message-ID: <dbpmx272tgpx2px27lrfusxzycyftedk3njmwuc4ggrql5rten@lcghetnxvfn5>
References: <20251011110017.12521-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011110017.12521-1-marek.vasut@mailbox.org>
X-Proofpoint-GUID: C3lFUfhAriqi4LxT1c4j8s0zJbPkG4BT
X-Proofpoint-ORIG-GUID: C3lFUfhAriqi4LxT1c4j8s0zJbPkG4BT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX/pWdeTjC96v0
 8mMNqMgQbwyWP0p5sNOlsuK/p6YDnUZTDkqJF64pFPjzEpZ/dwITyyQ4pOgNZnVEWiEZPKaHQ7C
 Tyyrs5e6gtZ+xb1qsvf1G2B/2/4xraaXjCxGKLtsNt6qfivq3bZnQqY2IUcX1V58tw9jiLoiRCT
 ZM1e4+pwbzHNnwreW8TvkUFidoMJBsztl1VtB+843Z5VEnA0XfjHBPM20Of8LMRNOAy9tYOR+O/
 s5KUQcQ4stLMFWlsA/OT6aDE7OK7R5xiqErBgTLOJfId9vg/plzalNbW2PuY/ZHFjV75IGYS4ts
 Ty2A2nF1McGF7aFfduimMRk8n9zqs+rUsIdCDMyd46auD45eyXMZkRMYVgsKQQkor5hxt4OhE8r
 w9GwuxLNgPCfMFMdLmNqGFZAgQ1wFQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ea8429 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=b3CbU_ItAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=mBvL99Qz1nDROh_LWmsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=D0XLA9XvdZm18NrgonBM:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On Sat, Oct 11, 2025 at 12:59:53PM +0200, Marek Vasut wrote:
> There is now a new LT9211 rev. U5, which reports chip ID 0x18 0x01 0xe4 .
> The previous LT9211 reported chip ID 0x18 0x01 0xe3 , which is what the
> driver checks for right now. Since there is a possibility there will be
> yet another revision of the LT9211 in the future, drop the last version
> nibble check to allow all future revisions of the chip to work with this
> driver.
> 
> This fix makes LT9211 rev. U5 work with this driver.
> 
> Fixes: 8ce4129e3de4 ("drm/bridge: lt9211: Add Lontium LT9211 bridge driver")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/lontium-lt9211.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
