Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445BCA7DA2F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B49D10E053;
	Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="yTVTX3jN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BC110E053
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:48:14 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375uENI000926;
 Mon, 7 Apr 2025 10:47:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=L
 rdbaiWgj+VqUgPxskU+PG3nQx7JvvWRLYO0Q0qnifE=; b=yTVTX3jNV8nyVF1kN
 OdDZ1wscYyHSHQGCSK624IPFaYmm64J6st+wC5TIpdw8dci0fALl/hxqPNfKpmRa
 HLtG+GSfVBYjZ2pgcOp8M5wqfdI7YRKEbQSeMW8cptJKxms01Ulr68gsDztJoRUo
 7yKP5/zcRTjVR6/uFUkWIlIwvh661qAicbZCGLr1o3SzPeQaONF4P6LJUUb+774R
 YQWir3NqWXZmHfIRqNjhn3m6jeXe8U1oWepoJcwActVtx7QLTzfJ1tOVBD3WtOfU
 LcOierFmQWJ0PkiDWr8L4vZyWin7yiS11GdJSnTn+vE+tTIPQ8CnQdNiCSGxqtaL
 YVWSg==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45uv5w8fpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 07 Apr 2025 10:47:56 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 7 Apr
 2025 10:47:55 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
References: <20250402-for-loop-counter-scope-v2-1-4fd550d22832@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: loop counters moved to loop scope
Message-ID: <174401927500.42684.16219205012504623611.b4-ty@imgtec.com>
Date: Mon, 7 Apr 2025 10:47:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.7.98]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 6CXKL1Bl7JVCpFq_7teK4J7jLNJycVGZ
X-Authority-Analysis: v=2.4 cv=VYD3PEp9 c=1 sm=1 tr=0 ts=67f39f4c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=r_1tXGB3AAAA:8
 a=PEAm01bx7CXaZduv5QMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 6CXKL1Bl7JVCpFq_7teK4J7jLNJycVGZ
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


On Wed, 02 Apr 2025 09:40:05 +0100, Alexandru Dadu wrote:
> Reduce the scope of some loop counters as these aren't needed outside
> the loops they're used in.
> 
> 

Applied, thanks!

[1/1] drm/imagination: loop counters moved to loop scope
      commit: 81feddc12613567d8206a9697d068711140e9c47

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

