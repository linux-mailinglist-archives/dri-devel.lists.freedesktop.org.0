Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOPhOPmMoGkNkwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35F1AD591
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B68610E9F6;
	Thu, 26 Feb 2026 18:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WgUTGat2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026B10E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:52:15 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-7985fab9203so16824097b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772031134; x=1772635934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2TBYz73kHEnIkCuW8JdOuhSWd80jhSztg/rGzlnY3s=;
 b=WgUTGat2n9ir4qki85B4rLWUDAoPl9AtdO0ke0eO6dhxZKMzxBoe9peRiDstmX/kav
 NZ9doOJVb1bwLeJ4VL3+i3PNlsItsOdyR5ebEPzqDkaw7GrirGPGefAPH630qAf5LEdY
 LopyNOKlD2RBKO1KfGA+NE5u9vFpNcfix/SDDomnPk+6QpL9H/y8omN/eSM/qmj6h6so
 0rz0ACEfFZh5RMPcVui1opIMypMioOikVe9YOWu5+hKFbaCgiYrqlFsRjm7hoEqebeko
 yqQjZlv1Ts9GUL2aN8nClSRSxfxEuTWoYILHj1MYPA4gplCu0vPLKl8YXEOwarZ26i4D
 vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772031134; x=1772635934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2TBYz73kHEnIkCuW8JdOuhSWd80jhSztg/rGzlnY3s=;
 b=KFyC+2jsX5dFWE3HtkzWA9gY+TaypJWGmRTMaY6t+fYvk1TOanSjxOgzYViVwzM8ZY
 gg6k925WpqnwveB/Vw5Vm24KMmczbb1RoTpvn55AyaTlaqzgrAILmWJAo3sQFNuDYNZt
 CxP1uquUapQ001PGYY/9h9bbEP0TNVnZdDcaHKo9a9ZwifQkM0n10U7CxueUV8EBi1gU
 GuHslO2sq0pjNg0FzfoVcSU9XeNFOkOl+SPf8/k9uzSdBgg94MoIlfTFpmfnYjS2kL8a
 lPi/wjTr5g0HIzOtUcXnkpl8bZ9vWU31CGXrJsB6lwUXQaNJQe1YoK1yHG0lR8cn0/rp
 1INw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSS0SdC5IRvpu42B92dc4l1M/se4ljXWXbYvOjShvnLg7zA5mq//dOwODzAmRPY1Rj9fq/x08sD58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqQjagFzoqLrAOkCqza3K9wepVvmrzO20+zpUhO4adka+vnq3U
 ihgLHkwaDfPz0fP8fqgSmOpZPdqak9grsAoN8sapXpvyjRpE0hOQEa28
X-Gm-Gg: ATEYQzwjTwYW9lCL7oqqpaJce/2mBiRDILjpbPgYtUQuZfj8WsQmdhpIdpMzB0ZC5EW
 wjt+fTSpOBh5TlTkWhZWsni0MRltSITBa+3SkIQ3ehhcgiSihCV+mDYccUMcQrPWGsORTmdvexA
 9tBxJ2Q8lK64Ri2EUb2NV2F++IOH8qNPqkFiySg50h3gMBtFjIy6JJdbHNfHVOP3u7b8e8ko96b
 1WO2Yx4F8xzhme/d4KXahzHyb6JgeXnuODZABkMrWFo6MaIheljim9Emx1tnH1CeKH4uEMVsSF4
 EHHU2UGpKy3AVYJ92nSLVulpjWzkhlEx5DwoYFB8/w1Jfs/UcpknyJEPfTtCEAl1qpBjCcnoNSB
 pfm70ACwMoAqa1igYjo79O2LrDteIAOVdZcYA+UApzTW0q/prd+jSStt/FUNYgI0DGBMxjqU0yC
 sp7L+H6P5KfB5TVesnKqB+7dvGWdZ2Lu1prgbRYU4IkOQMzb5zGngaMUQ/FCKN/dkXNdl0KGQV2
 z2gZjebhqr1nc0sVGjShuDL
X-Received: by 2002:a05:690c:101:b0:797:db54:b876 with SMTP id
 00721157ae682-7982902d571mr150381117b3.43.1772031133627; 
 Wed, 25 Feb 2026 06:52:13 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7982dd81e22sm57803827b3.33.2026.02.25.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 06:52:13 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com, superm1@kernel.org,
 mario.limonciello@amd.com, cesun102@amd.com, Leo.Lin@amd.com,
 Jammy.Zhou@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] drm/amdgpu: Fix resource leaks
Date: Wed, 25 Feb 2026 08:51:54 -0600
Message-ID: <20260225145154.14168-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:11:59 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[27];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:lijo.lazar@amd.com,m:superm1@kernel.org,m:mario.limonciello@amd.com,m:cesun102@amd.com,m:Leo.Lin@amd.com,m:Jammy.Zhou@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F35F1AD591
X-Rspamd-Action: no action

There are multiple resource leaks due to ioremap() being used and
iounmap never being called in multiple possible error paths.

Change ioremap() to devm_ioremap() to fix all resource leaks at
once.

Detected by Smatch:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4834 amdgpu_device_init() warn:
'adev->rmmio' from ioremap() not released on lines:
4539,4549,4563,4574,4592,4834.

Fixes: d38ceaf99ed01 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Removed unused variable idx.

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0acddcb04730..3bc685162974 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4520,7 +4520,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	for (i = 0; i < AMD_IP_BLOCK_TYPE_NUM; i++)
 		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
 
-	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
+	adev->rmmio = devm_ioremap(adev->dev, adev->rmmio_base, adev->rmmio_size);
 	if (!adev->rmmio)
 		return -ENOMEM;
 
@@ -4843,8 +4843,6 @@ static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
 	/* Unmap all mapped bars - Doorbell, registers and VRAM */
 	amdgpu_doorbell_fini(adev);
 
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
 	if (adev->mman.aper_base_kaddr)
 		iounmap(adev->mman.aper_base_kaddr);
 	adev->mman.aper_base_kaddr = NULL;
@@ -4927,7 +4925,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 {
-	int i, idx;
+	int i;
 	bool px;
 
 	amdgpu_device_ip_fini(adev);
@@ -4970,13 +4968,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_unregister(adev->pdev);
 
-	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
-
-		iounmap(adev->rmmio);
-		adev->rmmio = NULL;
-		drm_dev_exit(idx);
-	}
-
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
 	if (adev->discovery.bin)
-- 
2.53.0

