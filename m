Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GwJOV6No2ndGgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 01:50:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1981C9DDB
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 01:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F385410E03D;
	Sun,  1 Mar 2026 00:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oF/FjcxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458DF10E03D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 00:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6739260008;
 Sun,  1 Mar 2026 00:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB22C19421;
 Sun,  1 Mar 2026 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772326233;
 bh=+pD3On1wtg4mr93oLiTdbuYmyvucPeSV2klXKFApJxA=;
 h=From:To:Cc:Subject:Date:From;
 b=oF/FjcxGmFhytPBPx4lJEuq4InJkgjpAVs9IaIxCREqE77XKkFczzkOWhqywfNv8o
 UavnGSvWVonPdvp7nQ8uzPTpfYgKqJBF3etIIgLVj/aKHWCWtd0OCjIFZ65PHt+lX8
 TcEOJxCjAtR09xS4x951qCbxCFlU1Os/CHmWwfoYV5tqov6Xe5ScfiKkcixd3vVEJc
 t7Y0ERX2SEZL9IydcxmmsTVRzLHtqt/OoKaCdjyLv4rP0sjJsR96Sh5uvYr6/qRfiu
 CgGevzRCcGIvlkhxJVuWfXpRRuDUrqx2hQtmqFfq5li+34v2h8/IqS7/TqN0iLqyJg
 B2CSa3b7sYxbQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, mamin506@gmail.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/amdxdna: Import AMD_PMF namespace
Date: Sat, 28 Feb 2026 18:50:08 -0600
Message-ID: <20260301005028.367618-1-superm1@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:mamin506@gmail.com,m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6C1981C9DDB
X-Rspamd-Action: no action

The amdxdna driver uses amd_pmf_get_npu_data() which is exported in the
AMD_PMF namespace. Import the AMD_PMF namespace.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 98720ddc9818e..d6d12355bd2b7 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -359,5 +359,6 @@ static struct pci_driver amdxdna_pci_driver = {
 module_pci_driver(amdxdna_pci_driver);
 
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("AMD_PMF");
 MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
 MODULE_DESCRIPTION("amdxdna driver");
-- 
2.43.0

