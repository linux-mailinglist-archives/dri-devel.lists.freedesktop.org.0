Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 749093D8BBB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA60A6E43A;
	Wed, 28 Jul 2021 10:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34F26E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 10:29:14 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e21so2113672pla.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 03:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajh3nG10UjXvJlzVI6uC9cucgvEZGkFC9GLNm2+GjJM=;
 b=oR02hxAgZVEp6RRR9SoRCwnUrjRcCwzmApLQF5HLBT9UnYDgJC7FW5dMnvPBbAN7vD
 aa4IJ+1vUIJxUHFOzzLfYGufaFJXUDKMFfqww5XyegcB/JMLmY3Gjq+toHQNiPK0xGFo
 Jaq6QrMBveQDszMhsHtxDUdOf/DTsBhPzujFAMI92HVtlOIRGanauj5xPOvECg2G7kHz
 +U1WCtTnpmWjxaL/UolX6t5bheor3o4D6eplVYSC/IfDICEOU0PyKBxCuCArmXsYwrBi
 yjQaDYKZAiO+Ox0lZFMPPUn2RDoEpLYvtE9X6Pu0FAPrrPZj+5LEa5EmG42CE9kOOeH4
 b0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajh3nG10UjXvJlzVI6uC9cucgvEZGkFC9GLNm2+GjJM=;
 b=ndNN/k5bUfF4rGuCDv0n9bCMQWO3q6GxN7gqia3UjflsBBWwjzAFgdctBBlyCYt4fK
 Y4qrxmb3buAhNHKyqA/jaF2v/TaQeZx3KLc3lhL8jUwxBOvq6/8YHRlXQfoW41a7ZNTR
 gkWkjC1rgs/S261llvTrWrGTt5CziGc/JjskqgiRH9u5YvaFkWMemzS3br454UxVcFi3
 4pcEpHYTe8cqUYVbJ0cGUMDC/Ay8kxXqq00XYS4J/2uDsCRXSI52wa0auDZxHscMx2vS
 sdkjEGGcNSsAuAqigoVSwDQ2+hzoL68DPH2ILHbO/qbgL5TcmWeFJBrIp6yl9M1YGqC7
 OAeQ==
X-Gm-Message-State: AOAM531cL04Xv6iFpA6iWsttuc7e+aPHKaIKBi15dtkywOfi1oISsloE
 AKBSSCSwVv8/K+Kw2Sup0Fg=
X-Google-Smtp-Source: ABdhPJzL3Mp5PPoomFs352O0RNKZvd0RT07l7cvWlcuPgneRfZsAFhiwS9yuNemvNdxe7zlC7mW0UQ==
X-Received: by 2002:a17:90a:4d49:: with SMTP id
 l9mr9265069pjh.179.1627468154432; 
 Wed, 28 Jul 2021 03:29:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id t19sm7550510pfg.216.2021.07.28.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 03:29:13 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Subject: [PATCH v3] drm: clarify usage of drm leases
Date: Wed, 28 Jul 2021 18:27:39 +0800
Message-Id: <20210728102739.441543-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We make the following changes to the documentation of drm leases to
make it easier to reason about their usage. In particular, we clarify
the lifetime and locking rules of lease fields in drm_master:

1. Make it clear that &drm_device.mode_config.idr_mutex protects the
lease idr and list structures for drm_master. The lessor field itself
doesn't need to be protected as it doesn't change after it's set in
drm_lease_create.

2. Add descriptions for the lifetime of lessors and leases.

3. Add an overview DOC: section in drm-uapi.rst that defines the
terminology for drm leasing, and explains how leases work and why
they're used.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

v2 -> v3 (suggestions from Daniel Vetter):
- Clarified that device owners are changed through SETMASTER or
DROPMASTER IOCTL.
- Removed unneccessary includes for drm_lease.[hc] and kerneldoc
formatting changes.

v1 -> v2 (suggestions from Daniel Vetter):
- Clarified description of lease fields in drm_master.
- Added an overview DOC: section for drm leases in drm-uapi.rst.
- Cleaned up function documentation in drm_lease.c to use kernel-doc formatting.

 Documentation/gpu/drm-uapi.rst |  9 +++++
 drivers/gpu/drm/drm_lease.c    | 51 ++++++++++++++++++++++++++
 include/drm/drm_auth.h         | 67 ++++++++++++++++++++++++++++------
 3 files changed, 116 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 7e51dd40bf6e..199afb503ab1 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -37,6 +37,15 @@ Primary Nodes, DRM Master and Authentication
 .. kernel-doc:: include/drm/drm_auth.h
    :internal:
 
+
+.. _drm_leasing:
+
+DRM Display Resource Leasing
+============================
+
+.. kernel-doc:: drivers/gpu/drm/drm_lease.c
+   :doc: drm leasing
+
 Open-Source Userspace Requirements
 ==================================
 
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 92eac73d9001..79be797e8689 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -15,6 +15,57 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+/**
+ * DOC: drm leasing
+ *
+ * DRM leases provide information about whether a DRM master may control a DRM
+ * mode setting object. This enables the creation of multiple DRM masters that
+ * manage subsets of display resources.
+ *
+ * The original DRM master of a device 'owns' the available drm resources. It
+ * may create additional DRM masters and 'lease' resources which it controls
+ * to the new DRM master. This gives the new DRM master control over the
+ * leased resources until the owner revokes the lease, or the new DRM master
+ * is closed. Some helpful terminology:
+ *
+ * - An 'owner' is a &struct drm_master that is not leasing objects from
+ *   another &struct drm_master, and hence 'owns' the objects. The owner can be
+ *   identified as the &struct drm_master for which &drm_master.lessor is NULL.
+ *
+ * - A 'lessor' is a &struct drm_master which is leasing objects to one or more
+ *   other &struct drm_master. Currently, lessees are not allowed to
+ *   create sub-leases, hence the lessor is the same as the owner.
+ *
+ * - A 'lessee' is a &struct drm_master which is leasing objects from some
+ *   other &struct drm_master. Each lessee only leases resources from a single
+ *   lessor recorded in &drm_master.lessor, and holds the set of objects that
+ *   it is leasing in &drm_master.leases.
+ *
+ * - A 'lease' is a contract between the lessor and lessee that identifies
+ *   which resources may be controlled by the lessee. All of the resources
+ *   that are leased must be owned by or leased to the lessor, and lessors are
+ *   not permitted to lease the same object to multiple lessees.
+ *
+ * The set of objects any &struct drm_master 'controls' is limited to the set
+ * of objects it leases (for lessees) or all objects (for owners).
+ *
+ * Objects not controlled by a &struct drm_master cannot be modified through
+ * the various state manipulating ioctls, and any state reported back to user
+ * space will be edited to make them appear idle and/or unusable. For
+ * instance, connectors always report 'disconnected', while encoders
+ * report no possible crtcs or clones.
+ *
+ * Since each lessee may lease objects from a single lessor, display resource
+ * leases form a tree of &struct drm_master. As lessees are currently not
+ * allowed to create sub-leases, the tree depth is limited to 1. All of
+ * these get activated simultaneously when the top level device owner changes
+ * through the SETMASTER or DROPMASTER IOCTL, so &drm_device.master points to
+ * the owner at the top of the lease tree (i.e. the &struct drm_master for which
+ * &drm_master.lessor is NULL). The full list of lessees that are leasing
+ * objects from the owner can be searched via the owner's
+ * &drm_master.lessee_idr.
+ */
+
 #define drm_for_each_lessee(lessee, lessor) \
 	list_for_each_entry((lessee), &(lessor)->lessees, lessee_list)
 
diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index f99d3417f304..ba248ca8866f 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -58,12 +58,6 @@ struct drm_lock_data {
  * @refcount: Refcount for this master object.
  * @dev: Link back to the DRM device
  * @driver_priv: Pointer to driver-private information.
- * @lessor: Lease holder
- * @lessee_id: id for lessees. Owners always have id 0
- * @lessee_list: other lessees of the same master
- * @lessees: drm_masters leasing from this one
- * @leases: Objects leased to this drm_master.
- * @lessee_idr: All lessees under this owner (only used where lessor == NULL)
  *
  * Note that master structures are only relevant for the legacy/primary device
  * nodes, hence there can only be one per device, not one per drm_minor.
@@ -88,17 +82,68 @@ struct drm_master {
 	struct idr magic_map;
 	void *driver_priv;
 
-	/* Tree of display resource leases, each of which is a drm_master struct
-	 * All of these get activated simultaneously, so drm_device master points
-	 * at the top of the tree (for which lessor is NULL). Protected by
-	 * &drm_device.mode_config.idr_mutex.
+	/**
+	 * @lessor:
+	 *
+	 * Lease grantor, only set if this &struct drm_master represents a
+	 * lessee holding a lease of objects from @lessor. Full owners of the
+	 * device have this set to NULL.
+	 *
+	 * The lessor does not change once it's set in drm_lease_create(), and
+	 * each lessee holds a reference to its lessor that it releases upon
+	 * being destroyed in drm_lease_destroy().
+	 *
+	 * See also the :ref:`section on display resource leasing
+	 * <drm_leasing>`.
 	 */
-
 	struct drm_master *lessor;
+
+	/**
+	 * @lessee_id:
+	 *
+	 * ID for lessees. Owners (i.e. @lessor is NULL) always have ID 0.
+	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	int	lessee_id;
+
+	/**
+	 * @lessee_list:
+	 *
+	 * List entry of lessees of @lessor, where they are linked to @lessees.
+	 * Not used for owners. Protected by &drm_device.mode_config's
+	 * &drm_mode_config.idr_mutex.
+	 */
 	struct list_head lessee_list;
+
+	/**
+	 * @lessees:
+	 *
+	 * List of drm_masters leasing from this one. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 *
+	 * This list is empty if no leases have been granted, or if all lessees
+	 * have been destroyed. Since lessors are referenced by all their
+	 * lessees, this master cannot be destroyed unless the list is empty.
+	 */
 	struct list_head lessees;
+
+	/**
+	 * @leases:
+	 *
+	 * Objects leased to this drm_master. Protected by
+	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 *
+	 * Objects are leased all together in drm_lease_create(), and are
+	 * removed all together when the lease is revoked.
+	 */
 	struct idr leases;
+
+	/**
+	 * @lessee_idr:
+	 *
+	 * All lessees under this owner (only used where @lessor is NULL).
+	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
+	 */
 	struct idr lessee_idr;
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
-- 
2.25.1

