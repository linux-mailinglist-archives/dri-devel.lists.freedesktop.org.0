Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC641334C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 14:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50956E95D;
	Tue, 21 Sep 2021 12:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D026E95D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 12:22:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q11so38593748wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5M2bRv2kmamfcOnSq0h86eu6NBUQ+EJzp0SymobeTak=;
 b=DFvrS0QYGhxB0DmDAsfqXwyI+pX2mHkxCYq+b45Yg8wY4PUEJnCOtxBrHoy/2jXbyB
 FgO0R+5uEjOde54sTR4+NH06OD095RdLgTqqo0TaL/sbZbswFwbEo2MaS96vxse+lbuP
 bgjGTlbdOAvXj7sy2hN/xYD6UhEdZzKlUJFydFO9B7VIOYMjO4RMQh6BbdQNS+h+EbJ6
 Wlb/88coA7F8iNaT0OPMEbaiuVcT2vslSjXODVshGWrgO26idvmiGYXqyaIAlvqgB5f4
 DOiEUssCsmgnE2FhUf55C6ecskd67exeNlR2lIM9QvRxb7HVqHbTmETxRH87WSCnwgnZ
 EN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5M2bRv2kmamfcOnSq0h86eu6NBUQ+EJzp0SymobeTak=;
 b=15kftie5aJkBRTjA1/iP0S/9JrMlgEoYz1tmOkLPuMopHUv0CdxbTHDeLC9Qhyc0sn
 HJw+s27QbsMp0E0KhVEocaFTcYuWOcdQdKPHaRpUeMpAcAFCoPVTIQgB2eENxP/1Rse9
 /jgE3T/gTS5UR3uGzNaw9voAXFymMBy4AglN4qUWnxeVbsmqKa+124/sYzfdeF3MUGop
 vj9US7BT3k64GrjOjT3VCXv90tOpulo/aJQnFQQcXzXA898mqrIRD2Wo7oxswa/C43fC
 jSisVQsC3jMeN2wuOAGIh8sDwkBe0nbd25j/UjgokMr1PgnQ0aVN36RLITMm1W01AJMa
 DShw==
X-Gm-Message-State: AOAM532hpJLVU+zaFfwpoZlo/avQFHLhUuWmGKVj2KrxuUN5+txn20x+
 sgE4fIPQxkoi7FekiibgAOE=
X-Google-Smtp-Source: ABdhPJxH/FHabvrYaa7eWfww74FZM0cp4SKhlS2u1GpqB0+l22TAx/x2zXu3m8WRvLuGV1egPRURkg==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4357450wmf.154.1632226924831; 
 Tue, 21 Sep 2021 05:22:04 -0700 (PDT)
Received: from localhost.localdomain (i59F67ACA.versanet.de. [89.246.122.202])
 by smtp.gmail.com with ESMTPSA id
 20sm2999829wme.46.2021.09.21.05.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 05:22:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: fix typo in DRM DRIVER FOR SAMSUNG S6D27A1 PANELS
Date: Tue, 21 Sep 2021 14:21:46 +0200
Message-Id: <20210921122146.13132-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit ebd8cbf1fb96 ("drm/panel: s6d27a1: Add driver for Samsung S6D27A1
display panel") introduces a new section DRM DRIVER FOR SAMSUNG S6D27A1
PANELS with a minor typo in one of its file entries.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches  F:  driver/gpu/drm/panel/panel-samsung-s6d27a1.c

So, repair the entry and make get_maintainer.pl happy.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210920

Linus, please pick this minor quick clean-up patch on drm-misc-next
(on top of the commit mentioned above).

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b990794ec35..1c486baf9c8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6045,7 +6045,7 @@ DRM DRIVER FOR SAMSUNG S6D27A1 PANELS
 M:	Markuss Broks <markuss.broks@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
-F:	driver/gpu/drm/panel/panel-samsung-s6d27a1.c
+F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
-- 
2.26.2

