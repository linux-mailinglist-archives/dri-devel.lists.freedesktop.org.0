Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BAD1C01B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3B10E569;
	Wed, 14 Jan 2026 01:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XKy6A2ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E4F10E593
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:04 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id
 5614622812f47-459fa8b6044so5433213b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355944; x=1768960744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=XKy6A2ex+6f9ojt5f6WOkXxq/yv5Guu3MrbmldoDQ7ZXtj0yK4eeEJpwJrZVgLC94I
 y+fCYzsqlOehhdlCCEFlovOgNd5sCwU3/+vmJZEKLQO+pmoa5E9+EVd6nrNZzehOF/hA
 Z/vCr1qKrF1QeiNkLfB6Fy8IKHLulbzZPY0V5WoPmnTDWlXS3Jsrpa+jO2gL2eCC3AL6
 5bnLKaHvWsPj8nsfbb849irylsESLyIR38AatQn6ilC2wuAimEB8ZbaiuTHXobaU7KE7
 BJDYXfDkzSU8i2dQfHxv9uBzck0Z0CVTjLkvzejthjlKcA6jzfqODK3BQwCcRu6p5atp
 LlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355944; x=1768960744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=McGREITV9UwvVcf743YjkjMuFqpae2ErqZwT79VEROENh2lMXktEhPHK3Bav4C8FOS
 /P4U7oJGVu+yptQ3i46nD9Ia0pd2KFUglgKdecGzAf4yPqKH8HGuP/WqsQNAvbdZj5cu
 Cj+79Wqc5c0YdQc7189RupEioVpQar0MBmfiYL9lhJE0nMbpQR1K8mtZeq46LJwGPzOR
 MomSKXKfoYxU88jtBeCoVg1Zg82zgF99OqpdR14Ur8f+SWyyc8qPbFp4lbsrkJ/vTNZn
 oL0CUx6xp8xopVR1eZpSOF0jVpJHjgdaaetf4bu++tasak3nWn3c2ChtqbaptJrhf6A6
 xCEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+eFHJ1YSWP1TsFgJj/GePkr5YjHHzjIxhmj2Bcbir5Iz/Bs3NMePEcpeFM16P3IwiJRFmBh57vpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeisAedSBl8ti2jfaovGQZQeCs02emxjTfDrSTzM7lQ1GOtzc4
 Pz+hdzmmHJ6B/1QI+RaixK+0062QrFk6yKFLu8Sf2InMsLXE8f9SuYnV
X-Gm-Gg: AY/fxX521SMQ6n2PPZFIbKWW7z4a/Fbt7ecyRYiR+oWNvv0BD4qxRwwK3Co45kKMQwL
 thcqVzoAEdogEvykoHVe2vBHNF2MCq3rNLfsbt4oOJ5WOasXY/OUI84aExNl3sk0U+F30aM4l1O
 UFHq3xEOEpWmwQF4tjqJG3lhoLL73tzdtsmm4VMeKu32EJ7X0DVjlY632zSFubbU8bc/gVk9tO3
 RtK/MibIz3zhRXxYFqskRS1mm2d6zflLdutMHerbJ71zLGMatM/5S2Mdc5MCRpTgymY6l0jtPe9
 3tfl7jK6oxK6As5Ro3d+ecKXUbNM6i0F7DcFFKR4jS2Pq9Ox2rqtWN9NWI3e+t4epip74p74GCa
 K8qoA5bmt+6/HtnGK+y1TWWITxYNWCuaZM+nm3X/v/KGT1OoiS6uzLchZOrfXyLPddLh3tr6LBq
 A8M4RdtZkUpNB4NApnzk6BcGsNINwUadqZeIDe
X-Received: by 2002:a05:6808:1785:b0:45a:a4b7:e5a9 with SMTP id
 5614622812f47-45c71553f80mr625400b6e.61.1768355943758; 
 Tue, 13 Jan 2026 17:59:03 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45a5dfb6256sm10704815b6e.0.2026.01.13.17.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Tue, 13 Jan 2026 18:57:21 -0700
Message-ID: <20260114015815.1565725-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.52.0

