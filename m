Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B26709E7A
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34EA10E5C2;
	Fri, 19 May 2023 17:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1255D10E3A4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:25:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so32105235e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684506332; x=1687098332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xvLZ2++fQnm+JjIhOF2F8t+cx4hl9h36DRJ3AK+mRck=;
 b=JFVXiWQSmYDU74DDMckE8I1eFbRQZT+cw8e9Lik5jkhHW38xmrHrxIUZjgOixa67dO
 t1HNBo517Z7vdPY0YOBOy0QiLPhBPYjzJdZymvkigS+KhrinR2C6tjJlqcRY18imZ+F8
 uH9j/QOS+uXhW0W77aTFTjFz5I8bN9wsdEBfPdV0sDMqFB20iCMvpZrpVefe1ScwC/Xj
 gE1KMeGi3FgsMCnX7F1JbS2EC0jqDis4EK4FcussUuTFvErnSYY6MLgz/iMeWQLS8LCY
 3Rnl4Eom/33W401g2Lc101fCvNRCF5TeAoPbqCmaHLO++JCEnNxlolEOMzgXV4quxGTR
 6B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684506332; x=1687098332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvLZ2++fQnm+JjIhOF2F8t+cx4hl9h36DRJ3AK+mRck=;
 b=N2alrRbTRlUoMvu24n2Npfg9KiuMxDixgwszJsztCQ/+xV1L5tXiyE5mK7co9B/lrA
 w0Uib4fBVvbIyEDazKmWad4+9fkwEp8DBKX7EtUzy+933t47Y/tP28X6iv2XQFGZzMy2
 CXvGbCUVo+AJ6Dw6ZLqz+SIOEmRXKUmCZRp01xSsrO19TUV5dFQfchaUtnhqSUn+YQXd
 cMP3jsCj/hCH8xHglxrQ0oEHgt1t5C/Xm7HBeTVipGw5QwZSup6UB175QbqSO3anmzMw
 kleCnBYTS25suJVcjtN7CHcwhq3rnh0634Em0zzvAw7Fg/NXkT7E+nlBaiJDvKYFHkst
 YKfQ==
X-Gm-Message-State: AC+VfDzO2VzYyalEZ3RFlJKS0l7JaUh9awykAOYvK/km0/b09XwabpnI
 k2lfIrkstHRYkbfrYhS0MOM=
X-Google-Smtp-Source: ACHHUZ7NWkSGxn/SlGxO8yV6Ikgtyfk9MEXgniVzcGq6Q9SyrHjOpFO3NiuhF4V62VzWRsdG7lyoVg==
X-Received: by 2002:a7b:c7c3:0:b0:3f4:2174:b28a with SMTP id
 z3-20020a7bc7c3000000b003f42174b28amr1441643wmk.15.1684506331605; 
 Fri, 19 May 2023 07:25:31 -0700 (PDT)
Received: from fedora.. ([95.168.116.22]) by smtp.gmail.com with ESMTPSA id
 h12-20020a5d4fcc000000b003062b2c5255sm5451748wrw.40.2023.05.19.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 07:25:31 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH 0/2] drm/panel: add fannal c3004 panel
Date: Fri, 19 May 2023 16:24:54 +0200
Message-Id: <20230519142456.2588145-1-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 May 2023 17:44:56 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal C3004 is a 2 lane MIPI DSI 480x800 panel which requires initialization with DSI DCS commands. After some commands delay is required.

In previous discussions for device tree [1] [2] and device driver [3] were named mipi-dsi-bringup.

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/CAO9szn3t-giVipb5oH_3mzQZbnXbDqqz0WEg8uAmo-1W2uKzFg@mail.gmail.com/
[2] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com/
[3] https://lists.freedesktop.org/archives/dri-devel/2023-May/404775.html    

Paulo Pavacic (2):
  dt-bindings: display: panel: add fannal,c3004
  drm/panel-fannal-c3004: Add fannal c3004 DSI panel

 .../bindings/display/panel/fannal,c3004.yaml  |  75 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-fannal-c3004.c    | 405 ++++++++++++++++++
 6 files changed, 501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c

-- 
2.40.1

