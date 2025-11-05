Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A1C3542E
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759F89FF9;
	Wed,  5 Nov 2025 10:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="x3BPo2S0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9289FF9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 10:59:16 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A56YGHb2568877; Wed, 5 Nov 2025 10:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=D
 Ln9qd4WPBCt4U2sBeCQuK4CdL5A3NAcyeayyNLl38Q=; b=x3BPo2S0c8odsOU9T
 SYAsrdP2GntN9fL/RKs6occn48d9zTnrBdnZGzaqX/hLXjcQaJRurx/2FGWNvULu
 fHswyuhSF4joEilJ8gA1mTuBkIfP/NyTZWh+3dv0NjVtJ0pC/C2ppAXj8ygOq0II
 Y1ghviYz4GtAW4HXF5mic2ulhcDkfOSkEpDMibCjqXgBuwJYywypa+LcCz5Uwpnv
 kV65/+qn0Jc4JqWkVmbbdnrDMTGd5KsEe/m0Y1Ld6jDRxiOD8t0tN2ls7hANxzAG
 au1yLc9ik3RfsMQThtj90kAHeS6CohoJKQbmsKS0uD/Cq5hr5VLYs+jnN5916UAn
 /togw==
Received: from hhmail02.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a7wfu0903-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Nov 2025 10:59:07 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 10:59:06 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.140) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 5 Nov 2025 10:59:06 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: <linux-arm-kernel@lists.infradead.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Rob
 Herring" <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue:
 Keep lists sorted alphabetically
Message-ID: <176234034588.12681.9069711461858090857.b4-ty@imgtec.com>
Date: Wed, 5 Nov 2025 10:59:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.140]
X-Proofpoint-GUID: s2wfV_rX2oVxRgo9Wg6N9NdF5ghQKfNR
X-Proofpoint-ORIG-GUID: s2wfV_rX2oVxRgo9Wg6N9NdF5ghQKfNR
X-Authority-Analysis: v=2.4 cv=ZIDaWH7b c=1 sm=1 tr=0 ts=690b2dfb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=A05BHC2L4TQA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=1lTEdIhUU7jd7zX5988A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4MSBTYWx0ZWRfX0YzP5H2GeK9G
 eQE23RgAytv4OKLxo3iTgLTQnlH8SXcUT0WIMltPsV6g/NJk6cBBAUikjBY5iXmHjh1PPB9bPkj
 aUwGalRGIJ3uxOid95UozmZ+iR2EFKgcz+GWZQlf4qEIGvB0jhab2nWG0jVg9aAbZWPMdF3K8tr
 62dfR1gqfjGvfoARaspZcmSR7CSXNEsHoTF3emUu2/pyLeB4k+mbTydXQX9AnfdEE1wnRe4FySg
 kRdE/zWmrrPcw3E3xSB6ZxXJtHA8KuOVmM/6U5dvarQGPZ8BtnfZzeMFp14cJsYH/uEVrufupO6
 7XsfX6kH7fjXexDehcwUWmRKH/+LTscemppYrVS+8ydBtOGrMu3D8QZ5ALNGtygrVp84w8qsyBl
 nSIrh6zlZTNgG4wWqarYs7A96cd+TA==
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


On Tue, 04 Nov 2025 14:56:05 +0100, Marek Vasut wrote:
> Sort the enum: list alphabetically. No functional change.
> 
> 

Applied, thanks!

[1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
      commit: cc2a5cae75720b41ba58b7d3ce977e0729c9b82d
[2/3] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
      commit: 6126a7f27f002408803f3fc50ff610699e57601d

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

