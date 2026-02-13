Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCuAFOxgj2nNQgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:35:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42C138B03
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 18:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C58E10E301;
	Fri, 13 Feb 2026 17:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="MBhRiPpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0B110E2FB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 17:35:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-8cb3dfb3461so127085185a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1771004135;
 x=1771608935; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lHcb5oQx+i1SpdjYrXcWh7mW2O04busIUXRXjr9SATA=;
 b=MBhRiPprN5bp9NuMMAq76U2JTMusRbpJi0oTSrUNwbtWA2SC87j0SO7rPhKFMQy+Bu
 SNB55Zv3GwwKiU8maPn+oY4OzbCQExlSyTHYUTgPhORolvTywsZPUTlIs4PgF+SVSrip
 uYMMTsdAm154c2V0q+PCnVqOT+zzNU3yysdtgzwqxrWGmrYVNVlWNv09Sf+R6fJ+h7IZ
 4Haz+F6BR9EvYjmDWqTMuN65HSb6d4+IHQ4fwR2XsAi9e1zw5w4iXJCCP8uFw4iJE8bG
 n+SMqFAYHBik0eDyV4SOr67mNVTSW8toC1uPAv12rqfxkKSbN+fmZUGvgh2it+0H3YPr
 CduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771004135; x=1771608935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHcb5oQx+i1SpdjYrXcWh7mW2O04busIUXRXjr9SATA=;
 b=OaHqCsDBPcKYCWC0v/WQOdh0FBixMNGWEAImuOhJb4ZHZlf9BrlmrcReSmsUaXT/wN
 BhbGZ1mzNKEL36tOIgYemwrgMIjBaFwEiuS6MtQGtc/dfZ5PiDwxaxcSxq1vdeBgyOCO
 9Alkp4sSGhtm6NsXBOFGFNUrKNL9iV7gy9Q/1IaJFMl+N0zDV9MInVsNBkRlDjwrH4YA
 SjRF4/Ccx9L2Apm9RhFlswNcmz6symrmkCkBPtwOITyslHwRxHBtI+84H4vreGSpyHrF
 UVn4JO2IVY9AFdjvhAahvkB4BhMJ2S3oSERqXkjZkGCNSTGAIAhGgu8SZSSfBcwKx2tG
 qrog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWWmGouI2wEpP9VBXUbK4IicgdEOIqqnlEPPZDMaojhley2oU41l7o0aUD56oHlbLCYfn5L/G7JkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKFhfwV/dFWsUyqA33UpFbfIYtHmNpQI1Mx4K9kGbcwhPWKE7h
 JEWsfRk0tLXcQBhinFNvD8WxY5ejKDHuOftC4dzvO+6f1zqtDMkv54DFFC8BI2mU8tw=
X-Gm-Gg: AZuq6aLM+KH0w+jJQBSoABA4ICmhDM8udraOL+2V0vYu6+EKqReRMUO3suiPffi2vWD
 F3dE+GiLUJ9nd36Xg8K7UI1tZushXQCGv+bVY3uSwc9W3R3GOzQOV6MzUiwLSjfagRTlNruW3kx
 d53JCNIG5y4S1w+o+bMxaE+9pgjdYoEb9v9X4fHr2VgTDcPLQMl050gCPOx+mDX5qpw/wvsbM+z
 /P1htntfucf8u/4FJgmqOjP5TgGJOq7f0OefXOILdDUuPE8k4yzZZeqLI21jeijnSXUM5TrhIcm
 bIe9t9smUDlavQ2n1pz+J9xT4pUKSNiJ2EO+8Q6WekUPigkw97TwWpQH5/2TxPPxxKcP7DlTauY
 lFZfSd7B3S/pmlpZJpcF7V6DwAi39NWlaQhpKGjOAdUpzfSGKbIoTSotUJ9vFj7dxwg10MUGo5i
 kCl8KL81tA2g9OWY9a56zRwHnfF7V/VHCMw/rVcs7MyVfuPOYicWeq3cQtriinBHEL8my7fPHKV
 xpuTsiIilmBzAtkzoyJfhlNupQ11xK4u25pOscgzT55wcHYzJUFpg==
X-Received: by 2002:a05:620a:2945:b0:8ca:3f06:c569 with SMTP id
 af79cd13be357-8cb408d698bmr458283685a.55.1771004135175; 
 Fri, 13 Feb 2026 09:35:35 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb38f2f47fsm377700285a.35.2026.02.13.09.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 09:35:34 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: Tomer Tayar <tomer.tayar@intel.com>, farah kassabri <fkassabri@habana.ai>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] accel/habanalabs: reject zero-element timestamp buffer
 allocation
Date: Fri, 13 Feb 2026 17:35:30 +0000
Message-Id: <20260213173530.2963318-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.79 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:koby.elbaz@intel.com,m:konstantin.sinyuk@intel.com,m:ogabbay@kernel.org,m:tomer.tayar@intel.com,m:fkassabri@habana.ai,m:linux-kernel@vger.kernel.org,m:n7l8m4@u.northwestern.edu,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7A42C138B03
X-Rspamd-Action: no action

A user can issue a DRM_IOCTL_HL_MEMORY ioctl with
op=HL_MEM_OP_TS_ALLOC and num_of_elements=0. The
allocate_timestamps_buffers() function only validates the upper bound
(> TS_MAX_ELEMENTS_NUM) but not zero, allowing num_of_elements=0 to
reach vmalloc_user(0 * sizeof(u64)), which triggers WARN_ON_ONCE(!size)
in __vmalloc_node_range().

On systems with panic_on_warn=1, this allows a local user with device
access to crash the kernel.

Add a zero check to the existing validation, matching the pattern
already present in HL_MEM_OP_ALLOC (memory.c:2214).

Fixes: 9158bf69e74f ("habanalabs: Timestamps buffers registration")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/accel/habanalabs/common/memory.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 633db4bff46f..37dbb9a013bf 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -2176,8 +2176,9 @@ static int allocate_timestamps_buffers(struct hl_fpriv *hpriv, struct hl_mem_in
 	struct hl_mem_mgr *mmg = &hpriv->mem_mgr;
 	struct hl_mmap_mem_buf *buf;
 
-	if (args->num_of_elements > TS_MAX_ELEMENTS_NUM) {
-		dev_err(mmg->dev, "Num of elements exceeds Max allowed number (0x%x > 0x%x)\n",
+	if (args->num_of_elements > TS_MAX_ELEMENTS_NUM ||
+				args->num_of_elements == 0) {
+		dev_err(mmg->dev, "Invalid num of elements %u, valid range [1, 0x%x]\n",
 				args->num_of_elements, TS_MAX_ELEMENTS_NUM);
 		return -EINVAL;
 	}
-- 
2.34.1

