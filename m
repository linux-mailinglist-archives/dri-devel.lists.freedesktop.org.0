Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2357B070
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 07:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CEC11B030;
	Wed, 20 Jul 2022 05:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC1A11B030
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 05:42:17 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10d7170b2fcso6159071fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVoUKQlwm/yv6Z3L0/jFWLZaGDmNOYrSPKQKqKpKuIU=;
 b=XPaCyj9Wh5VKhFBmtKwkuoU7O3F4OFPLSQcDzS5lWZY4a0jZ6Q6CyV7SvIXilpZ/y/
 mMnDdjxELgbZlCOoHKky9Uj0Wc8+A/FF7BAuOUsuzzCsBDuAcNLPDsk3ZcS1kNXZjER2
 B8+cSZa52oZee6UDPkGPO+rcR+HklIFH0s1NbPGCEccGGH4hZCesZgZridWVX59jqpHN
 Ug/DT73FLr4jqJMs5i2eZNGyC8yXUrAHWl6IXj9riBev6Of710kDwY/540pqn/xqisvc
 /Za32VKeVdBPZ3cH23NgB3gCNkPM+HGmS2u1S8HC68jySxCc0U2HWWuYDKdTyDlks6K6
 C+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVoUKQlwm/yv6Z3L0/jFWLZaGDmNOYrSPKQKqKpKuIU=;
 b=S/CcmOOGJMrJ1tAJpG7iQyrtCdz+BT1CcW/8wk5lpYm6wLK+pD35cbjU5aOglJAHte
 RwzpH7kiXilYxDdZdzCx/k8rYjqcH32fbiih6UJAbu26TwH9d7Wsw7aztQRsMbaJ6zhk
 EhCDq4KyKDO0+IPTtXBE5OkcjI9LCxitsfDRZKswWsI35b/Rob0C2CJhRujlDYES/tdC
 nRpLB7aGMCDULS+PgxGvM87U9Je/Dv01+OvBmc2ehtxgZG8VI9C7CcBbi17pvLRHhHNQ
 mgK5I33riuHhPj4KICNTVdGoa9Dc3mBnnceA/dxRvHCgAvxYlCNwaLSMzNoTSQUf6/YT
 RGPw==
X-Gm-Message-State: AJIora8/dhd8cuFB3bMcQFqkzGEBVK6aVfvjYFarVfjdMwUkJk/U7ZTh
 nVDGCkH1P1dxmw1WgE/JmCdHciglu/DwygcP0Kg=
X-Google-Smtp-Source: AGRyM1tMDZuqnSAaDTRab2kmBYi2PvBr+UpWYHJAfRGE/yEVPs7ppPRY/TqvXBZpXnUYH/6Cuqhlwg==
X-Received: by 2002:a05:6870:e74d:b0:10c:759f:a079 with SMTP id
 t13-20020a056870e74d00b0010c759fa079mr1589514oak.184.1658295736484; 
 Tue, 19 Jul 2022 22:42:16 -0700 (PDT)
Received: from localhost (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 bm51-20020a0568081ab300b003358e034f72sm6179069oib.7.2022.07.19.22.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 22:42:15 -0700 (PDT)
From: Steev Klimaszewski <steev@kali.org>
To: steev@kali.org
Subject: [PATCH v2] drm/panel-edp: add IVO M133NW4J-R3 panel entry
Date: Wed, 20 Jul 2022 00:41:52 -0500
Message-Id: <20220720054152.2450-1-steev@kali.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720052841.1630-1-steev@kali.org>
References: <20220720052841.1630-1-steev@kali.org>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an eDP panel entry for IVO M133NW4J-R3.

Due to lack of documentation, use the delay_200_500_e50 timings for now.

Signed-off-by: Steev Klimaszewski <steev@kali.org>

---
v2 - actually mark it as R3 in the change, not R2...

I'm basing my information gathering off what I could find for the IVO
M133NW4J panels on panelook.com.  R0 is glossy, and mine is not.  R2
says it is discontinued, and I am just guessing that I have the R3 as
the Thinkpad X13s just came out, roughly a month ago.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5024ba690abf..870b98041c60 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1883,6 +1883,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
-- 
2.30.2

