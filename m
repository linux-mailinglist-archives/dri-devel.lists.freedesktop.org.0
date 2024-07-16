Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79A9330CC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC1B10E80F;
	Tue, 16 Jul 2024 18:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BFlM4AVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBE910E681;
 Tue, 16 Jul 2024 18:58:22 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-80767b21543so4305239f.3; 
 Tue, 16 Jul 2024 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156301; x=1721761101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jicnEuSikysNdrvNl4Iye9B1q1hn5wCOtgRQWjJh+Y=;
 b=BFlM4AVvOc5rH5WMLHCHImb4KEdkczFrQAC4PNQ/z1V6VRqo9EL359sqH+6Om7lqgn
 bHsosekzWswu9ggM25hDpqUBS8ER0i+pBvKd90b2t81AxjiHD4norI2dKD4cDkQSvkez
 ae/ZVnZLFLgMA53eaWCLEyq7oHhB+/at+4A0xEGupHhUAta1NuDqRtcB7ULwprBOZBPN
 QNbj674WTE1XiUL/xzpIklMH3VAXpL7vgftL8IQuqOcYRUgVyys5LExFLTu8A5nsh9hT
 raGsYfmWCB6wGreQaxVsa/PLNHTncTZffTJg8FrbSCiJi9wP7bkbGlrItAwTfnfhBEz1
 Botw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156301; x=1721761101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jicnEuSikysNdrvNl4Iye9B1q1hn5wCOtgRQWjJh+Y=;
 b=XH++4nhMEnROG7UJhvYY3LtRaje5qQtJ0etzmNaz/tmd1/kz2OnzzRqghEli9Sfg34
 C4CzltqJHgCF4J1SNsczNJtZ2ZeKUEeiq03kBU3EAJEKCHp8C3RlyvKZ4NJYyyJfUNe8
 h4J/8/oXIFrr+sLaYc4tS9eG3XetMZnj7byu22iwU0/WIJXUFF5frRS442V/3oftn9F+
 OI6RLpuKaRN7F2oJLMchv4+PV3IfKybrlzk+Xn1s/rVkpZNDHi8xEw06oVicTVaJJ+o7
 LqXEGE0b6oJ494ioBcx66P8Gf3MfCIy/6xxF8QYxXQF4BWhIIOjbqQn17yvr49sfsHqL
 wZrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxB0VFRLxTXs8b8JE5WaA6YBA7rgstRjy053rcrjAml4aH/R8r9rMm/qVZ84SwT+rs9goGsy+aRmJPi5gyXxuCqFMy6LkcVI2kMnPyMRomIYcWLu/RHezr/edBi5Htvjd//RhhGjDmC7Mn/UsdSq8R1eHJeXHE+W2gBWYWn3w+Eczm/bvdnd4nq9DmJ1QHINse0jya+Sz4/jHblcl9Zpw5aKIFXAW/c3rac3zNNp01/+ijXo0=
X-Gm-Message-State: AOJu0Yzpv0xFR0hxBjN9Y8KeAtfVVeLg8h0/mNZPCixhUVnc2WrnBkD8
 ZxH+DAXS4pVGiaaIUvGpShJ6VQGBnx5IUmytyjxexWyvrgk6WjGo
X-Google-Smtp-Source: AGHT+IH/6GmZg205UsWXcwtXp+7UYuUNvdEOD8tXVXy+IqWVen8eLnzAm3KTq1H8aJb2I+6ZPRtN3Q==
X-Received: by 2002:a05:6602:15d5:b0:7fa:a253:a1cc with SMTP id
 ca18e2360f4ac-816c3f7c4c7mr42921939f.3.1721156301543; 
 Tue, 16 Jul 2024 11:58:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 02/54] test-dyndbg: fixup CLASSMAP usage error
Date: Tue, 16 Jul 2024 12:57:14 -0600
Message-ID: <20240716185806.1572048-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

A more careful reading of logging output from test_dynamic_debug.ko
reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, 105,106 have LOW/MID and MID/HI skew.

The enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  I coded in an error, intending to verify
err detection, then forgot, and missed that it was there.

So this patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
that it is too error-prone.  As noted in test-mod comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8dd250ad022b..a01f0193a419 100644
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
2.45.2

