Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F39240039
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 23:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33ED889EAE;
	Sun,  9 Aug 2020 21:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD4E89EAE
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Aug 2020 21:51:51 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c15so3696243lfi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Aug 2020 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrsiR38UwzGryEjdYP0YDhWr8aT6bEJDFis5+ZW/wZQ=;
 b=KDGG9CdMfmTOWgai78aMqMIKf2hZdwLc42psRqBMoXt3B0UUYmR6MwLEgi2tY6IqZX
 DDL4ZBuEHsBi7TLsmsTUMNbpFoa+XtjgVlW98R3U8FJDvLbxyWGgwQ6o5kklV0eZfEVq
 686SBAy+LjHG+ydsNzB8rC4e2H6HUEpcvTrzTba48080IsLCMZ3KCyk40bJC1MZ4KQpR
 JemrNMl57hFCFnYd8wdvGcCS2LL72f5kn6GxnGy8TsyqhO+hX9s0vNoiL+moS0uPjbCm
 GiQCRkCSF73QRcEXLcUQPMHir0KWoQIuFjjP5COxdSQss4z2WCjPlfw0dFpXZsqC2K+0
 gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrsiR38UwzGryEjdYP0YDhWr8aT6bEJDFis5+ZW/wZQ=;
 b=JQwGGWtiXWU4Rz0ipwes+yRfElFtJwJCuRlbmndJOhGwTPp/R+7ISqESX+cXC2J9uZ
 aUWM6xIIzpKbGBtxbkZpKYrIzKYrvZTHRbxzW3aYOJTh1ggM4U7PI/+tAsM0UobNtFKT
 VNbtUAemH50XvlAlCgXayO3Ox4AddVJwPl91y4Ly1NvlKQmJcMC5GN7E2SRMyR+JD1ws
 NT2F70hCKBnw0+u8YoCgjEHbZo1Xk7GFwS6PwiNl8tizIqD0Myg8Hlb/XRAXlzA2Edxp
 jXft7cGhIVKK4zU7MGVt4z+q4BGYNuAceO/h1oITnmWtbdyi0ZKMyhHgwjh9FUj0wIkM
 qMbQ==
X-Gm-Message-State: AOAM530imgqi6/JsLHcbQxdcG97nXGsQrEj7RtW/W1SdOSpvyiY75LAP
 3Exi2eMV3E5h/j0DA7t2F6HI3g==
X-Google-Smtp-Source: ABdhPJxCn6ctoM00FlOc1yoF19XeRjQs/IZNBLYFjm4Q+m9YdPCqyWhGEwNmugdo3OB7+UGdSg1TvA==
X-Received: by 2002:a19:7f94:: with SMTP id a142mr11353510lfd.43.1597009909504; 
 Sun, 09 Aug 2020 14:51:49 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id t20sm8277045ljd.12.2020.08.09.14.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 14:51:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/4] drm/panel: s6e63m0: Add DSI transport
Date: Sun,  9 Aug 2020 23:51:00 +0200
Message-Id: <20200809215104.1830206-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This begins to modify the Samsung S6E63M0 driver to provide
DSI support.

After these initial changes the driver can already be used
with the Samsung GT-I8190 (Golden) phone.

After this initial support we will make more changes to
support more gammas (more levels of backlight), special
biasing on different display types and handling of the
ESD IRQ.

But let's begin with this.

Linus Walleij (4):
  drm/panel: s6e63m0: Break out SPI transport
  drm/panel: s6e63m0: Add DSI transport
  drm/panel: s6e63m0: Add reading functionality
  drm/panel: s6e63m0: Add code to identify panel

 drivers/gpu/drm/panel/Kconfig                 |  23 ++-
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 145 +++++++++++++++++
 .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 101 ++++++++++++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 146 ++++++++++--------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h |  13 ++
 6 files changed, 363 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
