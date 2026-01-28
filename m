Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GGODcMkemkO3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A54A36BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0B10E717;
	Wed, 28 Jan 2026 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jBtDroSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514F10E299
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:22:23 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-823210d1d8eso2532545b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 01:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769592143; x=1770196943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
 b=jBtDroSLEx/gOLoA5ZD/vBTrssOR4eKr/perq5qnYxLrgFj93tVXkQzlF/UZ8CQjDL
 Mcrm99007KLxDZ4ee2AF0wpZ6pc9/MwAuv1H1TP2MWyC3meIJKueVZlCIGlU8pQ1+nfC
 fnx2mbPEGX0qpm3KWFO9Rt9qlENxy8+XlBedYVTIPLC3y9t9N3V4SKpZ1Umf3JeS2qcV
 NMWQwBQkTj0Zdh6rFJ4h7XZmvf78q2/IC3wMQ9Ojax+h5fY3o0K4OaRzZeW4pE1IBw0c
 df9DfU5QqtEqdcJ9LlbtPqFYEOJTqYKqs/FqmNvx2Rat1ZS2Vs0e7EG13znLUhA9He62
 oE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769592143; x=1770196943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
 b=W4hcx3SXV/0zfE51NNzHlL+sSHWcwLQNGT7RvLmmy3vVTCy9aEspIoZGQ+JE0M4DuG
 qD6rDI6ExL/4LkejEWrtsbxvrEG/X23YjsctHaD7yiOhfDhr4aAgKAYMt6oYhRj1bkQk
 fHDMry3P7MzTMgOjCFID0c79AhO1RI1xdonGDP6dP+zU/T7lJF9xX7WMYye7luOE+5/O
 B/IDBsIlXKs3j23ByIUWHjz9EGpwYCdCrTYpMwdQdZgo4y6YA9CN8z3JWJBbvU375eTH
 WxQ69CPfl7ssurhlsNljlomkzEb7uYvCaRQ5/tNBn2TcO3bwkyLZqj8Sszl274w6qYHt
 mtdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWZdAvz32ET4Q1lXy6ypSrKzmi0tb2lHWtCJpc5SiHX69snReuDdC10PjJnPWybQ5n0Da+lu3OAsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy/XwMUYtTM3nGdCTVXWGN/JMQ8R8EFIHmU6PyANAYmWbONE08
 6rWprN2qm1DWOVOPF8zy1Pf6ZRMIlO6pIdPxEM/dH2NUh5D2KFuvX29j
X-Gm-Gg: AZuq6aLAmb+EUbLLDMddHsSn2f2EhiV8hHAtMrvo/Q0NatOB3FYuXi7KYRzGUvif8XN
 23XrcpxqMP4+D1yGnKnErNM3BxiU6wi1CQYtAmUNiH8cejx2GDCPMSH+Ihqt3WNuYi6sXg2v1I0
 LXNtTxY+NxPbcznzhxc6rzIB1syN93e692rIfK3guwlc7G3j7ZFSP2sB8uibAwuqDs6wP8sCgp8
 A0OTXEOR3tkLwugjdgv4o4AF53lR0dsfQRmaT35coCWgVdq2DK1MU/ELsk+zPuoEivhj4XrhOKh
 qCNa2yzqawCEow9HANekxWG3IcSYg66YRLF5/cEm3GvieLbzjtqUUv+zpKSLvWI9K/ku5ZlKqPo
 /4QjXGJg5DJXD9RN/4yVMsJ9H65sX3yruitgmc17t0sN6QqC4aUlSNMmDBmv9AlN75Nw2ylBc/1
 F5Ot6fwU2oYDY0RRIthPCzAiXdkQ==
X-Received: by 2002:a05:6a21:6b0d:b0:364:13ab:d4c5 with SMTP id
 adf61e73a8af0-38ec629f950mr4457135637.26.1769592143279; 
 Wed, 28 Jan 2026 01:22:23 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642b0b4c07sm1758138a12.36.2026.01.28.01.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 01:22:22 -0800 (PST)
From: Waffle0823 <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Waffle0823 <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 18:22:10 +0900
Message-ID: <20260128092210.864021-1-csshin9928@gmail.com>
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
X-Rspamd-Queue-Id: 52A54A36BD
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: Waffle0823 <csshin9928@gmail.com>
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

