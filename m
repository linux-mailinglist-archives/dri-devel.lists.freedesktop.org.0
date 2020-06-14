Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB71F8F9F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1801B6E0AD;
	Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6F6E077
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:55:46 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kyGp28v9z9vCCQ
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F5zfEL5V9zI for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:55:46 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kyGp0KByz9vBs7
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 20:55:46 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kyGp0KByz9vBs7
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kyGp0KByz9vBs7
Received: by mail-io1-f71.google.com with SMTP id h65so8912253ioa.7
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdqIFxgHaPyml2SmCdHxvLQZge/mICMslBYJgjMsN0k=;
 b=mGPxDd568gvpjZYW7B0VV+xmdjn8NF+TD7I3LwqVL2COMehOHnoTIw5DZKtZ2bCFGj
 BMwI50DUWvzIA/tkfqI65XIID6XJlTCB+kdK1dh8rade6ulX7Fi6FgldOo2ERHBlLP2E
 siDnavJnLqqVBTE/lCpswnHpXQ3RILH0X1OcuU63Jb7jg4KONnbJRfSzX+IfyN0IPSRn
 IgppSXNBpwFC8F/DX691Ay6J3ZtLHjW5t8tArT5DtA1b/L9EpEdLoE+k6XLlxU86O5ra
 8lAH96X22H/YvEqm7TkoXs7Lf95zofSOUpbSCv6nAIFhoj7emn26PExmWKYugvvVBMIw
 6VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TdqIFxgHaPyml2SmCdHxvLQZge/mICMslBYJgjMsN0k=;
 b=bohGwOT9ipnCgi8KMpQLL6zrVG3i5VcLJ4RMpQr2evdX/Xb3ZU5jwLR9y86SBtnkZ7
 m9jZBBCklZi/yfVPrB2ZaXUtqL96QKHWU0zI3T4ayExf+JIhehHD5abEnAlItH5rcVvU
 8GVI48BdPt+op5s+gYRY7W3+f0IqHr1jkHCOKsyibuS/SvAlMMNhJq5ecO8TGW3mRQpD
 ef+t1NPWouHEl7wm7Fps8QkUOXSRHezaCPLMHc8Dzal75hK33U/IU2uYJK+pZDUwOFZz
 2U+eHg2bwJCbvX5S8VRZKXF9bTGsIlQgEjZnHg5ItQaVq/QuD/VfLGQk7iUCJkfc7Rmk
 n8OA==
X-Gm-Message-State: AOAM533+Fq1usIgBW1Msa9lnQkSp+hxzjcs9UEWtLgH+Fj5xfa2ZWkkb
 evOnYVowPhVGIdaIgD8BAQkLluuTsX1U7CwL6ZWi+9lLe3S5ElUFXI/U4ZoAYISO1k6ZimFeYzw
 tOvLLHeUvmrZFPofMvbGT2QMvoYrbDzka
X-Received: by 2002:a05:6e02:be8:: with SMTP id
 d8mr19558116ilu.32.1592099745719; 
 Sat, 13 Jun 2020 18:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcVDjXlANd/0Xr752unf8N10VGa47mAE3GfelbMmqQ32kEGlnlBYsVkfVLgyXnIgnf2V8zuQ==
X-Received: by 2002:a05:6e02:be8:: with SMTP id
 d8mr19558104ilu.32.1592099745566; 
 Sat, 13 Jun 2020 18:55:45 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id w15sm5544402ilq.4.2020.06.13.18.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:55:45 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/radeon: fix multiple reference count leak
Date: Sat, 13 Jun 2020 20:55:39 -0500
Message-Id: <20200614015539.123654-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index fe12d9d91d7a..e30834434442 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -879,8 +879,10 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (encoder) {
@@ -1025,8 +1027,10 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	encoder = radeon_best_single_encoder(connector);
@@ -1163,8 +1167,10 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	encoder = radeon_best_single_encoder(connector);
@@ -1247,8 +1253,10 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (radeon_connector->detected_hpd_without_ddc) {
@@ -1657,8 +1665,10 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
-		if (r < 0)
+		if (r < 0) {
+			pm_runtime_put_autosuspend(connector->dev->dev);
 			return connector_status_disconnected;
+		}
 	}
 
 	if (!force && radeon_check_hpd_status_unchanged(connector)) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
