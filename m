Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BA6369D3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF05A10E5FE;
	Wed, 23 Nov 2022 19:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7FC10E5FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 19:24:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id v7so13826706wmn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Xjthq2+qgiXzb/f7wAfOELUP1rS9RtqVyPjIavSAuI=;
 b=XG9xx70jS8Gy7jU/YYfq1AJFelsQPJGeexQnfc5SSaIq63hP669Ell1gQEFJWCZqOr
 l/SGxgUTD2VBYjpAjgGHUVNdi/N201mz8evlz2jr+//Lst70qErW7H0PpKw+Xlj+ADEu
 ir+oN+qdWoIDLNsOPmiC/uaDH4opINzqH7Zl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Xjthq2+qgiXzb/f7wAfOELUP1rS9RtqVyPjIavSAuI=;
 b=pS+6l2iZeqWxDfkEQ+pvrWVM8qDBXK/GQu6ImTv/G3Zomh8xRJx/rYLC0rJ41qvUlw
 UzxgU3ZErBz1z+ku9j4gRmPva8Vn7wIfkhltINzqjjfDF8ZT4pEp4yfbOO+nAxW05FS8
 82sGun0U0ogGB6JXlFSIerkubofWhEevSTX5Rn5WRnbRsJ7E/v8B6w18Ikag3i8KqRXB
 luCk7pOKWmkaeSsHKktKrNgBwQd1bE/rtoZE39QyVwWgM3LGvjAsr8xM8CI8lFOCQM8O
 eiGL8uopJybv2fryeKtd4zN6BkCrLesJR5xMOVogTxQWDnZnsUun5AnFnQ0e64j/sk2Q
 RcEA==
X-Gm-Message-State: ANoB5pk4vqgX6VPKlGIeidlNr4eN5BDG+LDNFQhSivfIUDzA5QO5RdQZ
 Rf84KWPOQdwj0qNld1aRjvzOQn8KTVRL7g==
X-Google-Smtp-Source: AA0mqf5d7H2p5Gny8ZJZ5ozgkc2ss9Vs12BnlW9NzmfzZyzsiie3CW5P1s5Bl/fIEJ0ulGsqTLTujg==
X-Received: by 2002:a05:600c:600c:b0:3cf:81b1:bc7b with SMTP id
 az12-20020a05600c600c00b003cf81b1bc7bmr11995546wmb.121.1669231484674; 
 Wed, 23 Nov 2022 11:24:44 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003c6b9749505sm3459826wmq.30.2022.11.23.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:24:44 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fourcc: Document open source user waiver
Date: Wed, 23 Nov 2022 20:24:37 +0100
Message-Id: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
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
Cc: Neil Trevett <ntrevett@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a bit a FAQ, and we really can't claim to be the authoritative
source for allocating these numbers used in many standard extensions
if we tell closed source or vendor stacks in general to go away.

Iirc this was already clarified in some vulkan discussions, but I
can't find that anywhere anymore. At least not in a public link.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Neil Trevett <ntrevett@nvidia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index bc056f2d537d..de703c6be969 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -88,6 +88,18 @@ extern "C" {
  *
  * The authoritative list of format modifier codes is found in
  * `include/uapi/drm/drm_fourcc.h`
+ *
+ * Open Source User Waiver
+ * -----------------------
+ *
+ * Because this is the authoritative source for pixel formats and modifiers
+ * referenced by GL, Vulkan extensions and other standards and hence used both
+ * by open source and closed source driver stacks, the usual requirement for an
+ * upstream in-kernel or open source userspace user does not apply.
+ *
+ * To ensure, as much as feasible, compatibility across stacks and avoid
+ * confusion with incompatible enumerations stakeholders for all relevant driver
+ * stacks should approve additions.
  */
 
 #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
-- 
2.37.2

