Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06F2A8C98
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 03:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8C26EDF6;
	Fri,  6 Nov 2020 02:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CF26EDF6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 02:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604629066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTTP77Binb8q6Myv+TECrFOkx25pYy2wpQfJisWb5cQ=;
 b=b63GetMCe5z6KeU88m6wq/xOjI0XkUaW2/p4QFeT892Ft26qLkiirc32g6kHMHE0dNJhh6
 USXLWGadgRjFy7xq15e5Q+dQnhu+xVAxGMDdcfLnuhVxTJIhKgWc9AkIxgYugNtcZE6wNq
 t0FWgAgpbrvgW/8FOcV7AM2pYyXtst4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-tYCkfRiEOYqnIRbj_n7z_Q-1; Thu, 05 Nov 2020 21:17:45 -0500
X-MC-Unique: tYCkfRiEOYqnIRbj_n7z_Q-1
Received: by mail-qv1-f71.google.com with SMTP id s9so2197195qvt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 18:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTTP77Binb8q6Myv+TECrFOkx25pYy2wpQfJisWb5cQ=;
 b=Sjj2N+85IwmydsCBkgGk3ClisgNc7wgVr38d/qOl1wGXHJ/+ppg+Qqd14fFGnO0grs
 9W0Ov5WEQl+8QnuXuflfYshDXLKTlGm84tAYxzofcK+FqI+J9icthd7UZwQA/Bjg98bz
 d64LCC9NTLIu1lssmrMmSPAjqhanyn7BHlWXYzTRfbKTuBBajpzhxxPb7i7UunMJFBYX
 F0XkHP6i476YDXl8hnV+NCg8EJqMNEGOyl6wFwCE0D4UL0/WrTFi0MV1OFAdyM4tinia
 QQwleBWlwT+P8mpOET3GelklRqV7b37Nt5OfYwGmUJ/wSHOWOeOiFxJcinm2VPE+yE4y
 dXWg==
X-Gm-Message-State: AOAM533XtSJyTLYQT9E1EgqrxzocBu/99KWLGX0uJGx1WUynltS6Ml9/
 gZWPGFU/ZJR2vFoJaKvuWn7pH+drD/OrHdpaus6bGpOxhoBCCgjlxP6nsPV/PYUD7nie7Kzg38Q
 3A49TtQntLqLlPJ5yVpdmbtFZ3llf
X-Received: by 2002:a37:b342:: with SMTP id c63mr5354715qkf.146.1604629064605; 
 Thu, 05 Nov 2020 18:17:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywxxAwhVSFnT9J8jpLBEO4CY5W9W9Xz/Qxhz0ra1j3pitSYEK7KwYiLA2H5gQ5/94RyqMxyA==
X-Received: by 2002:a37:b342:: with SMTP id c63mr5354696qkf.146.1604629064392; 
 Thu, 05 Nov 2020 18:17:44 -0800 (PST)
Received: from xps13.jcline.org ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id q20sm2195301qtn.80.2020.11.05.18.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:17:43 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 3/3] drm/nouveau: begin documenting core nouveau structures
Date: Thu,  5 Nov 2020 21:16:56 -0500
Message-Id: <20201106021656.40743-4-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106021656.40743-1-jcline@redhat.com>
References: <20201106021656.40743-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start on documentation for the Nouveau device structure and the NVIF
client structure it uses. This documentation is not complete as the
structures are non-trivial and I am not familiar with large portions of
them.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 67 +++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index cf6c33e52a5c..cf83d4bf3c6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -90,8 +90,20 @@ enum nouveau_drm_handle {
 	NVDRM_NVSW    = 0x55550000,
 };
 
+/**
+ * struct nouveau_cli - A DRM-specific NVIF client.
+ *
+ * This encapsulates a NVIF client and is intended to be the sole interface
+ * between the DRM APIs and NVKM. An instance of this structure is allocated
+ * for each userspace client when they open the device file. Additionally,
+ * there are several allocated strictly for the kernel's use.
+ */
 struct nouveau_cli {
 	struct nvif_client base;
+
+	/**
+	 * @drm: A reference to the device that the client is associated with.
+	 */
 	struct nouveau_drm *drm;
 	struct mutex mutex;
 
@@ -101,6 +113,9 @@ struct nouveau_cli {
 	struct nouveau_vmm svm;
 	const struct nvif_mclass *mem;
 
+	/**
+	 * @head: The list entry for this client in the @drm device's list of clients.
+	 */
 	struct list_head head;
 	void *abi16;
 	struct list_head objects;
@@ -108,13 +123,36 @@ struct nouveau_cli {
 	char name[32];
 
 	struct work_struct work;
+
+	/**
+	 * @worker: List of pending &struct nouveau_cli_work associated with this client.
+	 */
 	struct list_head worker;
+
+	/**
+	 * @lock: Protects the @worker list. Additionally, this lock on the
+	 * @drm.master instance is used to serialize destruction of the @base
+	 * member in this structure, as well as the destruction of the &struct
+	 * nvif_mem embedded in &struct nouveau_mem instances.
+	 */
 	struct mutex lock;
 };
 
+/**
+ * struct nouveau_cli_work - A pending work item for an NVIF client.
+ */
 struct nouveau_cli_work {
 	void (*func)(struct nouveau_cli_work *);
+
+	/**
+	 * @cli: Reference to the NVIF client this work belongs to.
+	 */
 	struct nouveau_cli *cli;
+
+	/**
+	 * @head: The list entry for this work item in the &struct nouveau_cli
+	 * worker list.
+	 */
 	struct list_head head;
 
 	struct dma_fence *fence;
@@ -133,9 +171,32 @@ nouveau_cli(struct drm_file *fpriv)
 #include <nvif/object.h>
 #include <nvif/parent.h>
 
+/**
+ * struct nouveau_drm - The nouveau-specific device structure.
+ *
+ * This structure is allocated for a device when it is probed and keeps track
+ * of all the nouveau-specific device details. The lifetime of this structure
+ * is the same as the lifetime of a &struct drm_device and is managed by the
+ * DRM layer.
+ */
 struct nouveau_drm {
+	/**
+	 * @parent: Implementation of the interface required to use the NVIF_DEBUG
+	 * and NVIF_ERROR macros
+	 */
 	struct nvif_parent parent;
+
+	/**
+	 * @master: This NVIF client is used to initialize the NVIF driver and used
+	 * for TTM memory allocations. It is the root of the NVIF object tree.
+	 */
 	struct nouveau_cli master;
+
+	/**
+	 * @client: This NVIF client is used by the DRM layer to interact with
+	 * the NVKM layer for everything except TTM memory allocations. It, and
+	 * all other clients, are children of the primary (@master) client.
+	 */
 	struct nouveau_cli client;
 
 	/**
@@ -143,6 +204,12 @@ struct nouveau_drm {
 	 */
 	struct drm_device drm_dev;
 
+	/**
+	 * @clients: List of all &struct nouveau_cli allocated for userspace
+	 * associated with this DRM device. Clients are allocated when the DRM
+	 * file is opened and deallocated when the file is closed. This list is
+	 * protected by the mutex in @client.
+	 */
 	struct list_head clients;
 
 	u8 old_pm_cap;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
