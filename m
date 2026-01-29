Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8El+FYgMe2nfAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231BAC9F9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7E10E7DF;
	Thu, 29 Jan 2026 07:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzuuYKlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4F510E7DE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:11 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-45c8b850f96so466723b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671811; x=1770276611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
 b=dzuuYKlc+Nw/mbc8V5L2KxnY+4r8A79ThUBuaWVZbWI7irX7KvDvChY1Edq8SFq1Tm
 q2BSd+c0UAIjijMy3VVZMilwUNL9chvOlenvACqi5c6dZRHxjg6EuAvUy6bHYbLTqnqT
 aAC2/y0ap13zTbMl71bYDO2emSNjJITsGNmjSdBcAXRA4K72bwCTTORASd3Uz1r4KIFC
 bsEy7YD/WdvADbrIbPxTQs85rDS65Qxuzc7aRfnd4AYEuEgCHW82FJzN+QKf1T3qTiWc
 zUepdvtROQdgdQwzexDhrZFo2W6/S9vquD2Fb6fgu7qSohJXlozHZ/SXQrZuRahnsi80
 TCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671811; x=1770276611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
 b=mG0AzOuJeyeVTFfwT3rz4dpxgvDBRyvFPcsQvDxH6jTyfYW8TDn3+XFxHxgBu9FKCx
 ASL/tfz/6NW1hMiRJJISLJnsq49GP9Yg1P/wIhS4nl5OmJ/UHhoXguCavgizeK7M8Phh
 ZcaGLUklZ8syh95pulzM1NcRJVd69EqVbBgwa4DH7PRGKadtnBy+Yhv5WW93TFyf1IKP
 TWyG3+IwpUxwD6KIMMlWW3TYrOLd2P4FcAQ/+eVtzJ7MArzMld4IbY4K3tZZxlWP15T3
 bNQReZj3rRVAJspm/2apTjpVkhi4+TjKyvNey56iW4mda9a5uizXpXtM8nWplSuhdexM
 n6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKG5EUNnjxecpTygS+XvTJ2y26zkt2c8WNJAK/VYjAG8ddR3rxL5uit/H12Z+J57wsCCdht+Xt8/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCOY2GvR4TU8JpxijziOFMLU2fFhaEnXCVEqKjXw3aTZzKvA/3
 prBntenvtgT3lELEnbR5Ie5FFZAg2g7dGKv0U2ADhJzOkZ7P0MVFAnuJ
X-Gm-Gg: AZuq6aIiOYlXu9XdnJ4RKh2elX0WZbVfK7z/3WbsDiA6CBGC1T2sHPhAkZcblUPfPP6
 20I76NOvIXymNhpHITv0VqCPLNHcQRTdAWBDlRB5sTX9ZJt8XGUN8/W8M/cN/IoFh5mw9617+h9
 nexbKjcpUaY6YMFhJhzvBnYRRPH+tw4gq9G+HHd87Aq5FvTHqJhFaLsT0ckcXxR/uWD/I85lHWE
 8WSKnRt2/2DhEqxPtzOJfiG2VgJm5bHZEZGJxnLyJfaiGCxO1wmU7Oi/GBfTEfK/3YOzi01fS9w
 zq/dhY8DGD4BvefvZe7ONgjmHnZ2IvsxBkTns3EjnpoKyjpr0/2Aj2ujLg+ZeSZdSYwx1tffsyC
 1JCH+jT8ms/Lmlap4amwEhGqbqX3IM6UcCgZvN1RWRJUULuY0SuWo1tokv8IMirni0uBIIO7V8n
 +rw+vjLlEdwJP7IBEvoRvHCMvyFOXGidE1tgehPyPpfLgjwayVdb0=
X-Received: by 2002:a05:6808:18a9:b0:44d:bf83:d7f8 with SMTP id
 5614622812f47-45efc4d5962mr4032674b6e.4.1769671810881; 
 Wed, 28 Jan 2026 23:30:10 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45f08f5ff30sm2718275b6e.16.2026.01.28.23.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:10 -0800 (PST)
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
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Ye Bin <yebin10@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 05/32] docs/dyndbg: explain flags parse 1st
Date: Thu, 29 Jan 2026 00:28:51 -0700
Message-ID: <20260129072932.2190803-6-jim.cromie@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:yebin10@huawei.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,lwn.net,huawei.com,linux-foundation.org];
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
X-Rspamd-Queue-Id: 0231BAC9F9
X-Rspamd-Action: no action

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

