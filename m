Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5043DB2B8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 07:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605136F3CF;
	Fri, 30 Jul 2021 05:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C737D6F3CF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 05:18:24 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso19130390pjq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 22:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Ab74AhJwzRIRCGKgVVDL+7Qsvq0Oe+eaDr5ToQWIrM=;
 b=H+H2wlj1EE0u8J1jTx+Ex7m4hUnl2baCHpp7Ad6LGMkcRw+7rwr6QGwxb0Zw9Z/+YZ
 DC6ul5wmzHs0mM3UfV3S41rlBtNoNOYF/ElpLjwU7Rwtcok8UhOXdNYqfuAN5Wm5foQU
 zF8jYbWZRDaJDt48rN5h8JAOE7qOchc2sKPvVpNQF4u2PJtoqzcJvwuylbikxxxBgDQM
 DhgJ740i061uzWWiqbaXQObrbX06D5xNBY9/Sz4hPeIVW354g1t2U/AAyHVRLupwrkRW
 gnjYSQU4fDBBflA0HkHlqTrdcD0dbsOqIeBXch7dFTd5zikxgKHkU98oAFvL9/OINjFE
 By6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Ab74AhJwzRIRCGKgVVDL+7Qsvq0Oe+eaDr5ToQWIrM=;
 b=cq3cPZOpMSmss0/rbTIA9loPeo04qB/+3+B9uSf6YS1owJf8qVErrrC/bUZJfOtwZQ
 rDfqD+NPMelVsvZG/j4XjhEhqV0MNL9f9XEwUw4L5JpQCBUdlRQO2tFtsCyBCurnI+Fg
 CGBfbv1wjzGL2+RZT033C+LihNIsgIjkdhC67uTrQVbA4aIWvey11qh/xXvHfDy21e+P
 7yvJzVpFkwnsefOL5TqX9xA8enV+IZP9d8dmIW03Kje+kyItrnU8niSbKNqEry6UtTIA
 QZu1i/nOQC5D4hnmRDELrO7MZMxpZVcIzKyKZOKrPAYs106je8zeLdmiq4atDSJ5Mjzd
 b2tQ==
X-Gm-Message-State: AOAM53223DGYGNHw04ZrIlpgAubRWg94r4r4Di1W87onkhgLQ/qBR4VZ
 llPx98wk8fCh6kii4oOjN10=
X-Google-Smtp-Source: ABdhPJwwZ7bfmA1WBWMnM9nSkPgl9E1SBdUL8MZLDqWCk8kGpHCkK3PjMOb59kmfJI125sxO51R0cw==
X-Received: by 2002:a17:903:244d:b029:12c:3c0:f21d with SMTP id
 l13-20020a170903244db029012c03c0f21dmr882043pls.65.1627622304272; 
 Thu, 29 Jul 2021 22:18:24 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c4sm655444pfo.45.2021.07.29.22.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 22:18:23 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: clean up unused kerneldoc in drm_lease.c
Date: Fri, 30 Jul 2021 13:17:59 +0800
Message-Id: <20210730051759.1570630-1-desmondcheongzx@gmail.com>
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
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kerneldoc in drm_lease.c is unused because none of the functions
are driver interfaces as the symbols are not exported.

Since they aren't used and much of the existing comments don't provide
any insights (e.g. they just repeat the function name or list out the
function parameters), they should be removed to make them easier to
maintain and to make useful info more obvious.

As a note, many of the comments mention whether idr_mutex should be
held, but these are mostly redundant in cases where the function
contains lockdep assertions or grabs the mutex.

To simplify review, here's the reasoning behind each update.

drm_lease_owner:
function name is self-descriptive

_drm_find_lessee:
function name is self-descriptive

_drm_lease_held_master:
function name and signature are self-descriptive

_drm_has_leased:
kerneldoc is summarized into a comment because the function name could
be interpreted ambiguously (check if the object has been leased VS
check if the master has a lease on the object)

_drm_lease_held:
Retain the idr_mutex comment because the function does not directly
grab the mutex or use a lockdep assertion.
Otherwise, the function name is self-descriptive.

drm_lease_held:
function name is self-descriptive

drm_lease_filter_crtcs:
Kerneldoc is summarized into a comment because the function name could
be interpreted ambiguously (filter leases based on crtcs mask VS
filter crtcs mask based on leases)

drm_lease_create:
Kerneldoc removed.
Useful function details such as atomic leasing are retained.
Errno interpretations are useful and retained.

drm_lease_destroy:
function name is self-descriptive. Additional information is also
removed as they're already present as comments inside the function.

_drm_lease_revoke:
function name is self-descriptive

drm_lease_revoke:
function name is self-descriptive

drm_mode_create_lease_ioctl:
Kerneldoc removed, but useful function details retained.

drm_mode_list_lessees_ioctl:
function name is self-descriptive. Additional details restate what the
code does.

drm_mode_get_lease_ioctl:
Function summary retained to clarify that it's the leased objects that
are returned, not the lease structure.

drm_mode_revoke_lease_ioctl:
Kerneldoc removed, but useful function details retained.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_lease.c | 131 +++---------------------------------
 1 file changed, 8 insertions(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 79be797e8689..dee4f24a1808 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -71,14 +71,6 @@
 
 static uint64_t drm_lease_idr_object;
 
-/**
- * drm_lease_owner - return ancestor owner drm_master
- * @master: drm_master somewhere within tree of lessees and lessors
- *
- * RETURN:
- *
- * drm_master at the top of the tree (i.e, with lessor NULL
- */
 struct drm_master *drm_lease_owner(struct drm_master *master)
 {
 	while (master->lessor != NULL)
@@ -86,16 +78,6 @@ struct drm_master *drm_lease_owner(struct drm_master *master)
 	return master;
 }
 
-/**
- * _drm_find_lessee - find lessee by id (idr_mutex held)
- * @master: drm_master of lessor
- * @lessee_id: id
- *
- * RETURN:
- *
- * drm_master of the lessee if valid, NULL otherwise
- */
-
 static struct drm_master*
 _drm_find_lessee(struct drm_master *master, int lessee_id)
 {
@@ -103,17 +85,6 @@ _drm_find_lessee(struct drm_master *master, int lessee_id)
 	return idr_find(&drm_lease_owner(master)->lessee_idr, lessee_id);
 }
 
-/**
- * _drm_lease_held_master - check to see if an object is leased (or owned) by master (idr_mutex held)
- * @master: the master to check the lease status of
- * @id: the id to check
- *
- * Checks if the specified master holds a lease on the object. Return
- * value:
- *
- *	true		'master' holds a lease on (or owns) the object
- *	false		'master' does not hold a lease.
- */
 static int _drm_lease_held_master(struct drm_master *master, int id)
 {
 	lockdep_assert_held(&master->dev->mode_config.idr_mutex);
@@ -122,17 +93,7 @@ static int _drm_lease_held_master(struct drm_master *master, int id)
 	return true;
 }
 
-/**
- * _drm_has_leased - check to see if an object has been leased (idr_mutex held)
- * @master: the master to check the lease status of
- * @id: the id to check
- *
- * Checks if any lessee of 'master' holds a lease on 'id'. Return
- * value:
- *
- *	true		Some lessee holds a lease on the object.
- *	false		No lessee has a lease on the object.
- */
+/* Checks if the given object has been leased to some lessee of drm_master */
 static bool _drm_has_leased(struct drm_master *master, int id)
 {
 	struct drm_master *lessee;
@@ -144,17 +105,7 @@ static bool _drm_has_leased(struct drm_master *master, int id)
 	return false;
 }
 
-/**
- * _drm_lease_held - check drm_mode_object lease status (idr_mutex held)
- * @file_priv: the master drm_file
- * @id: the object id
- *
- * Checks if the specified master holds a lease on the object. Return
- * value:
- *
- *	true		'master' holds a lease on (or owns) the object
- *	false		'master' does not hold a lease.
- */
+/* Called with idr_mutex held */
 bool _drm_lease_held(struct drm_file *file_priv, int id)
 {
 	bool ret;
@@ -172,17 +123,6 @@ bool _drm_lease_held(struct drm_file *file_priv, int id)
 	return ret;
 }
 
-/**
- * drm_lease_held - check drm_mode_object lease status (idr_mutex not held)
- * @file_priv: the master drm_file
- * @id: the object id
- *
- * Checks if the specified master holds a lease on the object. Return
- * value:
- *
- *	true		'master' holds a lease on (or owns) the object
- *	false		'master' does not hold a lease.
- */
 bool drm_lease_held(struct drm_file *file_priv, int id)
 {
 	struct drm_master *master;
@@ -207,13 +147,9 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
 	return ret;
 }
 
-/**
- * drm_lease_filter_crtcs - restricted crtc set to leased values (idr_mutex not held)
- * @file_priv: requestor file
- * @crtcs_in: bitmask of crtcs to check
- *
- * Reconstructs a crtc mask based on the crtcs which are visible
- * through the specified file.
+/*
+ * Given a bitmask of crtcs to check, reconstructs a crtc mask based on the
+ * crtcs which are visible through the specified file.
  */
 uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 {
@@ -258,10 +194,6 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
 }
 
 /*
- * drm_lease_create - create a new drm_master with leased objects (idr_mutex not held)
- * @lessor: lease holder (or owner) of objects
- * @leases: objects to lease to the new drm_master
- *
  * Uses drm_master_create to allocate a new drm_master, then checks to
  * make sure all of the desired objects can be leased, atomically
  * leasing them to the new drmmaster.
@@ -330,15 +262,6 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
 	return ERR_PTR(error);
 }
 
-/**
- * drm_lease_destroy - a master is going away (idr_mutex not held)
- * @master: the drm_master being destroyed
- *
- * All lessees will have been destroyed as they
- * hold a reference on their lessor. Notify any
- * lessor for this master so that it can check
- * the list of lessees.
- */
 void drm_lease_destroy(struct drm_master *master)
 {
 	struct drm_device *dev = master->dev;
@@ -372,10 +295,6 @@ void drm_lease_destroy(struct drm_master *master)
 	DRM_DEBUG_LEASE("drm_lease_destroy done %d\n", master->lessee_id);
 }
 
-/**
- * _drm_lease_revoke - revoke access to all leased objects (idr_mutex held)
- * @top: the master losing its lease
- */
 static void _drm_lease_revoke(struct drm_master *top)
 {
 	int object;
@@ -414,10 +333,6 @@ static void _drm_lease_revoke(struct drm_master *top)
 	}
 }
 
-/**
- * drm_lease_revoke - revoke access to all leased objects (idr_mutex not held)
- * @top: the master losing its lease
- */
 void drm_lease_revoke(struct drm_master *top)
 {
 	mutex_lock(&top->dev->mode_config.idr_mutex);
@@ -549,12 +464,7 @@ static int fill_object_idr(struct drm_device *dev,
 	return ret;
 }
 
-/**
- * drm_mode_create_lease_ioctl - create a new lease
- * @dev: the drm device
- * @data: pointer to struct drm_mode_create_lease
- * @lessor_priv: the file being manipulated
- *
+/*
  * The master associated with the specified file will have a lease
  * created containing the objects specified in the ioctl structure.
  * A file descriptor will be allocated for that and returned to the
@@ -676,18 +586,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
 	return ret;
 }
 
-/**
- * drm_mode_list_lessees_ioctl - list lessee ids
- * @dev: the drm device
- * @data: pointer to struct drm_mode_list_lessees
- * @lessor_priv: the file being manipulated
- *
- * Starting from the master associated with the specified file,
- * the master with the provided lessee_id is found, and then
- * an array of lessee ids associated with leases from that master
- * are returned.
- */
-
 int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 			       void *data, struct drm_file *lessor_priv)
 {
@@ -734,15 +632,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
 	return ret;
 }
 
-/**
- * drm_mode_get_lease_ioctl - list leased objects
- * @dev: the drm device
- * @data: pointer to struct drm_mode_get_lease
- * @lessee_priv: the file being manipulated
- *
- * Return the list of leased objects for the specified lessee
- */
-
+/* Return the list of leased objects for the specified lessee */
 int drm_mode_get_lease_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *lessee_priv)
 {
@@ -796,12 +686,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
 	return ret;
 }
 
-/**
- * drm_mode_revoke_lease_ioctl - revoke lease
- * @dev: the drm device
- * @data: pointer to struct drm_mode_revoke_lease
- * @lessor_priv: the file being manipulated
- *
+/*
  * This removes all of the objects from the lease without
  * actually getting rid of the lease itself; that way all
  * references to it still work correctly
-- 
2.25.1

