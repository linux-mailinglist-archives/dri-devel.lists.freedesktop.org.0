Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKeCJ5iGrWnZ3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1E230A94
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A84410E431;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X09NVS21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE2410E012
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 03:33:07 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-79801df3e21so90626977b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 19:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772854386; x=1773459186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/NIaTR733CEI10YxzEjaU+igMogbfaVYBZNgtGsYrGs=;
 b=X09NVS21bXVxaNDknlxyszZj9lWTlGgSYIciHl86zEynC4NCX/5W1SdAOFHBUOYnTH
 dEIMqtd6SVFbxKpJE8tjaMxWV6g6BT3B9OpUPZf00DTLx1dbRdpS00uXdqtkIgIW4qHl
 zzOi341m7jME6Xz6Rr2mBVcbWgbh5T08Gat0bRVEicWVjtl9hTc1VT6kLiHsB8wby6pn
 r6jMykHnNdJjI8I5J+lUdNLJ5oN/FZQrCxV3LXp2kYu8Hpp4XUXlHBNWIBJTmZOhJGLA
 6wvvXKbhXH2DteTHtAuIDnt37+sOFJkimmyE77lz4ug/8nnif2re7Jb95VdA4tZszbcP
 RDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772854386; x=1773459186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NIaTR733CEI10YxzEjaU+igMogbfaVYBZNgtGsYrGs=;
 b=cmHaUJlislbr3aGbrdXLzIpuXgV7GYUUYm8dDTJmEkBr+Djw3Zq6Jb5g7Bbr8KLLza
 3ZxRJmjFTjquTq0F2AB/tRsjcL9insY/CG0gogEzzATD7n9pIq751aYnNIUIoQQ5FtPE
 egg8OT4MAV/D6NgiV/l3IUkTVTiRYSs7IL0fmzbZvD6dfw2w/JtelKDULzv/xEyVa2cN
 ZgzDoTIUpvFHHobk8OY4QEsXa9cnuPrIcx80oJcm+K/sRfMkYEPuGgDQx+s71u985kU5
 iDjv6lq2E/tgG3E5GZF+ecHCX9aSGN0KBP6iaR4T6jTg/DCwZcfaSHu5bJWbGT0y4bS3
 SjTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbB2tP5563BuUzzI1+H3cY5lmt8dUnqyBfGHOlU5mJ9XRHtIIESnk7hZUlKNdwkgIabnRqmTrkWoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWR7ovfhfhmfoE1oudzqL6bbR4+q96t0oRBvOsi/ETqpiX/GdJ
 hzfdzorrQHpQpvuLhKexU+2fotzR6Q3uw3o+EhtQPg4xx+rOgIDrNLGi
X-Gm-Gg: ATEYQzyjQwzTOwt+DXt6pu0lhsdGCEHP4ccqXpAXlS7SPuRiGaF58Y7Y97BBFPSPv/u
 AMbCdwgPsJPUW/EAGTaxHyhaE8FmL+gk8wPLzcswiYJTy7dFLLPAFvop3q14QbX5V+mmD6AVp53
 CnsJGfCNRW6+pR2gFvfCdFQmR1N7QIeRYBncSa6bJz/sQrV5ZxRDuR+9m2Y1hMEtbnoUN6jvx57
 ULAL0+QVbC2tfXpDGB+WS4nDZ2qu8Cc2LcUU8ypp6wij61FTOO8gSusILY/MIHAJU1YHfEaKnzh
 4CNCRf+o+RD+HGwc1opO1Vxmvxdu6vW8yrrxoHUnOUigd+0kvH1P8A3M+s8A2f2NzUjTd2pAQT1
 Kwi1136u5oHZ6he5jZn00mep+sYTZqClmnXJEHABSZ68mz6E1wrYryh3GHYCDiPg7cL5h6vJXxo
 mQVATClw98gae6MZ2JhFvQcfU0DndzwZVFiJtfQ27aoCygXSmJyGCb18483qDwkYPiAXrXgNZpH
 0GlhDYN8WVMTiwrP1g8R8xJ
X-Received: by 2002:a05:690c:ed5:b0:798:578c:2ad7 with SMTP id
 00721157ae682-798dd756781mr41072307b3.39.1772854386380; 
 Fri, 06 Mar 2026 19:33:06 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5585])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-798dee4a70bsm15274827b3.32.2026.03.06.19.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 19:33:06 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Joseph Guo <qijian.guo@nxp.com>, Ethan Tidmore <ethantidmore06@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH]  drm/bridge: waveshare-dsi: Fix signedness bug
Date: Fri,  6 Mar 2026 21:32:45 -0600
Message-ID: <20260307033245.71666-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 34D1E230A94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[34];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:qijian.guo@nxp.com,m:ethantidmore06@gmail.com,m:lkp@intel.com,m:jernejskrabec@gmail.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,mailbox.org,nxp.com,intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The function drm_of_get_data_lanes_count_ep() returns negative error
codes and dsi->lanes is an unsigned integer, so the check (dsi->lanes <
0) is always impossible.

Make the return value of drm_of_get_data_lanes_count_ep() be assigned to
ret, check for error, and then assign dsi->lanes to ret.

Detected by Smatch:
drivers/gpu/drm/bridge/waveshare-dsi.c:70 ws_bridge_attach_dsi() warn:
unsigned 'dsi->lanes' is never less than zero.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603060341.hNj0pl9L-lkp@intel.com/
Fixes: fca11428425e9 ("drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 0497c7ecbc7a..32d40414adb9 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -66,11 +66,13 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
-	if (dsi->lanes < 0) {
+	ret = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
+	if (ret < 0) {
 		dev_warn(dev, "Invalid or missing DSI lane count %d, falling back to 2 lanes\n",
-			 dsi->lanes);
+			 ret);
 		dsi->lanes = 2;	/* Old DT backward compatibility */
+	} else {
+		dsi->lanes = ret;
 	}
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
-- 
2.53.0

