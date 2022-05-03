Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D7518405
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9F10F934;
	Tue,  3 May 2022 12:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A6110F934
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:14:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 249993200944;
 Tue,  3 May 2022 08:14:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 03 May 2022 08:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580048; x=1651666448; bh=oN
 XaaqSh3xgQHherAO1Vq7n8QOOiqGtqmMnPlSHGCS4=; b=UXcbl2OTrraekclS/Y
 UCupu/sGnY9A/N3ssTUqBM7V6IzejI+ZY7fbUlK+V8NcuMLN3oxa4FGMeY6+cvyy
 u3Q8NR8NfbXCc9Rsr6egeQSrnRreDVrrBVtL02+mlMMC9y5OphrV08J0hARaO8W6
 DjWUc61s18v/Jlfyd/CEbCmGd1siv3lF+uhBLpNrQM7bFxQTKeFflixBY0PF0Pt+
 VhkN06cmWmPXdrVha5KNCkstxjumm04XqE4TFdfacQ8H96Budd37bQ6QLukXzDhR
 52aFV0TAlGrskmI6q4SenqpuQBVOz/l5Sae5sRnEe99L2+BtxR1p72igOtIYNttr
 bIDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580048; x=1651666448; bh=oNXaaqSh3xgQHherAO1Vq7n8QOOiqGtqmMn
 PlSHGCS4=; b=zDciZfgo6FRN9ET3gGV7A0Q8mlYKrAewlSw7f7cgzncnNY7qKcS
 T3I54/yflfDn/YHtEU2h5OD6hYHgUqj7V1CLNe0+3Sa0RuYqG1Lve2/WRn9Do5IQ
 hfFniXGFVCQHuFcwTCdj6VtJVM3KNw16VSn64RR2kL3zCbjIdumF0dwAJSQndldl
 hnp+dhxJ50gHQiz7CW8yW9yxCZpxS4sQ3IDLmtntljfz8uGXLzfokQMa1LGAqGHu
 NOjzV1n/j5JCZyjVHLGgkyiw066K+M4eEPF4xb1Zc+Gmv/kq3XsIW7OrTfofCz6k
 MXG41sVRcZTAh4Widmp6T1nQtNEs2UcFnpQ==
X-ME-Sender: <xms:kBxxYgwFgnB_cpacvJCOVnuDvsegQxUggFIkaob0oQBWlxGMHS8AdQ>
 <xme:kBxxYkQK6w4fr3DGEdX12K9MbM7K4VXGyqpN7JRgjIwo0FGqKugYgOJSnKyqZ1pcy
 nnvkZYXG1MSqWfZItQ>
X-ME-Received: <xmr:kBxxYiXPXOu4XvtRrYW3V5twDzJvwECvqnD7r-nNyOEhPyOauuRTW76BIo6kaxvKzFvvTJEnh89lfdHgfucerO9h_mN2f970OoK4C5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kBxxYujcnunji_pcanXsvaiwS0rM9kMazVoXNlKXak91zbNF9VsOBg>
 <xmx:kBxxYiBDQEWt-kakykfbVfsLV9Y0FEpOtpuwzia7mw9budMXHocbOA>
 <xmx:kBxxYvLwEVuHQ9VIg8LaomAz1QjtcqkDFvFqF8J58Btmsd2NvCSqyg>
 <xmx:kBxxYp45PNeixd1_HrxrszvNCpxcKUmfPqmGHg6PmwxcNfvEtkyvxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:14:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/14] drm/vc4: kms: Register a different
 drm_mode_config_funcs on BCM2711
Date: Tue,  3 May 2022 14:13:33 +0200
Message-Id: <20220503121341.983842-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the BCM2711, our current definition of drm_mode_config_funcs uses the
custom vc4_fb_create().

However, that function relies on the buffer allocation path that was
relying on the GPU, and is no longer relevant.

Let's create another drm_mode_config_funcs structure that we will
register on the BCM2711.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 3c232d85ab85..1d3b31fb71ea 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -997,6 +997,12 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 	.fb_create = vc4_fb_create,
 };
 
+static const struct drm_mode_config_funcs vc5_mode_funcs = {
+	.atomic_check = vc4_atomic_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.fb_create = drm_gem_fb_create,
+};
+
 int vc4_kms_load(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -1031,7 +1037,7 @@ int vc4_kms_load(struct drm_device *dev)
 		dev->mode_config.max_height = 2048;
 	}
 
-	dev->mode_config.funcs = &vc4_mode_funcs;
+	dev->mode_config.funcs = vc4->is_vc5 ? &vc5_mode_funcs : &vc4_mode_funcs;
 	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
-- 
2.35.1

