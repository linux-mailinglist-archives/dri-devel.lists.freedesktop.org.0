Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE02A9A9A4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3063F10E278;
	Thu, 24 Apr 2025 10:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OO9zlUkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5805110E278
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:12:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5mKmD003802;
 Thu, 24 Apr 2025 11:12:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=M
 JAEru0kAy0H7x3MdM/FxMUu5VMkYpr+/fhGXMevwe0=; b=OO9zlUktAdqCtQ/cP
 hzmQ1zoxlEzBEweoudQNQsoyFdszNvXDgYbU4ImBN0q2KTMpczeibNh9srMMACUp
 Sd0SUOXw4/3Lc1di73lW4Y5syBry3q0dFbRTsl7mO6dQ6B/6XjuHp3lrKKlC2yUg
 b9DPIBGreRCNzm9kZ2buerCqWOZSjvNzJNcS/6AlKYTO3ep/iS99yK9m50HqsV+3
 xvTctplBqLJG5n5D9AAzUikDTUXSpoB5lqQRUawwgofiHtxYWCuyQemch/xDW+zU
 G+DbPFINxnmIiCLfpAPkL4IbGY0s17tTwKQqXJxdmEadG/3Z4nQnZ4P7Vm0lwDyR
 8U12Q==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t30g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 24 Apr 2025 11:12:10 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.2.134) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 24 Apr 2025 11:12:09 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
References: <CGME20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327@eucas1p2.samsung.com>
 <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
Subject: Re: [PATCH v6 0/2] Add optional reset for the drm/imagination driver
Message-ID: <174548952899.58512.17299170499939227749.b4-ty@imgtec.com>
Date: Thu, 24 Apr 2025 11:12:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.2.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=680a0e7a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=r_1tXGB3AAAA:8
 a=mmtmsoJdFJwW0GXKqmwA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: LMEE7J05_CQhUV6Mqv_KC8BrWut2cSrV
X-Proofpoint-GUID: LMEE7J05_CQhUV6Mqv_KC8BrWut2cSrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NyBTYWx0ZWRfXzFB4qk4ii2uJ
 Inxqu4Twf3r5FChzGPDTwnBPXM6McYgZ+qjtaZr546Z0/XP0uTuCfwLDsZ/vliSqlZGgq6jZ6PO
 MALDIkniPJOOLBZ+Os1Bqp4ZBQQqSiw6967yGQRcMNEslV2YOH3MAulvjsRaP4MvBDs/pUp3zlb
 bQ+6YkxnTC7wbdbPsgTfuyHArKfONE0v9s4hN2ASw9ayrI0gEc3VTSZnxsAebDw0+UwLWHWD8pu
 d1lR37LmN0Izd75A3Ra0JaFQsrLRLjCTw6XrfBJ04DJZS5Ssqg95W6U/IWO2eCwl7YAInzYBJN7
 GCHg6+6nE7B3I2ojV3tsHdrRUF9RE3WJ750jmKU9tOcRs9BFKoSnDvLBFTgBF5KSfJ9oIYdUCS7
 qQcGgpsfEdCyUT6ciHWsYtEIV8vqKw6T/WzTHuQ0UasyIjNlg2tVU1Vi3qYgkFIosMyi3uVC
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


On Fri, 18 Apr 2025 13:22:47 +0200, Michal Wilczynski wrote:
> This patch series introduces and documents optional reset support for
> the drm/imagination driver. While developed as part of a larger effort
> to enable the Imagination BXM-4-64 GPU upstream, these patches can merge
> independently.
> 
> During the upstreaming process, we discovered that the T-HEAD TH1520 SoC
> requires custom code to manage resets and clocks from the power-domain
> driver [1]. Nevertheless, adding this reset capability is necessary, as
> the GPU Device Tree node would own the reset control and would manage it
> for boards like BPI-F3 that don't have custom requirements for handling
> clocks and resets during their startup sequence.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpu: Add 'resets' property for GPU initialization
      commit: 1300a7f8a7d4c5f88de30312cf34448b96539c23
[2/2] drm/imagination: Add reset controller support for GPU initialization
      commit: 3a2b7389feea9a7afd18d58cda59b7a989445f38

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

