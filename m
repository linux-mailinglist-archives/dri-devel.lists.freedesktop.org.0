Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06133DBA37
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 16:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD416E3D2;
	Fri, 30 Jul 2021 14:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2996E2BC;
 Fri, 30 Jul 2021 14:19:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="276882042"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="276882042"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 07:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="417979839"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 30 Jul 2021 07:19:55 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m9TMg-000A2u-Br; Fri, 30 Jul 2021 14:19:54 +0000
Date: Fri, 30 Jul 2021 22:19:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH] drm: mock_device can be static
Message-ID: <20210730141948.GA11955@243d74413310>
References: <20210730095251.4343-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730095251.4343-1-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/selftests/test-drm_damage_helper.c:15:19: warning: symbol 'mock_device' was not declared. Should it be static?
drivers/gpu/drm/selftests/test-drm_damage_helper.c:16:30: warning: symbol 'mock_obj_props' was not declared. Should it be static?
drivers/gpu/drm/selftests/test-drm_damage_helper.c:17:18: warning: symbol 'mock_plane' was not declared. Should it be static?
drivers/gpu/drm/selftests/test-drm_damage_helper.c:18:21: warning: symbol 'mock_prop' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 test-drm_damage_helper.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
index 1b585c13e042fe..1c19a5d3eefbf8 100644
--- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
@@ -12,10 +12,10 @@
 #include "test-drm_modeset_common.h"
 
 struct drm_driver mock_driver;
-struct drm_device mock_device;
-struct drm_object_properties mock_obj_props;
-struct drm_plane mock_plane;
-struct drm_property mock_prop;
+static struct drm_device mock_device;
+static struct drm_object_properties mock_obj_props;
+static struct drm_plane mock_plane;
+static struct drm_property mock_prop;
 
 static void mock_setup(struct drm_plane_state *state)
 {
