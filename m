Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E96924A4B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FA410E6C9;
	Tue,  2 Jul 2024 21:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jzcTYT/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60BD10E6CB;
 Tue,  2 Jul 2024 21:58:24 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7eba486df76so856839f.0; 
 Tue, 02 Jul 2024 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957504; x=1720562304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wso+Oi2/ut2legKe2oAWbXK/ItRspmzOjB4tGo2hISg=;
 b=jzcTYT/2PkZD3uXDPguTLQ8gTlWktnug6yLsUFB7M4rlHq+ZlSeaU/3rsLpvvhrv5f
 J20J2ePO2YWfo1Y5cQvqgeQ/dyyv+BLzd6OkEttYQKpVZXFWg69WNwh6d25MdSdN4Guy
 /46lP83aHnTAwmktrsyQgmmVc/07M39kVTD27cqnupVW3DGbMJn+tOpmo7lUEYQMwnNl
 wHZLD14ZggOUAh1+APzDC+kTXnj4yFgaPRGX78vvHu9JNcV2nIohWovsPPe8wKJu+TI6
 fOSKkHUAAkHczW1wMPk9J4VBHxWRtpFiPpz2MgqF/G+JdBAcXSVuortBeUxg1t5l9fp2
 Gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957504; x=1720562304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wso+Oi2/ut2legKe2oAWbXK/ItRspmzOjB4tGo2hISg=;
 b=vDMMCJR/b21VprFw0HW3juj8s+oGvn2TbDJ+5/mLCn5EkgEKubpmHL16EhmCQfEwcF
 JHCUsu+XSn+Do/Zr1lmsTuFyi4eBUnqXlNQ2BmYYO85BYPxMTHBoz+T+P8glTNkSU9az
 bMSuDN61bYJ5+gSfOXmPb2Vj0/JrKUr939kdahmUx77J7ck6yeIyeGw/yoFV5zfuPUVT
 ArdRMnZ2Xkod7Gj+nMtjCRf53QlHmd8arxj2EHsqIYkT97NJ1YAEvuBC0e0IfGr3PzoH
 TtiMsV7j8cOgyBFrwz2d0TGUwBUWPkIdgeHqS1shWoiL83HpMePdrkdcTygXeg6AN9FY
 h5YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGspFOpI/EoxBSR+83pdN6I0R8It0DWMs75dNQkHaHdTMBbRGCA6Ooem1TM2JNXw/ATMvE0/KuPF+kJyXh1utvYcipZwIhXUeFiNYXZ7Cd6rLNwmX2//HdSrmGaNsJJ777lkS5J7JFG/MyONEV+vvs6ZXZ6cVi6MdPkZPj9WL8cEQxe+Xy4Cw8dPX+w/wM4XC/RSc11dXdiCgIXdwullX9JZWVR+NvU/uzfj9+GHJeMd3VGMQ=
X-Gm-Message-State: AOJu0Yx911LOb8Iyp00NJMHyNdapBZH17nC98cs5n5H0N6WFiH/A0u/S
 ZCPpJDND5uChSpTDR79W9AynZsOqRBuI3iJ8o/nq00aqxILjBuc3
X-Google-Smtp-Source: AGHT+IEjihZo5dhJ6MSq0XVTxwNq7IPZF6HNZIFL7WZIO/OulVmLPGqkTjVhpi6rvHnYoJxnqgO6CA==
X-Received: by 2002:a05:6602:54:b0:7f3:9e2c:fdfd with SMTP id
 ca18e2360f4ac-7f62ee9d6e6mr484501939f.8.1719957504092; 
 Tue, 02 Jul 2024 14:58:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 08/52] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue,  2 Jul 2024 15:56:58 -0600
Message-ID: <20240702215804.2201271-9-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b53217e4b711..8116d0a0d33a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.45.2

