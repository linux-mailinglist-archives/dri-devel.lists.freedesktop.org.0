Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017D4CCA61
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10FF10E3EB;
	Fri,  4 Mar 2022 00:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2BE10E3C2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:03:27 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id ay5so6264202plb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 16:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uhcD4UvaPOzmyw+JIMMImnAjRph755cmDjQJ7NEOGPo=;
 b=epc/hkkPONQlmZ2L6W9lZGK93Yj9NTYnrX9YhoRHv7uSPpZFJOeEeI9TMf6AZgGbAA
 cZa2P3MQ57+v/jQK4M0xtcY8ft/B6paTbrfvKHag90BjZm6vRk3lErU5m6EYgLLvWWHz
 xpN1iSrHPHLvZCj+mpDl3J6BtKsDOfKDHnAe6XeHUdA69lLgz7DuOacfxwMAqL8+DHzT
 ZrKMnodmNP9+HlzcbqAT1PxHtRGGpw+KYjcdf6IO6SJ2AY6a85u3snSNwc+wyb4mY08y
 15ME72/O9ucYQNfFbVngQ57XLjIVvE8DcM/hbNEWc9DPPRkROUrxDhewz7I2/CxEya6r
 0Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uhcD4UvaPOzmyw+JIMMImnAjRph755cmDjQJ7NEOGPo=;
 b=1g236Ee5lWL3/Ydjfd67Zhhqgk39lWrE0u+O7n555g4cLR6HoSwNexyZu4nrrkVTom
 WKoDO7uL+i6gikKtLy+6VFpgo0BqJyDLdHmnrXd/MElXjrhCi37KaJmNMYUqasS53sk1
 2xm9uOteoNsT9HREFBnP0DlAMkoMmuiDwnJKMKjwEUqpkgxuvuEpvYj90MYg8GYSRufM
 OYq1b9wT2v2Z7LuLWp0u56ho6moxxbIRIDpO3i7kt+c4I8zL3+X3gDdOFncetFg42a6S
 1p7ElxH6OVH11rBZcyjxZ6I8zM8XpeI4UAKR2YVbf0buM9e+MbDlryRSTH/Nwi5Xuoy8
 iZoA==
X-Gm-Message-State: AOAM533ZQj9U65yuLyypnniyvqXkT76pykxKJL6b4WlkuE0Tgycfg6f0
 J641T61PYxhBniGjMH0zu3k=
X-Google-Smtp-Source: ABdhPJxnSRBdeXggNjwOC3GlHeBWS9e08z+WqN7h9hP28KglwVu0Nxdfq7EsiiynMdPOJRjcp+FEGg==
X-Received: by 2002:a17:90b:4d8a:b0:1be:f5f1:89d3 with SMTP id
 oj10-20020a17090b4d8a00b001bef5f189d3mr8012723pjb.79.1646352206557; 
 Thu, 03 Mar 2022 16:03:26 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa79588000000b004e1dc67ead3sm3579070pfj.126.2022.03.03.16.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:03:25 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/2] dt-bindings: Convert GFX bindings to yaml
Date: Fri,  4 Mar 2022 10:33:09 +1030
Message-Id: <20220304000311.970267-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1: https://lore.kernel.org/all/20220302051056.678367-1-joel@jms.id.au/

This series cleans up the bindings for the ASPEED GFX unit.

The old text files are deleted for both the description under gpu, and the
placeholder one under mfd.

The mfd one existed because pinctrl for the 2500 depends on the gfx
bindings, and at the time we didn't have any support fo the gfx device,
so Andrew added the mfd ones.

The example in the pinctrl bindings is updated to prevent warnings about
missing properties that pop up when the gfx yaml bindings are added.

Joel Stanley (2):
  dt-bindings: pinctrl: aspeed: Update gfx node in example
  dt-bindings: gpu: Convert aspeed-gfx bindings to yaml

 .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
 .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
 .../devicetree/bindings/mfd/aspeed-gfx.txt    | 17 -----
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 16 +++++
 4 files changed, 85 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt

-- 
2.34.1

