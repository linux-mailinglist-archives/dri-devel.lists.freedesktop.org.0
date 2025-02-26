Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DDA45CF5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56310E1F8;
	Wed, 26 Feb 2025 11:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C3vYJCdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226D510E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-220e6028214so144264025ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 03:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740569182; x=1741173982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AMvhFmeWiiJ59MbWRJ0xc+vmIBHwrNScSowo75dvzJU=;
 b=C3vYJCdLt2Jo4UjDMh6NRkTH/7DXM0HTRVHtXlsdIbgN+oXOld1vgTBPDmScqj97u0
 OJnGjrAzU5ayjOx3RGblyT+cZp7WgzxBdN77qohEBOatmy/GkyeFA1zOjz5v2cjNtOAo
 pC28Q7LlzVXZkAG5rxMfZtYw5J0NK9imcttvDzo44CAzbegPkNhIGVwAmQ4GC1Ji9nB7
 VhrJoHxOcCsV0T9Yvew7IeE+62XTbfVo9G4nD6qrG7e+T7K8AnAeo2oxzwCzjy7A8U2b
 Y+sht1otKDshynLKda1t/8PNpdD14r469bTqXWXlPBE1tFNmwA2vdLD7DJVf81RsRSnK
 2gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569182; x=1741173982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AMvhFmeWiiJ59MbWRJ0xc+vmIBHwrNScSowo75dvzJU=;
 b=Wctv8K2K6ve9SWbSsLgznHtDbwkmMT7H3MnpN4iXX6XAuQ6B5Pnnhlf+rJONM3Ab7r
 RKxG1uMRRhmy7HNJ7V5y+j/VbMeI0fs7+TjonqA2u/kWsSHEN9wH6u6uijBl0mtO31xk
 xYUi7Mqh5HlxEnra1fJ/lYYyb3yS68tCjWWGBdUND0l6nxVr2YnXGOnhsq9SSIHGk0JP
 Y95Yw2OMpLkzNP/sqmySJC5O2OvCn6PmY4jRdNhpUtZE0C9W3Uu+fnODgTOmJhSwTthV
 ylcam+ToqbL3OhBG9SGtZ+QpHqm7W+BwYAYH9XkC0xhJCzoQQGUZh8iw4Q3l5MrRwuuO
 DLuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIOsjARFAvEC4p0sl06z1MRRhlT8VXxf9jbDkuHIspdQf9h+RNSlmMtZ5AmSTVIe03YijfnDRNroc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNom2hFTJD2bjWg5PLoG8c11mWaqCjrplB2iOuZm1EJBe1hEZQ
 o16gq2uSN/oYrQEGKL1QK8fW8LJkA8fuXWOkaYGiLsdfTCVg0SWl
X-Gm-Gg: ASbGnctETKjnou5tLLHnTmIl8UQ7K1BwnsWeM8t8vTYEHHmI43x8ylCg1t52xRKqfW8
 LASK8gJqHqV32l074n1tb4Gka3WS8GzWRi4S9yXjCJv+U7LPgZYEf7f3MiHlUMIAsnFMrywUxHd
 pdnpw6MKzXsPu7WbF2qEPuW/uVGmPboy5psBdwXdC+WkAlX78pfSnR8XEvNCEAMgeBSZlVdlLNZ
 LA/fNHfGXrlgKnfN08K+5/Av5Z+jzHIQERMJqtjACK36yo1Qe3OP6MDGFEElY/6tOWVFckJ7Sbz
 pX2Kp1PkMgQ6iQj28FwXcKO3ieTZnTeoPrULKbc0AwcEFmQqDwTQplsNCQMdhn95xjvWEw==
X-Google-Smtp-Source: AGHT+IEMiq2YU5RKJm3D770WMo6TL1/47tghAXdIVx19pY6j2yorw9+JiO//+tAGrvPkBGyhZtqsCQ==
X-Received: by 2002:a17:903:1a86:b0:223:225a:7e4d with SMTP id
 d9443c01a7336-223225a80c2mr37478285ad.26.1740569182523; 
 Wed, 26 Feb 2025 03:26:22 -0800 (PST)
Received: from localhost.localdomain (221x255x40x66.ap221.ftth.ucom.ne.jp.
 [221.255.40.66]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0009a0sm29800345ad.27.2025.02.26.03.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 03:26:22 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] drm: panel: Add Generic MIPI Panel Driver
Date: Wed, 26 Feb 2025 20:25:47 +0900
Message-ID: <20250226112552.52494-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
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

This is a Generic MIPI-DSI / DPI(+SPI) dual stack panel driver.

Although the MIPI specifications define how to communicate with a panel
to display an image, some panels still require a panel-specific
initialization sequence to be sent.

While there are many dedicated drivers for such panels, they are very
similar to each other, except for the configuration parameters, including
the initialization sequence for each panel.
Since there are numerous panels in the wild, adding parameters to
the driver for each panel every time is a pain.

Instead, this driver offers more generic and convenient method.

Its fundamental approach is similar to the `panel-mipi-dbi` driver,
which sends an initialization sequence stored in a firmware file.

Moreover, this driver allows display modes, timings, and panel
configuration parameters to be stored in the same file.

I've also come up with a firmware generator [1].
It helps to create or configure the panel parameters on the web.

As a reference, similar generic drivers currently exist:
  * drivers/gpu/drm/panel/panel-simple.c
    - Supports wide variety of panels, but no init-sequence support
  * drivers/gpu/drm/tiny/panel-mipi-dbi.c
    - Supports init-sequence, but only supports DBI panels
  * drivers/gpu/drm/panel/panel-dsi-cm.c
    - Supports DSI Command Mode, but no init-sequence support

[1]: https://kikuchan.github.io/panel-firmware-generator/

v2:
  - Drop redundant properties from the DT binding
  - Fix the compatible property and examples in the DT binding
  - Drop support for the redundant DT properties from the driver
  - Fix minor issue in the driver
  - Add panels to the DT binding

Regards,
kikuchan.

Hironori KIKUCHI (3):
  dt-bindings: vendor-prefixes: Add hothmi vendor prefix
  dt-bindings: display: panel: Add some generic MIPI-DSI/DPI panels
  drm: panel: Add a driver for Generic MIPI-DSI/DPI(+SPI) panels

 .../bindings/display/panel/panel-mipi.yaml    |  121 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-mipi.c            | 1181 +++++++++++++++++
 5 files changed, 1315 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-mipi.c

-- 
2.48.1

