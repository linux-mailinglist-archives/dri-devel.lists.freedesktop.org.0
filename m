Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896CD239E59
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 06:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423E96E117;
	Mon,  3 Aug 2020 04:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1D56E117;
 Mon,  3 Aug 2020 04:34:47 +0000 (UTC)
IronPort-SDR: uM5mX57y74ZJ8VXAKxtXhY1z7MhrKnJ10gYh8Aprgk+x/yfc9f32KAD2dHc7vPNMxPUo/Chfqj
 nB1eqijwt2gA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132102554"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="132102554"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 21:34:47 -0700
IronPort-SDR: m96PCb/SEYdFcKEvVK00UtBToHdPOg2pAh3TcgHQwHGHMBLhnWYTyqIjDg5NmGV4ETzH1dxabg
 x616PKGfG2Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="314528997"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2020 21:34:42 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 sameer.lattannavar@intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 2/5] drm/drm-kms.rst: Add plane and CRTC scaling filter
 property documentation
Date: Mon,  3 Aug 2020 09:59:50 +0530
Message-Id: <20200803042953.7626-3-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200803042953.7626-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Add documentation for newly introduced KMS plane and CRTC scaling
filter properties.

changes since v3:
* None
changes since v1:
* None
changes since RFC:
* Add separate documentation for plane and CRTC.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 Documentation/gpu/drm-kms.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 3c5ae4f6dfd2..8e4031afbb1b 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -518,6 +518,18 @@ Variable Refresh Properties
 .. kernel-doc:: drivers/gpu/drm/drm_connector.c
    :doc: Variable refresh properties
 
+Plane Scaling Filter Property
+-----------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_plane.c
+   :doc: Plane scaling filter property
+
+CRTC Scaling Filter Property
+-----------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_crtc.c
+   :doc: CRTC scaling filter property
+
 Existing KMS Properties
 -----------------------
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
