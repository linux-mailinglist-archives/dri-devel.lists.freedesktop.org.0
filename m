Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316387BFAE7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ED310E168;
	Tue, 10 Oct 2023 12:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0044610E168
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:14:14 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c9b7c234a7so3406075ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696940054; x=1697544854; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L4rJvZa60kTdbII8l4EjwZAg3vHn1h6W4k0foh1IZsI=;
 b=0fKarvbcC22en2jIV6PeDrT0ohJIDNwuwFyR1ZcGoxGI9RWhHUQxjrqsQiBCQI9bij
 MU/Jwkg8k1rpjRsy7sy9IYWi0xKGZ6Az4oOA/4tGYHC/yyx2ntO3toKVmW2CLt6yZpNV
 jUvKQtAxNkracWiDkDnp8/eDSuOBqbIfItAm0TRBAuPqT44nB480IS93+m7paZGNd+MS
 k7TuUuO9SfooJa7O0l4NtZk+EM3i5T/zkRhqvJ50O6OQyCcFGwaO0TYq2cXbBN+DEC/j
 GAPJzvgxoUa3u7brfsthhI/kVmz63e/1yJxe913YHXb2Go2tS4mUybFnESLyvt3V6fEb
 rmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696940054; x=1697544854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L4rJvZa60kTdbII8l4EjwZAg3vHn1h6W4k0foh1IZsI=;
 b=O2KyDKhczzJw7xRo+mNyFEbwY7FRqv/yr8rzFrcNOJLjXM9vU3LW2ULZDo1ZUaR6A1
 lAdQ/AJH2DOTN7sInpIKzsDd8a7lG/Dvfv1k0JO7xiBss9oz/bDOhRqsQ0HBQzNqxG06
 9qD1vsoiSzDxUGbOCp0auL9kouZlxRMG/QDbf/9lOq0LRmw6cz1CuZbPMfdEbG8nrgbn
 +R2B+HRD/x7Wt4i/qR0Lj8qQYWJfQeaZZ+kBzA8RbfR8jRtmIZ+mYBinnJwktOePa0Ma
 D1UpmU/uuV2XKTBvLPJfqkWMTRG1lOCVJGHBxUzN8i9U76DwiqC9NC8eesQFjS2uIqnK
 eDIA==
X-Gm-Message-State: AOJu0YzPECbnaN2z2A3s9VWMdk88CYc43jDCuU2da0mQdhNh8GGiem+6
 eKYdDwnkB7Jgv/RlyuyeCVIUcA==
X-Google-Smtp-Source: AGHT+IEahAveVzw5XhYWHKCv6MAhrD/avXVl3tCeCx1XFdgFa7h7YmS35nM4LZujP7PjYmlnjFBbUQ==
X-Received: by 2002:a17:902:ee8b:b0:1c6:2927:fbbd with SMTP id
 a11-20020a170902ee8b00b001c62927fbbdmr17803939pld.18.1696940054475; 
 Tue, 10 Oct 2023 05:14:14 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170902ecc400b001c74df14e6esm11570486plh.51.2023.10.10.05.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 05:14:14 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com, catalin.marinas@arm.com,
 will@kernel.org
Subject: [v2 0/3] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
Date: Tue, 10 Oct 2023 20:13:59 +0800
Message-Id: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus series proposed to break out ili9882t as separate driver, 
but he didn't have time for that extensive rework of the driver.
As discussed by Linus and Doug [1], keep macro using the "struct panel_init_cmd"
until we get some resolution about the binary size issue.

[1]: https://lore.kernel.org/all/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org

Changes in v2:
- PATCH 1/3: fix Doug comments,define "_INIT_SWITCH_PAGE_CMD" and remove the "shutdown".
- PATCH 2/3: Modify ili9882t_switch_page function instead of hardcoding.
- PATCH 3/3: Enable new config in defconfig.
- Link to v1: https://lore.kernel.org/all/20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com/

Cong Yang (3):
  drm/panel: ili9882t: Break out as separate driver
  drm/panel: ili9882t: Avoid blurred screen from fast sleep
  arm64: defconfig: Enable ILITEK_ILI9882T panel

 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 782 ++++++++++++++++++
 5 files changed, 793 insertions(+), 371 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c

-- 
2.25.1

