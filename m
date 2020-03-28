Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD451196646
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157A16EAE2;
	Sat, 28 Mar 2020 13:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E5D6EAE2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q19so12991672ljp.9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqZgt0+H86dzDgMStZ8jbgHYLQgNUufTEwKegYS+otE=;
 b=EzQJzlOKUXSQhFuGxvJgwSojj+2v+40UBfPEiqu8xEP8vgHNFOYKa0TBsWEGuABb4k
 CsffuYK8T0EKGBY/BqYBUmteih9pcHZKkNnFG7mzSvmwGTn3OMpFmKsd4CiYaOdXq+E0
 h1E5qhCoP1YCGEHl2+fxUFBVhDv8Ay1QX070YkQRT3tw8nd+qLZrG30Szto7ypT700lX
 J1PjzGVZztvN+DsP1TzTY3AfWi0Uaq7QmYNo7W8puUsedqXiEl46ernKpj0OLywId82W
 /mAsX3+Sl37jGQWNTBz0tgnTtPODGawwlTDjNSJ+8nxgDx1dfyp/zeyncU0qmXc9XO7Q
 MW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jqZgt0+H86dzDgMStZ8jbgHYLQgNUufTEwKegYS+otE=;
 b=fX0yfQRV4hmOVFNWIWvNFDN3mbEQUiLD8ePLRu8+zDJVOENWpFWHzOVTKOB4Fm5tVj
 7b1uF4KB5hb/t+Sgpozw0TfaZFbbDZw9p92fFJEAtGRwoIdQZQKQell7s24QbOXBtv1p
 iRRXyYYPIF48ubL9+wFtXhN8CacIpoWfuosGbuzDUyh79waJ9PgyJppwHkqVDWH+Di+d
 G8/vt2gIp8BWAqG5FaCf8D2ZALDlL96xbjKVMwvn+UxziZY58k0bp2ccljwXccQcuTq6
 77SMVGca886tH4VLEjYkVVmbKVv4kplDer/BJ5wNB9Q6mS/pzUXFFWe7/K4BVy0wzBJt
 lfrg==
X-Gm-Message-State: AGi0PuZ3J7DVRRS4gJXBL8ZzoXyondSmjKKokkdRhyqt7Dv2aUTYX/ng
 CJ1pih2ugEnMYanFuzwbqzR/S/6AD3I=
X-Google-Smtp-Source: APiQypKdu4blG5ayZTSb2qC28mScmHoqfV2O5HhJb2x6AKKGKgI0FW3y+OpCSuUHmSjFJSt0zvLdhQ==
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr2169669ljc.217.1585401642592; 
 Sat, 28 Mar 2020 06:20:42 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:41 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 4/6] drm: writeback: document callbacks
Date: Sat, 28 Mar 2020 14:20:23 +0100
Message-Id: <20200328132025.19910-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200328132025.19910-1-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the callbacks:
    drm_connector_helper_funcs.prepare_writeback_job
    drm_connector_helper_funcs.cleanup_writeback_job

The documentation was pulled from the changelong introducing the
callbacks, originally written by Laurent.

Addign the missing documentation fixes the following warnings:
drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
---
 include/drm/drm_modeset_helper_vtables.h | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 7c20b1c8b6a7..c51bca1ffec7 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1075,8 +1075,39 @@ struct drm_connector_helper_funcs {
 	void (*atomic_commit)(struct drm_connector *connector,
 			      struct drm_connector_state *state);
 
+	/**
+	 * @prepare_writeback_job:
+	 *
+	 * As writeback jobs contain a framebuffer, drivers may need to
+	 * prepare and cleanup them the same way they can prepare and
+	 * cleanup framebuffers for planes.
+	 * This optional connector operation is used to support the
+	 * preparation of writeback jobs.
+	 * The job prepare operation is called from
+	 * drm_atomic_helper_prepare_planes() to avoid a new atomic commit
+	 * helper that would need to be called by all drivers not using
+	 * drm_atomic_helper_commit().
+	 *
+	 * This hook is optional.
+	 *
+	 * This callback is used by the atomic modeset helpers.
+	 */
 	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
 				     struct drm_writeback_job *job);
+	/**
+	 * @cleanup_writeback_job:
+	 *
+	 * This optional connector operation is used to support the
+	 * cleanup of writeback jobs.
+	 * The job cleanup operation is called from the existing
+	 * drm_writeback_cleanup_job() function, invoked both when
+	 * destroying the job as part of a aborted commit, or when
+	 * the job completes.
+	 *
+	 * This hook is optional.
+	 *
+	 * This callback is used by the atomic modeset helpers.
+	 */
 	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
 				      struct drm_writeback_job *job);
 };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
