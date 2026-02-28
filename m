Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HGmBBuHomn03gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A491C07E1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5F010E20E;
	Sat, 28 Feb 2026 06:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a+vZREpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC7610E20E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:11:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B3B38443D0;
 Sat, 28 Feb 2026 06:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E48C116D0;
 Sat, 28 Feb 2026 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772259093;
 bh=kSlBR43nw1qpErsYzT1vZoNQWreE9zm+wWCwsiTUixs=;
 h=From:To:Cc:Subject:Date:From;
 b=a+vZREpOIleKSIZgSZpEIdRqlCoovvqemDrWh5Ww7akGWTPGg3Rs5DXmrQs720Gf7
 ANK0mFLSgR98az0F1ZltYyx54Yz7NwaHTNIzPxDGq3Xh5j4qFj6ljqaIRSj7rvTKHI
 aarPsmm4MoVGpDeIQ26pg0cPrdDkUM2nOtjUJLZm7GAcEuiX35gtCw4tL3skhtaX3m
 suFTemhTa90w1X7TxEbw0160t02BkZlKKWZeGQ3wd72TR29R+Mq9qv1ubnp+BszDwk
 a+KehGoYh07h+JrzbsxOGNzL/WqOR2D3T1JguRE2LjppMziLpTp89slboX4wRQ+lFD
 avVWpQ1ujHHSA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mripard@kernel.org,
 ogabbay@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add some sensor data to amdxdna
Date: Sat, 28 Feb 2026 00:10:56 -0600
Message-ID: <20260228061109.361239-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:airlied@gmail.com,m:lizhi.hou@amd.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mripard@kernel.org,m:ogabbay@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:superm1@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2A491C07E1
X-Rspamd-Action: no action

Previously a series [1] was sent to add power sensor data for amdxdna
through the PMF mailbox.  The PMF patch was merged but the XDNA
patches were planned for later.

Re-send the XDNA patch, and then add in another patch for getting
column utilization.

Link: https://lore.kernel.org/platform-driver-x86/20260105172956.3732123-3-lizhi.hou@amd.com/ [1]

Lizhi Hou (1):
  accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate

Mario Limonciello (AMD) (1):
  accel/amdxdna: Support sensors for column utilization

 drivers/accel/amdxdna/aie2_pci.c        | 50 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 22 +++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 include/uapi/drm/amdxdna_accel.h        |  3 +-
 4 files changed, 76 insertions(+), 2 deletions(-)

-- 
2.43.0

