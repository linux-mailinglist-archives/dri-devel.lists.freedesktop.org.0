Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DC6EFA6A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5849110EA01;
	Wed, 26 Apr 2023 18:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275C10EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:55:01 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b4bf2d74aso5901595b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682535301; x=1685127301;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=997wcZsLPXSjxvxtNnVAzBL/b0WavYLyXHx/RJFuEtg=;
 b=aUuvqyNKlA5I0oZy805T2an9GEfL+KC6++nGq27+EUSXq9LK9+jWRy+fdW8XPL2BHV
 2SLcXJEqYVAqbwqb6zBbRN2HtBf9xbb/NFq/KoRNZ/a/jPdc7SySEifL99a7Nkkq8bNz
 fzsU4YXNX9ZJRaPwQm6X7I2sku4I8pis5Dw+gAaUYWb7zlnZ6tm6uRcoeD0zn++ssuZE
 Hon/AWOHYo24U9K5xLPuozBb2Zt/PDDcNSJ3nSuKecJxTLNI8Tc+I3sPf38XSg0o7oz0
 kb1vp0kQ7mgRLACpPno0hxGzV2baCHigl/G4J15x3YWnP+NdD9LfMRYDDFOsj01gQfqR
 YQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535301; x=1685127301;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=997wcZsLPXSjxvxtNnVAzBL/b0WavYLyXHx/RJFuEtg=;
 b=XSzMXVNBwFgtYyALNkGog85gsJxMKdDHyQqnPfo9wP537dTKoohnVTi9ViifGl0gSX
 5nmLnwylSA1bc8mvLAhgVLv12aBfv2koOUrUaRnV3IWDZeusnkSGAUChS7tjxNKux9Sj
 iKXw7Uua+XvH8zG+CoI2JTynT6p5phoBZjuQf8qHafbVTMcFhQ1DuuzoJQgZf9x+aYGA
 lC9KaNyuE3vuvcfxnxQ64/yTvYxZ3bGSQzH1x2LmQKEEzwDehmeaZHfp7YhEW2oAs5dX
 3So8JOBu0db/ArWGKg529ASAl/JFqAL96ZC2ZQKlYT7gW4NuQVkR3YTxMiLGqFZhbyCW
 eSuA==
X-Gm-Message-State: AAQBX9cGxbVEBHgGM+laVF1udMdE9IFKyNqpZgYnIIrd3a+UeN3eSIQC
 Whyg/uJycyocNn+mMKyefe4=
X-Google-Smtp-Source: AKy350Z0cJXW20DTfOvXiRpjr1pWWqpblVlGo4EGb5Y7ZS1Ssx3KNESQrFJo2MKIsbY+cizfJdt0Mw==
X-Received: by 2002:a05:6a00:17a9:b0:63d:2f13:1f3 with SMTP id
 s41-20020a056a0017a900b0063d2f1301f3mr34588884pfg.33.1682535300748; 
 Wed, 26 Apr 2023 11:55:00 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm11639254pfb.104.2023.04.26.11.54.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:55:00 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2 net-next 6/6] MAINTAINERS: ASP 2.0 Ethernet driver
 maintainers
Date: Wed, 26 Apr 2023 11:54:32 -0700
Message-Id: <1682535272-32249-7-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
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
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add maintainers entry for ASP 2.0 Ethernet driver.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
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

