Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F63924A3D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5910E6BC;
	Tue,  2 Jul 2024 21:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YKpoiFmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1B010E6BE;
 Tue,  2 Jul 2024 21:58:18 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7f3d59ff826so173085239f.3; 
 Tue, 02 Jul 2024 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957497; x=1720562297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jicnEuSikysNdrvNl4Iye9B1q1hn5wCOtgRQWjJh+Y=;
 b=YKpoiFmo0fKBTeU+3fL34cgk/h7y99HDYYOVhg0JbjgjdmcPFlztBc8EEkADORx5io
 ZU7UJcAXTLsVWUfmy7Dg9IG0mfaG2XjKzPYYzpTYKET27y8ODO56qlgDRQKUgMM088Gn
 W/R5d+8qa+FEeCVTQayVe1KKaYCGaYBeKl8UJOPu+7PRFvOQc2RQs2VYAuLrXrsU7ApB
 fAEYesA2JKOHytq0DI6MqYn4c7jdjALMDDDo8mLJ5cyRK03a1LP5AC8OIeaNjy9PRBmo
 XVTEE0SlqZ7NNIddaEZPpve7l6XwiFHyf+tTVwlLmsp6KQXElM3U1EQ2lgujvrc9FI5H
 tlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957497; x=1720562297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jicnEuSikysNdrvNl4Iye9B1q1hn5wCOtgRQWjJh+Y=;
 b=Svngbt3I6K5WNfJRamMjSG9cMjx23QgcosHBnKi0T6HG5C0ZakpVf6Vf6da+BQGMra
 amQYIr+Xmdfbstr7Ko6qVi3jSm7/kVOrlTG2IKqouoSyL1TcR5E/16Mo7hjSHCS8kNYm
 dK9WAuxqNSl9rNIfyDHevnHJdMNBgNxbyd26MwxZpcQb0s/tjBCeKxy7qYjbLn/twbKt
 dBoee2/g4jOVc5c+9ESGTSXmcP3ApuXbMFv+sQFY0+M+rDlAXtheP82uaHPr//GMkFYU
 6CxeWFNPohQ/E0Drkv5HayYBJ3EP1gGhisD/qcs0kYTFgoxM9s9bic+5MS1lavSizHg3
 OfRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeL6oI8R+dOOQSEubNR0NMGZUfTRKAlAGXBRS74YNyRakH+TylgFxEhPep4DzMlcCFOn6lTBCmp5d9LY5B9e1frJJIFaT3aalbUc8ozwC380MIs+yABDYwqWKAbBD2yUQbHTwZ8kPdZHggnT6OxDOMiG0i7atd/yjj8o3g0u7hSw4MtvUInBnO6B8fUnSEy5WbZgo6LSvB+DRMdV0PtdEoRC6CsxcJFLwASCTAObHMD8uKWis=
X-Gm-Message-State: AOJu0Yzaj/LjF3x2Xgl8t1SsKVIBTE1IoxQF7FKiy1n8eds7azcA2o0f
 deefvPJ/WZIswZBjBeBXB0NpmXDTGeUgp4CxxwQKJEa85DU0RjNV
X-Google-Smtp-Source: AGHT+IGgEpsraXVf8DsSJ53T9EEmQ2VNyi43sZWgM3hFXw7ayPt2A1BBLWk8VrVLBa5eFbK21ld0jQ==
X-Received: by 2002:a05:6602:1224:b0:7f6:1ea5:de97 with SMTP id
 ca18e2360f4ac-7f62ee3d6bdmr1057195239f.3.1719957497302; 
 Tue, 02 Jul 2024 14:58:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 02/52] test-dyndbg: fixup CLASSMAP usage error
Date: Tue,  2 Jul 2024 15:56:52 -0600
Message-ID: <20240702215804.2201271-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

