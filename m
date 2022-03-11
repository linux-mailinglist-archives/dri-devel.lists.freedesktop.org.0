Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE0C4D686D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 19:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3481010EA0C;
	Fri, 11 Mar 2022 18:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F38210EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 18:28:12 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b9so5168782ila.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 10:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h6kRnzC7goLGEPmVBWo4cUiV7yAsagl+8hP4OJRt60=;
 b=Yysm327o5/GzYIVke4LAYz/7eSWLDIM7SQoR1fxon9K3967gGvGTsPyBKOdl6WsoUs
 lxMBbrpmgjl2+fdxYqM30DKensGi/owlaCLMJtL3ldflz8+HF9HcsODaxgYYL0J79FEj
 0ZJqXnBsDrNyosZT8oIqcVD8Q+UJUxpjOZP7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3h6kRnzC7goLGEPmVBWo4cUiV7yAsagl+8hP4OJRt60=;
 b=A5ZsSoRo/7w84bNEKNrWoTzM2juVXNVCcZmp05JJ/APnSj6O3u6sR6Gl6egC4zW1t3
 NsibEP+Noryo3OzvsFLItwhfdt3zYmOz1vj1m3BEP3u3XOVqBsYItPLvdrFEN7fbNs/+
 v2tw/KH2ObHe0uzhYpSz5CNWRlIIvKYh5F/WCyxOSIVqOn0F7AT4HxK9FyxFRFB23ecV
 rEx0LcE4//xiTWkil5Bk7kk1FnL2xQFXM+ftIiFOiL+JWc9XNPqaTSkBOBu8e89FwcaC
 vR2fhu0jOGzKYjaQ27n/qF8MaFnan0z/3vr+CQ5HVceqiJ5LYgmZO/iG0GMjBclVdl83
 yP1w==
X-Gm-Message-State: AOAM532KX+9Na1tKiTd7G2bIUdCRNXthNmEdr0u1H/XG/mfbBgTG05lM
 q+B/7ZbwQqqjVgFtZwUl3GgHKSF8Mc6Bvg==
X-Google-Smtp-Source: ABdhPJyXBcq64bTK5sj2ZWDtA1swRGQqBBlqtFMBcZKFPte5wO3bMxTNbICLQeV75OSaWmb1MkEzMA==
X-Received: by 2002:a05:6e02:1285:b0:2c6:123f:48b8 with SMTP id
 y5-20020a056e02128500b002c6123f48b8mr8342898ilq.250.1647023291166; 
 Fri, 11 Mar 2022 10:28:11 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:200:5a3:e166:1d11:e36c])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a056e021a4f00b002c665afb993sm5031715ilv.11.2022.03.11.10.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 10:28:10 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Update comments for drm_find_edid_extension
Date: Fri, 11 Mar 2022 11:28:07 -0700
Message-Id: <20220311112801.1.I8dff39863e3d7a30f13512d9ff50b38ce6743373@changeid>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Drew Davenport <ddavenport@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In (40d9b043a89e drm/connector: store tile information from displayid (v3))
this function was changed to find EDID extensions by id, but the comments
still are specific to the CEA extension.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---

 drivers/gpu/drm/drm_edid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..1afe73fbf3e0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3326,7 +3326,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 #define EDID_CEA_VCDB_QS	(1 << 6)
 
 /*
- * Search EDID for CEA extension block.
+ * Search EDID for the extension block with id @ext_id.
  */
 const u8 *drm_find_edid_extension(const struct edid *edid,
 				  int ext_id, int *ext_index)
@@ -3338,7 +3338,7 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	if (edid == NULL || edid->extensions == 0)
 		return NULL;
 
-	/* Find CEA extension */
+	/* Find extension that matches @ext_id */
 	for (i = *ext_index; i < edid->extensions; i++) {
 		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
 		if (edid_ext[0] == ext_id)
-- 
2.35.1.723.g4982287a31-goog

