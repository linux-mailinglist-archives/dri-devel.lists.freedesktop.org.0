Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03317571132
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 06:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F5A113CE9;
	Tue, 12 Jul 2022 04:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56FD10E074
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 04:23:08 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 b10-20020a170902d50a00b0016c56d1f90fso1210534plg.21
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 21:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VlO5TFuuspvYhdi2DpaxD3h20t2f4OEaq2DrHe4AmmQ=;
 b=DyQYKlDD/IcOA4P9vRQKupo+DLs43KFlBZqdk7RIEWnyIoKW37RMSah45C6eYEV0Pm
 g5nMaKhzXoAXgpIRbOs8Hvpwhql49X/a5gts8RYFTlQS8kHBr/jlT4CwXOkM7fWuC1Do
 IEN7vOiitvjjkShkA3h3tDyqbl9aQbQ+Inv4lILFKGh8aSpXTjAToRD1J6Z8JQzh+Uax
 3p6oOnn6FW98eCFH1+r4bBQKI1IXw0aPOdKVDqrlbp0FbuToLO9O8T807GajNjxIjR5p
 lE4dXi0YR8Qnit7OyH1aLsKgZnO6jRRqB4XbBqcQmu6jOAFslutRoNCSZxWWb8o/GInk
 ZhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=VlO5TFuuspvYhdi2DpaxD3h20t2f4OEaq2DrHe4AmmQ=;
 b=cxPauy5GTKbSsNA1L7eKHwm/A5t+pCbEmSC01GSUVW8YRwbQl0ZWLKYCGWa2YoJmcu
 9tUC0XuirS/LvOfK9z18dXENKgTe97XXmIeMlE48E5STBNfCrIB3sbarsd0heeZIqFv6
 gDR0AlNrpMy9fSs5rtjNN5MyE040Y4PyHlnGt1lJzNPWf4qeSeWxtONJ/H2HNpiGNcJb
 IGoeQxHJOjiJqHNI4KnCZxs3BNbDNRW0JFBjwgFI5xbpHm5UnWLudoxXWru2ipThOLDn
 PviitOHgYJe8qfghjYJw4gOThrwSKoaVUA0YcwWcx/nKq1sCM6i+l4N2x6bVD0PHVDWo
 x/kA==
X-Gm-Message-State: AJIora92LMbCDhH74wnVoGmf8w+VbglUDydtsxUMuVbNHe6NIGqx8MdE
 Dteveh2Kn1X1gl/bW6Bcp3v0K8Fr3W4=
X-Google-Smtp-Source: AGRyM1u5ruiHHM3S6bje5uDXHiDhsX9GPjl/iquz7U8+/miDVMM2oXhlDLLmW1rox8AgppVRKHsmFfeak9oU
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a05:6a00:16ca:b0:525:a5d5:d16f with SMTP
 id l10-20020a056a0016ca00b00525a5d5d16fmr22040610pfc.9.1657599788310; Mon, 11
 Jul 2022 21:23:08 -0700 (PDT)
Date: Tue, 12 Jul 2022 04:22:56 +0000
Message-Id: <20220712042258.293010-1-jstultz@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [RFC][PATCH 1/3] drm: drm_syncobj: Add note in DOC about absolute
 timeout values
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After having to debug down through the kernel to figure out
why my _WAIT calls were always timing out, I realized its
an absolute timeout value instead of the more common relative
timeouts.

This detail should be called out in the documentation, as while
the absolute value makes sense here, its not as common for timeout
values.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Chunming Zhou <david1.zhou@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/drm_syncobj.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 7e48dcd1bee4..b84d842a1c21 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -136,6 +136,10 @@
  * requirement is inherited from the wait-before-signal behavior required =
by
  * the Vulkan timeline semaphore API.
  *
+ * It should be noted, that both &DRM_IOCTL_SYNCOBJ_WAIT and
+ * &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT takes an *absolute* CLOCK_MONOT=
ONIC
+ * nanosecond value for the timeout value. Accidentally passing relative t=
ime
+ * values will likely result in an immediate -ETIME return.
  *
  * Import/export of syncobjs
  * -------------------------
--=20
2.37.0.144.g8ac04bfd2-goog

