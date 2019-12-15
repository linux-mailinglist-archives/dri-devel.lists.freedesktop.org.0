Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE511FFC2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05BD6E438;
	Mon, 16 Dec 2019 08:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191AD6E140
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 19:43:51 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 47bZbB2mtxz9vZ6L
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 19:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtcqE8IVtN07 for <dri-devel@lists.freedesktop.org>;
 Sun, 15 Dec 2019 13:43:50 -0600 (CST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 47bZbB1cGXz9vZ5l
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 13:43:49 -0600 (CST)
Received: by mail-yb1-f199.google.com with SMTP id y204so2655800yby.18
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 11:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nzUVfiEDZWnnZ8iTI733utxeYaoLpIiip1KoZGu7VT0=;
 b=fQT5U401aqJdtyEC3PeaqB8M1c9gazre6yrbix1n3u84kw0WobKU+W0kQm50sncgaM
 ui9X/Jue0JRBKrEjayU78aedygD8tYhaTLHoaauTs+h4W3MabLiJq5eV8DghyA+Nv3Ca
 osGouTl5sH9bAYp5w1Tz8RISjxkuJDXjxOr+mGKuwmX5D7ugmFjWRnMYX16qt7iImkSz
 AeYLd8xRzh9yUiLGAg0yI9+6UauGwDz+QpjlQFOxxwtuv2Afq5FowA1MT7ayA/XAahgd
 Whp+BRGVgO65scHHeX+DtRhu04WMBdHaTQ8Ocz3fb3LMZqKyEcjpzeqW0cNWptrXOvgf
 4FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nzUVfiEDZWnnZ8iTI733utxeYaoLpIiip1KoZGu7VT0=;
 b=JkusbJSqoGHVCmAKaJFsnRJ8B97+Qnuwriu9C2ZtK4DVbXgDDXXuxN37mEUfDm793A
 Nmdk2G3AT7V5onGNgcutop9hF0Xt3JN+cZguv/AqAkp5slfk54SbJXZ3opWdi/U6bUsf
 L779Oaww3R+SePrgj1IWySil183LW9EsruSN4WazmddExJDPzZJpCRCwvl1tXsk3q7qj
 ret5TZaC0K20Rsktx7BOGYFzl+1ujKxCh3+22C/y/nIj1wmjr5lGeeGFHpObfOpU3Iih
 tYdFdzjs2FH2665DugKm9GCPojH0Qz2/SaHmp9+VucOpqaTRJfFhOiDrGCb1B01Udrpc
 Y3SQ==
X-Gm-Message-State: APjAAAW8B1jeKMcHqbsAIqltZY/V2r6sGxMN8yuKzv5I5Aklfibt/ILP
 Va0fEFFoJq1gvrKjHj8KA2FcVyLrfbHq4nH8pVpksk734uBurLJG7llx+EpvH1U4AW6xUoFwl3e
 2Y53gvE8eSbtMcg57zdsRwoeW36LmYGyj
X-Received: by 2002:a0d:f585:: with SMTP id
 e127mr17247500ywf.155.1576439028882; 
 Sun, 15 Dec 2019 11:43:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwh+uZ2y7jBdt0l8mdoCQ5qrh/XYRpRcorJY+Fip/K20Q5s1zWb0E1EsZQV/zWoIBzmlmKfow==
X-Received: by 2002:a0d:f585:: with SMTP id
 e127mr17247484ywf.155.1576439028663; 
 Sun, 15 Dec 2019 11:43:48 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id g29sm7441920ywk.31.2019.12.15.11.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 11:43:48 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm: remove duplicate check on parent and avoid BUG_ON
Date: Sun, 15 Dec 2019 13:43:44 -0600
Message-Id: <20191215194345.4679-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_dev_init, parent is checked for NULL via assert after
checked in devm_drm_dev_init(). The patch removes the duplicate
check and replaces the assertion with WARN_ON. Further, it returns
-EINVAL consistent with the usage in devm_drm_dev_init.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/drm_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 1b9b40a1c7c9..7c18a980cd4b 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -622,7 +622,8 @@ int drm_dev_init(struct drm_device *dev,
 		return -ENODEV;
 	}
 
-	BUG_ON(!parent);
+	if (WARN_ON(!parent))
+		return -EINVAL;
 
 	kref_init(&dev->ref);
 	dev->dev = get_device(parent);
@@ -725,7 +726,7 @@ int devm_drm_dev_init(struct device *parent,
 {
 	int ret;
 
-	if (WARN_ON(!parent || !driver->release))
+	if (WARN_ON(!driver->release))
 		return -EINVAL;
 
 	ret = drm_dev_init(dev, driver, parent);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
