Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C35EACD6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B2210E72D;
	Mon, 26 Sep 2022 16:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315C510E719
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 16:43:38 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so9929544fac.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RNp07vbgm/KhF2r1MqQ+J+nkeazq470GtvzwhTtFxMw=;
 b=CZQGzJQhjAIr7wI0UZanSwKJsg0qt8tvwn+2+u3FqQg1XAiacPdUoVUGBu1x0KFD53
 AQqUi153AWQQ7TXOlTwubMzNrx1BUVr6Ps0oaGeLUw1lw9Zo0WFDBOTGa3v4KBWbe5a0
 hmxF3i9pHAh27C6GbUJbLr7J+CzM0JbLFbP+NalhNob6/gmN4DEeRXTNP4aFfuokr5BH
 VkrECWQmIcbKAlp/SbtRfCmpXFQV/t9iUwQt3BOb7uugBbNe10w9dtTTyzXD2V13qLFI
 ZQcEbV5L6/HcqCNz5qPxNnw9n37KyzTd3zu7FoaXUM9tfYTuf19lzSIpZ8/MYmQBTt/9
 uk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RNp07vbgm/KhF2r1MqQ+J+nkeazq470GtvzwhTtFxMw=;
 b=HsoreTHydws2Itmls8TagRH0KNA148rSpGXXsLqszU87JzpYULptp6BPAHph5b6H90
 z4dLmi2JtffpWuFzTSrhzy3KNuizx4T6/JijO2iSqzAVgpcyN9RljzYouQBEALwLqtMu
 PrkCMQTDL3nzYtKxJZ7bPnEzfX1yfFlpPc0FLVt+PGiQTkzPJBjjNCgLGRi/lV2yEwXR
 8hovtvb276KDdTKqrgwbDRGHBtc2uSjcuAL2WyIBb7eeemwCFEcQvWnVV/kHEAsPBjTR
 OxXDov1ygUIyerQGNCpcM9jf2ViKWQww+K8TC0WR9a8fF8OC5k7zFvuqvPs42iCom9B0
 t0Zw==
X-Gm-Message-State: ACrzQf22d3nQyQxxUFYukfChnv5uZFUzP0hX/9s4+uJUXo9HD/1wmddz
 kxMp350tt8znxpxMFannC9xB7vV/8pY=
X-Google-Smtp-Source: AMsMyM4r8aI1Y+fS3enQwrEcXCvDH2gGCebpzgp7aJVUlEucF6Z8DJ6PPqtJW7uBR8iAmIAsqo0qiw==
X-Received: by 2002:a05:6870:1702:b0:127:cf3f:37b4 with SMTP id
 h2-20020a056870170200b00127cf3f37b4mr18964927oae.254.1664210617645; 
 Mon, 26 Sep 2022 09:43:37 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 o83-20020acaf056000000b0034f684ca159sm7318798oih.29.2022.09.26.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 09:43:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 0/2] drm/panel: Add Samsung AMS495QA01 Panel
Date: Mon, 26 Sep 2022 11:43:31 -0500
Message-Id: <20220926164333.7485-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the Samsung AMS495QA01 panel as found on the Anbernic RG503. This
panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals.

Changes since V2:
 - Added 50hz mode at request of userspace devs.
 - Renamed "dupa" to panel name. Good catch Maya.
 - Added Maya's Signed-off-by.
 - Removed check for max backlight, since it is already done by
   backlight_device_set_brightness.
 - Fixed minor formatting issues on devicetree binding documentation
   and added port to provided example.

Changes since V1:
 - Removed errant reference to backlight in documentation. This is an
   OLED panel.
 - Made elvss regulator optional. In my case its hard wired and not
   controllable.
 - Added "prepared" enum to track panel status to prevent unbalanced
   regulator enable/disable.

Chris Morgan (2):
  dt-bindings: display: panel: Add Samsung AMS495QA01  bindings
  drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD panel

 .../display/panel/samsung,ams495qa01.yaml     |  56 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 547 ++++++++++++++++++
 4 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c

-- 
2.25.1

