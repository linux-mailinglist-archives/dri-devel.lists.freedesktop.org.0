Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F8369C9E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CCD6ECAC;
	Fri, 23 Apr 2021 22:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475BB6ECA8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:31:43 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso5172165pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHY+ROjn2ymCjh078jTDkUCblBcQyxx6QQSN0itztnw=;
 b=cc/VF9Odav8lnmm3AZ894XhXJRTKDmuDid2JPuB1gr6yh1XX4W7FDS/uOpyQMA6K5J
 V1F16rlTgTOCfGUGfqud2KsIFUkMboMkFVxnoKAp08CpKYKx9OAMdsH7UcIXu0Xbry3x
 GT/cXnxOdJxMJL4oHBY+LbOox9WRP/vfdWTCTsDzWAuCmt6ShUc6DgKxWDbJqHAZByAl
 2L434t3BtIDTij8dUPaqRdpTW4yoTy0AFPDVJXX87uhF0Daghw8vFUxDw6RSxR6L/4do
 arPedXQMKGiVInFjvROpTTUTpQaQuT3JPfc6k0jiwCggnm4TMa+lJT4JKgpbQfyZt/E1
 NRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHY+ROjn2ymCjh078jTDkUCblBcQyxx6QQSN0itztnw=;
 b=rxKINLPxyKMe4ulgbROpVfHg9wFVYqXLFEArUiv8rQZnRrqKMlc7flBhIEmoO2Ia7C
 IPNkD2SKIxj621RBYfjo6wsZ1YEBAVKMT482fLUz2FG12/XBQqbijHGusLdwDkjMxnIX
 JBz1LWh+/Nk207Zjq53A7LGtCCWVC2KvtuDZU9dxiFZ6vyDEtLqCqpLtbxHcoSBzdLZm
 3OZgqWAIZdHRWaQeqzpgTRzHmpZB2sS42iXkhP59gnQ/Uw0tAHZRZRxvtRiKaZqYLT2l
 QzB19YC1BsvLn067orv/a/9TK/LGeB8iPhc2tWwjNzyDBjzN7jBCOrr99rwTtX+2YQE7
 bPsw==
X-Gm-Message-State: AOAM531cyhR/XZfNc5N+pgMOzYU6TeZg+a27xiN9XTEuZaJAIqHXBQor
 eI38o1MOMSWirIrogehHAJHrFg==
X-Google-Smtp-Source: ABdhPJwHi2Jf13kPWRazpaJRDITxeW+hv6i5EAQV0NxIugexhLJlj0x6PRmcAAwYyyEmxKz29AplGg==
X-Received: by 2002:a17:902:b08a:b029:ec:af20:5602 with SMTP id
 p10-20020a170902b08ab02900ecaf205602mr6292478plr.71.1619217102797; 
 Fri, 23 Apr 2021 15:31:42 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:31:42 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/21] drm/i915/gem: Return void from context_apply_all
Date: Fri, 23 Apr 2021 17:31:14 -0500
Message-Id: <20210423223131.879208-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423223131.879208-1-jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of the callbacks we use with it return an error code anymore; they
all return 0 unconditionally.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 1091cc04a242a..8a77855123cec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -718,32 +718,25 @@ __context_engines_await(const struct i915_gem_context *ctx,
 	return engines;
 }
 
-static int
+static void
 context_apply_all(struct i915_gem_context *ctx,
-		  int (*fn)(struct intel_context *ce, void *data),
+		  void (*fn)(struct intel_context *ce, void *data),
 		  void *data)
 {
 	struct i915_gem_engines_iter it;
 	struct i915_gem_engines *e;
 	struct intel_context *ce;
-	int err = 0;
 
 	e = __context_engines_await(ctx, NULL);
-	for_each_gem_engine(ce, e, it) {
-		err = fn(ce, data);
-		if (err)
-			break;
-	}
+	for_each_gem_engine(ce, e, it)
+		fn(ce, data);
 	i915_sw_fence_complete(&e->fence);
-
-	return err;
 }
 
-static int __apply_ppgtt(struct intel_context *ce, void *vm)
+static void __apply_ppgtt(struct intel_context *ce, void *vm)
 {
 	i915_vm_put(ce->vm);
 	ce->vm = i915_vm_get(vm);
-	return 0;
 }
 
 static struct i915_address_space *
@@ -783,10 +776,9 @@ static void __set_timeline(struct intel_timeline **dst,
 		intel_timeline_put(old);
 }
 
-static int __apply_timeline(struct intel_context *ce, void *timeline)
+static void __apply_timeline(struct intel_context *ce, void *timeline)
 {
 	__set_timeline(&ce->timeline, timeline);
-	return 0;
 }
 
 static void __assign_timeline(struct i915_gem_context *ctx,
@@ -1842,19 +1834,17 @@ set_persistence(struct i915_gem_context *ctx,
 	return __context_set_persistence(ctx, args->value);
 }
 
-static int __apply_priority(struct intel_context *ce, void *arg)
+static void __apply_priority(struct intel_context *ce, void *arg)
 {
 	struct i915_gem_context *ctx = arg;
 
 	if (!intel_engine_has_timeslices(ce->engine))
-		return 0;
+		return;
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
 		intel_context_set_use_semaphores(ce);
 	else
 		intel_context_clear_use_semaphores(ce);
-
-	return 0;
 }
 
 static int set_priority(struct i915_gem_context *ctx,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
