Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPI4M5cMe2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EACBACA25
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92A10E7E1;
	Thu, 29 Jan 2026 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OKbni8c7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B681010E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:27 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7d148dd3421so229251a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671827; x=1770276627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7h3bLXzeM6mWSjiJcGUgMMMhzyq4pD1tO2973ypLisk=;
 b=OKbni8c7mxITzQj8psPil56LbS8GM/25EANWw0wI9XonRALz5VG4IsOUT07NmZXA+8
 vDOq/Lz/VS+WyrdYczAE82XO8BUJJAuFDRBUSZy+4GnzgB0qKURajMaPVwjiIui7I4nm
 4yQP0V8ZnQ6NSXvm4BwQvO5tNO4oI0PlbWcthsZjyg3vsDdRA8+GNpD/yJ64YyisLMDA
 Z+irPiBclRgyG5nU4InlDl10i2cedkxvZAGrJTTBKPLBuHn9m9dl6YbCD45dINTIV6Oy
 NUui/t+6t98/oCaIg5A7KqJfOGJ+YXyfIN+7lWjFiUNQeg61WNmr0SMKo7IfiPsiNZhX
 K/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671827; x=1770276627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7h3bLXzeM6mWSjiJcGUgMMMhzyq4pD1tO2973ypLisk=;
 b=fNIcPIexDl/NkwuZ3DTCMOGW0gVGgPeoJPjFZrTQFMLsuQzRu6PNmcaiQcgY5zg6Gn
 st90unQGYznGaxztCVnJ5CUaZfGr2ZWMpIJbq03jaDPYyGcS4LDwDgMg3lT7DaU+0yX8
 fG+SqA57KWkb6NVLDCM2PNGZ54rqJHKDT4/q2BTAm6p+pExAYK4yYekOcb10mBYPJkoI
 vTuqpiRJhA2vNoXR6I1zo2osUfnoXj0rLTcM539tvcowQWd8bp3VyvD5kreWwuHFAS6g
 /Y7KdfVMQzRBvhLxBjI42/s6Sfo8tlqv8Js9cJKC/XzzPy9PXTZ0aR49O6XF1ufJ6FpH
 69ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMtiO0El6O+Id3eBG0EiGDuBoldxldKZyD8G2saBbWLM+pjwkCMKS9LSTld6eWuDRzTEVCdz2X9Hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsOX0zCYE2zSS9d4UhguBijVgsZxhBN4Ygky97JCmkxfpEWJzU
 SUCLWUi5BFQt7vqqW8qFwv+y/+ll5Q6JvCQk0hcaM1s7XsbMRKWgw2fv
X-Gm-Gg: AZuq6aLGS9szO5nb7Er2YTgepk06/BZFgmxARxcz+n8qPH7uSB8Jhzvpgq764eaBiO8
 z84FAgi37JrlvpO0M0kgIvoFJRZC67J8k0epLILywQydY1T4Dae6ONOT73wp4FJXTUk1xc/zM/k
 wAKQBFCche3bheLXUK+0J7SK9JWutme9af2GYi88NGQ8Yd8q753C/cfVjsCCjF8J/fBD9dzJIGJ
 XSjJ+aLfKbhEcHitfGz/9UqemjOhf8ZMOgvk64FV+n8es3QcYuaTvY6utWQs+diPPLku68MSeSR
 TP16nousvQn6Po38pZZ9uBQtjYv41qHakgQTvhOjz09ZCnszfxVugB06MO1rxM2UmN/h7Ou2Yz0
 ryAQHVU2Kmlqdd9J3jv9MjRnT5tFfCPr9XD+/fi4xMtIiIRBoWS69zD7j+QlDLZxkGntxFWNRSQ
 Ilv/lMnV+5p4TVY7n+j+4vlgAMOcs8sjvHwUGLPNFu
X-Received: by 2002:a05:6830:4985:b0:7c7:e3b:488a with SMTP id
 46e09a7af769-7d18512ac73mr4516959a34.30.1769671826941; 
 Wed, 28 Jan 2026 23:30:26 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7d18c7ffbedsm3173982a34.21.2026.01.28.23.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:26 -0800 (PST)
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
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/32] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Thu, 29 Jan 2026 00:28:56 -0700
Message-ID: <20260129072932.2190803-11-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 5EACBACA25
X-Rspamd-Action: no action

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1d13e3ee3e12..fbe18b1f0b73 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

