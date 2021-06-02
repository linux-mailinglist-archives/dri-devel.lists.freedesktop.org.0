Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544B7398CF9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35AA6ECCA;
	Wed,  2 Jun 2021 14:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311B06ECBA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z8so2519371wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mad90AtNlCIQqeONJLgwNjgy3qTN43q4JqhckiOfdA=;
 b=ExgmwiJMlS0eRraN2kHbb0Ihbru+U+mZwxjE9wzZHHKQkqrHsrk3enpg1hFU9j+oDL
 ekIU7tjAs5rhizmS3T2H0X969HshiCtOYtJ0HEgwm4sbKX/J3QPaX0YBHw68X3GxyOf5
 /0mWlLkzvVx1O/vvv/9xmiqVEjdCmd986lpGHFOeOA6wlyZHO/FuPTdOb+rlGP0c+KG/
 4tiRvZU2Q0johCTwk70k8ziUMQadlY1ZTPyEJzgcMWaniqYTBhLjlH/GkXdMU4UYbL4C
 zFo8vutbbvWfUI3BSjNb53fqs46HG7mY4fOzcxK9EDNns6B8NPr3lP4u5vA2PF50FHPh
 x9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mad90AtNlCIQqeONJLgwNjgy3qTN43q4JqhckiOfdA=;
 b=bOhKtbq5SdkQ5P3WwZkf+v8tR3jWHbAQBPoCacxZKHH3J9sjuPJJuUaXnacAn/rt+L
 FfjTx0cMIWach/2g7dUq5PZ1JGM3Z8Qv7S7RXBv/l1ixCOS9hUgVAr/88+0G0ha1wH8O
 V7Ws9Xv071LtH181si0PVs4R0Uh412oV293xpL9HD9mtd1bC/UIXg56C9h6VHP/w30pj
 Lib9gHJIyQLcpdqRteWQf4osc0RZAmvZkuuEqYMqZsaGKPu5PuYZFwwhT4zIRevDJpYr
 8evm22LomhCyA1O3XtJfqzH+n5uKUK5ZoAnjpYbm68g9/N7z2d50owz+H5NbJljPubJj
 TG1Q==
X-Gm-Message-State: AOAM533On3HFA1xDHaC/jws8H4VRLHWnrEq11NzcZZPi0PD9hIlQpChe
 DKMZbc22MYaIFP/AlHY8fXzp7g==
X-Google-Smtp-Source: ABdhPJxJR+DAmRu3LRD0lFSDK005qWO7ULh1N0b3KxxqVF1PwKK8vsdmXuNc8EdYh1jdRA5kCHa3Ng==
X-Received: by 2002:adf:ea86:: with SMTP id s6mr27047293wrm.75.1622644410937; 
 Wed, 02 Jun 2021 07:33:30 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:30 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 20/26] drm/panel/panel-raspberrypi-touchscreen: Demote
 kernel-doc abuse
Date: Wed,  2 Jun 2021 15:32:54 +0100
Message-Id: <20210602143300.2330146-21-lee.jones@linaro.org>
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
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c:33: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 5e9ccefb88f62..2229f1af2ca8c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -29,7 +29,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-/**
+/*
  * Raspberry Pi 7" touchscreen panel driver.
  *
  * The 7" touchscreen consists of a DPI LCD panel, a Toshiba
-- 
2.31.1

