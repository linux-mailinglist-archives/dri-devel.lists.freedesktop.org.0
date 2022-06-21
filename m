Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096D552FD4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1010EC9C;
	Tue, 21 Jun 2022 10:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C17E10EC9C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:36:37 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id d129so12721906pgc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=690PLBVumykqHvXRfbpeTt397V+lvH2pXtqvwt2Ufc8=;
 b=c0QGurYJNRMK3UMxsy3QW0s8lheOT+3HBk7/aVmxeGnsDa/4Mz3PxfwyLx+/zLuwLq
 vEWLMtHeeBOGEr3g2bc3f2HRlLr6S1X7ar1WEI2rOAie0xwOF8iYhw6k5PKJDYEXFLtG
 tPrclTO4rFQuDCuTCTVh9d77q69eRMIM5AJRmZCvW7I5bxwOTYLhbtoPZEdwpeK69UCy
 BDhTpsmFMM+SdBSdHy59c/dR5JXABq/nQjkt5EIbtDd0oKuKaBUcutrRkhdbps9vYszw
 cytcf/3FxDj/wXwWYMHIT7EJ4zXoKNk2PpsgjzL3NJKgoY8c1c+K9q3/24+nzRLHtOo9
 TvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=690PLBVumykqHvXRfbpeTt397V+lvH2pXtqvwt2Ufc8=;
 b=ZDtWRJaqHZI+9ddtl53cUJG5FAyQ1hhfFTWi2oReWhoxKSXEYm82pypZoktdv1xdUY
 WFCBPQfKlIQpId+Pyqy1Lqnu2UvXGZ3Gk6rOpUz9vn1qjf+eU1aHVpassPTunvjTQ/vh
 QS3MeLVoM4BkQXKmyg3L0d8WsC21wTJXngvcSiVcASrULgbXCKuQYhHo1klunxyTKKgv
 8zdYISAs73EZv4/8TUyfuQv0aGIvvlOHyr1LsviYm7aAbrtRc0QV2y0j5vdcar0kNV9N
 5laLLMO02Vy/zrYV62KfuNmR3MQNH+wjO44RkBkxcLVVkNSjQmCN2ORI1QCiXtlpqOGV
 LUgw==
X-Gm-Message-State: AJIora+fP5Ve0jZV2CeNdBIc8BkgD6nGBaq8qwm+rDFOZIcqCcLNhTuw
 JIYgen8iCmdJjPXOJiuvn30=
X-Google-Smtp-Source: AGRyM1vor8LKN4/OSFgCvaMisJ2B3ZIyyYU/vXq4D6EHLN4tE9ZukH3WdJP7Ym20T5kb80NVeEkYhg==
X-Received: by 2002:a05:6a00:13a5:b0:525:1da8:4af4 with SMTP id
 t37-20020a056a0013a500b005251da84af4mr12372757pfg.43.1655807796742; 
 Tue, 21 Jun 2022 03:36:36 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:c428:5499:b787:9:3bde])
 by smtp.gmail.com with ESMTPSA id
 o188-20020a625ac5000000b0050dc762819bsm36295pfb.117.2022.06.21.03.36.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jun 2022 03:36:36 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v4 0/2] Add the property to make backlight OCP level selectable
Date: Tue, 21 Jun 2022 18:36:26 +0800
Message-Id: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series is to add the backlight ocp level property parsing.

Since  v4
- Fix wrong macro usage, must be 'DIV_ROUND_UP', not 'roundup'

Since  v3
- Refine the description for backlight ocp property.
- Use the enum to list the supported value.

Since v2
- change the property name from the register style 'richtek,bled-ocp-cel' to
  'richtek,bled-ocp-microamp'.
- Use the clamp and roundup to get the ovp level selector.


ChiYuan Huang (2):
  dt-bindings: backlight: rt4831: Add the new ocp level property
  backlight: rt4831: Apply ocp level from devicetree

 .../leds/backlight/richtek,rt4831-backlight.yaml   |  5 ++++
 drivers/video/backlight/rt4831-backlight.c         | 33 +++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.7.4

