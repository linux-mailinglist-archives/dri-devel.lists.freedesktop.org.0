Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B811C25A16
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70E810EBD0;
	Fri, 31 Oct 2025 14:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Ley0uC2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C718010EBD0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:42:22 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VDiHdH2882472; Fri, 31 Oct 2025 14:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=p
 VnwbKyAoM4XNHeszp6tYbSCUGRBg1M1CjmSLFZIMuc=; b=Ley0uC2wO7T5BzH/7
 zsdZ03fF91Z0sKAaY+PKUgpyLynJL/hCuL/Cj0w6CQqyfWAB8sklyj2qf0LREBbV
 jYXBhXSJaZBW4dHnhBbmkwPLUm5kWMO71DBmjpdT+/fpPfs52Vv6UUU1QeEwBkfx
 76sEFt8waK9u4kRCwq0WEj+4219xCK1KKyk66bw2D9CuVwH4CzIjCIIxh6jHjXy1
 kC04apRAM6VbRgTRn4oD2Jmb/LjzS3U8XEgReEEjG9iU9CnoYwB7XkjUfu6BP0Ih
 rg7Z+fXI/3OURsfnpuhot5rNDFbDFFuYDwhDxMaD+aUyODcTupb5Pt+V55JP6HrI
 tpG/Q==
Received: from hhmail02.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a3whxsa38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 14:42:07 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 31 Oct
 2025 14:42:07 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.134) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Oct 2025 14:42:06 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
References: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
Message-ID: <176192172651.30862.3429730919575512889.b4-ty@imgtec.com>
Date: Fri, 31 Oct 2025 14:42:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.134]
X-Proofpoint-ORIG-GUID: b0vaoEnKbzPb7F2e5pKIhGvH2QVMFCCq
X-Authority-Analysis: v=2.4 cv=C5zkCAP+ c=1 sm=1 tr=0 ts=6904cabf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=0einROue838A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=S9DGgefAEktgCmtaPdcA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: b0vaoEnKbzPb7F2e5pKIhGvH2QVMFCCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfX1brwmYvW6If9
 ummI8lS3/Xn4GLgQYIHAznz8T1D4izhA8MVzbD3MgN/CuOLmGox5EOIaj7OxFoZbA+IQyD7VXBM
 2OaFLGbiksNs9mByTtbs1BpIa36aV4fqdJJQBvRPS6VrOdTg2NLpk7BmAM5ZDYaxrC4zMs5xut8
 UHxyKr/v26iZoaDjuS3YG2NpwE0ujXHO3+vhnQjlFCZ8f+IFI/5yWDqC6mykHOmmY/+2TqPLKLm
 kgehE9EVr0N6ZVEzsfM1qBhQS+fqR9Kk4jYapY8LN9W9qyj/a/qaTeo1FCEPHV0dPv4CjJDOxY9
 7eukHjsei7+01T82r/et+0cZc37YuLZhMWoaNk1+grm58EtCnlw3In+rdB9u1DDbHpSCTVmMtl0
 unUxY343wAj++zFv53ywU6hcWtznSQ==
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


On Wed, 29 Oct 2025 20:42:02 +0100, Marek Vasut wrote:
> Fix the following DT schema check warning:
> 
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:103:1: [warning] too many blank lines (2 > 1) (empty-lines)
> 
> One newline is enough. No functional change.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline
      commit: 75d42e0351ac5ea080c33a15a92293155f51c9c9

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

