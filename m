Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD6528A57
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 18:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440BA10F99D;
	Mon, 16 May 2022 16:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC4010FB88
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 16:29:09 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tk15so6242456ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z664EsRbmKvMTMJMIIbFibyESl4V8wTy2xC+qQ6EHX8=;
 b=S/mO7960uNYEyhFA9Xj5FaZrLw0jj70ilWt3AWMKNI7ilvT8/W/389Tcb3DDQZpfuU
 Y/7/i73+FLJPOpwFgSfWBvdJ6gwnWiakkcMWOb0keOrc5a6q2CcwdCwf38r41ZfG9uFE
 QTDPHqMZiCvyGXWjts9lxESFX0q+IWXYbwUMV3N/lM0PJFeqkYYiG6f05BIkBoBNIyxP
 bNdTMqRgOvRn9PpFfhEB5cYJ7ue9GvMnWme3G5V7LDC52rYegJsw7F+xThHg6PX65ktJ
 SaLrlCzfZviz1WuRzPNL/H/+WlnioG3WqNJRxeWpAcKHkWD0NUVNVtY79yL0vbGbFkj7
 kYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z664EsRbmKvMTMJMIIbFibyESl4V8wTy2xC+qQ6EHX8=;
 b=CjvgM67yx9yTACXPfjLhuQWQ2OkotZBMkxbWUZ1XOBbCRBOoqpq5IswnHx6qX19yyK
 Qvq13k0E0D2C+RtrWK8X9kKtkj4k4uFvdejyNVlZ68s6zwVz47rKQSV+dWeo55gOAe+H
 GymoOFB+7IX5jdnoRmnu0DYKGgr9/F64xirB4yYko/PQ7f2KWif+JjKtUwJ8nkfdOj1N
 DHyMLFXW68FT9wEpRTUNE0y1Zk7BbQEB2//KJMcXgc+f4o+AO/QIQHLVx9aJPwEL8o+I
 vWdTp8A/EcpNDAgRcJ8v1b4l/oslO/lSVBSFpJ1k4UHRpdjviHvMXkskeIEyZ/tM+WKQ
 Xd4Q==
X-Gm-Message-State: AOAM531EZgrnNZ/sicqsiYbNqYlEe0nejyFNRlS3ZInO7TqqqG9I817N
 zrZQulWE0fPUENqd1baNsG4=
X-Google-Smtp-Source: ABdhPJwqdsWUekOMU8dN2Q7HZJY3pp4HFQiSwnN1K4N0Ebz3Z0wTMdmY/DKl2oOhTcjaattKUXcuEQ==
X-Received: by 2002:a17:906:99c3:b0:6f4:a9d7:6dac with SMTP id
 s3-20020a17090699c300b006f4a9d76dacmr16118497ejn.85.1652718547605; 
 Mon, 16 May 2022 09:29:07 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214e3bsm58819ejg.161.2022.05.16.09.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:29:07 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: max.krummenacher@toradex.com
Subject: [PATCH v1 0/2] drm/panel: simple: add bus-format support for panel-dpi
Date: Mon, 16 May 2022 18:28:24 +0200
Message-Id: <20220516162826.23025-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>


Commit 4a1d0dbc8332 ("drm/panel: simple: add panel-dpi support") added
support for defining a panel from device tree provided data.

However support for setting the bus format is missing, so that with
the current implementation a 'panel-dpi' panel can only be used
if the driver of the display interface connected can cope with a
missing bus_format.

This patch series defines the new property bus-format and adds it to
the panel-dpi implementation.

Check initial discussions [1] and [2].
[1] https://lore.kernel.org/all/20220201110717.3585-1-cniedermaier@dh-electronics.com/
[2] https://lore.kernel.org/all/20220222084723.14310-1-max.krummenacher@toradex.com/



Max Krummenacher (2):
  dt-bindings: display: add new bus-format property for panel-dpi
  drm/panel: simple: add bus-format support for panel-dpi

 .../bindings/display/panel/panel-dpi.yaml     | 11 +++++
 drivers/gpu/drm/panel/panel-simple.c          | 43 +++++++++++++++++++
 .../dt-bindings/display/dt-media-bus-format.h | 23 ++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 include/dt-bindings/display/dt-media-bus-format.h

-- 
2.20.1

