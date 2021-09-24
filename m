Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F341804F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9895B6E3D0;
	Sat, 25 Sep 2021 08:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9191B6EE8A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:45:17 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id v19so7905643pjh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vmXM0x+L2fy2oUFZKpqZIVda6KQ5BuS4MqABxpV0RLE=;
 b=Fd02+5DZCGdPajbQblz6RtZEdBpaT0RdsW23u2GXu0J+qSxYcUQpvLClMFfMU3Mejr
 liAyY4fcaNt9zqXY0Ten5whNspHlgozFxh+M28hvPsEtjWgzU4y17cqW6fDw5qKeENwe
 RVEcII3WbcKWV5WpIPEMY+PqrhRi2sNm4y1y76/t3Ob5qQXwjhmnXhKN5ohS0UIHyZto
 h4Y0LbskPUXgiZeddW5UwgivBqx0o88Gu4mrbilNmyr426+0zLndSYpI10m9xZcioFk/
 rMJRQAii8MpyZdNhn/5oEumlUE2Rugl1jnuZOM50l2NH3G2omWbxHVckVW9hbCRj/wNb
 sZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vmXM0x+L2fy2oUFZKpqZIVda6KQ5BuS4MqABxpV0RLE=;
 b=ixXL88GBPH0jIORMejR6lbJDq8QESA3Gw1/P8fkfkxrGXUvpVgw8SjCrsJQgZTpwnJ
 dghNZmCB5vDCj2VWGwwgthiSWu4tBrZ6CfoCyVTLlGwJoSTZwoLQXZ9zHGO0NaW9R22W
 MNuo3wdFjOTKbJc9x56VQcjVnbdwbd3bkfQqwg5w1qPBy+tYFNINfd/KwuFnnxLq+oAo
 B2/RyuPjqZvxqFjmirfY5XgZdfeIUIrQHK5L6W4PQRVTzfT4tscnAXj1EXad2JL2eMPZ
 txZS4VEcIya5mbEYCauStRZpd3sLOfQFFmQqfcs+DizT7SnUhwJa2gE88SLXBhEYRrRK
 Ap4Q==
X-Gm-Message-State: AOAM532Vq2jFuKXr3Agma2agvIcrmMSAzR+bgr6humMsAzcgLAVdZXJG
 D23prUsfbSIWE1169CNVQ84=
X-Google-Smtp-Source: ABdhPJybXofQcKpz9+5yupOdPkX9X/mvHj3Fe0KKcW1PyI8x5z4ZraFHO7B4bQLBBOHzDvEhuHAA3w==
X-Received: by 2002:a17:902:c084:b0:13d:c6ef:7cf0 with SMTP id
 j4-20020a170902c08400b0013dc6ef7cf0mr10957762pld.4.1632519917109; 
 Fri, 24 Sep 2021 14:45:17 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n66sm9842029pfn.142.2021.09.24.14.45.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:45:16 -0700 (PDT)
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
Subject: [PATCH net-next 5/5] MAINTAINERS: ASP 2.0 Ethernet driver maintainers
Date: Fri, 24 Sep 2021 14:44:51 -0700
Message-Id: <1632519891-26510-6-git-send-email-justinpopo6@gmail.com>
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

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f46153..3ba3ca8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3762,6 +3762,15 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
 F:	include/linux/platform_data/bcmgenet.h
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 
+BROADCOM ASP 2.0 ETHERNET DRIVER
+M:	Justin Chen <justinpopo6@gmail.com>
+M:	Florian Fainelli <f.fainelli@gmail.com>
+L:	bcm-kernel-feedback-list@broadcom.com
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
+F:	drivers/net/ethernet/broadcom/asp2/
+
 BROADCOM IPROC ARM ARCHITECTURE
 M:	Ray Jui <rjui@broadcom.com>
 M:	Scott Branden <sbranden@broadcom.com>
-- 
2.7.4

