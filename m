Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D984B7688B0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 23:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED7210E14D;
	Sun, 30 Jul 2023 21:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323A810E148;
 Sun, 30 Jul 2023 21:58:20 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-790a590237aso27568039f.3; 
 Sun, 30 Jul 2023 14:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690754299; x=1691359099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOewQfiuna8cVbGW5XrkGFy/hH53YPAnw6xDAt3LB98=;
 b=DKqR8ijCyupw8t6lZBwoDKFigkZROGJMEnXL0h+oDYIWwrL9txDkSZwkw8qDxS3soa
 c3XjOLuZrGWsm9OD3KHhrpaHR8GLxe/CB5Ro1EaU9VacZqveIVmsH8CsmTBO++Xaw043
 S9c6oT2auG+ybCgccn4OLLiMrn6/XVSvAF3xW6fHj3I96dLrXCCEGBqomm+i4JrtxKNP
 4IzSucxKUjtCeXcpYBmuwY5QKkQKoRM3oL5rXZFv2h34c6/mpHNp06uALNOSgH9FacqC
 9CA1m/gl3qLd2CeJGFNDiLv4DsucE5zaM45Bd6PL+T/8Hi3WkinQ5SEFRhcOE5+BRjef
 0hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690754299; x=1691359099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOewQfiuna8cVbGW5XrkGFy/hH53YPAnw6xDAt3LB98=;
 b=Vho84KwTpM7lKtfsMA2BcN9aOryPXkRRbOZt5Z7P4l2haEVjUYuKzjXJfDlHoeV40H
 3P8YB8qvVJJI7MnSRDq8a/ELyVU/6ojlVCsNQX46zUDQ+1iSr2jUJc65AleTYExA3C6J
 8mGrxwobdfCFNzSSWvrFb4qZDvMbeQRBzCSfJURzwAl7QxQ0gqcGA+maea61t2eg98xv
 Iws1WKvVdXXoQ3FFGz7QvRCD494J9L2eUF2BZiXzIdRCXZGs5FdxKNsBz1zrreU5VWsp
 03LAIcUtKq8z8KLdxYw9RGdP23hrm8zGRgx5ctgn0nxxgcclPAEJ3T0AsBBPQ0gss4A8
 5yyQ==
X-Gm-Message-State: ABy/qLavlYB43XugLUDKA8EVCRxxkLXDTBw+bgr0BMwG1Nt9p7gNAur2
 GSH7+fTexEv/q6xu+K6d29E=
X-Google-Smtp-Source: APBJJlE+/l1vuBJeosdUA7YLF9Qwd6Adbkqlh0UuNChyRu2idYwLmWELfaF8uOq6UyjwQhIZGytVZw==
X-Received: by 2002:a05:6e02:134e:b0:340:8cb1:aaa8 with SMTP id
 k14-20020a056e02134e00b003408cb1aaa8mr6815096ilr.21.1690754299458; 
 Sun, 30 Jul 2023 14:58:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e18-20020a92de52000000b003424b3d6d37sm2747520ilr.24.2023.07.30.14.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 14:58:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm_dbg: add trailing newlines
Date: Sun, 30 Jul 2023 15:57:51 -0600
Message-ID: <20230730215758.54010-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230730215758.54010-1-jim.cromie@gmail.com>
References: <20230730215758.54010-1-jim.cromie@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Mika Kahola <mika.kahola@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c       | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 3a7b98837516..993ba9f01018 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3808,7 +3808,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 	struct drm_connector *connector = conn_state->connector;
 	u8 port_sync_transcoders = 0;
 
-	drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]",
+	drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]\n",
 		    encoder->base.base.id, encoder->base.name,
 		    crtc_state->uapi.crtc->base.id, crtc_state->uapi.crtc->name);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 3aeede6aee4d..c7daae828792 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1428,7 +1428,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	if (unlikely(reloc->write_domain & (reloc->write_domain - 1))) {
 		drm_dbg(&i915->drm, "reloc with multiple write domains: "
 			  "target %d offset %d "
-			  "read %08x write %08x",
+			  "read %08x write %08x\n",
 			  reloc->target_handle,
 			  (int) reloc->offset,
 			  reloc->read_domains,
@@ -1439,7 +1439,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		     & ~I915_GEM_GPU_DOMAINS)) {
 		drm_dbg(&i915->drm, "reloc with read/write non-GPU domains: "
 			  "target %d offset %d "
-			  "read %08x write %08x",
+			  "read %08x write %08x\n",
 			  reloc->target_handle,
 			  (int) reloc->offset,
 			  reloc->read_domains,
-- 
2.41.0

