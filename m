Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CdnI++lnGkYJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088FA17C057
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4E010E424;
	Mon, 23 Feb 2026 19:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pY7bv8Ly";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeeisLqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ACC10E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI0GT03732653
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=; b=pY7bv8LyTytdTBwx
 FdDz8F8YAh21njbNhRKTOgB6ASxCA5j+1P+5Hd7dROPVgXLegJv7Y4OZ4Y75jTbb
 691M3GLS52UkNTPuNK+tUSt/OKn6RK5YhR5tttqrXS7/2YX2/ALYN1GNDIX14Gtp
 8y7wyRBGxNHBt6kh3siFZC7okCWsmbAwfQperSk6+9HOwOinOewBnSjq0AWzPHTk
 B2nbzYjoGlicQRzCFR309S838vxt/jYNyIMa799i1USDELzpQ0+wjR4gw5K6IR11
 8yB4K12mYKvRwhlmp1eM0wE939875N4A4S9fjicTdaReX86Oix7iJbCfjgBqAIpx
 /ASXPQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9m60-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:09:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ab4de9580dso395843535ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771873770; x=1772478570;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=;
 b=UeeisLqagt5TM9CnMrK6DKhjT6ln9ST6gCw1gworyxVGP7Scu4xDoyn5rxCWuXjNJk
 /5fnk8pp2n9NjsGyonPh1WSz7H1MPrHDz4J8da8wMqfhbcs1gafpgvOMwRTiLqpjQsEg
 ABSiCCG5vuLSozQFXQFLGiR+fao/9aDTJmok3znkAvzyQolqnYwb0e4InNL9cMMKT+Un
 6MYTzD4TiOp1NDzm5DiPR3yx35aq4zHM9hyCgzxtVxSk/4E/DFJOHExdm0uilyYFazGB
 RGxzuxUI9E5f+7smbzKDEBpGezuGfMlrJf5JK08RpyioeKVNwaOxX9CCl0AZ0YtPbfj5
 KRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771873770; x=1772478570;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Clm+7k+qHiGBFSKNSFyBJAE1bBx37+hOGzIhiR9y8j8=;
 b=hPqbwbt7CiJMyIfu1G8yMEHMhzVDhk9vN4pqZWtqddEQJlmcTlxyFz9Ra2z02Grz2t
 ytUPzcT3LcjenyOon5pT/mxYHva8Ad7dGHC8EM6eF+l1U4dUCleKxe5XeOf6b6XQiVkl
 adlIyyoH0cuj4yDRTS7pzFe3Zm/gPP3y7iKmHG+5uNZhFZW09K989kcaOljNqgLBltGY
 Qbjp12ocSGz7XWxZHOewXOyAJZpbzVsw+BoXVc3D6ks/c20f6QUtafOHoZOb4StAquz/
 PldAGvLaDAtpvQ6/vGazkgacRBd9LKQD3BdAyHBIDvOBhyHMfCJVEYm9FjeAISXuPAps
 0hYA==
X-Gm-Message-State: AOJu0YwgZKz/WInMaMDJBlkxGojOn1vZzxI9Gs2Nu4OADp0/IkebHA+f
 V4gqM6QvEi7dBQGZHEkRCngdzp0ustiPc2lMp1edpLj7Ws8SbBEIX7Udx7vbzO7cLJDU1amkFJd
 GZin9SqEGbbAK07FCxSlO/B1hDXj7LVyy5x/9BYy5RLkFVHqftoUczMF/Uj9YsiqUbcwo6vU=
X-Gm-Gg: ATEYQzz0Vsu2J2b9qUrvpOR0ZoWGTGh9C/SZ4Nrz6msXKXAVinlr87UPbLQQ73JA4Lz
 +g07lVGVzERj0NTJ5LVsuFkeNSFi0Pd4giPXS8RxmdPgP7XH/0b8tIV8t2S2IirswJoIwrOnTiP
 agTd7eXuiSr/TL/quZ1FIGtUCqAzOxLXF6zj2NVQBkyVQghkoB0I0g0JTipCYZmVe7QoJOdx5fx
 I0yzT0fshQW0WkQGSGxZtJ1wsfRtcRzQmI5r+dPJmhKfsP5gcK5SEir4gh1BKC2KdQVPp7WFa2f
 26sTfhNEpslt7QihZKvDYUQ+AX6/eeEAre+x2f0h1Smt/mbeulQc8MBWwQBQs89elM6NKJTPrMQ
 uBIdbAL4ym53uS/ekO8L9SeG2jrb87lfd2SR3RrTqUMep7Rfai7YE0w==
X-Received: by 2002:a17:902:ef48:b0:2a9:4c2:e47 with SMTP id
 d9443c01a7336-2ad7458617fmr91702935ad.56.1771873769453; 
 Mon, 23 Feb 2026 11:09:29 -0800 (PST)
X-Received: by 2002:a17:902:ef48:b0:2a9:4c2:e47 with SMTP id
 d9443c01a7336-2ad7458617fmr91702545ad.56.1771873768877; 
 Mon, 23 Feb 2026 11:09:28 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:09:28 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:55 +0530
Subject: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8196;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Zq6CFw1VSCQehea9a6rhVdMON7B8W0MmxMsOW3uKtjQ=;
 b=rXPbVMVVUoLnQhK6G4B08gOscy7gxC3JRP2zb2W8d74yPv902ZtG45ZW6lWshlXckS4YvBWtR
 LzYqLzgQ+iIAwp100NKsDuMgQ4wgN58wj+seVZlEx1YacUgesqDzglm
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699ca5ea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WUJy9f6djnNETMKr9A4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aDfuUUv-XiQK6jC7wbsZjrIbSQPquq7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX4z/Cfb2Bg+k2
 kvuZGEQcgjRA0+RsryKszNIjgHXlbFEMzZtVXeUKFddAASd4CGYp2z8O79O/hM9ZfTtO0fbXsHG
 cRZDQTI41gahaQx4zNgD++8TRqvS4NGwsrhlo+Y7oanx8FLj3Pv5PTaik448OjUr+9qpf/EWh+8
 8X8dzZ782yvk8Cs9YAFd/GiHftjnavkomA0MkCmaemzoyOQFhQEkYfA3bXAQnfnY55sjhq1unIW
 g5eoLoraPrz9ewIqDUsnepIzG8zkHhCxC14gc63uelEcOQSufRsVbrqYXKSljVb9NumRyTzBcZM
 2QyEF1zvdIyTlanTQFY32zgW3hijKox4mdVYP2yL8B3LWSSAi05zveE/rZI8Oc9e+LDjCbXq99t
 /VJFM1zxWGlH+QAakT+tXg/2M1QKjlaLXQUCBeAZpPUz0nzUs6gglG1HOwG4N2kikDprysQbMzf
 AYiBRBvXjzbtPc+zHNw==
X-Proofpoint-ORIG-GUID: aDfuUUv-XiQK6jC7wbsZjrIbSQPquq7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 088FA17C057
X-Rspamd-Action: no action

Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
integrated in the DRM accel subsystem.

The new docs introduce QDA as a DRM/accel-based implementation of
Hexagon DSP offload that is intended as a modern alternative to the
legacy FastRPC driver in drivers/misc. The text describes the driver
motivation, high-level architecture and interaction with IOMMU context
banks, GEM-based buffer management and the RPMsg transport.

The user-space facing section documents the main QDA IOCTLs used to
establish DSP sessions, manage GEM buffer objects and invoke remote
procedures using the FastRPC protocol, along with a typical lifecycle
example for applications.

Finally, the driver is wired into the Compute Accelerators
documentation index under Documentation/accel, and a brief debugging
section shows how to enable dynamic debug for the QDA implementation.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/accel/index.rst     |   1 +
 Documentation/accel/qda/index.rst |  14 +++++
 Documentation/accel/qda/qda.rst   | 129 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..5901ea7f784c 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,4 +10,5 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   qda/index
    rocket/index
diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
new file mode 100644
index 000000000000..bce188f21117
--- /dev/null
+++ b/Documentation/accel/qda/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==============================
+ accel/qda Qualcomm DSP Driver
+==============================
+
+The **accel/qda** driver provides support for Qualcomm Hexagon DSPs (Digital
+Signal Processors) within the DRM accelerator framework. It serves as a modern
+replacement for the legacy FastRPC driver, offering improved resource management
+and standard subsystem integration.
+
+.. toctree::
+
+   qda
diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
new file mode 100644
index 000000000000..742159841b95
--- /dev/null
+++ b/Documentation/accel/qda/qda.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==================================
+Qualcomm Hexagon DSP (QDA) Driver
+==================================
+
+Introduction
+============
+
+The **QDA** (Qualcomm DSP Accelerator) driver is a new DRM-based
+accelerator driver for Qualcomm's Hexagon DSPs. It provides a standardized
+interface for user-space applications to offload computational tasks ranging
+from audio processing and sensor offload to computer vision and AI
+inference to the Hexagon DSPs found on Qualcomm SoCs.
+
+This driver is designed to align with the Linux kernel's modern **Compute
+Accelerators** subsystem (`drivers/accel/`), providing a robust and modular
+alternative to the legacy FastRPC driver in `drivers/misc/`, offering
+improved resource management and better integration with standard kernel
+subsystems.
+
+Motivation
+==========
+
+The existing FastRPC implementation in the kernel utilizes a custom character
+device and lacks integration with modern kernel memory management frameworks.
+The QDA driver addresses these limitations by:
+
+1.  **Adopting the DRM accel Framework**: Leveraging standard uAPIs for device
+    management, job submission, and synchronization.
+2.  **Utilizing GEM for Memory**: Providing proper buffer object management,
+    including DMA-BUF import/export capabilities.
+3.  **Improving Isolation**: Using IOMMU context banks to enforce memory
+    isolation between different DSP user sessions.
+
+Key Features
+============
+
+*   **Standard Accelerator Interface**: Exposes a standard character device
+    node (e.g., `/dev/accel/accel0`) via the DRM subsystem.
+*   **Unified Offload Support**: Supports all DSP domains (ADSP, CDSP, SDSP,
+    GDSP) via a single driver architecture.
+*   **FastRPC Protocol**: Implements the reliable Remote Procedure Call
+    (FastRPC) protocol for communication between the application processor
+    and DSP.
+*   **DMA-BUF Interop**: Seamless sharing of memory buffers between the DSP
+    and other multimedia subsystems (GPU, Camera, Video) via standard DMA-BUFs.
+*   **Modular Design**: Clean separation between the core DRM logic, the memory
+    manager, and the RPMsg-based transport layer.
+
+Architecture
+============
+
+The QDA driver is composed of several modular components:
+
+1.  **Core Driver (`qda_drv`)**: Manages device registration, file operations,
+    and bridges the driver with the DRM accelerator subsystem.
+2.  **Memory Manager (`qda_memory_manager`)**: A flexible memory management
+    layer that handles IOMMU context banks. It supports pluggable backends
+    (such as DMA-coherent) to adapt to different SoC memory architectures.
+3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
+
+    * **`qda_gem`**: Core GEM object management, including allocation, mmap
+      operations, and buffer lifecycle management.
+    * **`qda_prime`**: PRIME import functionality for DMA-BUF interoperability,
+      enabling seamless buffer sharing with other kernel subsystems.
+
+4.  **Transport Layer (`qda_rpmsg`)**: Abstraction over the RPMsg framework
+    to handle low-level message passing with the DSP firmware.
+5.  **Compute Bus (`qda_compute_bus`)**: A custom virtual bus used to
+    enumerate and manage the specific compute context banks defined in the
+    device tree.
+6.  **FastRPC Core (`qda_fastrpc`)**: Implements the protocol logic for
+    marshalling arguments and handling remote invocations.
+
+User-Space API
+==============
+
+The driver exposes a set of DRM-compliant IOCTLs. Note that these are designed
+to be familiar to existing FastRPC users while adhering to DRM standards.
+
+*   `DRM_IOCTL_QDA_QUERY`: Query DSP type (e.g., "cdsp", "adsp")
+    and capabilities.
+*   `DRM_IOCTL_QDA_INIT_ATTACH`: Attach a user session to the DSP's protection
+    domain.
+*   `DRM_IOCTL_QDA_INIT_CREATE`: Initialize a new process context on the DSP.
+*   `DRM_IOCTL_QDA_INVOKE`: Submit a remote method invocation (the primary
+    execution unit).
+*   `DRM_IOCTL_QDA_GEM_CREATE`: Allocate a GEM buffer object for DSP usage.
+*   `DRM_IOCTL_QDA_GEM_MMAP_OFFSET`: Retrieve mmap offsets for memory mapping.
+*   `DRM_IOCTL_QDA_MAP` / `DRM_IOCTL_QDA_MUNMAP`: Map or unmap buffers into the
+    DSP's virtual address space.
+
+Usage Example
+=============
+
+A typical lifecycle for a user-space application:
+
+1.  **Discovery**: Open `/dev/accel/accel*` and check
+    `DRM_IOCTL_QDA_QUERY` to find the desired DSP (e.g., CDSP for
+    compute workloads).
+2.  **Initialization**: Call `DRM_IOCTL_QDA_INIT_ATTACH` and
+    `DRM_IOCTL_QDA_INIT_CREATE` to establish a session.
+3.  **Memory**: Allocate buffers via `DRM_IOCTL_QDA_GEM_CREATE` or import
+    DMA-BUFs (PRIME fd) from other drivers using `DRM_IOCTL_PRIME_FD_TO_HANDLE`.
+4.  **Execution**: Use `DRM_IOCTL_QDA_INVOKE` to pass arguments and execute
+    functions on the DSP.
+5.  **Cleanup**: Close file descriptors to automatically release resources and
+    detach the session.
+
+Internal Implementation
+=======================
+
+Memory Management
+-----------------
+The driver's memory manager creates virtual "IOMMU devices" that map to
+hardware context banks. This allows the driver to manage multiple isolated
+address spaces. The implementation currently uses a **DMA-coherent backend**
+to ensure data consistency between the CPU and DSP without manual cache
+maintenance in most cases.
+
+Debugging
+=========
+The driver includes extensive dynamic debug support. Enable it via the
+kernel's dynamic debug control:
+
+.. code-block:: bash
+
+    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_debug/control

-- 
2.34.1

