Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AAC26286A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A199C6EA1E;
	Wed,  9 Sep 2020 07:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E520D6EA1E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:21:28 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j34so1421820pgi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Cckn9EcRCOy7+IrqhRAkRB9fhj6npQVnQRV+Ywzibc=;
 b=gvxxZAB0tPUxEA0Thi4h7/smwnXShApL7/fFLgGCHldHmOEE2BTAehvz980zF0bC5V
 1jyjKn1EcadTXdtjYvSp6exlDKHQgRGcsYiGmfs1pvalHPOjt9P3+KqwM1/PjcdN6uw5
 ofBzbQ6swdXhEMJZ9w0hU/qrJcw4o4uQvTUWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Cckn9EcRCOy7+IrqhRAkRB9fhj6npQVnQRV+Ywzibc=;
 b=J0PUmHDeVpZhODM098z2JZr7ru+v1ORgkmwUI5olVIF4TRKKUzC50YlU6RDHIIC8cX
 EsMs78QfUZpM4BvzPS02fwDC8yvW/dY9JBdCysZy9ddjfxTQEno8beINFavtncWbV2dH
 YHOKdffRd1doRUZamys9N6oyZMd7rclg0+f0p4/QlbuZZ1+icBqwtwOXx5QXMeZ0shxp
 omfYQrLga4Y5DFdaGPsoas+bxghe8Bs/SMnVhS8co3LCT2kYOTDryLqsYuvK6r0S1ypX
 /jiIeoOuy+MkYcWfuf5RqG8i4lKxjz0rwIRTYAgUsl8vPyRmsWWoAqZvIbaIYqsgEjJa
 Zngg==
X-Gm-Message-State: AOAM532sRMF0+pXGLII+JG+8jmhHK7wUbnQkA/4rnRa7gsVleukUp15n
 QY282x/7Shl9h+//b7Naf9gy8g==
X-Google-Smtp-Source: ABdhPJyVJbjJSTx1Z989hLkxbOZzvUOJE6v28wOoJgdZ3iUdbEym7T5IeDt/Vu4kikQytkZs652qvg==
X-Received: by 2002:a17:902:ea82:b029:d1:7ed9:5470 with SMTP id
 x2-20020a170902ea82b02900d17ed95470mr1734756plb.26.1599636088605; 
 Wed, 09 Sep 2020 00:21:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id x9sm1240120pgi.87.2020.09.09.00.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 00:21:28 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] drm_dp_mst_topology: export two functions
Date: Wed,  9 Sep 2020 17:20:51 +1000
Message-Id: <20200909172023.v2.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
References: <20200909172023.v2.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
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
 Sam McNally <sammc@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 dri-devel@lists.freedesktop.org
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
2.28.0.526.ge36021eeef-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
