Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83AA45B23
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 11:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EA110E048;
	Wed, 26 Feb 2025 10:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QusQmhNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16A510E048
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 10:04:46 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q7M4FB010391;
 Wed, 26 Feb 2025 10:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=H
 NeVkcyhJTDYPqzpSDY2qxIpZaWs6DnKv2b1WJOnJt4=; b=QusQmhNjZGkf2LIws
 xzW3CJIVDf8kwQ5BZZ8n2ZgY+pnGsEdWjdfeo7iVK/PzAcgCSMAkaVMZqEzqMem7
 Ga7o8JyeByu+9p8+aU7fGMbuQUvvRFww52ZHyiyhaOTDtIGeGGDMvJh9Y75cuH0z
 wUxbJQfmF+cvOVRvZthb+aQ+xgHuhi3lFPauc0y0HaUYmixwXLwD/Ze5uXHNp6Yv
 OAxhAWo8BpLhoQ2LQCpipuVO36nplFng8KQhf8BNsoptRKr/jugfrfKV+Dk8mxCi
 ilVV8seRBcMlGKlsjeOZEv/Jd09/o5/DUs9gi7+9HA6Do7VwoXc229P6+I5Q5ijC
 ynmmw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44y5qxass2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Feb 2025 10:04:32 +0000 (GMT)
Received: from Matts-MacBook-Pro.local (172.25.7.33) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 26 Feb
 2025 10:04:30 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Masahiro Yamada
 <masahiroy@kernel.org>
CC: <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>
In-Reply-To: <20250210102352.1517115-1-masahiroy@kernel.org>
References: <20250210102352.1517115-1-masahiroy@kernel.org>
Subject: Re: [PATCH] drm/imagination: remove unnecessary header include
 path
Message-ID: <174056427082.17179.5057304555659162001.b4-ty@imgtec.com>
Date: Wed, 26 Feb 2025 10:04:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.7.33]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: B7ua5HpXOp3VEP3ICcYKjWDxBZznJFv_
X-Authority-Analysis: v=2.4 cv=OLPd3TaB c=1 sm=1 tr=0 ts=67bee730 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=V9sbW7EuxLoA:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=r_1tXGB3AAAA:8
 a=5yNAjN4o7YE2XUz26QkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: B7ua5HpXOp3VEP3ICcYKjWDxBZznJFv_
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


On Mon, 10 Feb 2025 19:23:50 +0900, Masahiro Yamada wrote:
> drivers/gpu/drm/imagination/ includes local headers with the double-quote
> form (#include "...").
> 
> Hence, the header search path addition is unneeded.
> 
> 

Applied, thanks!

[1/1] drm/imagination: remove unnecessary header include path
      commit: 2e064e3f3282ec016d80cb7b1fadff0d8e2014ca

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

