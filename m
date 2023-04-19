Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBEF6E703A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370EF10E7E7;
	Wed, 19 Apr 2023 00:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242FF10E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:51 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id l17so10528716qvq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863050; x=1684455050;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=e9ELuaxovAZK107S+i/lSGtgzWrNVqegvOgbyEPR6lQ=;
 b=TgDPsyZ1jBiBNae2UNayCnoPatUMqJfdKQIaYymmlbnKkfDWn7HE9FtZXecYXWbvmy
 SQnf87vdKQOotjJz7TvP7+xX0CxpkrcPRr2KjczH43l8fTtM1Hxu+kSBEQIv7nCa8HpS
 9LOzE82ION1FnEzjPGgJ56Y6PfCkbPoHDOiDGgnpA5lQs8RAlFGjlQ1LGyAyCSclQdDM
 UjXmvmNbaBzFgr6dzoHmq9tQrr1GqcAXQp8sa00EnyD4zWpUD3NOw4MzCz4xfVYA3dM7
 YNtWCm2YbSvY7lUCOHADi9FajcLM/l9JPmJoOODkDuk7qpGc2NVo35AZ3HxPLS29MwNO
 2sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863050; x=1684455050;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e9ELuaxovAZK107S+i/lSGtgzWrNVqegvOgbyEPR6lQ=;
 b=idNc0lz62kLCwCx4tCANDNSvOYDfX00Ps+PrEOBarg/AJBzQf+wfgfMuV/kg9h8myX
 fIpsmq5Cjl/hQysIuZOuEPI59s/iZgHEBmDyzjl6jQZC/+IzWkyCnqZsgueXpGtQMfS3
 iaSXHXm/k4Z99RfitriO0pwLRP/bkLbaOAvkXPBmGGMce7ZNsTIq1+lTC8c5MCwubAjW
 QgMeM8UXOS3PpGwqym1F32P9K9o8AaBGIsDE6wk8pR1923XSzsKI0H6Rkkd3WEq2R8IP
 wFLfRC4O2fcnqd+tj+L5IdouaHJ5yu/VkfdYLemuIQHVVZ+z78kwnbQ4PIOQ6n2ro0kz
 u5fg==
X-Gm-Message-State: AAQBX9eaZcusOS5wdw5VmPzgAJD53qk2PVUDMyhb1emnICqIPELu9/PL
 c18f8MLwJTnqFZ7n3lSfL7I=
X-Google-Smtp-Source: AKy350YAySwOPYgIwQnF0LF8BMbshq+v1WxcDSvfQk1fGEMDH6OmZSxu8FMKW47JggpKX+oc+lJmWw==
X-Received: by 2002:a05:6214:20a6:b0:56f:796e:c3a5 with SMTP id
 6-20020a05621420a600b0056f796ec3a5mr22713215qvd.4.1681863050059; 
 Tue, 18 Apr 2023 17:10:50 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:49 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 6/6] MAINTAINERS: ASP 2.0 Ethernet driver maintainers
Date: Tue, 18 Apr 2023 17:10:18 -0700
Message-Id: <1681863018-28006-7-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 Justin Chen <justinpopo6@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add maintainers entry for ASP 2.0 Ethernet driver.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4fc57dfd5fd0..24cbe1c0fc06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4189,6 +4189,15 @@ F:	drivers/net/mdio/mdio-bcm-unimac.c
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

