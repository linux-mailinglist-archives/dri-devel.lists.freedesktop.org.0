Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C876C102
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8459910E448;
	Tue,  1 Aug 2023 23:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2DF10E048
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:21 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3492e8fb906so6532005ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932921; x=1691537721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=ZfSrUjTlhhWVXmCxpYv0ujUYTgmvuwgWu1MQihiN1/gwsGPB43U9EC39GybOwaK6JI
 TynF4nJHDZmDrAhaMGPf6jnJMWwP3yhkHzEJQmZ2tH5+E98bOkJrr5ngRt9I15Q2T8Vr
 vQn/BSsfWHhZ8yDXxA5VKmfCMp+y3+irtQzQvBKUxAPU14rHUh59w0tIF1TY96JdjaUp
 EAWKd2oNfeeEQMF3wbGGk4Y0rw7ebtjGUdYm1YWYIxBPyk0wlEDc2bSHcAqLlGCjPFDG
 igwYNLZrxwPbH3xubdKLd4PxecD9augGm1pry8pgS+TkYQeZ757rMeopuwvDCrFfFLq+
 wWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932921; x=1691537721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EpDVIlDX2H9hcBKUU2bnV2uAgz8tLVHVeXAEtG+jYc=;
 b=Qc/N7lCSLFRN3evtKl38hpBm6Qh27FdfcamNm6734w6oPamasyFtw2g3nPczcii98i
 hQKgvzrQrhHZsTUqNu6Q68e28RoH+vLjt8JmANPxLcM/Rr/sSYc7EtK/rWmoMtP+Jrg4
 1BDXGZfjjfCiAGabLGpdvOjX47VGYnb6nDC+YziF86MvGCZgFBEFs2qt3HlRH6vrXMDf
 UKkLLY9MSO5MJiHSGTiP5FHS3Cm31pHCtU1JlNk9sZZt2Fsh4fkorEk3z4MgI6c0iDvL
 GjsjGzshUpZ7U0pjAuqZhqAezNYdMIIVnxar8B0apzEJ6AVeeenDOxfuGUKaWk3IUhqa
 OFww==
X-Gm-Message-State: ABy/qLaemRDrJWyv0OW79WvktnZiH+dMHn2XKrnDSOMUsBmOJPZLz83y
 KXATwO55mqZ33CJW7Wq+vA+c4201q3AK3w==
X-Google-Smtp-Source: APBJJlFWVAtcjCQRb4qaYFPcVc6qQSf7WKA64arSdrXADptzETwL4XFIOJUhKcCQM15hokeTlLOdxQ==
X-Received: by 2002:a05:6e02:1748:b0:348:90c2:ba0a with SMTP id
 y8-20020a056e02174800b0034890c2ba0amr15569141ill.32.1690932921131; 
 Tue, 01 Aug 2023 16:35:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/23] drm: use correct ccflags-y syntax
Date: Tue,  1 Aug 2023 17:34:47 -0600
Message-ID: <20230801233515.166971-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

Incorrect CFLAGS- usage failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
but without DYNAMIC_DEBUG

Nobody noticed because a larger regression emerged.

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a33257d2bc7f..670bf046019e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

