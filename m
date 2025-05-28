Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1BAC67D4
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 12:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6F510E5EA;
	Wed, 28 May 2025 10:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLqBDXLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B733F10E5E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:55:39 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1wtSk006866
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=; b=WLqBDXLaETrREYPP
 k3bqTgo4rPOev8L1bg2YP3zUKL3ZKb/ZbYk2aOckQdMkBvCDvDHTPbAK0IhR7Wjv
 12r5wFXgoAWjAYkw74SbYE+gmbpqy29x+7rpmMgEm8WCZyASVPYsO6vxBdYVsYsg
 P4+BgsYx9M5+a/I/xK+XplgbelC1Jxf365V3AIK6OTFyZpKSRusIKbJ4S4HmWsTt
 0gtsHWF3imOnvSr9sHhysmwT4MkLWmAvXSE2jGkGzbBBkuXpKVh9qjJXwo3/r3s7
 5uLyOjv1bGFclk/VO6rcG/LGayxuaz3O1JC4IIzV+UlafMX9BvVP/6bYQqL4mxuj
 X3b5uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek1v5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:55:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6faad1c56b9so51333816d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 03:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748429738; x=1749034538;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2GBHIa4UJXy3kvJwaMsOIp36AT4ZgsNjCHuBmMnsGGw=;
 b=O7PY1Lb1/2tMi+wkvsUxjxl7hcvtkCQ6B02kMXLcQtXMv1W3m6SA3xq8KKchKMEsJl
 eq6cekEZL4tIKcx4B47HBaPrEIPNIxNjoodsjdjA8lrJ9ciUT+mc+jxLEYMbeyPrHkPW
 ep8Ft3fg4upjDyYJQYKMmMokjy+pxmdH5kor5z3cNZL9sj8rK3JTNrGy1EQgtPSHFoj0
 hNveMjnHOvdGDJzZ45na81X8mfoLkSuOo5qBNdpon7leUpGBn8hP1jSjncRhUVxkPhaV
 aNWYK9n229ETZuXOIOpNFriDyW/BFAxVTZ4q5qstMVxbrZn5WFTwq0Bhh2FkuddAbtfm
 1Ixg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEK9Euqck4bvTQ8HS+q5PVzuAZedbPOPlVnGGio8EBMltKlnGLCDCLVY8Zb2z3LmuxEVPaNxM0Dg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylNqcCiHZ50dvjx/vtMG2WxMfAg5VEAcM/JtOzVIjdg3+xcdYl
 4EKhTjtgwA8kzgyWpQQ7n20fyuG2m484NaTzYqebLaPb16MgpGmRDW/2F1jG/MQeVtOVoydboQW
 MBayN8rBIGUUHoJ8s3Am3jPEzmmw/qPzxC7f5ufOBzG4c+p5nS8PTEqv4ShXEPRksEbCOADM=
X-Gm-Gg: ASbGncuslCAUOE2fgY0jj5uFzZOdmoynNXolZnmxtLjBjiXq2CUDoKbCkHLdTZpG4yb
 RyUqfwCqrblIKzeIe/KRDLHnHLpEqwXkZ7on08XsUe8wY6J4TLqu+F2G7HF7FKH8aVkV36aHNCE
 DsK2ltpXCXr7mK08PX+yJ3r/0BdZp+9jOLSy/JlpaDCmQziZrEZQlc7du2psRMv1/THZEySZMIj
 Yav15HoAHVZHIzDivisuOMvmeAwdOdynRhqCsUa6CRKKTOAru5KApyt8DrhEPjTT6qK5guSc+U+
 zaHDUCZxYFRTq5MYiO4GW+lvK37JVKJRPp61aAUvRLrmfnsDJcyV1OwxzXKigEEGwl+NJtLPGVA
 =
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id
 6a1803df08f44-6fa9d01b876mr219767856d6.12.1748429737675; 
 Wed, 28 May 2025 03:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHTeW9Oym5KrU5w2CrN6TuqbEYXZSVkhfiP2M2uzBIJxVS46ac7MVbRXMxqQkY4kvIlFReMQ==
X-Received: by 2002:a05:6214:f04:b0:6f9:51b5:45b4 with SMTP id
 6a1803df08f44-6fa9d01b876mr219767476d6.12.1748429737194; 
 Wed, 28 May 2025 03:55:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f62b2e8sm233345e87.96.2025.05.28.03.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:55:36 -0700 (PDT)
Date: Wed, 28 May 2025 13:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4] drm/bridge: tc358767: convert to
 devm_drm_bridge_alloc() API
Message-ID: <y262e67gi5f53objugljkpyc3lzdaqtw3b7qr4546btqo7ehu4@qp2orsf6xd7t>
References: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com>
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6836ebaa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=Xa5mcPTA7YjQpW6brCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: eZtma5__eUjiyQyVseg8s9MAby0LuqDC
X-Proofpoint-GUID: eZtma5__eUjiyQyVseg8s9MAby0LuqDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NSBTYWx0ZWRfXzHqsHuP2tR8H
 1F1cpYJ7E+kf5y40SUHLEKvbIAB4AlDJRklijEVdoGZEVbBS7w/gwLXhF6qtb9buFiXvr0FCsQq
 FPiA12H1Vekv3EPYtkLAh28/8gq+vXowoUmtKXrmfeLyQz1GL3N+oV7AF9PXHmhA9FN2zUpHqXg
 fad4j2XbfpgSR6WpRkl7Nz78kcPPoTRK1GIbacTKQkfQk0clVHPEnTNxTnW3KMqQPEJg86u9fmT
 S4oMIy/qVXI2I+zABg2fNug8G7fXL/NGczNRN4qCWCUuRq3qfNZrMXaHzl21N0ddExEBAt3EYZ5
 ACy6r7jf0EKEOgkXOuuzEeCeqjTxejz5Wt+peIbBCQaBcWowYwlWXYHtJX/S1reahOq7jGiU95+
 UUCUWdSjofr8oe0y2BUn4jeDs9JbGKphL13EwHqKU0HFrcMgukwPlj4n7P0c17IMfu/eoTga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280095
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

On Wed, May 28, 2025 at 11:29:36AM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Converting this driver is a bit complex because the drm_bridge funcs
> pointer differs based on the bridge mode. So the current code does:
> 
>  * tc_probe()
>    * devm_kzalloc() private struct embedding drm_bridge
>    * call tc_probe_bridge_endpoint() which
>      * parses DT description into struct fields
>      * computes the mode
>      * calls different bridge init functions based on the mode
>        * each sets a different bridge.funcs pointer
> 
> The new API expects the funcs pointer to be known at alloc time, which does
> not fit in the current code structure.
> 
> Solve this by splitting tc_probe_bridge_endpoint() in two functions:
> 
>  * tc_probe_get_mode(), computing the mode without needing the private
>    driver structure
>  * tc_probe_bridge_endpoint(), only initializing the endpoints
> 
> So now the mode is known before allocation and so
> is the funcs pointer, while all other operations are still happening after
> allocation, directly into the private struct data, as they used to.
> 
> The new code flow is:
> 
>  * tc_probe()
>    * tc_probe_get_mode()
>      * parses DT description
>      * computes and returns the mode
>    * based onf the mode, pick the funcs pointer
>    * devm_drm_bridfge_alloc(..., funcs)
>    * call tc_probe_bridge_endpoint() which
>      * calls different bridge init functions based on the mode
>        * these don't set the funcs pointer, it was done by _alloc
> 
> This solution is chosen to minimize the changes in the driver logical code
> flow. The drawback is we now iterate twice over the endpoints during probe.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> bridge, and the only one supported from now on. It is the first milestone
> towards removal of bridges from a still existing DRM pipeline without
> use-after-free.
> 
> The steps in the grand plan [1] are:
> 
>  1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>  2. handle gracefully atomic updates during bridge removal
>  3. avoid DSI host drivers to have dangling pointers to DSI devices
>  4. finish the hotplug bridge work, removing the "always-disconnected"
>     connector, moving code to the core and potentially removing the
>     hotplug-bridge itself (this needs to be clarified as points 1-3 are
>     developed)
> 
> This series is part of step 1 of the grand plan.
> 
> Current tasks in step 1 of the grand plan:
> 
>  A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
>  B. ➜ convert all bridge drivers to new API (this series)
>  C. … documentation, kunit tests (v1 under discussion)
>  D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
>  E. after (B), convert accessors; this is a large work and can be done
>     in chunks
>  F. debugfs improvements
> 
> More info about this series in the v2 cover [2].
> 
> Luca
> 
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
> [1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
> [2] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com/
> ---
> Changes in v4:
> - Removed patches already in drm-misc-next -> only 1 left
> - Improve commit message of patch 1
> - Link to v3: https://lore.kernel.org/all/20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com/
> 
> Changes in v3:
> - Fixed issues reported for some patches
> - Added review tags
> - Removed patches that have been applied
> - Added revert for the exynos patch, applied by mistake
> - Update cover with grand plan info and trim some of it
> - Updated bouncing e-mail address in Cc list
> - Link to v2: https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com/
> 
> Changes in v2:
> - Improved cover letter with link to commit adding devm_drm_bridge_alloc()
> - add review tags
> - fix bugs in zynqmp, vc4 patches
> - fix patch 1 error code checking
> - Link to v1: https://lore.kernel.org/r/20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
