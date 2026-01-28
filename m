Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNunBscge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCADAADD71
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8467C10E829;
	Thu, 29 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LkOiBaa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F7B10E766
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:39:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a09d981507so1631145ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769632791; x=1770237591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
 b=LkOiBaa27Tkql4qTbpUJVwZX577tkTcpUj+eDoS2xPenqtYVLCgUE+bud/wMf/MN9Y
 OsbIwdv41WixBNuH/+XtKfws0Xwn3RPLJhlVTFUsr66GKgUpHtvIQY+xpbk6/G2tsdSM
 Sc3VJ9UStvpjYdITaBPmKK39teKYAH6m1KgAOxgH9jcQQb48RquQAJ1tmhNWUUET9DdE
 +/vh6zhno3sMndMHAbRME14Wt/o1z0Oo318mpTZt2oYUkaP3fAt+fv2Oqpe8LmkNVS8s
 EvlyhUny/r51jr2oAxyRHPDVfLcaoWZCbrPvL1HXFJ8iizh+mT4wkAkzCYGJtWypF0OO
 Qp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769632791; x=1770237591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
 b=j+YwF24UGdcHVYkFs4Y+druRLehZfc+OU3KYwwDPoLAxCrQQufol2jILJy+mT0JPih
 oWZ4HzPK8fEBM+GYFXgi+0SEdKu0rvD/LME+Cq24KcWZscblrRubswJO848tHJA7cVMV
 QV5KONFxNWtILY0cIScC5Vay4m0n1fMZ56LQ+WuoBJW4vAWkWSBvSqr19IJ9yRhpJATY
 BDuaULv3Romj1Ww35gLf6k0nfN/P+/uJklf97w+07snYV8+n7F3y67Exko/ySATZD8AL
 ZoIBlAqSfz9+ict3PxK5tMp8ZpBucvuGzaDQlY4vRUCPyff3XW6IRqxE5hLJn96NgdNi
 qAKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkS8vbJT+FPspNU1/XIirchRkSYjcVRLnk5ExrbIr5WRsMakiz02MzTTvPadsn/tN84zcIUCK5S4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ5yTfg2XaNCab4FUjEy81CRC7VfpBnu7xIKzBge0iVyyjE4w6
 SoUs9YmZg1Igb/+mVYs1zQetXyEvDJWGwAnCNB4u2cCws4zDsEHV2B+X
X-Gm-Gg: AZuq6aLU0WVEpK9Zrmb0UWMOFrfD3Ms9IyCn3j8FrBOY/rbsYfsQDVk/nhw3Pf4uENi
 pUVCFiHRjYaPXO+cRsYDd77hlxt7yXQ6Ruq5tiv19lUx8RwbsOkU8M4qkygt2qrhc9LSUMxM8oO
 U8KVeSbroik8sKkQe/jRxaeYFUwT+SNAHJJ2nRJl32Ul539Gnbrtgfgs42D/b8mu8LhUe1hANTS
 yq1VtunjktgtdDDLVvzged5aztsTMCpFMK8Mgs0hwLvbA85BDCNpbfNUQnsAq6ZxLsaj8FxuWby
 gdyWoeKOyLjsOD31a4/S72itFYmPedfizF09uKKB9K5v7AzsRJI4kFhCQs2wDezk3ttx9ySHLSH
 CELVxmGMGwRsNMCM+XgWNYPk53Aho64SLxRQFo30KVZ1YiZfbjwst/fdkVqdGQjU0yeVwyvMQzW
 U+1olXtZoHCtwIFVB9UEq5oV9uCQ==
X-Received: by 2002:a17:902:f683:b0:2a7:a3b3:3229 with SMTP id
 d9443c01a7336-2a8bd43275amr6095695ad.5.1769632791253; 
 Wed, 28 Jan 2026 12:39:51 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c45c4sm29703465ad.62.2026.01.28.12.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 12:39:50 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH v5] fbtft: limit dirty rows based on damage range
Date: Thu, 29 Jan 2026 05:39:38 +0900
Message-ID: <20260128203938.962414-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:csshin9928@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCADAADD71
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate the start
and end rows based on the damage offset and length and only mark the
affected rows dirty. This reduces unnecessary full framebuffer updates
for partial writes.

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1d5cb45199d0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,12 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+	__u32 height = end_row - start_row + 1;
+
+	par->fbtftops.mkdirty(info, start_row, height);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

