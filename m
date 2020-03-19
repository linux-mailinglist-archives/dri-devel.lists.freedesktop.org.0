Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8B18B16A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6586E9E4;
	Thu, 19 Mar 2020 10:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941206E9E4;
 Thu, 19 Mar 2020 10:30:55 +0000 (UTC)
IronPort-SDR: BDW95vAe1OJ+RAMXW/8SjCOXbJr89ugMQcXkmOkNb5+sBVEnFTmLPMzo8Co2K1QMdMaohK+1eM
 ojbFoySdgceA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 03:30:55 -0700
IronPort-SDR: AssF+72ULaqNumOZPFRliT1O0dDfvZQ++Kf/bCPTQzfW7wnqmxIVpBQn8/4tZ6DpI4/9fU6u3P
 Po5+7aJ7ztSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="263687098"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by orsmga002.jf.intel.com with ESMTP; 19 Mar 2020 03:30:50 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: sameer.lattannavar@intel.com, jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, daniels@collabora.com,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 2/5] drm/drm-kms.rst: Add plane and CRTC scaling filter
 property documentation
Date: Thu, 19 Mar 2020 15:51:00 +0530
Message-Id: <20200319102103.28895-3-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
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

changes since v1:
* None
changes since RFC:
* Add separate documentation for plane and CRTC.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 Documentation/gpu/drm-kms.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 906771e03103..b0335e9d887c 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -509,6 +509,18 @@ Variable Refresh Properties
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
