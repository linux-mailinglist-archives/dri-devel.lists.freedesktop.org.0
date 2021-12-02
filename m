Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920DC4667BA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6AF6ECBF;
	Thu,  2 Dec 2021 16:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77556FB0B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:17:47 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J4h223pz3z9w2M6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:17:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEHaBoDcF75F for <dri-devel@lists.freedesktop.org>;
 Thu,  2 Dec 2021 10:17:46 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J4h221p50z9w2Ly
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 10:17:46 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J4h221p50z9w2Ly
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J4h221p50z9w2Ly
Received: by mail-pj1-f69.google.com with SMTP id
 ce19-20020a17090aff1300b001a6f72e2dbdso102957pjb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgDUgiquyeE/HBpyk1r0o9owU/0QA0kjA2nxOoAn0vg=;
 b=gXXhkhGRPKwEEtTuml2rjG//g3S0E5irHeJYXmB/fAkm/rSWvG50Ptn6mCIfuhuwLO
 s+GsPIrsjU/3ol6TexAgYESgAIiQe7PBCSbYIIdssbk3/rWWef+TWJ9aMgkz5p4GZRFe
 IX4AZwkQtR45z6qZ0uLz8Rb7LdK44LmxI23/ScN9VYA1QkA6cryi8A1YH+D0tcQ5ltV0
 0NQHz+a2lbP9NIX/ly+XWt+RRXGxULP+6suY7f+Z5mM3sps+5CegsK2W/8GyzhdrxaAz
 8p80h+HqrdZL6JQLg9X4nuYl9UnYhU8Lkooi9Vn3/bE7ZY3z3LKH0I8hJORLzF5g00v+
 IaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgDUgiquyeE/HBpyk1r0o9owU/0QA0kjA2nxOoAn0vg=;
 b=DbTjJD9GGosnZrvpJ/T8KQcMQD30uHOczkjO5VLvALsiLgZyfDfRzqnjLoYxLISsLe
 dr4pKDctEeRG05I2J41fPIh19KzfGoEH8nHn2aL8sGUA7tOmzbxk9dWmHizpA3tpKUXh
 0LoC5MeAow/tAwx1PkDQPZ6KBWeUW+JTdSOzjkrQgsFih+QDtsaQUBRuF+iygwjFyQno
 9XXxojPnQviioJzn4pHHH8CIrMdfH/3XfPEjZYH9Cqv8Fidt0iYcpB0oh0yNAHzSVUDw
 AZQBW5ViSWIQ35i1Cga64E04rT8K2B/e/EwgvjRO5U8r9RGf0bygkiPItq3s1j01YPsm
 z8ZQ==
X-Gm-Message-State: AOAM530Na8q0I3DLt5GgIL8YWESHAoQj3eNhY8Xr5TqdgvNj8+oNQB3w
 XMK+j7sofeJoKC6AL8UCmVX8QEzWBkCxtJaXTcbUO7AhaT+fg3aSBORFJZaVyN6s5Xys+bZJDS2
 59+Hx1kg0DtdPK5Ivlp3BWv6cS2a0Flfz
X-Received: by 2002:a17:902:9a09:b0:142:82e1:6cff with SMTP id
 v9-20020a1709029a0900b0014282e16cffmr16500988plp.47.1638461865445; 
 Thu, 02 Dec 2021 08:17:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlBUbzHE8EObBvEJkQ4GrdSaOO5BVm897v2oE1K1vI9kxnT2PO8h97GZr1lIie/srkFKr7Yg==
X-Received: by 2002:a17:902:9a09:b0:142:82e1:6cff with SMTP id
 v9-20020a1709029a0900b0014282e16cffmr16500956plp.47.1638461865176; 
 Thu, 02 Dec 2021 08:17:45 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id s14sm273542pfk.73.2021.12.02.08.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:17:44 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/amdgpu: Fix a NULL pointer dereference in
 amdgpu_connector_lcd_native_mode()
Date: Fri,  3 Dec 2021 00:17:36 +0800
Message-Id: <20211202161738.79176-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CADnq5_P8amQK60zD-2tkVWBneZCoLENe5KY_S6eqoAAyOieatg@mail.gmail.com>
References: <CADnq5_P8amQK60zD-2tkVWBneZCoLENe5KY_S6eqoAAyOieatg@mail.gmail.com>
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
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, hongao <hongao@uniontech.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In amdgpu_connector_lcd_native_mode(), the return value of
drm_mode_duplicate() is assigned to mode, and there is a dereference
of it in amdgpu_connector_lcd_native_mode(), which will lead to a NULL
pointer dereference on failure of drm_mode_duplicate().

Fix this bug add a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_AMDGPU=m show no new warnings, and
our static analyzer no longer warns about this code.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Fix the similar bug in else clause

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 0de66f59adb8..df1f9b88a53f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -387,6 +387,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
 	    native_mode->vdisplay != 0 &&
 	    native_mode->clock != 0) {
 		mode = drm_mode_duplicate(dev, native_mode);
+		if (!mode)
+			return NULL;
+
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		drm_mode_set_name(mode);
 
@@ -401,6 +404,9 @@ amdgpu_connector_lcd_native_mode(struct drm_encoder *encoder)
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

