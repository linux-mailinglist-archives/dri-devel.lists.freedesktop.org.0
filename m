Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH7YJGMbjWm/zAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D412879E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226110E67F;
	Thu, 12 Feb 2026 00:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IcXY7APt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com
 [209.85.160.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A7D10E67C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:19 +0000 (UTC)
Received: by mail-oa1-f65.google.com with SMTP id
 586e51a60fabf-4044d3ff57bso2202559fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855259; x=1771460059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qRceN60ALceVVDtbjqnqaIeAyOWJgUuFn8II6brejM=;
 b=IcXY7APtTDbPHFSGsEIN/plTcuArzub6hWlyFsDFf/3UvG5Aj0X+eRr61MsmmJkED0
 RK+Pl+86HLf2l8OuHIb+l86gjVYzNaOpJOHFiwgZxnw+X6sODCRdDCrw9hs2l/L9XN5Q
 OLviHx8F55ChI3xYqMxIWoLyV9/aF5lHhDYiyAQTPOopkQIWbKcafSCi7OWdoo1349ml
 Oe33/dWhqFY706KFLyefh/PAxPnP4eUEfo8J4iYtz+McGBInls9UxKRSH4Dn/Q7LEfiD
 ++70Q3MGMJV17K/CokvLhduw2eSrKhXx7c+/ubT3NVZi7SZvkxVx7iJ4X9xG+H2pHRhC
 6vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855259; x=1771460059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/qRceN60ALceVVDtbjqnqaIeAyOWJgUuFn8II6brejM=;
 b=sK4gQeAtpZAoZaIxrChd0tE8AmX+YF9TrBj0ShpuE6Wvr5mZTBzYC/WodSZRXBBb62
 86UcylAkLFnzTv80jsGXzP0MGdlE51hotWfl1gNGED0f1f1LMRpbhpNR9ECU14FKd2IF
 TmU6Nkspon8w9SNrHrH8ZLyV00GKYss6XDvWT72o/Ixz04HHuo8g4aMZ0xYCLJquHcym
 iXbNGnCtT657ZuBT7qwf7uywUnBZ/4PeJhQtRQ094Es1nLOJ5syl9b6YxPTncVIql3TZ
 KeAP3Vzv86OrwlhGrMTJe2tsJim+lClZURx6h69ronw3/AUxYAXtVh5Gh8IHPhxVbVg/
 3SjQ==
X-Gm-Message-State: AOJu0Yz4lv1V5oaSfPAvlSR5LlnhEDdqcpZZduLr7ttCMWdViBS00wfP
 IbyKwhD62R3bffGgHP9ys2Wt/+NZnpi7iWGhSGDfdOT8oY4Ukswl4TEC99/7bGgW
X-Gm-Gg: AZuq6aLTuhMtu5LilzxiOKaQR0ktYZ4kHJsTEe9jJGOl42wyD5rcTyYvsane1M5PMjO
 DpYOT82j1tBzUdTIoreG2Kzlpdn6pc0pK+10Bp/BPwd2dQNToW5O0ZOUO8lNdWmfKmDLsy3Sny0
 LMv1HcLZf61fykrSLpZYzlTop1hQN1xqXqfmg+vBYFQykOIRSpix1BipsDrnpmS+GRQ3IMYq9yQ
 WBuog/NTBl2/PmA/wftZc767eYi0mmm4wZxfDOmC8AgnYn0v2d1V/0WtqfGCn3gXxoKXrU29+Ky
 pXviOlgAqW4thTQPlicxyUtsD9czaXtItwArIn2RnsBhnlqSYpdZiYD9lW8FyUzANT+dyo/xA6n
 9pNnDPfRZnZwjZY5AlN33UpeJl9YF6w74R919id8sDYMG1meoQ42qSbw1H2cz7BYin5QPix4oC+
 97rrj5Wmy5nb8WJoSaQwBqmPRL5vt2euefzJT+GjqMe68poFreARrI
X-Received: by 2002:a05:6820:2188:b0:663:d58:63f9 with SMTP id
 006d021491bc7-6759a558792mr530140eaf.42.1770855258871; 
 Wed, 11 Feb 2026 16:14:18 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:18 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 07/61] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Wed, 11 Feb 2026 17:13:02 -0700
Message-ID: <20260212001359.97296-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-7-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
 <20260212001359.97296-6-jim.cromie@gmail.com>
 <20260212001359.97296-7-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 495D412879E
X-Rspamd-Action: no action

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e7578507945a..55e07b706c84 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1166,7 +1166,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.53.0

