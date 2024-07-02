Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999ED924AC7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60810E72E;
	Tue,  2 Jul 2024 21:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCUnpAgW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A310E71B;
 Tue,  2 Jul 2024 21:59:32 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7eb5dd9f994so174444139f.2; 
 Tue, 02 Jul 2024 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957572; x=1720562372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=LCUnpAgW+mRailg1nyeMHL/B23KJ7qVULfhOaGbyayKi/ixZEVieX5Wkn5wykzpQAx
 Wj07G1pexURjKoE+TIczgBwhc5wJGzc3O8B0uuQoHwkiVh+Nry8RAyJ4/4upSV3ZoxbZ
 8nJ5JpK68POrzRFxe3aUac2zPNTL+pZDCuxgSMHkuqtU6A7wvoUwxy3mMKbqNfTqte76
 1BRGRPCpLdSQttDIIabQ4avUKNBhPe/XcIhLZVLWAz9yr00OxJKy3CQHpS8KcBAt6Q+G
 3AwT039BOzYixQ1YA3mJw8FVS70c/kotqx364JzzLNUsPXi5R6NIBel6azCvwdPLXhSM
 88ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957572; x=1720562372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdxS3Fv+DdtdyD/OX9RwYgW//DQBvhU2TaujYV4igeo=;
 b=qWAIjOrwon1clMIMvo5h0drb7oOP5rq68U1kQSLuBi/ql8JbdHxzLdJ6qcnWYpukWU
 xtmT1oEz+bb4Ae8rpiP+iBeNIgvUtFu4zq4ngt7XVk+GXamcUCj3piw17DuL+hEzE6bi
 gnIwt9V2nifxvubEYCDAxkvflp+/3TldriaIKiKiQSDrwMyz8K3cNHvTN+gD8bcIiWDo
 ogi3x93waachzp/eaqzz4PqZ9qotgPoeILnTYl+oIrma5H7A/JtpI0MsxV0b14rFCAmH
 9cN+UH/mEgQZ6ChxKD4JvrpiWGc4M3vX6OX3+U3KmD8KswewP+HlJ6HqTmvrhifYRd33
 8uDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi6d9iI9J99KtyOKdwyS/QxkVT+YIuid/jVTBuWRE2jCE/Se0OpiXeWfay4ubG6VaRpWE6CtLGYKaHfSi2VwvLuh7e9SZND6NFBx2ZvOmbmrwcPmFCpUZxBqZfzyIeyqZ1xpQ1DZ+T5lauEJ01AbPWomFSTn5ZElgj0QYMwK1NtNmSR0aJPF1tYSsC3UWAMo7CHZ226gV9LcyiOSwtiNFPysQZXY766j/8Tqj3PCwnhzvhc+w=
X-Gm-Message-State: AOJu0YyHsmE6A45/jhjPw5ySrpCzG4WTjtvxkrBmmpIKSazW48Ykif9k
 qlr1+aCec05Ce9a8rV/t+dP6Ax5JoLJTjsZ/4VFuoUIK5g257n8x
X-Google-Smtp-Source: AGHT+IG0BidfQmn2qvsEzI4yxcp7Po1yYyxiFL7MCjw8+FHvwJsFiaR7ArnybWXhDCww+r7LW6gVaQ==
X-Received: by 2002:a6b:7411:0:b0:7eb:8ba1:b03 with SMTP id
 ca18e2360f4ac-7f62ee18032mr1037353639f.1.1719957571867; 
 Tue, 02 Jul 2024 14:59:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 49/52] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Tue,  2 Jul 2024 15:57:57 -0600
Message-ID: <20240702215804.2201271-68-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 9d7bf8ee45f1..5b555045fce4 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -31,6 +31,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.45.2

