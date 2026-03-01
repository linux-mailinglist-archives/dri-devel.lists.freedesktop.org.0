Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PPWKT6do2l2IQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:58:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9811CC6C0
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC5C10E39C;
	Sun,  1 Mar 2026 01:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXwgoWwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672E310E39C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 01:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD2906013E;
 Sun,  1 Mar 2026 01:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD77C19421;
 Sun,  1 Mar 2026 01:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772330297;
 bh=3EIISzbeKVqchxa+1QCQ1gwGJ55k3qVQO1Ia51Z260k=;
 h=From:To:Cc:Subject:Date:From;
 b=WXwgoWwd3AYnLUmm+RluCZviycr9PrUjvsNrEXMuyj6nxEluLMI+ISvxFvOJ+dGMb
 RvEKUBqHm9lQYh14hqaY8MyNfsFTjN4PEZ8byXWJNEDe3LzPZFFo+IBxXN1yFSjOUT
 Nkrow4jpZXzqQ5Ts6/T2FwBdLzbo2RAuI2XzLM617OGU49JchP7G3gh49ShDRju+KN
 we0MjfDIuptAbYD0VLtFtsRx2EAhN4FZghXz3ake860l6HsU+QqOivnnktayx37MBm
 II3DMvOd0ciITUpVNl5ZZ1j3xbrDEakEYR3wIGSjbxXlYfFdE5jAQPk7kd1ZCeUieN
 K8QMogcTdgM0Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	geoffreyhe2@gmail.com
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "fbdev: of: display_timing: fix refcount leak in
 of_get_display_timings()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:58:15 -0500
Message-ID: <20260301015815.1723667-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:geoffreyhe2@gmail.com,m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7C9811CC6C0
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From eacf9840ae1285a1ef47eb0ce16d786e542bd4d7 Mon Sep 17 00:00:00 2001
From: Weigang He <geoffreyhe2@gmail.com>
Date: Fri, 16 Jan 2026 09:57:51 +0000
Subject: [PATCH] fbdev: of: display_timing: fix refcount leak in
 of_get_display_timings()

of_parse_phandle() returns a device_node with refcount incremented,
which is stored in 'entry' and then copied to 'native_mode'. When the
error paths at lines 184 or 192 jump to 'entryfail', native_mode's
refcount is not decremented, causing a refcount leak.

Fix this by changing the goto target from 'entryfail' to 'timingfail',
which properly calls of_node_put(native_mode) before cleanup.

Fixes: cc3f414cf2e4 ("video: add of helper for display timings/videomode")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
---
 drivers/video/of_display_timing.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index bebd371c6b93e..1940c9505dd3b 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -181,7 +181,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 	if (disp->num_timings == 0) {
 		/* should never happen, as entry was already found above */
 		pr_err("%pOF: no timings specified\n", np);
-		goto entryfail;
+		goto timingfail;
 	}
 
 	disp->timings = kcalloc(disp->num_timings,
@@ -189,7 +189,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 				GFP_KERNEL);
 	if (!disp->timings) {
 		pr_err("%pOF: could not allocate timings array\n", np);
-		goto entryfail;
+		goto timingfail;
 	}
 
 	disp->num_timings = 0;
-- 
2.51.0




