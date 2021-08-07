Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25503E358B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 15:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D989AA7;
	Sat,  7 Aug 2021 13:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6E3899E8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 13:31:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so10943282wms.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30uracpthIuXSs44lu6RRxWBv7NJjXzBaQjU8TB5510=;
 b=BO8bcpN1CIWN0qYdxusjoibcUU67AZWWmWilv+lZwrVsDPJleQ9ekpLFEjW7YW03HZ
 gJP1goMCAonYPOfB++ZDgr0Pm2oRgiQAY4oTO3e0kFNTelCkRLn3NE1uiTARcJFWqT1H
 yEisMEZAUL3Shh1uCuzbs7P8lawCq8mWFWfkFcZJEueY6yMUsHFfs8gTAQDm4Wtbfggq
 glZAo0z7mdPSUazEbB2jDMTv6itSKqP9y5x6nW9Y/4RXde3ERHXP8xQceQfM9nKt10q9
 IIEbi5NMP8rkuuTk+akfQqNkhHHZoATtrmqcqL7qYanRVnsCx2KpEs0CDLhxPiXqxpqa
 6t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30uracpthIuXSs44lu6RRxWBv7NJjXzBaQjU8TB5510=;
 b=pjM0elwm5F4tFZbpsuJLh1Mif7U3oL8HxDi9iHJFm6rSMKjtHKyq/48KwuJ706VsDW
 Yj3caR2lDwz9uP2MjM75JZoE4ali3t5TJxlgMVTNQEZuuhI/1r772NFqZhVcRGtHFlOK
 kLnn7Jj94SFNL2HVLqgbTMh/i9tOGkFdQNEBJSE1w+RzIVzGX5tfsMoSJpexItZkVNDz
 5q/d8mez8LOjlwkohuSxR6fabWfO3p60jmWCP64MJVcD8Od6TEwJzAceR6e5IrnxeMY0
 tzzrd/bb1nTtguYwCYSa1aHN1tOabmY6DZ29G0qNPHS61UJuXDdAwZWZN1sZX13tybdr
 YPsQ==
X-Gm-Message-State: AOAM533VFkq9G+uCZaM+fhvobBFegky/G6XjOkq78PaVhG8RxrPFu8dG
 Qw8XRJ3OLBNKBM7rnxX7aUY=
X-Google-Smtp-Source: ABdhPJwdkY7aIdXNZw3I4FK3IgMpiEezPwawBNuDlPLqTlDrV6SKa/gC1/V+bA6Gy4eIvJ8+36kIqQ==
X-Received: by 2002:a1c:7fd3:: with SMTP id
 a202mr25834149wmd.150.1628343080296; 
 Sat, 07 Aug 2021 06:31:20 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([62.122.67.26])
 by smtp.gmail.com with ESMTPSA id x12sm13254454wrt.35.2021.08.07.06.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 06:31:20 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 phone-devel@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 0/2] Add support for Samsung S6D27A1 display panel
Date: Sat,  7 Aug 2021 16:31:09 +0300
Message-Id: <20210807133111.5935-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <YQw7M7OF6OZLcLjk@ravnborg.org>
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Samsung Mobile Displays(SMD) Samsung S6D27A1 panel.
This display panel is used on Samsung mobile devices such as
Samsung Galaxy Ace 2 (GT-I8160) also known as Codina.

Markuss Broks (2):
  drm/panel: Add DT bindings for Samsung S6D27A1 display panel
  drm/panel: s6d27a1: Add driver for Samsung S6D27A1 display panel

 .../display/panel/samsung,s6d27a1.yaml        |  97 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c | 323 ++++++++++++++++++
 4 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c

-- 
2.32.0

