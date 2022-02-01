Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28304A6242
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2B710E6F9;
	Tue,  1 Feb 2022 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BF410E6F9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:22:21 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id v3so15942045pgc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VG6m0yGSKpFG4q+Uc9WqsHQnQC10ZbIeInL9q9ZvJP4=;
 b=Z59AWVextX0bLU1YwItgjLla2IDdnIhdNx61ujWPh3oF5IQSXKrK+CIngzOv1pmp/z
 BnGo8ycDeivDlCmc6skyHGhjq+vmmloQ8Cj+SC99shLtUSEMKhIgdF1sqsdBHhOr1I66
 bo11+Lna5pgOAd4oJxsgT5imhMdmbBakhYGeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VG6m0yGSKpFG4q+Uc9WqsHQnQC10ZbIeInL9q9ZvJP4=;
 b=5BSdH+BrOo7Uo1s6IPkkdKnxeIWRsKi92kk/hk4mDb0cwAoOeJf8/J9f5KswnwBuj7
 G/5PugSf+QL/03QszujRzwOOq1EgCoLGI5j2i3A51XI60PZA3FqY1sB4CcH7dtPEqybx
 LYJnHBwNDDaEnk+IkchiJDXD27e93Q8aTcLEqA3tog78stAEjqQMYEXa5XEtfNVohVdg
 HHF7M3NhXNmkEhKEO5R9vq38cMd1b2XuW1dPQmBTMO+JROdSrVhRXJeP4LyeBfKVKCsw
 yAFhvyBt8sI1XQoZwMjAMO4N3b0mWRcXjkFC+pSNEiwiVlvzssJL/cWBNIqpYjCFFzfv
 Id3g==
X-Gm-Message-State: AOAM5332wLGJTTx2RYkSuK88Q5wSiyEUP5sYO7ukCsukmEQ0Ltm8LbQT
 iiHVEujc33U09c8xySjjzeugRA==
X-Google-Smtp-Source: ABdhPJwXfiKI3nFqn6/pTkWSkhtXry13WyUFnS4GLyA22EFm8qelW/dao6QZBnEvV3MAjoEEFkooaQ==
X-Received: by 2002:a63:884a:: with SMTP id l71mr19755054pgd.589.1643736140943; 
 Tue, 01 Feb 2022 09:22:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:c148:8249:fae1:2404])
 by smtp.gmail.com with ESMTPSA id 19sm3304400pjb.42.2022.02.01.09.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:22:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] Revert "drm/panel-edp: Allow querying the detected panel via
 sysfs"
Date: Tue,  1 Feb 2022 09:21:58 -0800
Message-Id: <20220201092152.1.Ibc65ec6fa05017e9856ba9ef557310268429c3ce@changeid>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 363c4c3811db330dee9ce27dd3cee6f590d44e4c.

Since the point of this attribute is for a test, this should be done
in debugfs, not sysfs. Let's revert and a new patch can be added later
doing it in debugfs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 39 ++++---------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 23da4040e263..a394a15dc3fb 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -222,8 +222,6 @@ struct panel_edp {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
 
-	const struct edp_panel_entry *detected_panel;
-
 	struct edid *edid;
 
 	struct drm_display_mode override_mode;
@@ -668,6 +666,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
+	const struct edp_panel_entry *edp_panel;
 	struct panel_desc *desc;
 	u32 panel_id;
 	char vend[4];
@@ -706,14 +705,14 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
 
-	panel->detected_panel = find_edp_panel(panel_id);
+	edp_panel = find_edp_panel(panel_id);
 
 	/*
 	 * We're using non-optimized timings and want it really obvious that
 	 * someone needs to add an entry to the table, so we'll do a WARN_ON
 	 * splat.
 	 */
-	if (WARN_ON(!panel->detected_panel)) {
+	if (WARN_ON(!edp_panel)) {
 		dev_warn(dev,
 			 "Unknown panel %s %#06x, using conservative timings\n",
 			 vend, product_id);
@@ -735,14 +734,12 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		 */
 		desc->delay.unprepare = 2000;
 		desc->delay.enable = 200;
-
-		panel->detected_panel = ERR_PTR(-EINVAL);
 	} else {
 		dev_info(dev, "Detected %s %s (%#06x)\n",
-			 vend, panel->detected_panel->name, product_id);
+			 vend, edp_panel->name, product_id);
 
 		/* Update the delay; everything else comes from EDID */
-		desc->delay = *panel->detected_panel->delay;
+		desc->delay = *edp_panel->delay;
 	}
 
 	ret = 0;
@@ -753,28 +750,6 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	return ret;
 }
 
-static ssize_t detected_panel_show(struct device *dev,
-				   struct device_attribute *attr, char *buf)
-{
-	struct panel_edp *p = dev_get_drvdata(dev);
-
-	if (IS_ERR(p->detected_panel))
-		return sysfs_emit(buf, "UNKNOWN\n");
-	else if (!p->detected_panel)
-		return sysfs_emit(buf, "HARDCODED\n");
-	else
-		return sysfs_emit(buf, "%s\n", p->detected_panel->name);
-}
-
-static const DEVICE_ATTR_RO(detected_panel);
-
-static void edp_panel_remove_detected_panel(void *data)
-{
-	struct panel_edp *p = data;
-
-	device_remove_file(p->base.dev, &dev_attr_detected_panel);
-}
-
 static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 			   struct drm_dp_aux *aux)
 {
@@ -874,10 +849,6 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 
 	drm_panel_add(&panel->base);
 
-	err = device_create_file(dev, &dev_attr_detected_panel);
-	if (!err)
-		devm_add_action_or_reset(dev, edp_panel_remove_detected_panel, panel);
-
 	return 0;
 
 err_finished_pm_runtime:
-- 
2.35.0.rc2.247.g8bbb082509-goog

