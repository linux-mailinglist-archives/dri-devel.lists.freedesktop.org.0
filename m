Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL0ZGCjreGmHtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:43:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF597E5B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8FB10E0C9;
	Tue, 27 Jan 2026 16:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZHBHoeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155710E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 16:43:16 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-81db1530173so3033185b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769532196; x=1770136996; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbJqSdTvAPwaCOQOYdwmWizDI5ckJvr5N6HEdUxLGI0=;
 b=aZHBHoeZEP41ny6HrwoiQ6GXqMHCKoSHqTRXRnPAEVsn+ZsCY1hbcSVEFDw+EVaqzy
 4vZhF9V25jsUV3NFl5zavAg+oQqAiTpTgldoEMsn8bnZyBPwE+ltyhSw1EUd1WaaFIn+
 GJ4q4/QDFdwbXMPvLykxvdK/i1NbmpeIq4U+Db8GPZzjVug2KK75itEdlTgCaMxaIcbr
 ztZpuXa0lsZQ0pTs73r9G1+sUAd7pO4L/dG8gwTIUHZ8W67Uv5cYN5fxzlLT75YRfDIn
 x0y0CIMQA2HJP6SCN9MsNuj+hIoU9jNYBbGzFTO8oPRZOCRQoGBAdTp/JQiqzN4KHLzS
 BXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769532196; x=1770136996;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rbJqSdTvAPwaCOQOYdwmWizDI5ckJvr5N6HEdUxLGI0=;
 b=iszYWgLGNwaNkXmbjwayeaN+dpTVWLJst8Hgyg8tX2x93zk+8aPfE7aFoEoSLOrazl
 umQkn5M4kHJwCj+VjvZnyFhlbcGnGr+70MjXArzzd2Bz2GUR61B0PIiunc2CZUXPvTU8
 OYoFoWbCKBFJ3zfF9+P1tzgJHW77tAeIz+BA7l9BjtiI8RF8cJB0vbUESb6DZT3XTWo8
 YTpxqzQqJNGepml7g4cty9suHg6b7mzNhsHB972eu+Db26pEUSGYtJ1ZAuW0jd8q3kIF
 2mauHhJB0wZz748ifV146cwUaB4qxzda/KmF/VVJ5d20/7nleK8blWar6YxsPdw3nVgl
 zrng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8Y798veTfijO/B8/yU/HgVa+wIun6TjrlyFyvZZVA5/KldQr9HDBKwfRTBAvGMAi+ANNmwsFC/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEEJAH66jU8BzB2Pu21FQlBYvxzyGiMn9e7x5GtF49POE91pWX
 qV+XaisBMGu4hhpC9bw/gK4shoArmHG49l5mMoHwoyHsWVMpiKR23mGnv6v4KeGhzac=
X-Gm-Gg: AZuq6aL6giSqmKhRhyxG+eqEYNRN+ZtHxM7ukVZiouomPfJ6gkGxMcjfBdvOJ7XOlzK
 8u2HfxsuCMO2DHF3HxLDDaq016POlwu4qOU0qIrNl9kSrAUsek6eQx7fPqJCxitVIYJSEjWBZC2
 r8zopUL2dXsCXVBacUSEyTCVGHpQ0WfonmV0WUALyzij0i/La1V0Hq7o2KVpM3g/pr8+eSj6Eo9
 FbXIfryZ8y+9uJyJ1KjVKwwal1QyhiL3dT8ckQ5O/eH8L5Kjhx67oeCxDcygV4ntlotHHdtoFN5
 C8Nv1Ik0M51AI259UqjveNkk4CTkdt+3Y05SCmCDaN2mULNHeDeQgepFgXeWCO7f51N6DQQBrLx
 kJIa4ZYtaqY4ZEXTSI/S0CImot+8MmaAiWsnxwbzo9U+nw4l8dh9iRP94+tplDvJk1ELayveF9d
 JsYdwTz8Pi/KXq9Bm7rhXr3iw=
X-Received: by 2002:a05:6a21:6813:b0:38d:e87c:48c8 with SMTP id
 adf61e73a8af0-38ec6546d38mr2069349637.60.1769532195656; 
 Tue, 27 Jan 2026 08:43:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c635a1307a1sm11187307a12.5.2026.01.27.08.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 08:43:15 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 28 Jan 2026 00:43:10 +0800
Subject: [PATCH] drm/tegra: dc: Fix device node reference leak in
 tegra_dc_has_output()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-dc-v1-1-a88205826301@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB3reGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNz3ZRk3VRjS7PEJFNjC5OURCWgwoKi1LTMCrAh0bG1tQD4XkIUVAA
 AAA==
X-Change-ID: 20260127-dc-e396ab5384da
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769532192; l=1230;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=jvSrjyI0rNYJ8C8R56pXxeLDoon1cGjhsNLYQXraWfE=;
 b=zAg99uNto1mob2shUsiEV5w4TAfuo/rwrqM+hVIS9lQ63dW5WkF0SDAfWkvE+yX7MT5qx765p
 W/5FyvToi+QCrFPSeh2AtelSmLjoTdDxfD3R9Qr8tLWnFjjJVJfMcVN
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:treding@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:thierryreding@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A8FF597E5B
X-Rspamd-Action: no action

The of_for_each_phandle() macro increments the reference count of the
device node it iterates over. If the loop exits early, the reference must
be released manually.

In tegra_dc_has_output(), the function returns true immediately when a
match is found, failing to release the current node's reference.

Fix this by adding a call to of_node_put() before returning from the loop.

Fixes: c57997bce423 ("drm/tegra: sor: Add Tegra186 support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 01e9d5011dd8..9bf6c008a5ea 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -101,8 +101,10 @@ bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev)
 	int err;
 
 	of_for_each_phandle(&it, err, np, "nvidia,outputs", NULL, 0)
-		if (it.node == dev->of_node)
+		if (it.node == dev->of_node) {
+			of_node_put(it.node);
 			return true;
+		}
 
 	return false;
 }

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260127-dc-e396ab5384da

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

