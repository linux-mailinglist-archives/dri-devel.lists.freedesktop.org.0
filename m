Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1AB44740
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B75B10E08D;
	Thu,  4 Sep 2025 20:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqHSy9Tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30310E08D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:24:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HeQxi032207
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 20:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eElUMenQajMKFKHmEfgJg4SM
 sc0hDo+dAtFtkPy6FKg=; b=BqHSy9TwmUNCS+2hyRbQjKWBBAcxa2ubVOWxnBWK
 7gZoHSE4hu1kNDYv8vSqmVAuE9uvfW8FN2phAzBrLQZwSijnaDeoEDsFPA2ZZvTd
 E5yj7RgFs90Px/bbyJCXRBPf1LIpYbjBLgubBoy894iE0FLkatBREyRMgDNijktO
 K5K3rGvwmrBe/ZlPHYn3A+L99jAb7enbznYqflBWukpo85QPYxwMvEWvCDs7SBWq
 5KbBHrNZOMeWZo7j96s600VmuUNlhSVecattxn4zCirDAUBjZ2hvNfXuj8aJ6Fcc
 OEgH7+GduPwKurE4A4lpx0QREynnMJkWiKrgQBht9ijeyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpgygh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:24:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-720408622c3so21359646d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757017451; x=1757622251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eElUMenQajMKFKHmEfgJg4SMsc0hDo+dAtFtkPy6FKg=;
 b=xIbwYFM29j2uQqmdxC3+hKihgaUm5cfk5yTPFw2D12VJb9JZhgtllqd/mc9Ik9eSeP
 uevAq34tgEOtmNWKCxrSgw/p9OJzlqkEd1wvj3tFxDNvWpP3dZ1CSDPOptOX4VdiQvfG
 hrPPH/UhSKL2Z90CwyUTNGCGpQ4Dqmr05UtyPMIjZuma7sK5LMHibt29dOFLrcD5RgcO
 lWX611s6loFfD2eSaS9eoiyGsOM7YV98WHdnWUnqE92/BTnWvYGtR6p6EboxZ/CYUqFy
 nXqYskzTLDG0v6iknC3eEJj5ms/B5/K3rNCMP0ioCvk1vLu13N4VukFh8No3RCzG45S4
 EXMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPULYjawt5Z2aPSHDoSyNbMhokzjfgiyNp1EzAAP1po3Hthf2kAj+xHXUabp7gh7DA9JtXqyedo3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEbsl7+OZlFSpqNSR9Tiw0doBSA4hAIk4EFvo3picvcAzDGWiV
 12/+oHS9RnQru3yxXad/EErWWzIF0vypeJ+NA3D5wNVOsWJL5neoxAe9vlWbuSW5tzCoXqM3jG+
 4PfUH+Z2ASbvYCVseIHu/EUarQq+eO4P8e9hlyAMoYch6YiXRk1f1IMzhn46P1OOIpJPvN50=
X-Gm-Gg: ASbGncs8TzCFsDWPYPVUtgTpLH7MRKVX9PzpnbdkEgD8+kDjPGOOeTPmY0BcIyMIYOa
 CilX7HgOrnA/SaOVZ+cOtcWKwDqRwZeyfDcK12bmJTddaHOjG2ArFyuBC8h6UL3UP1I5SdGEmuA
 ClV0tbSR+FwKS/+Ox2LGE3dToHVLknfHqrWCtQnMSZn2E1eHo6S9ln5KSF2lebFNHUPPFsyTepi
 8bfluKc/XjWhMO1Ii57cbt4IIk+1q9L9nzaan/xwWcQ7M9kHb4tz+qxb2rfZXgPviUFPV24s3s9
 kLKhtpesHLBOUeGPWguBuQ33L8Rb8rtY6rOeKnpwBKAO1MgOh7ta7J2EYFoGAcRQaPQDPNb5Wpq
 SZsvjEWEhmEJ7C50+ND0KstSIlAFbgBcQysHZEkb6qkpED37nowKc
X-Received: by 2002:a05:6214:400c:b0:70d:fd01:992d with SMTP id
 6a1803df08f44-70fac73d452mr234244906d6.16.1757017450929; 
 Thu, 04 Sep 2025 13:24:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEOYSlodY7ZwXlWkX917XlXU/4KfFSD9zZ55jDeSqB3xRKphER8n42jI5hC2HlLwTZYFa5kw==
X-Received: by 2002:a05:6214:400c:b0:70d:fd01:992d with SMTP id
 6a1803df08f44-70fac73d452mr234244476d6.16.1757017450284; 
 Thu, 04 Sep 2025 13:24:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad121acsm1370936e87.118.2025.09.04.13.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:24:09 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:24:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Devarsh Thakkar <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Select VIDEOMODE_HELPERS
Message-ID: <pbtpeuu2t6iwlhyszf4utsjg5jgx7aawoisuitszbeww2xb5hn@revzgv5mfhgr>
References: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-cdns-videohelpers-v1-1-853e021908cf@kernel.org>
X-Proofpoint-GUID: 13-jswO3W7Y9KgL5J56adtv-s3YYnVdU
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b9f56b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GyFj89KpxmL9ovfeiVUA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 13-jswO3W7Y9KgL5J56adtv-s3YYnVdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXwS2kpgS162Bh
 3ThkCRwK9zHK0druBwqMlxMCm0y79rXuzCV2JUwzmQs//ZC4koXu/2i3Iy62yeVf3VvyMSO45Cm
 Pet30e+HLv9bJTklIO8wMTktpuS2OxZ9jbQj0cKU4sn3weerDQAhcxWLEtIEHbHHVhaLr5c3fCa
 aEF4mRJUTxu8ccYaalQSCaj/slcyrGIOUv0mQGOBrEZtQ2Ip1OefHIfUfIiRFvy1r26RPq6dVH7
 otHyKENwN+60wDrK263/gk1U73Sc5MLf189aiR64b6NUJGMIIgkhFfQlXQUfkIg4Y294nIWpWSI
 lfygigMhahGAEp7JIPTPQQVs465EV8izUvW464eFvs8nAY0spvyUjHA/+vPNSbKTG0y4tUykroS
 2mcwBtWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Thu, Aug 21, 2025 at 01:52:12PM -0700, Nathan Chancellor wrote:
> When no other driver selects CONFIG_VIDEOMODE_HELPERS but
> CONFIG_DRM_CDNS_DSI is enabled, there is a linker or modpost error:
> 
>   ERROR: modpost: "drm_display_mode_to_videomode" [drivers/gpu/drm/bridge/cadence/cdns-dsi.ko] undefined!
> 
> Select VIDEOMODE_HELPERS to ensure that this helper function is
> available to the driver.
> 
> Fixes: ce4bc5ca7c1d ("drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/bridge/cadence/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
