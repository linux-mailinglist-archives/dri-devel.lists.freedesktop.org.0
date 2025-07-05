Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE1AFA13F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 21:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656810E100;
	Sat,  5 Jul 2025 19:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4262PbB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB310E100
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 19:03:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565HSHI8004830
 for <dri-devel@lists.freedesktop.org>; Sat, 5 Jul 2025 19:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GbeLfqtbM84GigusBY9E85yZ
 ET2t+I54GGzPiTHuUK8=; b=X4262PbBT0ocS+G1VzLtUvvO6QeTriYKsQ7KM6Gl
 a3/Fp1XauDYfMEYw+cIIH+0GRaRFDS7OQ7oFR0+pbUpB4ju2BqdzCog51Et74914
 4HcGXKQnqP/5XDoOeXWxJddBafY4mxgBKnFAZFszy6B2BlO1kfR9VIE/nJoDATpt
 HEyYlIu3uwcFn71ZYfG54yWQKMAwIVvdl9JUD5f6Fp8ave1iVz7xoO1jb1sVUGuo
 5bHfs/pr8+/xOfb/n5D+I3DByTwemsYT64Qrte3vcMiS/57yYNcSKizeTNYAFSCR
 JVFVhX8tpqnFmY2AMeCqiznGGxtSSfrKs/glJ4vdZDfXjg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x9um5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 19:03:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d3f0958112so264850785a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 12:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751742194; x=1752346994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbeLfqtbM84GigusBY9E85yZET2t+I54GGzPiTHuUK8=;
 b=lRUlf8fASBkmbuoOB9/Rtll8rFJjh126Lg5xzIzgx5rbkt7Lj+TJjjWC4FIRHBJZFJ
 Kq7F6EDBl41ZuXyqNAJ5wayiaPFFkRffYc1ns2S0U9oNio9zjzuewYY0BYDFrURVSGA9
 DPT+Enb2WM/OUfDOQYTCuSWVWM1p7AvNNzA0Lt/itxXuAEPigWiUDdzhz8+pR86mjDlV
 kLgps3dxowvmu4FJJr9BBJ6NrHltELEmCP4UhvB5QAgppSKY47EGsHWjLmEeK8XlqThe
 Rptueq9XPBpd62f6zj0HW9LJmPf960ZT4Akro+PTvyCU3ogP0aEeVlSNRpB8PLjGFXNk
 xQNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyseTS/FuIMZV6xQM4ZhecE97miRbzOPlL6kNdzQbUzY1hnICxl8/PFv2BWoJrmO9Xu5KsEhv/XXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztnLCRukMGY48xWcmtVnjbgl8Ar6hxa/PVfoZXYqKzGEdBFSPC
 cFh4K2jhbCO6YMlSElE0GwRcZim/Bg7p1kY75b0JRI1d6uDidh1UKQyW3hl8tvEllPvvAjmLmPC
 LDrX+i66+h30GAhQys0cv0pGN7Rmc0s34vu0ppGp+iLsuDX6j3CDT5wOYtmij2cJ/2r03xHE=
X-Gm-Gg: ASbGncueTv7hNp+EfEpSmpNZ2H7PO5sxMWXTZaz7YIH6byTV2iFsR++xCv+HkxOU/Rq
 3HDwpYqshvK/kk+HlUQyKeDrMG9BymmeGmwFSJHTgPDHa4tF/cuVIfmEcQ0UaEDzk4ENiapOcMS
 BkHuykO0nCs2eVJw6465Wzaot7ONx0sN0WVoVXQX2JsYAJNFca87dUDI2ht6L3eqTNQk/GeGUJO
 NjtbfF/SlQ2Zk8HZWmZW3SINnN9hGiHMjkDBcZ7rclsfuO7ek4GZUMxUa/mALHeLi+yChT+VSPz
 4wWK5jgBPSjiEoNvoMAp6TrVfTOC9iqrbz/5Xrlfm29Q2A7KNgKCk1kVEwzj/aeN1HxdbntG+YW
 T3wAxlVwIs5wzBLwQYhX9g0FvyjApvR59P+4=
X-Received: by 2002:a05:620a:1b96:b0:7d4:4abb:908f with SMTP id
 af79cd13be357-7d5f2f3f5fbmr408995885a.42.1751742194460; 
 Sat, 05 Jul 2025 12:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcvtS4mI2BDeyqNJVRJsTnuleGJAXLklqYBVVRwEGb4WyHXNKOFHugdKts46+FzAjULo25pw==
X-Received: by 2002:a05:620a:1b96:b0:7d4:4abb:908f with SMTP id
 af79cd13be357-7d5f2f3f5fbmr408991985a.42.1751742193996; 
 Sat, 05 Jul 2025 12:03:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c18d3sm658991e87.212.2025.07.05.12.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 12:03:13 -0700 (PDT)
Date: Sat, 5 Jul 2025 22:03:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
Message-ID: <d2a4ixu6xjcltjylv5c43gkzksbr2n4cqhw4x6tljaph77is7q@mdlp7fhoms26>
References: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfX23KaItLW1nGE
 4j38zafis2ZBo2wafAWyhq0Jf2xbDCuuFXEpa0OGIcZ+IA2PbhpSYJftY9glRe4PXAUYt6Mde/h
 wfvTtKlZGHS4Dd5fhcCUwnFIqbBqFGkAUQ4/EV1+cp/wscfUu94Y0lphkPvWZ5DK0lrJWbg3p3r
 N1A+PHCN29fyaiBzUbVLsUmaZld1m5dLzTsLzgMXnjojDXd/ukHMnFEJQBQjqMOC2RhM1QoqXNi
 FOM8DVVQG6At7LC/al3bqiIgPbCUB7ITpwbaE3cWelXPA4qFT3VPuIUS+Q2r+6Ybj5vR9OQWNog
 YLBTQxr/kKBC5atNe68KIO2z4HP0gDx8CYL8X/hMCMzGrXHAyaoBJpUXTaDFrPKEh7UXnBTLmLk
 wvEfJ1xxJ7xQDkGTIcK0kmZyGOXoilloYJ+b4D4p/na8ICIF7hEuZ2thxiYYH1LUX+9iSdjC
X-Proofpoint-ORIG-GUID: cn5uO4Qso_dALNClbCvthJSwuZSh1Yl3
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686976f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=1kJDpHXNGl3mU_r8nRYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: cn5uO4Qso_dALNClbCvthJSwuZSh1Yl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125
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

On Fri, Jul 04, 2025 at 02:52:54PM +0300, Cristian Ciocaltea wrote:
> When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
> CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
> expected to fail with -EINVAL.  That is because all required audio (or
> CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.
> 
> Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
> ops only when the aforementioned kernel config options have been
> enabled.
> 
> Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
