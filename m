Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3C5B17CE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C01F10E9C9;
	Thu,  8 Sep 2022 08:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5F10E9C8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:55:11 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1723391pjl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZK3gsfh7RWbM9CrtWvTUZX33Bm/T3p94/yUzT2/I0OU=;
 b=YmogQJprMr/RjjMlImkpkLfcp+AUyr1pSrltT5i1jjkh/48lBCoo7DQ6EBMcx4CIA1
 Ew7JXnoTYEp3MpdEHmINpkmPkqdlNP5IZOJ5BqmYb7QMOMKcsx9n4V61kxlYvwODDHJ/
 KZa74fEuebxJNQwcZGJ8jHUKTvCGq/+UOXnNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZK3gsfh7RWbM9CrtWvTUZX33Bm/T3p94/yUzT2/I0OU=;
 b=k6EkYZ+V18Zmt7NMQkZ3kaxuqw6CLqOZz//OH9WNLRDqeR9d8d4VdsdIo+p0wV1OH6
 3BecRYPckGN6OzLJonmiwtcr7mS65WRzggwVdXBr61zf+FoRVkP7Rbt3Im7sL14rahoX
 JEJzdkBHz2nJIyPNHtL9CAK7FAAW3N8MOVVqlkprETPftM9McygKFcF+izsYDDM9SuJJ
 SragMUByONp6wP9kUvcmrCp4cuuu50pyUE7ApeOoOKuFKmcWLRlXXnc7tkPKNw6XqTLC
 0LeCgPXqZFLg8J5Qn1zp1dRNK6v2C2dYXnEgg8RHLvFBAqWv+hIJHvK9GJAJXrT1eNPK
 YXgA==
X-Gm-Message-State: ACgBeo1oAJYTwmNXlygrlHrgKuU5OuHwduRL+0n1q3Q/dq1TjIgAvjIa
 6K2H/bHhOUr2XEQOI0P0LEN6wQ==
X-Google-Smtp-Source: AA6agR7+/jywm3x00fh+VStEJoKR8VdWUmDZ3AeFxeZiVW7XtGSjj4Hjpi+FdrUummQmeMktGomVTg==
X-Received: by 2002:a17:902:b715:b0:174:dba3:8bca with SMTP id
 d21-20020a170902b71500b00174dba38bcamr7806570pls.51.1662627310835; 
 Thu, 08 Sep 2022 01:55:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:c6ba:fe7c:d2b:242e])
 by smtp.gmail.com with ESMTPSA id
 mj19-20020a17090b369300b001f334aa9170sm1188629pjb.48.2022.09.08.01.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:55:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm/panel-edp: Add Innolux N120ACA-EA1 panel entry
Date: Thu,  8 Sep 2022 16:54:54 +0800
Message-Id: <20220908085454.1024167-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220908085454.1024167-1-wenst@chromium.org>
References: <20220908085454.1024167-1-wenst@chromium.org>
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
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel has the same delay timing as N116BCA-EA1 from the same
company, which is also the same as delay_200_500_e80_d50.

Add an entry for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 65e3a5361c80..15e18a64b03d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1890,6 +1890,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
-- 
2.37.2.789.g6183377224-goog

