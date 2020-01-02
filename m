Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AC12E53F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE216E06B;
	Thu,  2 Jan 2020 10:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A70289EAE;
 Thu,  2 Jan 2020 09:49:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u2so5117788wmc.3;
 Thu, 02 Jan 2020 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=8CFwwBAmgqgcgGzucLPpxl2tYfKM/hG3OYkRoe8WYPU=;
 b=d4HlM1/TBFOTa6XiDaYcMZwGiUc51p4Pv0bBSbInlqbpvi1cIco9U5kLvaLBYdgLZW
 VaS9zaAFFO6S9Oc1lQKYNjDjrW4NCYPPoAu2ovrM6Ubd7GXc1PE5pL1VJO/hxapXCaGs
 67jqWjWasTK8FQwLLx1skppJitsfvMVOrZj0VmXyeKVyh4z0Vra7l/Crr3ECYLm6CykX
 oxqwJsl5db2DHXHUXn4sDy40dp9gi9B2akAWlnOMkfkFUIyx1HfMAiBGefzkP+r6Oiff
 jVKJPkTI+/VZiHFbipEqUL+f80TtVzegY+kexQHhFwwRwokXHzqlk2187GJ7o2Ay5dIP
 aa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=8CFwwBAmgqgcgGzucLPpxl2tYfKM/hG3OYkRoe8WYPU=;
 b=Z7qQLPQqYiLvGFos4UA7/V8GltSEL3EBEL/OQQSNqlpkWoG1Tggk1GwYZQtSHeg76u
 zA/OSDVY9DaXMNGgi0esSrdEQE77uegVTRaeNx19OnU4FAX3w0CaFq13Q8S3oj4/FP+t
 dkgpKXCZj9a0pbCJafBD78g8EltvnoY+3QCA4xEjM0PldFo7pYqLV41qKnWSaTgjzwIT
 INdHYupJ1yq3QMTj2v56D5hszO5H9EKXEpdDhQ2VxyvzylpK/fNB3vPoScFMy5Nlkko0
 RCK0yyDCYODuIglbMo6hYkRE30M5CEvVwcVWk1Hq+VvTU0rDwnZoW7cm3d01uUnFc9Xe
 D5eQ==
X-Gm-Message-State: APjAAAUpS+7ZoLXoSV8Rhm0CYAy+NgQ+G4KWNJwBd5s2KMhAmAUxGimP
 wwQPNBob5wFbpiTqgeKocow=
X-Google-Smtp-Source: APXvYqzO9axMTRGskzMsGwa8ngIZWcBBu4BvMO32lxcz//RnPJJwDLNpK5ESv5nCEsFizWXHbDucgw==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr13491283wmd.62.1577958565901; 
 Thu, 02 Jan 2020 01:49:25 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id h66sm8383963wme.41.2020.01.02.01.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 01:49:25 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: remove boolean comparisons in conditionals.
Date: Thu,  2 Jan 2020 12:49:21 +0300
Message-Id: <20200102094921.6274-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary comparisons to true/false in if statements.
Issues found by coccinelle.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_dp.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9ba794cb9b4f..c065078b3be2 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -1812,7 +1812,7 @@ void intel_ddi_set_vc_payload_alloc(const struct intel_crtc_state *crtc_state,
 	u32 temp;
 
 	temp = I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder));
-	if (state == true)
+	if (state)
 		temp |= TRANS_DDI_DP_VC_PAYLOAD_ALLOC;
 	else
 		temp &= ~TRANS_DDI_DP_VC_PAYLOAD_ALLOC;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index aa515261cb9f..93140c75386a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4958,7 +4958,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 		WARN_ON_ONCE(intel_dp->active_mst_links < 0);
 		bret = intel_dp_get_sink_irq_esi(intel_dp, esi);
 go_again:
-		if (bret == true) {
+		if (bret) {
 
 			/* check link status - esi[10] = 0x200c */
 			if (intel_dp->active_mst_links > 0 &&
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 47f5d87a938a..cff254c52f5e 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3292,8 +3292,8 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 	if (!intel_sdvo_get_capabilities(intel_sdvo, &intel_sdvo->caps))
 		goto err;
 
-	if (intel_sdvo_output_setup(intel_sdvo,
-				    intel_sdvo->caps.output_flags) != true) {
+	if (!intel_sdvo_output_setup(intel_sdvo,
+				     intel_sdvo->caps.output_flags)) {
 		DRM_DEBUG_KMS("SDVO output failed to setup on %s\n",
 			      SDVO_NAME(intel_sdvo));
 		/* Output_setup can leave behind connectors! */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
