Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4E9330E3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3BE10E82A;
	Tue, 16 Jul 2024 18:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MO8P4MUz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B26F10E2C5;
 Tue, 16 Jul 2024 18:58:42 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7fe8d029fbeso5410839f.3; 
 Tue, 16 Jul 2024 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156321; x=1721761121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PG0HixeKNGYC1yKqg8pO4K0aUEEvqiNOUzi5OjavD2Q=;
 b=MO8P4MUzasiZONyaQWjLx7ItFRDcnLnjeCvZTWd1/+c/7ufgHJNYEkwbIEppsHa+GI
 GbT3SMXJhj/2tbb+MoV1bk9w3IQR8DHyf5HxFgbzr8y7w6/t7SNQh7uTz03MIMgXJ8XZ
 Ac2X7Tv56n6o5zLJ8MvKhtjVK8gM7GYbvejVP2uRrcPOrSp+iTphIx2CYW9mENUm/4HF
 g4XoouRmgh6oqC3XeIu1m0xfYfLiugbvxv2U2iP3d2rIGCScep+L4Dhhtn9rDTuk/xLE
 0LwqmH20IgtPuu8RwQC9lBxU2UpZONYByepZfz8ShdR5bteziH6tjJac4lcZQkOSGnaF
 AhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156321; x=1721761121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PG0HixeKNGYC1yKqg8pO4K0aUEEvqiNOUzi5OjavD2Q=;
 b=BCJcmGVg1S0Uvr0+FjPllLbxLKDyTmZNyjZlgX1XB80NGhmk1ditfaRpNqdDQWSIqK
 AbWFe1cbp9H9FQomH91wFXMY22e8JKaqKIRbZNXO7hZRsnooszQ86rh/JYluft4a95Rt
 7u4vA1oMoQDQA8CArCZjc1WK8fuc/ZDiCkJZOgSjK1HhMGxQxJM2KPh7BN4f+tGRBEga
 ZgcAjkK36m1VSPI3SVuDBnW1HC50XC7KJ2ndbEe6ziufmwPaTvbA27B4PP9X2mscmxMy
 NWjwlWdX9YrJx/t6ET/tpG677eaeOCFK8ZU/lVqHDr9+XEolSyUM5+XhFxj1sDrxnL71
 pQ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFKrOuKEaaKF0IP/QPRkqBydr/K5DCzxNv/Nqms1m7FQmhTlF4ujTxJaTC7bRTRUlh3O9lWSytja97ZzV86H3IFHwJxrAkMVcVIZA0iotad+Bnpf6+tFcyIse6ilpmKqdO18OTfkyDcXWRTG/kSdZ0Aks75pWr42f5NeJiVe1uGGc6diJJBxgRIoLfVdAAyMVT7DVcDFvkVVevEyPeUnYJETV9o/Jyfe5IenIMZwPQ2y4pfuQ=
X-Gm-Message-State: AOJu0YyIRCMqZR+x8mVun79BZFAFmrWeyt855pl1p2VZeyEOuGgTs9NL
 9B8RdwHZOqt/5a1rjp4ATzKkjbRrvb50zvx5Fjc5kOz/yTlOwdRo
X-Google-Smtp-Source: AGHT+IGTZjuSx59fvBLEZu4nUn6dn9Q2x+1nuEiSc6h7Vo8FFTzb5CNqZWvEdUtshl/goBTMCnhqjA==
X-Received: by 2002:a05:6602:6426:b0:7f9:40a0:dfbd with SMTP id
 ca18e2360f4ac-816c51c8095mr42802139f.13.1721156321173; 
 Tue, 16 Jul 2024 11:58:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:40 -0700 (PDT)
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
Subject: [PATCH v9-resend 13/54] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Tue, 16 Jul 2024 12:57:25 -0600
Message-ID: <20240716185806.1572048-14-jim.cromie@gmail.com>
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

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d4a0ae31d059..43a8e04b8599 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1245,11 +1245,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.45.2

