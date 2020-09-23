Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC0274EE2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 04:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEB06E0FE;
	Wed, 23 Sep 2020 02:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983496E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:14:25 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id j7so6009353plk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNa2dm3fhSu/kO1AHNUeoooQdDAxpXsqSbh5Zlmjvlg=;
 b=V3j39mj4oLrHFwOz+exT805RYUtYchcvjy/huA0mvzjSdjVSysR3QNM0Q+XuDQoJnq
 UfWpR5eKNpg+vGjIM0fjq72XKrc68lvBwoMBfOhi09jTTrT8Q9ncRQ/TVoope69vAB0f
 ry0C/RCJrz0c5RUyCrG82rMxmrbS0HGyBQpoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNa2dm3fhSu/kO1AHNUeoooQdDAxpXsqSbh5Zlmjvlg=;
 b=QCE12nXaqaUTbZEyGjFWBYZEdOPD4xs4fH7Xo4J6KiWDnMFWwedeGFfImU/BETaWKU
 MYscJ/OBkqB1e51WKxRIhBdXFCVczPVR5LcSjRDN1nZicfIzQdv08vNwQp/1H19/k3KC
 boWNeoOUef7ar0Hmi5G8GmgdtxWnDpyEHmxtTCA5tTfGP7SY7KsQy3z7+KKeFnNaVTn2
 XB8qOcx8VsGQjmB5gNDBUG08vuxuVC3eZ3B1Q1Ovl9Cegl5j654kh41lxr5U4mJp1HTc
 05qoZF6fjA1/HdvmSQvEklln9vBhU2dDPj20xYsRa7xXqoeHH/ENkCDECkph11FQORKn
 YgMA==
X-Gm-Message-State: AOAM532Fd5GJkK2C3o5h4MrOC3DvY2lXslsEKxD90K9poi4yT7fKdpHX
 idnI4mrw3Yqe1KgaLBsf0AaZEw==
X-Google-Smtp-Source: ABdhPJwPbdYRIScjSDYsvKXBL9n/d9LpGV5xZ6g3zyl6g0PiM7S/HMZTbcAdsJBN4n4mbtDDnwVOiw==
X-Received: by 2002:a17:902:8ecc:b029:d2:42b8:2c5d with SMTP id
 x12-20020a1709028eccb02900d242b82c5dmr5039857plo.69.1600827265256; 
 Tue, 22 Sep 2020 19:14:25 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id n9sm16298737pfu.163.2020.09.22.19.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 19:14:24 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] drm_dp_mst_topology: export two functions
Date: Wed, 23 Sep 2020 12:13:54 +1000
Message-Id: <20200923121320.v3.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sam McNally <sammc@chromium.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans Verkuil <hans.verkuil@cisco.com>

These are required for the CEC MST support.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Sam McNally <sammc@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/drm_dp_mst_topology.c | 6 ++----
 include/drm/drm_dp_mst_helper.h       | 4 ++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 0d753201adbd..c783a2a1c114 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -62,8 +62,6 @@ struct drm_dp_pending_up_req {
 static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 				  char *buf);
 
-static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
-
 static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
 				     int id,
 				     struct drm_dp_payload *payload);
@@ -1864,7 +1862,7 @@ static void drm_dp_mst_topology_get_port(struct drm_dp_mst_port *port)
  * drm_dp_mst_topology_try_get_port()
  * drm_dp_mst_topology_get_port()
  */
-static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
+void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
 {
 	topology_ref_history_lock(port->mgr);
 
@@ -1935,7 +1933,7 @@ drm_dp_mst_topology_get_port_validated_locked(struct drm_dp_mst_branch *mstb,
 	return NULL;
 }
 
-static struct drm_dp_mst_port *
+struct drm_dp_mst_port *
 drm_dp_mst_topology_get_port_validated(struct drm_dp_mst_topology_mgr *mgr,
 				       struct drm_dp_mst_port *port)
 {
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index c7c79e0ced18..d036222e0d64 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -754,6 +754,10 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 		       struct drm_dp_mst_topology_mgr *mgr,
 		       struct drm_dp_mst_port *port);
 
+struct drm_dp_mst_port *drm_dp_mst_topology_get_port_validated
+(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
+void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
+
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
 
-- 
2.28.0.681.g6f77f65b4e-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
