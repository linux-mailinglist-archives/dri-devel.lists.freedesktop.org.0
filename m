Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F859330DC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C9510E2C5;
	Tue, 16 Jul 2024 18:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5CeGAEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE0410E718;
 Tue, 16 Jul 2024 18:58:24 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7fedb09357aso5193839f.2; 
 Tue, 16 Jul 2024 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156304; x=1721761104; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=al8xZ+YlvhlhYR2QqHaR49xBruYIKMULtZOXYmr91IY=;
 b=G5CeGAEaEjShCy3jYqNExGPO9WUQWXE2xoomMHAzWcp+kBVZCDzcB0lbCpSMOM5LJg
 P0DIIiQ7JMZuZz4mrvb6SOZ1GjuxuqyJqTHsfdmrenlweKVVGeOD+Te6KmmySOw5V6rw
 sLTILjZl36amhGeH+rKkcaYrZwUOnzYWRQzTd5DMQWF50B6soZivtd/LTRpKuSFCPXy/
 4/c+7EFvWf6q93qf7YaJskX0ly2tnr0qKJ6rlD8kYZ0Ou5D5iLCfdKtHTjqoEldlTMIu
 mKQDw106YOffYov6jhAfvW2LhwP1BFer+MVH2k4HFq80b9NtllIBOKKP/b7J5q57sTVA
 ++2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156304; x=1721761104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=al8xZ+YlvhlhYR2QqHaR49xBruYIKMULtZOXYmr91IY=;
 b=C7yrm5ngR5iDHDS3adkjY7pADKvJC9BRK7MbMFqIHSJwCrT4tUVQtFo/mS00UOINYV
 CmUbsTJiFrsXT/K2fXi7/8nR/DoJRpXPEcoUCCttPBcq18RCOzwfGtyMtuQZfl35goAj
 np/S3gxcTKIf5ZDml11cw244U1sIgqi0s/EhYiYdJyKCYToiIScrabyMRLrEsrSWm/I6
 iWcv8SpDGEh4K9F6SdrjNY+SDCo1aYoIkKuBjkQ3oM1fGRV971UUYiNNPgwhkt7a1Sdv
 9J940wC8R707PM0mkLwp42dE7TqTBRvwjr9j1iGOLUAVsyw9+AW6eHgc0cbVdl/N8QRa
 blQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT+hI3N5C3L/gbg/wKNGS2Pnx/GUKpBLRngTaKfsXphcx/yXRmZ/y9H2o/9jdUWlFJvmfZFdkAbNnB+8YigKD0y48wjdakz1SmbqJpw0VdTHykRhJ90p8tVmqob60N326gRbKYn7WkXZiiFLgSaEE8+Cdtg1Ri/0kT9GwLSUi8UDBbcFuWImzYjQoQYHiSTut3vifgNVOTSPtATpsa/37dyTwXJJiIQOotIvOrWtG+DdyUDlk=
X-Gm-Message-State: AOJu0Yx3dRZBpy93rRUHIPoBAxSAuAhhsgNiAmYoEGO+mHRNGqhFZSON
 g8e2lxs4bg/rUMNdFu+HR3eh0MeQ5RZQdByMbnr79+jtiz0sitLy
X-Google-Smtp-Source: AGHT+IEHXZgya8fxlhk9i3WpXa3f6xKgjLFbnVvzZUw1PQJh5tx0JX3MrDcdRp4L7TxET69MO77yeg==
X-Received: by 2002:a05:6602:3fc7:b0:7f9:bef6:2068 with SMTP id
 ca18e2360f4ac-816c35dac54mr41417039f.10.1721156303915; 
 Tue, 16 Jul 2024 11:58:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:23 -0700 (PDT)
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
Subject: [PATCH v9-resend 04/54] dyndbg: make ddebug_class_param union members
 same size
Date: Tue, 16 Jul 2024 12:57:16 -0600
Message-ID: <20240716185806.1572048-5-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..b9afc7731b7c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73ccf947d4aa..152b04c05981 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.45.2

