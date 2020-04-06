Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58619FE60
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28E96E48F;
	Mon,  6 Apr 2020 19:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619D26E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:47:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l11so479445lfc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MiNO70TmAG0QhMUG5PVFb6s+G5Cgfx1bpNgzYYPVLI=;
 b=lW3JeUK0ciVOxpHYbEskzIbHptpaNi3QYZyfw9JljbIRpBa2gYPIWtRbfEahVEkiea
 wU7yCtQQZMBttNsMSA0QXpNyFhNwsqhb+10mIgX6oORNszrItADyEf0MjR1d3g/cX8kU
 MkQbNW9kpr/JvCSaJ0WKoI4xASKbj+zjvpO9eWDHhPxOoUKamrMchI2eKklwevTZfLMU
 zY3KLMoZy9We00mi7mZnHQXDcJ9B1FXGyYUSmftRTKco2cO+xSdbILjt4f4Z7S4vFAZS
 ZVoiqt3LmcC1DMjdQLIp5+1EH43Aw+PcGi9IdmuBYWpmKRQHkeX1rTFO2YC1hP5ZJ0wh
 yU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6MiNO70TmAG0QhMUG5PVFb6s+G5Cgfx1bpNgzYYPVLI=;
 b=D0WfHSYcw1mJA5OJbhzcRNC6DCTMyNVkInw/p5G7uXCOxYshAdlLiH2gqzs1fqn61z
 2h+Vep/Twz8xDHjhXW0jsMZOiXLHyxZe1glOwy5YfqI7dRHHoB0q6+K28DlKIGK51h0H
 z4s14NlMDzMZD/q8TGqZ7Y5r/K8EoaEpUcSZ3XIkSQOYg+TiCPp2opiPEAhf0qZQRQ9C
 ALzFqRgYgQ5/333RmZcjI7BGe7ITSMqB4ShJU1uehOY8vsfi3tcHM8mvbLg9qclAN2Ix
 XkSgijmPzx/8aool7hbQrQhDH+yGQBKbGc1ec/VdEA7uCegASjON1QUgixqM9b5w+M83
 71Uw==
X-Gm-Message-State: AGi0PuZAmsCFN1MCuMm10Hh5gFzjzjGkISCNeyht2hX8qxbv8vA6247m
 hb3dKwcpPOM9pFwH1DnXWPBZ5I2BiGk=
X-Google-Smtp-Source: APiQypL+c8lHPKr4SHjf2lLMqFAjUdVYWUdwMY0k7O07lkXNULEt0MmBql2D+Z/TXFYzeRNo7U8Zww==
X-Received: by 2002:a05:6512:304e:: with SMTP id
 b14mr13538125lfb.119.1586202475443; 
 Mon, 06 Apr 2020 12:47:55 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 b16sm10525276ljh.20.2020.04.06.12.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 12:47:54 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 2/3] drm: writeback: document callbacks
Date: Mon,  6 Apr 2020 21:47:45 +0200
Message-Id: <20200406194746.26433-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200406194746.26433-1-sam@ravnborg.org>
References: <20200406194746.26433-1-sam@ravnborg.org>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the callbacks:
    drm_connector_helper_funcs.prepare_writeback_job
    drm_connector_helper_funcs.cleanup_writeback_job

The documentation was pulled from the changelong introducing the
callbacks, originally written by Laurent.

Adding the missing documentation fixes the following warnings:
drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'

v2:
  - Fix formatting (Daniel)
  - Drop changelog text and add reference (Daniel)
  - Improve grammar. and use "operation" (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
---
 include/drm/drm_modeset_helper_vtables.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 7c20b1c8b6a7..421a30f08463 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1075,8 +1075,35 @@ struct drm_connector_helper_funcs {
 	void (*atomic_commit)(struct drm_connector *connector,
 			      struct drm_connector_state *state);
 
+	/**
+	 * @prepare_writeback_job:
+	 *
+	 * As writeback jobs contain a framebuffer, drivers may need to
+	 * prepare and clean them up the same way they can prepare and
+	 * clean up framebuffers for planes. This optional connector operation
+	 * is used to support the preparation of writeback jobs. The job
+	 * prepare operation is called from drm_atomic_helper_prepare_planes()
+	 * for struct &drm_writeback_connector connectors only.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the atomic modeset helpers.
+	 */
 	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
 				     struct drm_writeback_job *job);
+	/**
+	 * @cleanup_writeback_job:
+	 *
+	 * This optional connector operation is used to support the
+	 * cleanup of writeback jobs. The job cleanup operation is called
+	 * from the existing drm_writeback_cleanup_job() function, invoked
+	 * both when destroying the job as part of an aborted commit, or when
+	 * the job completes.
+	 *
+	 * This operation is optional.
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
