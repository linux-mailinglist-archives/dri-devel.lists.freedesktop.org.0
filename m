Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A22924A82
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA08310E6EA;
	Tue,  2 Jul 2024 21:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TcTZP2QT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D25C10E6E6;
 Tue,  2 Jul 2024 21:58:56 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7eb5dd9f994so174425039f.2; 
 Tue, 02 Jul 2024 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957536; x=1720562336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94MIkUtYPNbEjf2ABNxMIbyceZTrdE5XkTP/b1VTHKc=;
 b=TcTZP2QT3+yC2qysRZdPTnfi7LlVMU1E7KMmHrGeYBONZKEe5Vf3vLPNwMkdtJdJmI
 EJX23D+CniZZJol/aMgTa8Vj5qXyRUOOO8MrU/bWmt+evpjuOmoEHgjRCDopmYJRuBNa
 B/Bzde6Gv5lDhezpYM8E0LXp4eM/PXMlLRhC6cgnE817y3rGJCASE02TVX14EuvoeqoQ
 uct18AF36dU0JzXM47hJkcpdRpPc6EDF6PFimM2yTIaLR672hXRYoNqy29J4pdBEm2sz
 e1DlItdh7QHVZQC8Hh8hK1T4Kt/xuIVDpIxq6mxLRnEew8JTGqoqCekA4NRfaARZD1oK
 fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957536; x=1720562336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94MIkUtYPNbEjf2ABNxMIbyceZTrdE5XkTP/b1VTHKc=;
 b=BMdZg8JaiZDtcHpU/YkGp/L/c6JlQxK2lh/+sX+4J0duDvASmK2YAx4UfujIxd0o4/
 Yyd1EVAPU1Ht5HogYJ9QXC0JJ+jqDpfXZiEY+4lb50sJCVDOCOv5/Q9RK59V6apxCc4l
 4Y6DtbzP5j7yosGY3+s1DvRE5TNNFI+5u5hzVD7NVPfYEXTu4wdfcEK/EWKv5K5FTkrM
 8/Yv1PgP1X8zuES4WSOzskXeSNHZpO0hgUZAKfYTBBnE1YiQCeoThskHd3kTOfIDGqay
 kk4U0Psb0VTHdeL92+Tvl4npf/mTHHx7bR/eo7iK4Q7Fvg2yotunOR2C++Efv32gNLF3
 VfRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAgheuCxd74MaOrq7pvgy//+vCBQDhctvpIfSzYyUPjiRCRMOm5uWqJqoL6FuH0rMHZX7zo2GL1XibvOphbxJJ+Tz7/sx+yHaFG1oa2knZUEFN8jpx5LVQzX50QUC/SFujlmKqIyDSvHpDhdUTwZ46GUOktFBK+5bxUGi4pZ8VjcqXaVKdo1/xkdA3ic0EeNsmkpUnsGxWQPiBuY4FwqY5XjUrggZH9wbifmgVSo+Cp1r1c+I=
X-Gm-Message-State: AOJu0YyuGojtS2rQL2XvfYjU7nl2ThAjIv18tmDDFzFewNmQnvcKzSQn
 UNmjgexBFPApwhnKbWJnMOB/hof9akRoZMYcTParnag1WymwVmWv
X-Google-Smtp-Source: AGHT+IHWBl0Ygyolnpn0Hok9dt+fa5+/pnDWaVB438H2fcp/zc4YMHsu9praTrPy+xMKUV2fg9LvpA==
X-Received: by 2002:a6b:5b09:0:b0:7eb:b592:6add with SMTP id
 ca18e2360f4ac-7f62eeb026dmr1066340839f.20.1719957535801; 
 Tue, 02 Jul 2024 14:58:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 33/52] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Tue,  2 Jul 2024 15:57:25 -0600
Message-ID: <20240702215804.2201271-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index de43048543e8..dccf12d05105 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.45.2

