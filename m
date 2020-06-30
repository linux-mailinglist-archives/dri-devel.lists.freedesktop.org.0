Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2BC20FB58
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8BB6E08E;
	Tue, 30 Jun 2020 18:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76E06E071
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:06:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t74so11955665lff.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRqj8DWmg7BnSD68DOI/fQne/hm6ycp2xnbz6/6YyDU=;
 b=G1kGUUWVaJo/NDAw8vSTN+t3mfhXNwgLSlATnsThjhQ1veVZJznC4N1HzMAmMJNoKi
 aHg9+9i7yngTmE+svskuIotC0VfMMZMz8X9o5Auo7IYQheptGpcmYps+ToWV6SQpZHca
 fhb+Gmr7dG9YwoppA9JFk5lGkW5LLAJjQ3oyDnvnU2jWI+5Grog45T3+AHnfJcoGsmVr
 O2FonH1WbKbXpjYQGjw3/nRhQJz4Hdl9K4f+gAnpXPvKHgK7att9Utqu+WQi5sDrwhIY
 Lf78Y2bLhe3hlVTrNXwcW1vU1v2yduDXaQQva7Ks/8FErb93TficSx+bk2JqnXtv2bAY
 hY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MRqj8DWmg7BnSD68DOI/fQne/hm6ycp2xnbz6/6YyDU=;
 b=gkxMF0Qmr8v3BuOlhVMQ1MEGRUbwRgcWbYv16kX+qA368u5bsdkW9oN+TFijV9fjUK
 WXclITlWJFEh1cP/5iQOdi6APRuXTkxyOTuC7icOyKdF6evJSdB8ap9JPkXoZPh5yZ1g
 fYVkwKyWf8XONnHeHmRQ6JMjC0nejWmTyCsqGJ+kHMHbNpxfMyqloEOMboN2tcWh4nKF
 9NpkSX83HCBMjBf+jPFnWr4wlZ03KJuuhuvQdJQuKyOeK4OGF3PSKmPYyXlvT/U6uU2i
 DPQeK2bygCHudFMKux8tSsRq3z8xX/1a/XmZDMTFXnQeal0TgMOXta0eCWsAH4oTCK14
 PP7A==
X-Gm-Message-State: AOAM530hxKFuErIK9vnutckHV3Z616jsiQVddFJui0P/2gMabfQBXP6f
 IGAV6QObqG8mpkwjeEbn7D6exI/IbEk=
X-Google-Smtp-Source: ABdhPJyEgLUu9qgYNGlz7b36tqQDBDQO73YD07Ucs7VQHi/8AXkCPAmSXOyfYWzMgKFzd1IaNxFQyQ==
X-Received: by 2002:ac2:43aa:: with SMTP id t10mr12644264lfl.114.1593540359908; 
 Tue, 30 Jun 2020 11:05:59 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:05:59 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 4/7] drm/panel: novatek-nt39016: drop use of legacy
 drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:42 +0200
Message-Id: <20200630180545.1132217-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop use of the legacy drm_bus_flags member and use the more descriptive
_SAMPLE_ variant.
No functional change.

Note:
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index 79be3dc4e817..91df050ba3f6 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -357,7 +357,7 @@ static const struct nt39016_panel_info kd035g6_info = {
 	.width_mm = 71,
 	.height_mm = 53,
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-	.bus_flags = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
 static const struct of_device_id nt39016_of_match[] = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
