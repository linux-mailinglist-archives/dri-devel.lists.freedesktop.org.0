Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKOKAaOTo2khHQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:17:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D641CA0D6
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B45F10E273;
	Sun,  1 Mar 2026 01:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o/Z5JhN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2E810E273
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 01:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 66EAE60008;
 Sun,  1 Mar 2026 01:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85169C19425;
 Sun,  1 Mar 2026 01:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772327837;
 bh=rbHV+E9OK1mzq3SlC6hrvDcWFwLv6LU2MWwplXVyrIo=;
 h=From:To:Cc:Subject:Date:From;
 b=o/Z5JhN6fCkWTRYVYisLy6obsBRwrs7CjBIOA4W9U63zQNRCTikyAnR8NOgMZQ35Z
 9KP4k1wcSBk80kIOio0Q205war2UbKgpNp6HDYeANeWdHKj6jrs53O+0dcbLHwn5p0
 g9LEP0yI3BxxtHtSFXwuf6hWDeoZTWKrNVeSlyN9tlpGzTmYCBbK8Zx7tx8o4eAb5i
 rcyla3LmfJyzgYWKt91l/i1z3vQjRnDJ3obrGdT825des5tYIiZLp0V9EG+IQKKmOE
 Gf8JWRuZW5cnFQ/3sk4oCMF9GpEGQ/SoiaF4k/MdG04ITBYvYiBlY3F2IVSJRGNRW6
 4Mv+d9EWMjYOA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	johan@kernel.org
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: FAILED: Patch "drm/tegra: dsi: fix device leak on probe" failed to
 apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:17:15 -0500
Message-ID: <20260301011715.1671126-1-sashal@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:johan@kernel.org,m:treding@nvidia.com,m:linux-tegra@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 37D641CA0D6
X-Rspamd-Action: no action

The patch below does not apply to the 6.18-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From bfef062695570842cf96358f2f46f4c6642c6689 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 21 Nov 2025 17:42:01 +0100
Subject: [PATCH] drm/tegra: dsi: fix device leak on probe

Make sure to drop the reference taken when looking up the companion
(ganged) device and its driver data during probe().

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged_probe")
Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://patch.msgid.link/20251121164201.13188-1-johan@kernel.org
---
 drivers/gpu/drm/tegra/dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 175f5f9937b01..8ee96b59fdbc8 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1542,11 +1542,9 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 			return -EPROBE_DEFER;
 
 		dsi->slave = platform_get_drvdata(gangster);
-
-		if (!dsi->slave) {
-			put_device(&gangster->dev);
+		put_device(&gangster->dev);
+		if (!dsi->slave)
 			return -EPROBE_DEFER;
-		}
 
 		dsi->slave->master = dsi;
 	}
-- 
2.51.0




