Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEBC7B031
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79E210E8EB;
	Fri, 21 Nov 2025 17:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QAZyvICP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5910E8EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:12:45 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALCbilm2018168; Fri, 21 Nov 2025 17:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=9
 irh16NdVLsEFe58EakSkx3HxXA9qzwBjOI2bq60wnw=; b=QAZyvICPyrHL+iBpx
 iaJA5YB+nxLZKPLlexmKWXEo+SVgxhBL3Gbzrh5pwvTQkKznF+RPQNgsxBC4f2Kv
 QpBEVv1h6mXoIemRR+LnY6LXUfc1/KTWF8CCgCWZSaMK5Y4L03ecZa7CMmwrkFxx
 NisOlTJOrCCW38M9+XdRtxM8IreyvmFjqJ8Kyvh+68zkmlxmoSeqDH0smg8cM2WD
 /gK5T3dLl3MBsWv3kqTp/Ik65HXpbbDWGuDvj0igYMasXyFrmwS1u2zj9wb7zQe5
 cPp8GczEE95d4JlzZKwuRWbtMRzw3A/sTZh+4VJwglud1EDpHeLZiQBrPAj9UIlP
 Z4QQw==
Received: from hhmail02.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4ajemdrhxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Nov 2025 17:12:27 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 21 Nov
 2025 17:12:26 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.140) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 21 Nov 2025 17:12:25 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Coster
 <matt.coster@imgtec.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
Message-ID: <176374514527.8082.7413128799744861664.b4-ty@imgtec.com>
Date: Fri, 21 Nov 2025 17:12:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.4.140]
X-Authority-Analysis: v=2.4 cv=Q6LfIo2a c=1 sm=1 tr=0 ts=69209d7b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=A05BHC2L4TQA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=FQz4N2SRXKIV2AokMrgA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 6YcffAvrQeXTbm1s2EOeE_rb6RcKcnSS
X-Proofpoint-ORIG-GUID: 6YcffAvrQeXTbm1s2EOeE_rb6RcKcnSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyOCBTYWx0ZWRfX3YPw5LpFQ43W
 MJ5EASAACXfiU5KE9oNowUrjL1ThSTnsHL5ptiUO7ogAhgP/BE/EgaP6z7OK+kAMwRi3Hn604Hc
 HaGF/JrEjjuFmh5yFO4HvKkOOsq+CgbXDysExi//DywHMqiVcWHOJvEmHnHLdttz5rzPqDSbBaq
 xWcxddDbJJ76JwrMRFxqXjOydBQA+HUnKkeyKuAr0OJ1AQzFby9t6wb75tBH60XdcE28OYZC487
 iqiR4WaZ34dHQO1C0H0ErBo7YTMVuEHCphKvR9cLZlGqkuqli36RqoHWwQccNFbR+KMKOWINyzt
 BBDk12ib9AcHn9B603/WTiOl0l6/llOhdHnMcIClsA22IKOXuZVFfjjJwMb7NZgnxVlOropP997
 Ns+jvKoeRzGXBnDoOrEgkdnksLRzQw==
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


On Fri, 21 Nov 2025 15:20:31 +0000, Matt Coster wrote:
> Automated testing caught this missing doc comment; add something suitable
> (and useful).
> 
> 

Applied, thanks!

[1/1] drm/imagination: Document pvr_device.power member
      commit: 83c53f1a2d6c4c8c19354b926367d0e82dcd6386

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

