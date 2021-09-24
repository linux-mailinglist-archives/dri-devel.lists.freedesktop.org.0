Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E97418047
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1886E3B2;
	Sat, 25 Sep 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A436EE84
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:45:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 bj3-20020a17090b088300b0019e6603fe89so7036385pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/7thBtiFxBveRQEidg5D1xv7aHxOGwL3MpL4sZxKG9s=;
 b=BUiHYCg7d2KQMyCmiKxmTwau4pkK5OLeLk25oWbbtUr52GcMYDxCVNMsc9BlDSushx
 QGuh215qDMwvG8I2FGtLNzZGwTofYEc/zontjWxf/ui1dzVAzb7pErzwr3pi9B3CbwzV
 y72U/h3qHf55kgLm1Xi6nqrJeDxvPnWc/wKKSo5CfV8ZR9eKVzsbkv3e8PDILmbqYX3X
 J3oEA+4Xw+wHjtCpmpUKE1GYmMvTZsvPFAhDCy+0Zy1blvk0dZM87qDMMlaxUeqq2puf
 QGOl2xwoVuOJH3Yt/YY4N53NLYqC3iLbk17dVvz/JgbhqtAKcfdiot2PJl1MYWQIqpdX
 QcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/7thBtiFxBveRQEidg5D1xv7aHxOGwL3MpL4sZxKG9s=;
 b=C6L5/eELnhd463NSkGC4cXbH2w7mUz+zlgL++06GVGVAoK413rsvInU3/wZbdrepV1
 6MqwfHImx+cKEHg1AGfG+gYvBe5UxWiT7KCGAmRVqQuI9YUi1dXQOoj7EiGdPy5zgXi9
 JCsWcsYXRVfDZPgluxQ5BmBqqq70LvUibnix4nhBzMmpbiUerlhV0StHByuFmXRN1J9m
 IGkQMNpKgHC7oEWSqw6lcMZSF2vZTV+0H/P0GfUCvVV0kqbICKD9SgADP/sbK4uQDPNd
 jTEqxYozsD8+ykr23RVgM58nDtZxZROfQ79ND8fRgr4epvrGGCrc9QKOoVXXxQZj+oQB
 S+7g==
X-Gm-Message-State: AOAM532GbA34RA44S6oIZ3zLZ6SbWprLgz9Gr7P5fhMDwacJNpH6FsXS
 ZpxJ51C/PTIBBgvDEZXQfos=
X-Google-Smtp-Source: ABdhPJxaJcDYyMdYo8ayqsa6Od0sqf3BN67AAF8xDoV+dzkNXnrZupGzbxhPWCm3jBJgdhRqYI+kAg==
X-Received: by 2002:a17:90b:3685:: with SMTP id
 mj5mr4800359pjb.222.1632519908620; 
 Fri, 24 Sep 2021 14:45:08 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n66sm9842029pfn.142.2021.09.24.14.45.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:45:08 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Justin Chen <justinpopo6@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK),
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH net-next 2/5] dt-bindings: net: brcm, unimac-mdio: Add asp-v2.0
Date: Fri, 24 Sep 2021 14:44:48 -0700
Message-Id: <1632519891-26510-3-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

The ASP 2.0 Ethernet controller uses a brcm unimac.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
index f4f4c37..02e1890 100644
--- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
@@ -20,6 +20,7 @@ properties:
       - brcm,genet-mdio-v3
       - brcm,genet-mdio-v4
       - brcm,genet-mdio-v5
+      - brcm,asp-v2.0-mdio
       - brcm,unimac-mdio
 
   reg:
-- 
2.7.4

