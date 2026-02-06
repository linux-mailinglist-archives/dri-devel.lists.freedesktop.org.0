Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFf0IOS6hWmOFgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E937EFC517
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550010E6A7;
	Fri,  6 Feb 2026 09:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="YrgwMbyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740510E6D0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:56:48 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61671a6Z3324164; Fri, 6 Feb 2026 09:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=AB3o5Ft2s9OK5rVZUP+9UGX
 sMfvR7VyUX0Cutvy5/u0=; b=YrgwMbyUKxGXcB6f22J1ua4vxYTfmNLD38yBonk
 e+swZsl5QVV4pcuNyoB+j9e/rj3dNNUCHSCBF+ncQyXM0wbYo6KVU6Xtq4z2smFT
 iXPOr9XZeznQhhg/6ic203Kg/relftZGRNBsElnJD5crcEETbKKLVTW7p76paDL9
 NwAaw2qcx73W6bwzeer1wpdzlKrTwFq+10fvoK+OMq/4qaJgi/iOJSrngGLmvF/9
 ktlHAHyGu0iWonAkyGg57x/RlJcbLYxVj+tTRC4WSHM4QSZLj95MtcnBoq6hgJ2j
 r7emdxDnrYCy2ihU/xPtMBVv+9b6eyOH11h5TDv7nBCsOdg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c4jfy0xmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Feb 2026 09:56:31 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:56:30 +0000
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: GPU_ID-related cleanups
Date: Fri, 6 Feb 2026 09:56:24 +0000
Message-ID: <20260206-bvnc-cleanup-v1-0-f3c818541fbe@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMi6hWkC/x3MQQqAIBBA0avIrBNMZISuEi3MphoIEyUJxLsnL
 d/i/wqZElOGSVRIVDjzHTrGQYA/XThI8tYNWmlUWqFcS/DSX+TCE6UxSFYhojUWehIT7fz+u3l
 p7QM43WjkXgAAAA==
X-Change-ID: 20260206-bvnc-cleanup-446e70666747
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=matt.coster@imgtec.com; 
 h=from:subject:message-id;
 bh=AGLSm3wHl0Zs0lvOpTIEQh1C19R/g+puvOXJfR1fICY=; 
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWS27jprt2Fp4POdqeXLI5jio84wvfl4du+EJrlv86/fV
 /UNKdaX7ihlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJNKUwMuw8K7nm3psQ1VsV
 f387r+DMOX+j/ZyC1VtBaX/Ft4pWsyWBKpL+zd3g9Y3dpvL52bJ1CzdznpOy8DX9/n6bRbXC2td
 /WQE=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NCBTYWx0ZWRfX/KtiiPPL+KxB
 sp5hhYscD4jhnuKgouHKDWrn43owbUnx3y3IEKMehgOk/gPwHtvJxMf5WVegPp9p2u4Z34mHSYc
 5V60H87A0MXP/VZo+mErszsHM8wxTrKlB2oX4R5dT1Hz/B8h/LrJ9BlAvHkaK9offh7TiA0vOwe
 RACjwiM0KL200rNXj9HEUf95nDZ5RuiUxTdq4vW3GBDJpGRxNzvG1cQmGi38qXPYEv0c5HNKKQ0
 fKJNQb9O+TO8HUVxCXwUaQoxP5S9EaXUBTVwqfYF1TIWKiRr4ob5LolwNeRXcMjmeWG2kR/31k2
 r6WzvNbVPFCJFpE42kCLkJqf+5Rqix79kbVFpNQGj7xNmlbjAT55+nnWO+Q8er8SoB+hzq+mulP
 6xOSACUY5AbW8dqTFWNnfBdJoxRll0Pw0detdllv/lvsf5I7vO15hVhaPRDLikg/AaiajKlBtyu
 m+41Zr+xK+cemol/9pQ==
X-Proofpoint-ORIG-GUID: uYkQGsKOtqsIsGtSOd1EzWu4u2N0L97X
X-Proofpoint-GUID: uYkQGsKOtqsIsGtSOd1EzWu4u2N0L97X
X-Authority-Analysis: v=2.4 cv=GakaXAXL c=1 sm=1 tr=0 ts=6985bacf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=zMgL16SF_g1udaVeNbsA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:matt.coster@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: E937EFC517
X-Rspamd-Action: no action

Just a couple quick QoL improvements around GPU_IDs.

The first patch touches the UAPI, but is not intended to introduce any
functional changes; it simply codifies the existing documented layout of
packed BVNC fields as a series of GENMASKed macros.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Matt Coster (2):
      drm/imagination: Define packed BVNCs in the uapi
      drm/imagination: Add PVR_GPU_ID_FMT to format pvr_gpu_id

 drivers/gpu/drm/imagination/pvr_device.c |  4 +--
 drivers/gpu/drm/imagination/pvr_device.h | 42 +++++++++++++-------------------
 drivers/gpu/drm/imagination/pvr_fw.c     | 12 ++++-----
 include/uapi/drm/pvr_drm.h               | 14 +++++------
 4 files changed, 31 insertions(+), 41 deletions(-)
---
base-commit: 55473b60178060a4fdb4631bd0c91879cc7d18d8
change-id: 20260206-bvnc-cleanup-446e70666747

