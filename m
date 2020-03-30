Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A91984BB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6C26E489;
	Mon, 30 Mar 2020 19:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0946E42A;
 Mon, 30 Mar 2020 19:41:26 +0000 (UTC)
IronPort-SDR: pDvjJ39+T1LPk3t6Xo6KeXFxLF1g2D67hcErqSQ2tXh0Lyt3vVxWWNFW5IjPzB/3fbyeSq6jYV
 kykVd6l46PLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 12:41:25 -0700
IronPort-SDR: 4zFr2/UsFR4Ph5uNlVy2x2qB7jH1qy8NdU+3n/XSf+FHkh+5U3tnuJ+x6f/muwq20tTjdq9jrN
 jq2fW0dN0VAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="359273039"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 12:41:21 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] drm/todo: Add todo to make i915 WARN* calls drm device
 specific
Date: Tue, 31 Mar 2020 01:02:08 +0530
Message-Id: <20200330193208.15038-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With below commit, we have new struct drm_device based WARN* macros,
which include device specific information in the backtrace.

commit dc1a73e50f9c63d4dd928df538082200467dc4b1
Author: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date:   Wed Jan 15 09:14:45 2020 +0530

    drm/print: introduce new struct drm_device based WARN* macros

Majority of the i915 WARN* are already converted to use struct
drm_device specific drm_WARN* calls. Add new todo entry for
pending conversions.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
changes since v1:
* Remove accidentally added unrelated change (Sam)
* Update commit description by adding space after full stop (Sam)
 
 Documentation/gpu/todo.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 37a3a023c114..d009a84384b3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -575,6 +575,18 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
+Make i915 WARN* Calls struct drm_device Specific
+------------------------------------------------
+
+struct drm_device specific drm_WARN* macros include device information in the
+backtrace, so we know what device the warnings originate from. Convert all the
+calls of WARN* with drm_WARN* calls in i915. While at it, remove WARN* which
+are not truly valid.
+
+Contact: Jani Nikula
+
+Level: Starter
+
 Bootsplash
 ==========
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
