Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5D58EFFD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEE68FE45;
	Wed, 10 Aug 2022 16:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F34F12A84D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:03:44 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id i84so12501713ioa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pLszvMp06j4ZdOd51Hbi3XTm/T7L8XdJjW4rKKC5yT0=;
 b=TjVnJEV2ndOr0ZBcIBuPWV0T2ynheHTyWYk8LnV8YiubHYBm04P1wPp5kqI3J6RFgU
 IRRYulGPE7fiUrHKrtThpSa9WlEaJqSk61jwXJMCaCIZJQ36zkGzaD+T+QERwuJVxNYB
 ZnztzAZrndxxWWa6qqNzOt+POpjOR1IvT+ruH9lMwIxOF4feaHz+VGCgFrak0rT3YjAj
 lvGLeFFnZyYRvmsxvh6AdkgMMm0vtf8m7EIC/QsiAbOrr2OPKfVxSOgWjvNjA61yjaiw
 AWe48N2HwSLHCCtUTm0a66HVqJHfwbuM80waAmHsJvWeJb7mrn/pLHP7U02rww6TxsDs
 tsjg==
X-Gm-Message-State: ACgBeo3P2PvGp8pArzg8LEnSINtBik6Om036A3CmT1wSH0L6r/fBuWhC
 QEOoQWOxdl9YmlyWbHzeCQ==
X-Google-Smtp-Source: AA6agR4+T5TZB8tmai+ZHR92K3UgZWu/lvjnSFQjQi9/vetr7i8iQFHeQNJ/h7qEmSMf7JBs7XaLkg==
X-Received: by 2002:a02:6d1f:0:b0:33f:8d28:4d6d with SMTP id
 m31-20020a026d1f000000b0033f8d284d6dmr13241554jac.16.1660147423297; 
 Wed, 10 Aug 2022 09:03:43 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 a27-20020a02735b000000b00341a215d3cesm7617629jae.63.2022.08.10.09.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:03:43 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/2] Convert arm,versatile-sysreg to DT schema
Date: Wed, 10 Aug 2022 10:03:39 -0600
Message-Id: <20220810160341.51995-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This short series converts the arm,versatile-sysreg binding to DT schema.
The binding is already in use in examples which unsurprisingly needs a
fix with the schema added.

This is part of getting rid of the remaining ~40 cases of compatibles
without a schema in the examples.

Rob


Rob Herring (2):
  dt-bindings: display: arm,versatile-tft-panel: Drop erroneous
    properties in example
  dt-bindings: arm,versatile-sysreg: Convert to DT schema format

 .../bindings/arm/arm,versatile-sysreg.yaml    | 35 +++++++++++++++++++
 .../bindings/arm/versatile-sysreg.txt         | 10 ------
 .../panel/arm,versatile-tft-panel.yaml        |  3 --
 3 files changed, 35 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,versatile-sysreg.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/versatile-sysreg.txt

--
2.34.1
