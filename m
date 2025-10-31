Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62EC25A19
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4E10EBD2;
	Fri, 31 Oct 2025 14:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="NAnorlSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E496610EBD1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:42:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V6kKrZ2063306; Fri, 31 Oct 2025 14:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=G
 +ymJZmW7v0bzF1fOrsBU91DiDFI16wILny7Z7z+WBA=; b=NAnorlSrDPKRQVjXy
 O/Yn/iLaKoo9NQr1oUi48VHX9FwBii9GiwHLZ1ZgkHr91MJdgMu0bdn5z4bYwJX1
 f/ouSOmwgU3kwbpAL9X2lv0xb8mX7LwIsvgvc5DbrohYfPrIDx86lnfrJr4poiyw
 pAvFUppcA2EO6GGQbzm4XLynojQrjjBD0q3c5JrRFzzPij7jkZlJkwRIV+2c7J1q
 4JDVXdyRSaEwCNdwUFlpQeI4erYdaXYtVowTLprdnqsUPgqe4oK0iPGqaDZ+GlQ1
 iqRijWz0wZTE++JYMUL3XnfQBky5fqiM/fbzHI7FDyhhfDKDHlGh483xw0ypE5j/
 A0kKw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a3wbcheq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 14:42:08 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Fri, 31 Oct
 2025 14:42:07 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.134) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Oct 2025 14:42:07 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sarah Walker <sarah.walker@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
References: <2266514318480d17f52c7e5e67578dae6827914e.1761745586.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm/imagination: Fix reference to
 devm_platform_get_and_ioremap_resource()
Message-ID: <176192172712.30862.17628053414032112619.b4-ty@imgtec.com>
Date: Fri, 31 Oct 2025 14:42:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.134]
X-Proofpoint-GUID: WGE_HsV3CD3d2kZtj3Ft-OjuUHz0HLmY
X-Proofpoint-ORIG-GUID: WGE_HsV3CD3d2kZtj3Ft-OjuUHz0HLmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfXwJoaOGH/jHkD
 l5r7Js4D/ZJ2jvzQYTxgHGtChIwNXvVrZ8BgdOft5kP/1nCODAz1nK/G432d+QsMSriH2ouEspj
 Ro+6utHx5xRbhuNGS11xSYzwHjvf4kYUgGUauYSabjVgF7nTfvo4ghVB4yy0K1DdWPr1j1QbsPn
 gl4yGjP8TmsoqapxsAi5JeIhA0E6lnxM3UOpCBf/Bfz9DGWZ6qKzgEvXzeWkqhEop4yvPVaHzNb
 JAiWUnLjYVowTwZk7ePboePQ0TGwBsKlf07rq00+dB872I35LD+eNBJOeHK+0NTcSiacU9Eq0o/
 1BihDFo975WYAMl0W6Q07GenYFq9ee5YfZGta/dGiZd5ZW3398O8qk1tvGVkC9ywF7NDnbvfBB7
 PvnERmIN3t09mlqAsr++Bz27tsorNQ==
X-Authority-Analysis: v=2.4 cv=FbA6BZ+6 c=1 sm=1 tr=0 ts=6904cac0 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=0einROue838A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=XpC44vr6I-WDIQ7FFpkA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
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


On Wed, 29 Oct 2025 16:00:28 +0100, Geert Uytterhoeven wrote:
> The call to devm_platform_ioremap_resource() was replaced by a call to
> devm_platform_get_and_ioremap_resource(), but the comment referring to
> the function's possible returned error codes was not updated.
> 
> 

Applied, thanks!

[1/1] drm/imagination: Fix reference to devm_platform_get_and_ioremap_resource()
      commit: f1aa93005d0d6fb3293ca9c3eb08d1d1557117bf

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

