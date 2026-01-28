Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dFbuDsMkemlj3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF5A36BF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFF310E718;
	Wed, 28 Jan 2026 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J5o2XH3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F2910E628
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 08:57:33 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0ac29fca1so49424245ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769590652; x=1770195452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEOJgPmuwRbV12LBE88Ol+uZDUf/K36dFJv3SsHLtYY=;
 b=J5o2XH3HEJ7Uf0q9OFvoqnO16Fn8Wh2zqBZL157VlPMt6+ksUrgnrLEkkixbRaWcnu
 b4AJY3iNJw1fwXQFToKA3M4cqQWLaxWQGX42MN7DBiQSB2dXRXqfRkaQEaxZZic6rxz2
 GV3tWPNgBu8ZDIPkgumMyvMnmRplH4Kd1x3jUEeZ9Iebh/8C5ecV2/A3ca36pknw+aHN
 MIdz9+9ifOLlnnYOT89kJWpRxyKB4se8x4DWcfaWFHRv8w5LsKTmlBGr7YYTBm0pG2xj
 4c7C2vuxAcyJggrSfSZHTdoCbi7QGkqz30mRMFw5Qqw86/LEVPtWTuWJi/+jFZ4vqgmg
 uwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769590652; x=1770195452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEOJgPmuwRbV12LBE88Ol+uZDUf/K36dFJv3SsHLtYY=;
 b=SdtwBn2goSDQizj678GutvmxTP0fqHlzUJjSAn7qbq/kX0/UqvpDXbap4I76BlRdFO
 kXnmxgHzf1AWJnlsIztlTyE6PeguqHCnuL2IiMSZ18Dvzj0C5+YsTedxV0F6zQcWsGAT
 p809NT/OFa6J91kpLHDuZVyZpfSL/hIXXy5l2nCsGGVj/SPlmmp5PgGFnO9pXtSM9ssG
 Ef2tkubUEhDPNFb5UilDQuPdOOvtmUXmeLDSBjUOoTWjc+aKkbQD2GQcG27W+z+G1BTp
 g97CWb31ahCJbVbED8FngLIb6o4AVx8vq2+JU/HZmsN880IgnewgEzX+e/ZqIcrCnIxy
 +ieQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXI1zv9uQlnTkGmEBsyw9ILUD2QaTveZ5vRdYniyz1KzS/T/VJUQRgmAJACzXAFvw0NeKQXOCrPU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTz8zOQZg+tLAut0KlI0DEh6Aw9CILxMAQ7xnoUF82JosiX8Ue
 MKXsVHZcTLrZNd4OXTi2Ia71thrJh4dYotjRR+ET09jYDRWKOK7Uz9Ul
X-Gm-Gg: AZuq6aIyD9UwT8JHeBuFp8DBLAE9iUQ52bPpEBbUmk8dkthf6VJw6CQRUhcA6X9FW3X
 FwZJ7dofGYQwrxSQx9myLhPRZ6dJMI7mWUzZqv4UuQOGDV+FxGGoKei4WRn5z9QvPYW8QS55zSp
 6WdTIxa88qFoY1TggtyUpZwgw8Jf0PLATar2S/bWXw/+hGd+SW2w3ipbn33ebuTNDuTYUSACvEn
 UC2VWpX/3Gkpm/7wvSC23izitnfzWZ+Tl9ZQvDCqTg8tMpKL2Pyoiy1lM1shV+15lWzVDYWsiMQ
 OjZwF/1tNdc9Ng6GHBNUQKq77dqYudtO4y+siygjZPudqDE7IyFHIl0xinscctHYCvTYWkpmghF
 raFMdJGzLg39DwSR9hIMX4+gbRdE3K4ZbnOVU9scJFlb7oDCSLqvPIDU1YOHspqnFzMhsunoxcF
 ctmSibx88HvMxBr4jvWokZmQytTg==
X-Received: by 2002:a17:902:ce82:b0:2a8:7814:47ca with SMTP id
 d9443c01a7336-2a8781448a6mr38415535ad.0.1769590652450; 
 Wed, 28 Jan 2026 00:57:32 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4154fcsm16707795ad.36.2026.01.28.00.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 00:57:32 -0800 (PST)
From: Waffle0823 <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Waffle0823 <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 17:57:20 +0900
Message-ID: <20260128085720.862399-1-csshin9928@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:csshin9928@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 72CF5A36BF
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: Waffle0283 csshin9928@gmail.com
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

