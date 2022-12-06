Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C5643A4C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205D10E30D;
	Tue,  6 Dec 2022 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A4710E2EA;
 Tue,  6 Dec 2022 00:35:18 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id e189so8776167iof.1;
 Mon, 05 Dec 2022 16:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+UDrWNXMMGhk9HzOMZBwbh5zjmulDfm2DaVnY/OUhI=;
 b=eLeE2dj14exQeQIr1ko9hCDJKvzZBxL31dknUIIIFaYlxA20UJuCHiOsbgVMQoo33m
 2qhDf9Fm5NpvMorwLHW2iBCbaXEhs0Ck79a3jMQjJmVaDNi4k9/rhuIC3/1Gyvv0GbR+
 yKtYcRWC+dnl+PUbTvH1i7/GSpRDrUAGqM4zlpfzTJeAvZ4iqQmZ+sVffIQCD0emjCs5
 5jm7Evqqm3oba1alb0augbhYBWWBxnrTQhdwTAknsh9m5ifR2ccK3kKdNe2ZYDfzsEMf
 OIoI0aUK+FFtI09eRSWSEtHRzDt3Cgyic2eQc+OWFGf93/+6XibjSm98FxmBkViMUuO4
 H9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+UDrWNXMMGhk9HzOMZBwbh5zjmulDfm2DaVnY/OUhI=;
 b=aPS0vWDH/JxY97kEFmbOayI/qjkUPpq/1CN6abz07vLLczC5A9e9hpFLRn7X3KW7K+
 M+Bhshu+nCKUXNDnkfAEK1XSVFWpkHbR8PSR+ZZu+MzoEjurSEvO4lkWiDZGyns/+t2y
 nQ69uwC08Zh9EIFz0pzIcXLPqmJ5Pb7p31SBZzk9i8tKu0MdZQfOvWKKTk94htRn0smt
 jF3gzOA+mpZYweWDUpxzMIvram0ZkYuKxk+6Z9tBv0maFBsHUvXxZlfECHWMf6hS8CX/
 kVwpAKJplyCo0NVhMi3kuBcqF5ZgllnY2NaL1tGGj9rNDLmIVgX3e8ttonnfEHALMgWl
 nOTA==
X-Gm-Message-State: ANoB5pkR/kBbhNRNu9MN7/hZKfmmb7oab7f/9zSKQP/sOIzZ8P3QL7H+
 cVsV0H/lqKKZuPNeMEejnbo=
X-Google-Smtp-Source: AA0mqf7S5bHLlbhVAzPpHg9sCL9n3qLeloz+E671RFH4nKtb1ybTIO5QlE+Jm2CCx5RS1oF/exUDcw==
X-Received: by 2002:a02:23ca:0:b0:372:59cb:f242 with SMTP id
 u193-20020a0223ca000000b0037259cbf242mr39977560jau.135.1670286917295; 
 Mon, 05 Dec 2022 16:35:17 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 17/17] dyndbg: miss-on HACK
Date: Mon,  5 Dec 2022 17:34:24 -0700
Message-Id: <20221206003424.592078-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dont break the loop, to see multiple clients.  the 3 client records
are differently wrong.
---
 lib/dynamic_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3ef1c0a1f0cd..a26eaa348731 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -629,6 +629,7 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	v2pr_info("applied bitmap: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
 	return matches;
 }
 
@@ -1321,8 +1322,8 @@ static void ddebug_attach_client_module_classes(struct ddebug_table *dt, struct
 			 */
 			v2pr_info("break on %d/%d\n", i, di->num_class_refs);
 			dt->num_class_refs = 1;
-			break;
-		}
+		} else
+			v2pr_info("miss on %d/%d\n", i, di->num_class_refs);
 	}
 }
 
-- 
2.38.1

