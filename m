Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F311577BB4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FAAA9D71;
	Mon, 18 Jul 2022 06:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0576A9D1D;
 Mon, 18 Jul 2022 06:39:28 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id w16so5094794ilh.0;
 Sun, 17 Jul 2022 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRaYOM5N2Fpgdluj7apd1mQHejWq3ClMMzk6PiyYq0c=;
 b=UCp4LmmEli9JSGOZxhB+PM6vmpQEpN6oEdrOeADstttiSDeNCDeesOLbEgY+HgKEcc
 Ytrg4CFkytA2c1O8ReqEolNJk13C608JyU35ae6lRYSh4nvoPFcodaaMPZUthZ6OrSZz
 WkeFIhr5Zh3eAJdDXN0cCyoVU6GwhWcm5wm4OhGJsDfc6lcmf1ecnvRGaLD5UOeGauHA
 CZtM5FbUMdDjhQhaB5hlsjsBTW7T8k8w/Mw/jcghIFG7TMTztxEsyGMOOzlR4umW90IY
 +3ku1plLnAUO+mJASLB5XuEoFIS8IivKKHXBKqXJ0M/3OVAe4A6PD5++8hnxCichZO/D
 T51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRaYOM5N2Fpgdluj7apd1mQHejWq3ClMMzk6PiyYq0c=;
 b=MDxM0O5VxTtOK7esEkW8h2KgIjt++OHfTlMKaj0GCM7k5Qrq7SbQkjV/uWpLIThskB
 aOc2uoingqiRp4WPmkTvUveza6Fb0nyAjHcBraQFCQ+H7O44hOeorU/HWYGUUCsYmbQj
 4bbqGHM11zO/9h5gZ48FahfUM/VYT4byYqPNbjjRunpHt57Q5gAWYyxsBO0d9GN1iqnj
 liTn4IMfLhc9JVVng7PTBRKTUN56eshic9OQTTc4Ka9HtP7nlXY3WigiD/Dzxtg9D/2L
 qVOZrh/hDqouru1O/slonX6xoD8e57H3+/q0dywr3ECAxvcDBIs1vHlK0aXdo8Fjd5GP
 KmOw==
X-Gm-Message-State: AJIora8AqbXIw2YIX7ZRepgHZqaEKUBOBQ1rJOkBKtTV+Qs+vpN6nsHv
 mi2XtTEOpXNBwjqx9/VmHgI=
X-Google-Smtp-Source: AGRyM1uk7CbZyzjhZdLeyISwfXvc3vTUVD1FONDcjDrIlsIzJfD1mIwVx8r5I4nBchvhmmhMH2B+Cw==
X-Received: by 2002:a92:c247:0:b0:2dc:8467:170c with SMTP id
 k7-20020a92c247000000b002dc8467170cmr12283048ilo.225.1658126367871; 
 Sun, 17 Jul 2022 23:39:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 39/41] nouveau-dbg: add 2 verbose-classmaps for CLI, SUBDEV
Date: Mon, 18 Jul 2022 00:36:38 -0600
Message-Id: <20220718063641.9179-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau has additional debug variables to consider:

drivers/gpu/drm/nouveau/include/nvkm/core/device.h
131:	if (_device->debug >= (l))                                             \

drivers/gpu/drm/nouveau/include/nvkm/core/client.h
39:	if (_client->debug >= NV_DBG_##l)                                      \

drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
54:	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))              \

This is another baby-step, that seems not to break, so lets get a
snapshot.

whats done here:

In nouveau_drm.c, declare class-names: NV_CLI_DBG_* NV_SUBDEV_DBG_* by
calling DECLARE_DYNDBG_CLASSMAP(verbose-type) 2x more, right after the
drm DECLARE, for cli and subdev.  Adjust base to 10,15, to avoid 0-10
allocated subsystem-wide for drm.debug.  This shares the 0..30
classid-space.

In nvkm/core/debug.h, add enums to match the names, with initial
values to match the bases.

In nvkm/core/subdev.h, alter (recently added) nvkm_drmdbg_() to use
NV_SUBDEV_DBG_* instead of NV_DBG_*.  Note: this is undone next,
because base != CONFIG_NOUVEAU_DEBUG.

NOTES:

class-name-space is flat and wide, so super-generic names like INFO
should be prefixed; who could predict what a generic "V1" does across
all modules.

A sub-system prefix, such as "DRM_UT_" could be considered a working
shorthand for module "foo,bar,buzz" (which wouldnt work), but it adds
a layer of authors-judgment in the classifications.

In both classmaps, Ive left FATAL..WARN out, they're not really
optional the way INFO..SPAM are; even if they were defaulted to on,
dyndbg shouldn't be able to turn them off.

bash-5.1# modprobe nouveau
[  966.107833] dyndbg:   3 debug prints in module wmi
[  966.342188] dyndbg: class[0]: module:nouveau base:15 len:5 ty:1
[  966.342873] dyndbg:  15: 0 NV_SUBDEV_DBG_OFF
[  966.343352] dyndbg:  16: 1 NV_SUBDEV_DBG_INFO
[  966.343912] dyndbg:  17: 2 NV_SUBDEV_DBG_DEBUG
[  966.344443] dyndbg:  18: 3 NV_SUBDEV_DBG_TRACE
[  966.344938] dyndbg:  19: 4 NV_SUBDEV_DBG_SPAM
[  966.345402] dyndbg: class[1]: module:nouveau base:10 len:5 ty:1
[  966.346011] dyndbg:  10: 0 NV_CLI_DBG_OFF
[  966.346477] dyndbg:  11: 1 NV_CLI_DBG_INFO
[  966.346989] dyndbg:  12: 2 NV_CLI_DBG_DEBUG
[  966.347442] dyndbg:  13: 3 NV_CLI_DBG_TRACE
[  966.347875] dyndbg:  14: 4 NV_CLI_DBG_SPAM
[  966.348284] dyndbg: class[2]: module:nouveau base:0 len:10 ty:0
[  966.348888] dyndbg:  0: 0 DRM_UT_CORE
[  966.349310] dyndbg:  1: 1 DRM_UT_DRIVER
[  966.349694] dyndbg:  2: 2 DRM_UT_KMS
[  966.350083] dyndbg:  3: 3 DRM_UT_PRIME
[  966.350482] dyndbg:  4: 4 DRM_UT_ATOMIC
[  966.351016] dyndbg:  5: 5 DRM_UT_VBL
[  966.351475] dyndbg:  6: 6 DRM_UT_STATE
[  966.351899] dyndbg:  7: 7 DRM_UT_LEASE
[  966.352309] dyndbg:  8: 8 DRM_UT_DP
[  966.352678] dyndbg:  9: 9 DRM_UT_DRMRES
[  966.353104] dyndbg: module:nouveau attached 3 classes
[  966.353759] dyndbg: 119 debug prints in module nouveau

NOTE: it was 632 with previous commit, switching NV_DEBUG to use
NV_SUBDEV_DBG_DEBUG instead of NV_DBG_DEBUG is the cause.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../gpu/drm/nouveau/include/nvkm/core/debug.h    | 16 ++++++++++++++++
 .../gpu/drm/nouveau/include/nvkm/core/subdev.h   |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/debug.h b/drivers/gpu/drm/nouveau/include/nvkm/core/debug.h
index b4a9c7d991ca..6a155a23a3d1 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/debug.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/debug.h
@@ -9,4 +9,20 @@
 #define NV_DBG_TRACE    5
 #define NV_DBG_PARANOIA 6
 #define NV_DBG_SPAM     7
+
+enum nv_cli_dbg_verbose {
+	NV_CLI_DBG_OFF = 10,
+	NV_CLI_DBG_INFO,
+	NV_CLI_DBG_DEBUG,
+	NV_CLI_DBG_TRACE,
+	NV_CLI_DBG_SPAM
+};
+enum nv_subdev_dbg_verbose {
+	NV_SUBDEV_DBG_OFF = 15,
+	NV_SUBDEV_DBG_INFO,
+	NV_SUBDEV_DBG_DEBUG,
+	NV_SUBDEV_DBG_TRACE,
+	NV_SUBDEV_DBG_SPAM
+};
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index b9c2afab321f..bf9c69f4fc3e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_SUBDEV_H__
 #define __NVKM_SUBDEV_H__
 #include <core/device.h>
+#include <core/debug.h>
 
 enum nvkm_subdev_type {
 #define NVKM_LAYOUT_ONCE(t,s,p,...) t,
@@ -65,7 +66,7 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))	\
 		dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \
 } while(0)
-#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_DBG_##l, dbg, f, ##a)
+#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_SUBDEV_DBG_##l, dbg, f, ##a)
 #define nvkm_debug(s,f,a...) nvkm_drmdbg_((s), DEBUG, f, ##a)
 #define nvkm_trace(s,f,a...) nvkm_drmdbg_((s), TRACE, f, ##a)
 #define nvkm_spam(s,f,a...)  nvkm_drmdbg_((s),  SPAM, f, ##a)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 76e3a8d50b01..85b63b527877 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -83,6 +83,20 @@ DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT, 0,
 			"DRM_UT_DP",
 			"DRM_UT_DRMRES");
 
+DECLARE_DYNDBG_CLASSMAP(nv_cli_debug_verbose, DD_CLASS_TYPE_VERBOSE, 10,
+			"NV_CLI_DBG_OFF",
+			"NV_CLI_DBG_INFO",
+			"NV_CLI_DBG_DEBUG",
+			"NV_CLI_DBG_TRACE",
+			"NV_CLI_DBG_SPAM");
+
+DECLARE_DYNDBG_CLASSMAP(nv_subdev_debug_verbose, DD_CLASS_TYPE_VERBOSE, 15,
+			"NV_SUBDEV_DBG_OFF",
+			"NV_SUBDEV_DBG_INFO",
+			"NV_SUBDEV_DBG_DEBUG",
+			"NV_SUBDEV_DBG_TRACE",
+			"NV_SUBDEV_DBG_SPAM");
+
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
-- 
2.36.1

