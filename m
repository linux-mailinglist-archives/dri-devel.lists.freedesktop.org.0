Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC73CD3A6B2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C9110E3E5;
	Mon, 19 Jan 2026 11:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gPIM+59y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6099B10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:23:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7Uk1b2326824; Mon, 19 Jan 2026 11:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=w
 25BmcYuEjY67PUld4Mxhgzp9H4hwdzWF9KGULdGe1s=; b=gPIM+59y2h/YtS+qP
 /gTC1NJ58S/MlNQJHNiUYNCWVvoDDDycICw0ssSfRbBX2KEvjQKVLfvpmNtNmCYo
 k4FzaiGwnJ59+MYwITdvHHkOWhIjH9dWeUNoibXtIvCVPCgDgXroP1YvgG6y6R+p
 pKz2cDr/uFZDxcuNwbWIbpCnfVn1+HykgubULiCWK8Wt94ZI/lW3Zww+5vKUxPqi
 otIsG725ehghUBpqrOtZVvO7LVCagqLg89kS91Rk3wMEYGrcFDdaWp/72h3HohQz
 paDxEH6TsWxOsAvnFTdxbxJJ2BZMVgFMOhKjOoiMqbluPmElXKiL9cMLcyJFy91n
 RsoxA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4br3cv9aus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jan 2026 11:23:29 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.28) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 11:23:28 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Coster
 <matt.coster@imgtec.com>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
Subject: Re: [PATCH 0/6] drm/imagination: Introduce hardware support check
Message-ID: <176882180831.5177.15144617033340003907.b4-ty@imgtec.com>
Date: Mon, 19 Jan 2026 11:23:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.28]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX0LzdYur9RjK3
 Gn2b9wDQsyfRMB04iaHFNyTDrq7b9hIgt0c+HGmLqcrRu54RfWsabuvCzlnMj5v+X4lfOP7j7nS
 MbjRvhLey3q4ZHYXw9wDOUyDG6+HtlY1/UIo1WlpKqOZrfVtVbJvtgP/rywO4ZwWeRccCRu6a7m
 9VqShgZ3cDisZCPRUyetw4yKa3kXmsJX5QqUHITMy+nVfTagrsO6CMVzUV6ldR/Kvh47Mxnudwz
 lu+bS/bwV0+GEzCcrkhImOcLvAEZkUvmS7R1rE5JwBKVfbHZqwdaob917ABMnRrn5N0dVvat9Uz
 53f0VphayZGNF0eQpR3IN9MLH3Kj6GuJIXQt0EkEPB8xqaR3Z9XcS1sjxHZH2ARBGjVOSh4TEdJ
 Tvhv10yIwt//+kXGN2+7ph9aUX7rfuvWlxiq8l1eTTItYNgP2tUCMxyH4MlxUmyDQXDimhpKCnK
 Ew9XrQ/qCfvC009FP0g==
X-Proofpoint-GUID: LZwBx4c_Brkg7x1iopWwJ_cTxpqPFQkI
X-Proofpoint-ORIG-GUID: LZwBx4c_Brkg7x1iopWwJ_cTxpqPFQkI
X-Authority-Analysis: v=2.4 cv=HrN72kTS c=1 sm=1 tr=0 ts=696e1431 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CzDp7rjNS_MA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=3rG1qpFNtWm2xQ7BA1AA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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


On Tue, 13 Jan 2026 10:16:38 +0000, Matt Coster wrote:
> We're seeing an influx of contributions to add support for lots of
> different hardware containing Imagination GPUs, and for that we're
> incredibly grateful.
> 
> Out of an abundance of caution, let's mark anything with intial support
> that isn't yet reasonably widely tested as "experimental".
> 
> [...]

Applied, thanks!

[1/6] drm/imagination: Simplify module parameters
      commit: a331631496a0af9a6f4e7e1860983afd8b1bb013
[2/6] drm/imagination: Validate fw trace group_mask
      commit: c6978643ea1c74c913f925c08ef9bafbdc031a04
[3/6] drm/imagination: Load FW trace config at init
      commit: ee184ab0ffb6cdd20527aa3b3729b824f52d3cd7
[4/6] drm/imagination: Add gpuid module parameter
      commit: 3bf74137340a1ced1566f4f9e9c2f08cba7bdf7c
[5/6] drm/imagination: KUnit test for pvr_gpuid_decode_string()
      commit: 3519e9ea13b49e7b37a20fa3a11a9e1fc5441af5
[6/6] drm/imagination: Warn or error on unsupported hardware
      commit: 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

