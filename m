Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ADB57B053
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 07:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A15112BD2;
	Wed, 20 Jul 2022 05:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208C4112BD2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 05:28:55 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso13416480otv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMgpxkjfCt/FmhZrl9x4hRcunizKW+tN6Bk2IeNKyKQ=;
 b=mXDtJvCawto79rB7epMR3MTBCkXqOxcR2YF3HQVBJgdLefbXGdDYYVX+3iwCnR5Mf7
 VEqRnPf4H/2R88zSUO22vRfxokdnmEEKrJk6PG1/tKgx/OJBCmX7sGV61qruC7rB430x
 7CAev2Xyi69EYDiAQ60ZWrv7YtPg1f3HGmUIa2zNHbiN8PJ4pBv720dwwrKz+SMB2WWP
 TLf8Ll4xDBz2uN77dnhIOVT65JG8jcm1qesrhwCSSSQ3wSslEElEd+BWWtDPI1s0dBF+
 UINLvN8W06ST0O88tzQBdIutvtfHJviILJ4gwTLIBWQtZcgA2embjoQwqcKSZWKo9p8K
 msRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMgpxkjfCt/FmhZrl9x4hRcunizKW+tN6Bk2IeNKyKQ=;
 b=LOgSgrW1CYxiaOrwRCTTg+GJNuJAYsnXKNki06ZEaSpyH5uOuEWfA/hUCcWGHmJgKs
 ouJJx24gsn9W0Fn19I7FAXNl+m+SKzxHFEwD945zAYTVE08o6nIWgkixBDtp+L+5yks1
 Ldw9X7pdXFNlUf0LNe79pFIGdx86iLkLI985s9qT5rGuCk0Y31/lgLLLqcAf45hWHCTR
 y1qaMiSJrKCZ70ljG02eJJ6WkQeR9onIVJVYFOQRA/kPnygrPNglU03lbYINlbghLOMv
 EKAQ/mNKPlKO/eBDn/4hVtdsnEkP6Ze5TVYbJnHiMx8pYcqvAJJHOwQl04Vp46VQeo7E
 5Uqw==
X-Gm-Message-State: AJIora/Jv0X6fhAyWOkO388MmSsnY8U1Bo4Hw6y3V32scXtrW4CQsndE
 Fe2gDM5mgE5h2Hf9LKdOC3LO7g==
X-Google-Smtp-Source: AGRyM1vn6Kpt3wQVlvK6egDGD+IJjzOjhDu0CYKIWARQfRD4PH+9F6xopwxjGmj7em0OMzbMS5PiFA==
X-Received: by 2002:a9d:6d08:0:b0:61c:bbc4:7996 with SMTP id
 o8-20020a9d6d08000000b0061cbbc47996mr1010758otp.277.1658294934326; 
 Tue, 19 Jul 2022 22:28:54 -0700 (PDT)
Received: from localhost (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 be35-20020a05687058a300b0010be134ac60sm8579140oab.19.2022.07.19.22.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 22:28:53 -0700 (PDT)
From: Steev Klimaszewski <steev@kali.org>
To: steev@kali.org
Subject: [PATCH] drm/panel-edp: add IVO M133NW4J-R3 panel entry
Date: Wed, 20 Jul 2022 00:28:40 -0500
Message-Id: <20220720052841.1630-1-steev@kali.org>
X-Mailer: git-send-email 2.30.2
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
I'm basing my information gathering off what I could find for the IVO
M133NW4J panels on panelook.com.  R0 is glossy, and mine is not.  R2
says it is discontinued, and I am just guessing that I have the R3 as
the Thinkpad X13s just came out, roughly a month ago.
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5024ba690abf..8f89226e9db5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1883,6 +1883,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R2"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
 
-- 
2.30.2

