Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334C144D57
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0496FAE2;
	Wed, 22 Jan 2020 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA596ED20;
 Tue, 21 Jan 2020 14:32:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id d73so3190056wmd.1;
 Tue, 21 Jan 2020 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=qLpfOk1ZTqYL3sl9pfEhz5Xx/erysYZDRTRJ2cdP8Hs=;
 b=UawKJfnuMSQgmUuHc3aPKzKnMhPeh32MiDDtA1GqSTiPHgrZqlxPPnezQNpJqfH2kO
 qq0AFTkqn9nh5EgVIQ/LuhMo40HGyycLx04fxID+ibRHqomNZkKdRnOktrcwz9bmF1rt
 FM45IuWtshnWJ9wa6goei9ZjsqKlc4iub0sJC8udVzyN+NsnF+SbWBTqG3GbqUOFVxce
 clAq4A5RmVY2WV88UOsowKBgwBkqPAZFFxBeq9QedPjPxFabHXnJW8JoUZaxO2nDzr5n
 VMDZN2NdsGICnukAG7E4EwJSTYfSc41iS3cVZky05MvBM5h6HusiFaKLgQLHqbUiwtJa
 oYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=qLpfOk1ZTqYL3sl9pfEhz5Xx/erysYZDRTRJ2cdP8Hs=;
 b=koCNi/X1lZWzIMRixMM1oIHxt3IVkX0xXKPl9qDgFOXSFlOSkw7Q2+rlceJK4g5Om6
 o+Ug9U864WNXLyYrEPX/tgbzIPdZreYsjIv5z3vICwXFMlYSTFCz1oRBY43l+NrQWxJ5
 nX89IZ+DGc5C0NTJ71swZ/Xb3Hqp4iFPiufIvGFzaBQhKG65tHQNrpEf+cgIy7fQVQu1
 BdlQOQXv+tCNH66bo3FY0C+//f19nC67D0lRy8XN+0MijVonfp/KFiVcnjdc6ri01rne
 fES3QXVV0c/FVcgYNFZqVE+NehhhbfbHXoLchEQhVf32SGqM03Z7XBJXuMo/lR+7ChNi
 7s1g==
X-Gm-Message-State: APjAAAWNmXfAHDot7Fu1Ad9QZC61srfssbFo4od5fE90Gz5yvBhZn0q8
 qtW7Zqvh3tW1aRDjs1r6FvI=
X-Google-Smtp-Source: APXvYqykAUt3BlKLSt2mxqLiNoLsqzzasnLDS1vsGFedEPdhJTbCnJ2DtQ7kzs7LImsKq1sqx+9jyA==
X-Received: by 2002:a05:600c:2c53:: with SMTP id
 r19mr4680841wmg.39.1579617121769; 
 Tue, 21 Jan 2020 06:32:01 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id g2sm52781284wrw.76.2020.01.21.06.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:32:01 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] conversion to struct drm_device logging macros. 
Date: Tue, 21 Jan 2020 17:31:49 +0300
Message-Id: <20200121143155.20856-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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

This series continues the ongoing conversion to the new struct
drm_device based logging macros for debug in i915. This series was done
using the coccinelle script:
@rule1@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Wambui Karuga (6):
  drm/i915/dsi: conversion to struct drm_device log macros
  drm/i915/ddi: convert to struct drm_device log macros.
  drm/i915/power: convert to struct drm_device macros in
    display/intel_display_power.c
  drm/i915/dp: conversion to struct drm_device logging macros.
  drm/i915/opregion: conversion to struct drm_device logging macros.
  drm/i915/hdcp: conversion to struct drm_device based logging macros

 drivers/gpu/drm/i915/display/icl_dsi.c        |  82 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c      |  98 +++--
 .../drm/i915/display/intel_display_power.c    | 177 +++++----
 drivers/gpu/drm/i915/display/intel_dp.c       | 349 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 138 ++++---
 drivers/gpu/drm/i915/display/intel_opregion.c | 134 ++++---
 6 files changed, 572 insertions(+), 406 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
