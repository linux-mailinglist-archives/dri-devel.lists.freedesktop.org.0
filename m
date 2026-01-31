Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g6PKCi36fWnlUgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:48:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C244C1D10
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1A910E0D0;
	Sat, 31 Jan 2026 12:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gE2LiMUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72FD10E0D0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 12:48:40 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-352ccc61658so1420531a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 04:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769863720; x=1770468520; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yg8/gpgU9m1/xq48pahp4plD2I6M9C2S++w+H4nQDDw=;
 b=gE2LiMUc5JNpCm8EI0MRYVomwdwyrbiKIfACvPTqdW0IhNOsFWdxsU5yAEtfPYgYui
 IMIk3G3NjqwqaWIJFrOzc14XSJfuO66PUpxecdOdEu2pOQKR05aQMnYs79MBZYcyAClG
 oUQvczaiyVPGEXvSENB9HbYlOHnafLZyOsQoRdImCr1yrvxXHpjxSqKxUDSh3uAHvdY0
 R6l2mUwu6ceYBmCT355G3LGA4M0nrcVA+hYPwi7NZlle0QV9AU2WSWvfpYAMwKYXNBbr
 Ic67rlZ9+Htv4lQ5clHWi5/mXGxr1Nt0xIrP4OicwkWpnXmFs37pRzIbuRBQeDdB7mC4
 d8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769863720; x=1770468520;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yg8/gpgU9m1/xq48pahp4plD2I6M9C2S++w+H4nQDDw=;
 b=Nht6I9MNAKrn26tyBQ/PSkU+XiO7oeu0ZrE8KRW71AR5oRvy0BpyMoCadVxos/AAmB
 gCB4AcrpOniLKvlvghhgOExfmavfVpuSw5+NZCjGiR/0gCBG0lZ3pVq4Y0wVNopEkslF
 PFHKlo3AUgrziEcWy8HCvC7pjyqnhCh/XZo1PWpNK84n4moiLkW2cK8C2QFWRkZoIudG
 YzGwPkwsZMGVgMut5wkKfoyQmTz7xc6qcZBgcJ+VLqbdq1YS6BgPZgXbK9W2HzVvEWoC
 9v7xy+502frNocvTbWptso3Ukqi39fyi1PyiDCwVC4JNiN4coY3Q2kkFVU9Qx4a6sNwD
 zmJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfQzAS1ZPcbOGiYmOM7KwnCSx2R/sZRv39hP6D4vUp85bH57tf3isKcKVXD5H7uf3Yvv7mXFVBWJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ+92VE8S7ItWpXINepuNEY9TxBUkm61wkoQ2TvdMofOzY5lMM
 /GNP/Zh53ndEKsAIyrsNLFAcBJ1W/mzX9NKdzthrtIJYdTYtHXIiW4/M
X-Gm-Gg: AZuq6aK9LB1tdePzX37bWifVp8OarKLwk0wNcWVPjRdOubJumwBVXCx8v01bkDTuJ6t
 2TbzqPXm91rPM1mqeNOizoCmxky8zHMFktURGXmJGHgtjBA2a7CrmevcJFr4SszyNvx3/5cOnXx
 RttjwBE0Ph68w79gllzPe1u/css5w4CDc+fCKkIuze0jUvMjO3zqVM1Ir6ZdWv58c/xTPNQHuCj
 ukcueViUlf1u+9n0DXNN9glCR6tVeyw6CyM60pdu/wb7UTNZDCh+/J5Fs5SGMf0PxkRe7xGdA5G
 sxb35wQiJf/Koyd0fj5a9jEHui+qo6lH/c0xmBV//wGl3JCioO8T3hwXWtzw/cLksJ74tkTBEjT
 RhlsXizMmW2lPzOqlBTwcEjHgHElsxeT4G5RroV+q6LI6eqClAeId1oNBCJG3/shhUSNY9XNnz1
 54RTD1IUU=
X-Received: by 2002:a17:90b:1348:b0:352:d1a4:19cb with SMTP id
 98e67ed59e1d1-3543b323becmr5352601a91.11.1769863720158; 
 Sat, 31 Jan 2026 04:48:40 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-353f6103e9fsm13107396a91.2.2026.01.31.04.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 04:48:39 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 20:48:33 +0800
Subject: [PATCH] video: of_display_timing: Fix device node reference leak
 in of_get_display_timings()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-of_display_timging-v1-1-f4f8d9f87c3c@gmail.com>
X-B4-Tracking: v=1; b=H4sIACD6fWkC/x3MTQqAIBBA4avErBPUor+rRIjlaANloRFFdPek5
 bd474GIgTBClz0Q8KRIm08QeQbTrL1DRiYZJJcVF4Vgm1WG4r7oWx20OvKOoW3qUkvDy3aEFO4
 BLV3/tB/e9wNMm2F6ZAAAAA==
X-Change-ID: 20260131-of_display_timging-ef874a2d049b
To: Helge Deller <deller@gmx.de>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Warren <swarren@nvidia.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769863715; l=1640;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qWjHqlgo4XNYoiM3y62z5BQIp1iGOLohTtFGm8bt+wc=;
 b=XM0629h8r42xPVOhCm2SBDvW3BUSZvjh6PxB+Kv0KYTj9yiq/letlXyOHcVyaxOXrdVMsqn6j
 xWztwcLXPhaBifQPNdGT7mFMXXzUpP1ni9wqvSz0sfxt8L1iI4TXaXh
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:thierry.reding@avionic-design.de,m:laurent.pinchart@ideasonboard.com,m:p.zabel@pengutronix.de,m:swarren@nvidia.com,m:s.trumtrar@pengutronix.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,avionic-design.de,ideasonboard.com,pengutronix.de,nvidia.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7C244C1D10
X-Rspamd-Action: no action

Use for_each_child_of_node_scoped instead of for_each_child_of_node
to ensure automatic of_node_put on early exit paths, preventing
device node reference leak.

Fixes: cc3f414cf2e4 ("video: add of helper for display timings/videomode")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/video/of_display_timing.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index 1940c9505dd3..a6ec392253c3 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -195,7 +195,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 	disp->num_timings = 0;
 	disp->native_mode = 0;
 
-	for_each_child_of_node(timings_np, entry) {
+	for_each_child_of_node_scoped(timings_np, child) {
 		struct display_timing *dt;
 		int r;
 
@@ -206,7 +206,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 			goto timingfail;
 		}
 
-		r = of_parse_display_timing(entry, dt);
+		r = of_parse_display_timing(child, dt);
 		if (r) {
 			/*
 			 * to not encourage wrong devicetrees, fail in case of
@@ -218,7 +218,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 			goto timingfail;
 		}
 
-		if (native_mode == entry)
+		if (native_mode == child)
 			disp->native_mode = disp->num_timings;
 
 		disp->timings[disp->num_timings] = dt;

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260131-of_display_timging-ef874a2d049b

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

