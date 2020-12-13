Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D92D8F21
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 18:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E33389AC2;
	Sun, 13 Dec 2020 17:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27C89AC2;
 Sun, 13 Dec 2020 17:36:34 +0000 (UTC)
IronPort-SDR: hPP8FTV86WFYVW1XcYfqy1cCKlklCg774NMN6joh07fmUSOzZLZgMpD17//Izv9jzn8HkFaagW
 oVrdMqR2iu0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="173850610"
X-IronPort-AV: E=Sophos;i="5.78,416,1599548400"; d="scan'208";a="173850610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 09:36:33 -0800
IronPort-SDR: Pwj4vBd4+/AJTcB25ebZmGqzfCCiYOvpGgtNEDqDXwX4CSCpGOqk3MLanJaILp4+g+miHImprY
 Dk/9NOeS6l3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,416,1599548400"; d="scan'208";a="350915894"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by orsmga002.jf.intel.com with ESMTP; 13 Dec 2020 09:36:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 17:36:30 +0000
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Sun, 13 Dec 2020 09:36:28 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "contact@emersion.fr" <contact@emersion.fr>
Subject: Re: [PATCH] drm/damage_helper: Check if damage clips has valid values
Thread-Topic: [PATCH] drm/damage_helper: Check if damage clips has valid values
Thread-Index: AQHW0XJpc9Vzs4eMcESLWmawfA0ONqn1zGMAgAAD6gA=
Date: Sun, 13 Dec 2020 17:36:28 +0000
Message-ID: <ea52f21e89f437ca88c3f5fdbbc0ff6116cc8bb4.camel@intel.com>
References: <20201213170728.290406-1-jose.souza@intel.com>
 <N8LaQsFFQKXyJWEc_Abvsw7vF3HIkLo4H7wsMHwL0DoHw6zLpYEhvb7tb8AFpH_0fC8whnF_R8uBwlAHc2aBKcYhgHOZ-V76qhgS2L8YPfU=@emersion.fr>
In-Reply-To: <N8LaQsFFQKXyJWEc_Abvsw7vF3HIkLo4H7wsMHwL0DoHw6zLpYEhvb7tb8AFpH_0fC8whnF_R8uBwlAHc2aBKcYhgHOZ-V76qhgS2L8YPfU=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-ID: <43BA5157097E434B81C69318A90DB45B@intel.com>
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "drawat@vmware.com" <drawat@vmware.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-12-13 at 17:22 +0000, Simon Ser wrote:
> Can you add some drm_dbg_atomic logs when the damage is invalid, to make it
> easier for user-space to understand why an atomic commit failed?

sure, this is enough? will wait for a couple of more days before send another version.


diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 9adb369440ba..b598b137d27f 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -33,6 +33,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>

 /**
  * DOC: overview
@@ -152,16 +153,25 @@ int drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,

        for (; num_clips; num_clips--, damaged_clips++) {
                if (damaged_clips->x1 < 0 || damaged_clips->x2 < 0 ||
-                   damaged_clips->y1 < 0 || damaged_clips->y2 < 0)
+                   damaged_clips->y1 < 0 || damaged_clips->y2 < 0) {
+                       drm_dbg_atomic(state->dev,
+                                      "Invalid damage clip, negative coordinate\n");
                        return -EINVAL;
+               }

                if (damaged_clips->x2 < damaged_clips->x1 ||
-                   damaged_clips->y2 < damaged_clips->y1)
+                   damaged_clips->y2 < damaged_clips->y1) {
+                       drm_dbg_atomic(state->dev,
+                                      "Invalid damage clip, negative width or height\n");
                        return -EINVAL;
+               }

                if ((damaged_clips->x2 - damaged_clips->x1) > w ||
-                   (damaged_clips->y2 - damaged_clips->y1) > h)
+                   (damaged_clips->y2 - damaged_clips->y1) > h) {
+                       drm_dbg_atomic(state->dev,
+                                      "Invalid damage clip, width or height larger than plane\n");
                        return -EINVAL;
+               }
        }

        return 0;


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
