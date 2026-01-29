Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIwUJ5cMe2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9EEACA24
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0410E7E0;
	Thu, 29 Jan 2026 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IVo5ixTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7638A10E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:24 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-45c819ca0f1so438549b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671824; x=1770276624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWBgactQrIZ1su7qA+LsEPA2s9t2/HSNvP/FFiyIdUA=;
 b=IVo5ixTPt61lN8KdQQ7o20zZPdGDyI2cd2wRuItfdvTk8G80/Jw/RXr3u5QHKYe3NY
 9/hLK0dUXOwIYFeI8s/HSaWqxp8tXhkNsrlXiTQ7g0DSkfPxOj2N004ZoCXLQpDdQ+gx
 jDjsUORINjy6VlCPs9rYJNoj8aMZp3Tfsfhv7Pqpxx4PTk3LwFnnHevopCKrXacDlPNC
 gZProeITMtWm5shgO+aoeiX7sstjSFwwuQFtaEuaW1RARYmLLuPG7FngG3NoFW8xDwvQ
 h8f/1WGC5F2V+O1fJaVF+AnyG04SI2R67xVZMrflF2IPkRkfntnqhRvCU+ow/R2eUDdJ
 qJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671824; x=1770276624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lWBgactQrIZ1su7qA+LsEPA2s9t2/HSNvP/FFiyIdUA=;
 b=rhF+hDbGPZWOF06YDoqHoLOUraNqd8FARXJTOHgiArB3BWAlCfabbE1T+oSBBALf67
 gXe4+jZ6HZ3MV2N2X3EdJxyZnAM+XaS1mi1f66a9No7gYLUzyBLe/wQbvmMv60415Aj0
 NiHaA/9ICvJNbyjhsPzuEri7XLpiUmTZAaDuo1d1tSw3y7rqCLdjy8OB3Wo4ZTRBK/91
 tpoD9/oBBpMLPI4lhBqjQNStRNgrcKqiO9QwcBnidJHf35bTHMAyIaRIVqKPn9R+d8+I
 imselv+E6Rz2mGBwjC5sSsCdKjXbI12Zv+N0cN8VRrgcKt8126qQdllTtFGZ9V7LxfaE
 nPPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwx8/o2iyev3S+lzkrcd8EmiJ3CIPak82mxff0QL2Lbg99LghMRowixrA9BJllnTo8jLZoJE2nB20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrSOvtPhGn4Cb3mjs4zPjHUW/llmdUo+V34eV8G4xQKWBfh9Xf
 tHe+laf0LxqKlNMxsyMMqEbw1m0Bz/UUoumGAZuYrF09OWfpsLR7t4nW
X-Gm-Gg: AZuq6aI9KTJ1fSPXuO7VCjj8OdIQbuF78Y4ntBIGOOA5WWtdZtpDECmz+2EcXxdER2t
 5mOu7fbzHnWOdLINyiZs1wp8qyg3deThRxkKC3gKSlqOci0mFd/b2+kw0SYSoRK7RgQvmL+5eAj
 CPCWL7SiZqTdd/BHYdwlVfxeBgCiJQc65BnGtOWcU16NC01840nb4A6KFDRC13xf+dEw+d5uHH8
 KVV1AKUUC1CAmAcxE7BQsov4ASYWWejj4TDkaymduCA9LS7szCt1MvnkkZDh+oCxX4y+lbSOE6O
 5q1mEXJ5qJ1OsCAcmUair1WaAWysbZM6oZXMCgs7ovRwOuf6ZVUvNlpWwy8BiyEU3CpRv1SDa3D
 tcgO8qMgrKtRqK5TBmKzkq3ZSNHErxMLKnRr4Juolb2erJjVsTIcgSMauUwBY6UhKDwe9JpUTeo
 JjPHC+PpGhUiB6sdrhBvCuVD9SXgUbLyD+GjPejm6F
X-Received: by 2002:a05:6808:3a07:b0:45f:13fe:4a2e with SMTP id
 5614622812f47-45f1e352fb0mr985931b6e.17.1769671823662; 
 Wed, 28 Jan 2026 23:30:23 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45f08d894f5sm2741734b6e.5.2026.01.28.23.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:23 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 09/32] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 29 Jan 2026 00:28:55 -0700
Message-ID: <20260129072932.2190803-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3B9EEACA24
X-Rspamd-Action: no action

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.52.0

