Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF8KBsMkemkO3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A48A36BB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E29B10E715;
	Wed, 28 Jan 2026 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHDVjQpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3084A10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:09:00 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so3509466b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769609340; x=1770214140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0UboJ63LtcZ77ZQp3GiXhx2JgM+P9ZD2N90y/HehnAU=;
 b=YHDVjQpP4VcUu8HgR+i4YqI2b+zx0bwCqgd16toVYqrwbdmcOaPSv+5c7R+Ku9hvIV
 zxlCNof7yMl8cvWzdoLr7egZ7btxjrmhMyuM/GZXuzXj1t19DTcCC9cgVceHDR0lOIXy
 dqMUb1/4jzSLk2JrChRuLX/99YTLVhjZ7xGK5tQoWSn2YJVMxBasYnXTZARGc2wG1yqB
 4dch9ZJGmc+9CEqs9/Fi9LIvSBd7tppNbMRkg5syJSCLhvuT+x9A+XoPnLixZ6ALbxWs
 1Yo+xBjEKzfXM4LxKc0J+FaGEgx3xhqFuPCDdcQVIKyc7KYKmI8fGW/oSdZa/E5ZLEeV
 0SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769609340; x=1770214140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UboJ63LtcZ77ZQp3GiXhx2JgM+P9ZD2N90y/HehnAU=;
 b=OGY5+wCubf67zO2XYixWQK1S1VflJkO7RAKceJlzct0E/d034yV0Pwhpt/b/37E2BF
 fgIdTzbXm0hKSjp8drZWxwAGun5e5jH524KELghDT5cLhvPMa0ZRdI4WGIiy7Ftxp6O8
 RkiyH7MCP9Z8DTbu8xXeaVU05IElG23gXpQdAeNobOAKLTEAgYq3jeLFLW56m9gv0ioS
 MW/7Am5ixWbZTqTZBtm6cZZb1ehBdMTkQVJfdhagsRcD81OciXH2/ffF8J3LdN6x0aRO
 6+zvTsfiVZ2N08kLKc4hzd3bx6BU+l1JXkVOoPFR6fXZuhF8xIgmj4FiR6BOUHwNQOXH
 5aGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+5jXf910T2IpE0K3zyNFhhezfB7mYis5x5p2kdrMk04FUdhg99bNUU9K1ZXOGbGN6toumx+y+gB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/w+DMiK5oIJ1YeTKumbOrkoMlPZTrK03uG3DYcfFg5+3VaqWY
 mHgpnKx/ZV59UjNX1kwGkE+tgvGHO3uoA6zBGHoInDk7HGlPYTjysCq8
X-Gm-Gg: AZuq6aLPtb3GFkYvMuI5zOwhtDX61hiUCJ132ztsmQxk24X4sG0Uso40ojmhxFgbrsM
 0CH71mFM1E1j2RhSHEM6Mr2oBNtCaAIxsR5WwRvlxfjuTal/EYOrtZL9dYm3DqwsyTcJsNiPU5U
 nEc01KyPdmfbvTYdz+W0j12UXSvmQ1mA42wkU1CgriXjDjDjMeUgwVOS5iaazzfBFD34IRGrKlp
 IM7I9kmM3lmqHS+5s2IelUDAboGxNagHpHPaFLRNWeXAT3EgPoObT57xmmD45OUBXWF53mk+K85
 uZNB3+xHuFcVnk9JMyydjhuOLCmzEM4XAaufbD55tMkFYKp10aY5Co44JXlZ6ChxeQhnb4AWDeJ
 cuqPQ0w1pGHmqA4wWHDRibq+ZsInvNLLkVlc8BtDjGzIKyNDqSCMdtUbGbbW52R6I9znTD67bNg
 kVF5rcBBpWXJdPLWpw8fQd5E/T6w==
X-Received: by 2002:a05:6a21:790:b0:38d:efcb:2e99 with SMTP id
 adf61e73a8af0-38ec62ddf2cmr4704070637.22.1769609339439; 
 Wed, 28 Jan 2026 06:08:59 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642b0b4c07sm2456786a12.36.2026.01.28.06.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:08:58 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH v4] fbtft: Improve damage_range to mark only changed rows
 Instead of marking the entire display as dirty,
 calculate start_row and end_row based on off/len and mark only those rows.
 This improves performance for partial framebuffer updates.
Date: Wed, 28 Jan 2026 23:08:44 +0900
Message-ID: <20260128140844.949262-1-csshin9928@gmail.com>
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
X-Spamd-Result: default: False [2.04 / 15.00];
	LONG_SUBJ(1.84)[246];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:csshin9928@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[csshin9928.gmail.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 80A48A36BB
X-Rspamd-Action: no action

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

