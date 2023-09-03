Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B89790D80
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BEB10E1C2;
	Sun,  3 Sep 2023 18:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BB810E17B;
 Sun,  3 Sep 2023 18:46:19 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-792975085b2so37498439f.1; 
 Sun, 03 Sep 2023 11:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766778; x=1694371578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxH9YviFYJ/sVQ921jdxmjDcbIQzwn47fQGdVFEkDL8=;
 b=WwncGzCLU+qQCq7Rkz27rjvhKVWsx/tKhakzC0jqkGgomgFaKYXkOJTYa5pRV8Q/wh
 P0l6eK2gDndbGEU62Ti1dfkPfBaD2KCTV8a0Z3W9AA6yqpuNZDijmOajFHU7zfpC3WbP
 IJOwRvYft+Pek2s9jzVZN9Q2Vksx4BW5gKPmfWZAzJwqAKQ0xw8EYF2qwWeV91B1B8m0
 D1QQ/1JLtl9zuav6DcttWJIShEKA8QLIt+LqDcImVyhejHhlxPe2vp7WOoxiyz3cYQij
 czIhOiIrtAIcJ7qhv1KmoIAhFBtwOy5uJcE12y/e3PV8Wykf3KUKsSdye7QZM7fkzPsR
 9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766778; x=1694371578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NxH9YviFYJ/sVQ921jdxmjDcbIQzwn47fQGdVFEkDL8=;
 b=F5xuwiiHSlxVwAtePJvtR9AmtVjozT4fQ728pxqD4vi3SXvUOW/r0KW+Y34i4fqIiL
 z9ztnRDPC17Zu1FTUw8PGkqP5Id9ze0DoIPx8Eu9wfAZtMV1zzuZxl+0HT2Lc1Di2P1F
 4Al3Pr0sKQpHjHTEO2Ff1GfGIWpSJrC3lKF85yBhr2SH1TNZU8CZ7SIj7zHezHXL7+0L
 xNh7WI/BRX+vuZ+znFqT7BvVi1/LNJoH7YV7uq8KY2UsOD3vZT4CaSntKw5KME6nNfbG
 RRtHXYsIRH8Otm1VeTvfbIcuyhbdpdfkHDzHEeAOLCI8jPMHQ5vq3dYGrfTazE9QAypg
 40mA==
X-Gm-Message-State: AOJu0YwOQXb9cxWWQPc8vBwbvf4dSe3deIHctlsA4fNP7gqb3riYuQo1
 MBtwPw4297agtY0K/+IZk8s=
X-Google-Smtp-Source: AGHT+IFaoNhYGsbvB6jznT4bSDBnIoFY2jvJJdHmVHBwkTi3nPyjBv03yWffGFhGkV6csSuj+h269g==
X-Received: by 2002:a92:dad2:0:b0:34d:e998:fb4f with SMTP id
 o18-20020a92dad2000000b0034de998fb4fmr7949087ilq.10.1693766778270; 
 Sun, 03 Sep 2023 11:46:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm_dbg: add trailing newlines to msgs
Date: Sun,  3 Sep 2023 12:46:00 -0600
Message-ID: <20230903184607.272198-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Fei Yang <fei.yang@intel.com>,
 daniel.vetter@ffwll.ch,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Clark <robdclark@chromium.org>,
 Matthew Auld <matthew.auld@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, jani.nikula@intel.com,
 seanpaul@chromium.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c       | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 090f242e610c..0a196348e2d1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4171,7 +4171,7 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 	struct drm_connector *connector = conn_state->connector;
 	u8 port_sync_transcoders = 0;
 
-	drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]",
+	drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] [CRTC:%d:%s]\n",
 		    encoder->base.base.id, encoder->base.name,
 		    crtc_state->uapi.crtc->base.id, crtc_state->uapi.crtc->name);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cfd7929587d8..29c40e8a7183 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1436,7 +1436,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	if (unlikely(reloc->write_domain & (reloc->write_domain - 1))) {
 		drm_dbg(&i915->drm, "reloc with multiple write domains: "
 			  "target %d offset %d "
-			  "read %08x write %08x",
+			  "read %08x write %08x\n",
 			  reloc->target_handle,
 			  (int) reloc->offset,
 			  reloc->read_domains,
@@ -1447,7 +1447,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
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

