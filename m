Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF1A6AD60
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC5C10E69C;
	Thu, 20 Mar 2025 18:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cNHVDKIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08610E692;
 Thu, 20 Mar 2025 18:53:05 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85ad83ba141so144309239f.2; 
 Thu, 20 Mar 2025 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496784; x=1743101584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zri7fWbQ6hYMke6+GekcmDcZwwxzqxWIAq8zKNxMydw=;
 b=cNHVDKIZQd3H5SRBDWu5OBRLxN8ic3YpWF2isBpmZ2SDLMyYX+aGeK25IdhERZ7tIt
 vsR5ZjlNJ25nDP9L2pP4WiCHrK35GceFkyTyEMwJsGeQbT09BgWeB7bMc+FgoT170Mg7
 HvbxviVNgSJdFx3tJ+vmcCzEvcN/2x/Z2ChCZzRNHF4n6qUF78F8Fx5HFDAGTzUnudr7
 RBb17N2pbeBYU69lEF/rRKk40yBmEFMQQ683OqOSbBveoyKbnkGPHHm6bCpXq+zXYkMx
 QODGiP1VR0aEef7H34/wdgrrA7r2plCenjGO711TjSfkwO8A3G6pFtkwZew6tmsKTL+0
 2KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496784; x=1743101584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zri7fWbQ6hYMke6+GekcmDcZwwxzqxWIAq8zKNxMydw=;
 b=W6vwNFU8wqJiGTy+Snfu2GYGkB1toCuzaH6kJsb55TuzdfSjEDVJORVfoIHHkMkpTc
 +v7qoh0lW4HoH1P/IAPJJRo585wcpk2m8wUv8gd+Mwc1CVwNKML8JeUEPeE3X3EOlL51
 qmB+6o6+ygl9Fq8wmN4jL0LEBtsdEAb8GHER6cgTougzh8Atgzk2GBb4GqOSUSichxfO
 IlaVwtXR89sQw/HSCfeS8UyfXHBesqyvs/ZZWe7BAyeOJhv8z5uerRVSp3W73144pwH9
 gjOmrbyvHm4aSHcKBcI6dMFSwi4dWGUjMtAVabusnh+EIyGTgmyFlw3o88HNqxlNIud/
 R4fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe3JT9EvIpbK3dUZPpqCqnxqj3tITac5mxRGPqMh5BIj1phckDfKNgXfy05KlnS9i1DKiaDTgz@lists.freedesktop.org,
 AJvYcCUonLom1CnFiMLVVWYeJHasxsSpG0ehzs0ocr6/o+8GzKi6MK5w0KmYzxwLshmiKI0KSv9g5jJI1HXejUgUBA==@lists.freedesktop.org,
 AJvYcCUts5+XRpq9Aa60vsY27uouFeh6pn6WU+7YtZtmWDPEMNBxLNqfbhnH+Oq+KNtODXekOAFZaTgT/DKw@lists.freedesktop.org,
 AJvYcCVIAGkLsNaHnGVPDapgwb6vWdjJKLUCBxN0eETtGZO8ARsK3kTXzlUiTdGKzqBkRb6GfR9dZmiXS5zQondwvFx1ew==@lists.freedesktop.org,
 AJvYcCWlBRwlGqEifXqVIe8fwz1PvDiIqAz6hUka3J6IHjQIW5dg/MOfuqvm/rlL7V5b/4XTkqKwm323k9ev@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv58UH5z+My1WsP7sNBGrfrtno5Oh1ZNhkzZqJqqEL5LAaMsR4
 AP0bcsVoLP4Iqh6HH2PPsLr0ih4ucq3va8ePi0N0V74q4fzby0V/
X-Gm-Gg: ASbGnct3W7oAFujkML1CrHdDUZJ8XiH+6bv7zIOvsPvf8q109aAYKJPnuWuPuamyczT
 LLLcbeX0H5CwKjTDBZnG2bwHQjgt0ce29aJYgKZy6H6qXmTKHqYJWIs0cI5hCEXNQt5D4tfnIL8
 qWbfvWyf47utwR8UXbeHHSI+aVpuJzqWDAhUo40EcQPE4/hhii+pHfFLd+7yKJubK1zadb/KgVx
 7vNUxrkk8UMrc0IYbqnqM0aVfL4qEtqReUPHR4EGqqplpgTyb0bNoJ42O/idjrBX58VoTsFS5Yg
 Wa1C1KujNSmB4YMYnualM3qeNtIV/mYpKgBIZ8GZ+QHCrgb71dSk6Mh7TqmtomrZG7KIulZOlot
 G+Q==
X-Google-Smtp-Source: AGHT+IH1P/jk1OIslkAUGgFRZQR/oxbnvI28Bj54hNazA+wkeOw9UlyQ7Q8GNNj4dKRg9NNNZoJpTw==
X-Received: by 2002:a05:6602:3a0e:b0:85b:4362:3403 with SMTP id
 ca18e2360f4ac-85e2ca8a796mr50382139f.7.1742496784432; 
 Thu, 20 Mar 2025 11:53:04 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 03/59] test-dyndbg: fixup CLASSMAP usage error
Date: Thu, 20 Mar 2025 12:51:41 -0600
Message-ID: <20250320185238.447458-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

A closer look at test_dynamic_debug.ko logging output reveals reveals
a macro usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
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
2.49.0

