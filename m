Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DC2B8FB4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079086E536;
	Thu, 19 Nov 2020 10:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D26E536
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:03:28 +0000 (UTC)
Date: Thu, 19 Nov 2020 10:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605780206;
 bh=GbLj95SRLRwE14z2jl/k8o6XNoJ5fglDR1+DFrbzD0k=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=JOo8bBkVugFfmG4x6oDnJewt8RVNw80kmXhHfhie2RtOD7fFxI+1nRcao6YjwI3ds
 R1YuL2gDkWKB8e93wCkUO4hWYiiUm8i2GawJcgajZDzZgdFoXFJdOr2GPV9HUc5HDh
 gvH1/W/m1tGqGJ9QFOcXI3pquRy6CKeMDv+0w0B9Fo3UYYGHfPDQeQibcVqLd+nFYb
 Pi5EPQxw0amh1FicIap07X5l26VWk6HfXXn5KrlL+3y095XSOAOTVNv3VvoyIzRR1H
 akwh+p1jHepO4mP+0/dfn8zF2tNG05IBCWcYanPHWZGlmrdVrDCD4QyT0Bi1EtlGRH
 gahxkiucT97ZA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: improve kernel-docs in drm_mode.h
Message-ID: <grZIqIAOSUM7eNL0PurBsaWoILFwN2hEKd40Ylgzg@cp7-web-041.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Remove duplicate doc-comments for struct members
- Add missing @member markers for in-line member comments

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/uapi/drm/drm_mode.h | 66 ++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ad10ab2a577..f29c1d37be67 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -905,24 +905,23 @@ struct drm_format_modifier {
 
 /**
  * struct drm_mode_create_blob - Create New block property
- * @data: Pointer to data to copy.
- * @length: Length of data to copy.
- * @blob_id: new property ID.
+ *
  * Create a new 'blob' data property, copying length bytes from data pointer,
  * and returning new blob ID.
  */
 struct drm_mode_create_blob {
-	/** Pointer to data to copy. */
+	/** @data: Pointer to data to copy. */
 	__u64 data;
-	/** Length of data to copy. */
+	/** @length: Length of data to copy. */
 	__u32 length;
-	/** Return: new property ID. */
+	/** @blob_id: Return: new property ID. */
 	__u32 blob_id;
 };
 
 /**
  * struct drm_mode_destroy_blob - Destroy user blob
  * @blob_id: blob_id to destroy
+ *
  * Destroy a user-created blob property.
  *
  * User-space can release blobs as soon as they do not need to refer to them by
@@ -937,36 +936,32 @@ struct drm_mode_destroy_blob {
 
 /**
  * struct drm_mode_create_lease - Create lease
- * @object_ids: Pointer to array of object ids.
- * @object_count: Number of object ids.
- * @flags: flags for new FD.
- * @lessee_id: unique identifier for lessee.
- * @fd: file descriptor to new drm_master file.
+ *
  * Lease mode resources, creating another drm_master.
  */
 struct drm_mode_create_lease {
-	/** Pointer to array of object ids (__u32) */
+	/** @object_ids: Pointer to array of object ids (__u32) */
 	__u64 object_ids;
-	/** Number of object ids */
+	/** @object_count: Number of object ids */
 	__u32 object_count;
-	/** flags for new FD (O_CLOEXEC, etc) */
+	/** @flags: flags for new FD (O_CLOEXEC, etc) */
 	__u32 flags;
 
-	/** Return: unique identifier for lessee. */
+	/** @lessee_id: Return: unique identifier for lessee. */
 	__u32 lessee_id;
-	/** Return: file descriptor to new drm_master file */
+	/** @fd: Return: file descriptor to new drm_master file */
 	__u32 fd;
 };
 
 /**
  * struct drm_mode_list_lessees - List lessees
- * @count_lessees: Number of lessees.
- * @pad: pad.
- * @lessees_ptr: Pointer to lessess.
- * List lesses from a drm_master
+ *
+ * List lesses from a drm_master.
  */
 struct drm_mode_list_lessees {
-	/** Number of lessees.
+	/**
+	 * @count_lessees: Number of lessees.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -974,23 +969,26 @@ struct drm_mode_list_lessees {
 	 * the size and then the data.
 	 */
 	__u32 count_lessees;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to lessees.
-	 * pointer to __u64 array of lessee ids
+	/**
+	 * @lessees_ptr: Pointer to lessees.
+	 *
+	 * Pointer to __u64 array of lessee ids
 	 */
 	__u64 lessees_ptr;
 };
 
 /**
  * struct drm_mode_get_lease - Get Lease
- * @count_objects: Number of leased objects.
- * @pad: pad.
- * @objects_ptr: Pointer to objects.
- * Get leased objects
+ *
+ * Get leased objects.
  */
 struct drm_mode_get_lease {
-	/** Number of leased objects.
+	/**
+	 * @count_objects: Number of leased objects.
+	 *
 	 * On input, provides length of the array.
 	 * On output, provides total number. No
 	 * more than the input number will be written
@@ -998,22 +996,22 @@ struct drm_mode_get_lease {
 	 * the size and then the data.
 	 */
 	__u32 count_objects;
+	/** @pad: Padding. */
 	__u32 pad;
 
-	/** Pointer to objects.
-	 * pointer to __u32 array of object ids
+	/**
+	 * @objects_ptr: Pointer to objects.
+	 *
+	 * Pointer to __u32 array of object ids.
 	 */
 	__u64 objects_ptr;
 };
 
 /**
  * struct drm_mode_revoke_lease - Revoke lease
- * @lessee_id: Unique ID of lessee.
- * Revoke lease
  */
 struct drm_mode_revoke_lease {
-	/** Unique ID of lessee
-	 */
+	/** @lessee_id: Unique ID of lessee */
 	__u32 lessee_id;
 };
 
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
