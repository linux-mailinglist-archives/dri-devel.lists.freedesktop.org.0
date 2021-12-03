Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCD467A32
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D076F5E1;
	Fri,  3 Dec 2021 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4213E6F5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:24:01 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J5GnW28NGz9vpQP
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5w5Lq-CJCpQb for <dri-devel@lists.freedesktop.org>;
 Fri,  3 Dec 2021 09:23:59 -0600 (CST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J5GnV734lz9vpQB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:23:58 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J5GnV734lz9vpQB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J5GnV734lz9vpQB
Received: by mail-pj1-f71.google.com with SMTP id
 l10-20020a17090a4d4a00b001a6f817f57eso1959716pjh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 07:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLGGvUHQifyobmz3LmGMV247Dhq0W2shJ3e+qEVTIds=;
 b=TNPaDNzF3K1VhbVDf4I1R5nZaBqAX6g77HbzJdKGnY8RO6IY/AyhqsDuO2Od0a5tu3
 LEKGoEXrT5vTDVyMVrFBWynlxEK2wRyn/TLPqShENHAhrIjwNg4+dKtb9Io5Zsfg0NLA
 V7DopEhSs1IF4LyxnB6EVfDotiDVjzndgeHRNxPemnaxHf/JWtcwFPelz6GdIfkQZHJ1
 1GkeAl/xxISXAv7T+cAYvg27PuVHwZXGkKRyM1tL18KQlU2pgq9z/0zx14B5Dx48zDca
 S0K1ywGE3yLPfsFmguVhVzkzuebFcbBPMzbqadlkVCiGsy7mlvlDaeLBIfN5DrDlJvLq
 o2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLGGvUHQifyobmz3LmGMV247Dhq0W2shJ3e+qEVTIds=;
 b=NPpIRG3fwoAV7JjC/X5vf0oXtYc1HQMefZgBCQXp8g5fgmHd4XmJ5X2qf+9lbZihb0
 L5AkRAdDaaVRz4z/ARTNQW2RErVtPqLwP0ggmCnzV36OpeZAa/X47/VOu8lHgUS/xCEY
 RHkl8j6dchy3uAi78DgZJJAxP5H1fpAaL9+EUB9PfyWMV7jO8rib5W4AymWYCaZf2Mn4
 DulcdTPbujh9mhjGr/sn8KBVdq65R/hijRusA4JBz9/bdwDLJ0wM6wStIELUHCz42aCs
 WFt3LDHLGykwDkE755QvluDstUCY9o1zL1vUaWQIGVcYKV7O3Y44bu23u8W3vrSC5cfi
 HpNA==
X-Gm-Message-State: AOAM5321N061i9nvM42CPdrS3kLutdZ2+5EZdie8HNpGKd+Jn3Cbrxw2
 dDror32QTzhjWbA8seApuegDjPRMT/wUJai+KvaVlN8sbxGGRQZGBx43QfQO6TMTiKAKS3/RIfJ
 OVaa4uZI7M0HMwz3WBufr0cyP4+oUhfBV
X-Received: by 2002:a17:90b:1d03:: with SMTP id
 on3mr1285023pjb.68.1638545037866; 
 Fri, 03 Dec 2021 07:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjkihQgC/+XOXAxkIe19mpdvtqNj0OFzj+orHDGdZiV+ukP/97LX7BCjS9Dn2qd5/hJVGyUw==
X-Received: by 2002:a17:90b:1d03:: with SMTP id
 on3mr1284989pjb.68.1638545037601; 
 Fri, 03 Dec 2021 07:23:57 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id z4sm3550613pfg.101.2021.12.03.07.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 07:23:57 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/radeon/radeon_connectors: Fix a NULL pointer
 dereference in radeon_fp_native_mode()
Date: Fri,  3 Dec 2021 23:23:50 +0800
Message-Id: <20211203152350.105099-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_ONy+=6ufko6aBiTDwBsUuRGqqJxcDvNmAEoELUMJMxWw@mail.gmail.com>
References: <CADnq5_ONy+=6ufko6aBiTDwBsUuRGqqJxcDvNmAEoELUMJMxWw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In radeon_fp_native_mode(), the return value of drm_mode_duplicate() is
assigned to mode and there is a dereference of it in
radeon_fp_native_mode(), which could lead to a NULL pointer
dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_RADEON=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: d2efdf6d6f42 ("drm/radeon/kms: add cvt mode if we only have lvds w/h and no edid (v4)")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Add a similar check in else clause

 drivers/gpu/drm/radeon/radeon_connectors.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..7953830cc8b5 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -473,6 +473,9 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
 	    native_mode->vdisplay != 0 &&
 	    native_mode->clock != 0) {
 		mode = drm_mode_duplicate(dev, native_mode);
+		if (!mode)
+			return NULL;
+
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		drm_mode_set_name(mode);
 
@@ -487,6 +490,9 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
 		 * simpler.
 		 */
 		mode = drm_cvt_mode(dev, native_mode->hdisplay, native_mode->vdisplay, 60, true, false, false);
+		if (!mode)
+			return NULL;
+
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		DRM_DEBUG_KMS("Adding cvt approximation of native panel mode %s\n", mode->name);
 	}
-- 
2.25.1

