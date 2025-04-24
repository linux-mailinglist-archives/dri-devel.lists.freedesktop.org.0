Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F527A9A959
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9346F10E7C0;
	Thu, 24 Apr 2025 10:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="bibwfnel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3D10E7C0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:05:03 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6A3Eb004531;
 Thu, 24 Apr 2025 11:04:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=h
 t+5MJoy98mefo5C6EhU8q+TpMHAYhDjxH3joLjpVHE=; b=bibwfnelT/m25Frf4
 LnxZIB8sCCOy2javZuwKXMBL0tSsu9ggTmWRxwN9fiWuxFvyHMIOz2s9DB4YjZ/y
 5Oz8N1IuN92qUYjcBfNLFFi6nvOvxgz2tR1n5p7hNWAVgrWGFXY69synP8wcy7dL
 6NQDHRQb48mibRJSySvAM+Iathi/qa5q09sXpVJCOFuhH8TVY5uOlEJkMSPO8w1J
 umOmfmkH0W4WR92oTapiU6MZimWXwfZptft/wh9Vf5oLIM2KGZGpeDwV6P/virGG
 x4cvSZwclUKxGZ8fOvzNEOtDbuQ96Mz1b8ankLiRSpzGUPTVGZFbeH23v2NeNkQC
 Gi5sQ==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t30bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 24 Apr 2025 11:04:37 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.2.134) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 24 Apr 2025 11:04:35 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arnd Bergmann <arnd@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Alessio Belle
 <alessio.belle@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 01/10] drm/imagination: avoid
 unused-const-variable warning
Message-ID: <174548907548.56131.3060253413773321018.b4-ty@imgtec.com>
Date: Thu, 24 Apr 2025 11:04:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.2.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=680a0cb5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=r_1tXGB3AAAA:8
 a=0awzr-uiiHjTTRS7KEMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: SPdZCKhLNrewa3ueFb4AyDGUNRLczfRX
X-Proofpoint-GUID: SPdZCKhLNrewa3ueFb4AyDGUNRLczfRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NyBTYWx0ZWRfX8Zno8UDFwBlU
 duo4p/Fdz0av0UAgxGRNiVRJk1XJoAiV3cx5zZXo6AcXCz222ufGHQ6WHfbQW9XWpRnDkit1K3m
 SrdhNtByYCGxNlVGWLPt/U1h1TRc9J6Go5Da2RgZgW6LgwweP0Zt3f3AQFYCX1hXLUDdOU4ti/L
 zU4nKKfMLBba9Te4xBIW4WYEWyPWiWUJfm4BFy2JvoFy26oBDK+rU7ZjYWGtobUQluv2tB6MSMd
 DKYk+kfeqDhicF9kF5mk9CGlseuzNtsEiOySkcJDZJWUawCmu626IowkW+CEnZuSlpjB1A2/sxO
 2hPqohFeIcc0tWOVj4BzHHy71HHMp0yOOxhDzNlyGJ8wRkkg+nglO5xooGbW+eKPVhNOlcGVJil
 Kl+gB1KT5TQ8k5HcTyO6PMC7OycZBf8xS92LrJ7FK0TC8eypbntBwOp+62KotipGvP1r+IrC
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


On Wed, 09 Apr 2025 14:22:53 +0200, Arnd Bergmann wrote:
> When CONFIG_DEBUG_FS is disabled, the stid_fmts[] array is not referenced
> anywhere, causing a W=1 warning with gcc:
> 
> In file included from drivers/gpu/drm/imagination/pvr_fw_trace.c:7:
> drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h:75:39: error: 'stid_fmts' defined but not used [-Werror=unused-const-variable=]
>    75 | static const struct rogue_km_stid_fmt stid_fmts[] = {
>       |                                       ^~~~~~~~~
> 
> [...]

Applied, thanks!

[01/10] drm/imagination: avoid unused-const-variable warning
        commit: 3206a96675342badb0254558ba4b4c8764aa3ae7

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

