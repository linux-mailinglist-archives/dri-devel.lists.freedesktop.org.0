Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A515C398CFA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F42226ECCF;
	Wed,  2 Jun 2021 14:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A27F6ECCA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m18so1475407wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mk39BS0/bKimRA7KpxocWhMuIWwoKnA1Ws/AOAzTtyE=;
 b=Ze4kBxas7q6PJHQjistPlY3BKGf9WVwTv4ZiKl4je3WZIzsP5ZUjZHbL5lDcXuJMJL
 Mp6ZI4gjntPB37vX8tuvvailzcv3mf843zkLy888nqtNLvPj8ZftiQaRrgOGdxX6VZPv
 9nS5yi91WCeR8aHzM7dFITyiGuynODpx8iVVYDuqNe5M2EIRZKaZLj43eza1GyjYePh5
 z+J1k4ToUKaDQtuIhWkKDvgcsElnM7zMy7MO9zXxOf7D3H7ZVqGhLBpHMxOCkxtIOhqa
 sF8t34MOtV5ptXDh2nnrsNorYSC9qUdeq8rjnDvFM2KD4u/mC1nLmDW3Pi0ir5dqBI8Y
 SILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mk39BS0/bKimRA7KpxocWhMuIWwoKnA1Ws/AOAzTtyE=;
 b=m0eCN3JUt9qUUor+DBWXOG0vLVinxCmHLq24joBXvLZxqH7xJS+KUXj6hh0TiDZHrI
 BNnr//OfELK228TapaU6Ckgsw/Cqd/zePamtcBEXxES7QMKKwoWVFqHQSN0Vk7el0mFe
 ttUqPPwUZF20s3R4fqNlIRRd55/F48ahyAWwYVZlF5ZWd1mjUhfp/N8BZAP2Xk8z/pGk
 /29/FOepn36b2r2h1tMvnx+SC8YQy4zygKc5S0IX/K8U6/xkaLWGhtevZzRmeJf9sPHT
 KP0YJo2Ern0ndI+Au9SfuEXdGd7R80fnukpdG2uJpaYW/It7AgqvtCsQm5m747p5dcSK
 Hk6Q==
X-Gm-Message-State: AOAM532neDHA+5PCLmNn1vD8V1+8nnFEz/BH/N336hgVcjiElQsEDiXS
 xKghFzqDCQmY3pC0HHEZNNgv/Q==
X-Google-Smtp-Source: ABdhPJzazpZoPsfKHbTwLRr5XwTVN0m1xuPC8VZ0OMkDvXGUjqhs7uhxKBzSXvOh0BW+8aTEa0oiFA==
X-Received: by 2002:a05:600c:ad2:: with SMTP id
 c18mr21789423wmr.93.1622644411800; 
 Wed, 02 Jun 2021 07:33:31 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 21/26] drm/panel/panel-sitronix-st7701: Demote kernel-doc
 abuse
Date: Wed,  2 Jun 2021 15:32:55 +0100
Message-Id: <20210602143300.2330146-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-sitronix-st7701.c:42: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 4d2a149b202cb..320a2a8fd4592 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -38,7 +38,7 @@
 #define DSI_CMD2_BK1_SPD2		0xC2 /* Source EQ2 Setting */
 #define DSI_CMD2_BK1_MIPISET1		0xD0 /* MIPI Setting 1 */
 
-/**
+/*
  * Command2 with BK function selection.
  *
  * BIT[4, 0]: [CN2, BKXSEL]
-- 
2.31.1

