Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dKGGEMMkemlk3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3380A36CF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BB10E719;
	Wed, 28 Jan 2026 15:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxNd6xw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB910E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:05:18 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-8230c839409so5549621b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 05:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769605517; x=1770210317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=60aBumMe56xZXRD8vE8OZN2hvZkCH80+CQWsk/u8eek=;
 b=KxNd6xw+cpkQER5g1k0lfK33x2V910f62ib5T6MeIawXzMPdljVapS960FQuFHRnsj
 ZsJ60uWYYr9sg/E1v+UwZGc9+VBF5sViZueibfB1fkHaWhaf/bvyWdvmIf32Gag0yqgs
 LqYB1lu8epynFXGLlmjE44fSnqEdHCcoNb/7E9YPWTEIKA63P+aZKupvaL/39Q009F/g
 OAC1SlodRCdCXnyUiA/f1rJClMNXmJQAe/X7l1k9n4sbBhd+QxVQgbei5Bjlc7/RTaEY
 TKurY/10M+PL0Dg2N62+C/my/3tQWpWovZfiUfd/UjGKKfgJbCxL0BrLs4pbqlFabaRl
 gGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769605517; x=1770210317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60aBumMe56xZXRD8vE8OZN2hvZkCH80+CQWsk/u8eek=;
 b=QVAmmjj0PGR+B8PAQ1fN+EnK1+aa3I1u//O5dv+2kBCBuGA07IeXA7+WxwaRUIq317
 9J+cz8ttNxDoWSg7M0d7xFMmQeFC9cwjP8mZVTqYJh2jx2vksd2bGklT9zRiZ7VFMiQK
 V8gLgR5vGDAeR7iit8i29pJ+l7sFE2METSsXLSHixFReVts98/cjktwdKFjND6LVS7kK
 JRDWmFVhAlZnKgBgAI5XkOwAdSOt4HOi43Gymho6Xz+5Xr5WniZhcg9eSbtVZy/20qVg
 W++jWgd362JiC042sU205AVwPyBRYr4Aj26I2KhCredQKRc3o2ucLZnG4EF3bqIk4TJe
 +hEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7120cfokAUiCuoVkOpx7C5TNItqKjOrbXtkVOIBnOFKxoj4Pt+uQ8ogqFz6na629+J8MSEHVICjg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5nc0oZNh2K0THzBcI0VrvgRCI5vLs9aKdUh7EwQHmL6rKV8jU
 psvgkc25S6Ske2secVm2TBtkvlif/vIvxl9r+k7OMKxD5ptKFDZjmFG2
X-Gm-Gg: AZuq6aKIFLat3Tt02mbMQ3/bDqgXnCLmDLMUh6u36lvtwfmJWYwK+6QTfNRGvWBU2dK
 rl7iFt8Z4S/UVnMaWjCrR6oOe6chwnf1JR/er3cJQqqBjY5sqlmw5C4/lPn6uFAcqoz/NSV+yGZ
 CkveKciBvCMdhQz/s2YbW7gRjXDD3D+c+B3MeX5+jfI86Smcb20Zf01punBNQlviIODLd9hMRDd
 n0sNRBvH6AxXHtu//uRPWU3Ywsd5ZTwbwzTYpIcQ7eT1jeNOEnJPrpWsGHQgxVwdUIq+EBlwDba
 N5eMXFEr12iXFrHUG7TTHwRoeCWym9kv6RFT9GnCqw20IV9ITJvsDyyVSRrTsJeiAhqyOIZTTKz
 UZcNfVX2j+qVoG29ZhHHEuuOIfxXToJHQ1vuVcCOqoKPMcP98tgG0ggTk1zl3HDJaARkyMCpnPL
 GuOauBQBQF8KHiwW/j/vj77ClBQg==
X-Received: by 2002:a05:6a00:9506:b0:81f:ac80:499a with SMTP id
 d2e1a72fcca58-82369199b5amr4580614b3a.20.1769605517452; 
 Wed, 28 Jan 2026 05:05:17 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c50fccsm2569978b3a.60.2026.01.28.05.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 05:05:17 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 22:05:03 +0900
Message-ID: <20260128130503.868466-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Jan 2026 15:01:07 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:csshin9928@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A3380A36CF
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+
+	par->fbtftops.mkdirty(info, start_row, end_row);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

