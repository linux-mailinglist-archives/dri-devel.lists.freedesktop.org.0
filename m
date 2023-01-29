Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361A67FF8D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 15:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8C10E068;
	Sun, 29 Jan 2023 14:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B52E10E069
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 14:31:57 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qw12so9332702ejc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqhRzedXTjAYBhupeTXHmy5HkP7oFM6wXur1/uCGklY=;
 b=bMAnX4NH2gBVWNMBfP5T8Ig0AvaeOIcfVbfjU9ga7Yfd7svUSS0vKBh8RC6QF70zWc
 pk8+ktReuJWrI1K8aSy2tHuXIujU0RCm6gYbpL6tO7UlmXKrMQ9ocgrGYtFjWC7rKXoK
 0n3MdHHfPH+TRwyO0RE3K4dOkI7At7MnSUZlt5QbTznbJ6HcjAr2rcYDcvuB3VB39DzF
 gApmu09u5PWt0XdEoKam87WxQdMlxLPDoJnZbyWapFMxEQxstqLK7e5z9sKxMwyGoYDd
 xXFdYIOXFK3wvxHqrACp5LKicZ0ye/amSkf2Pnzi7uyYgaitH+cECyZ9MGJByU/pvZnw
 /I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dqhRzedXTjAYBhupeTXHmy5HkP7oFM6wXur1/uCGklY=;
 b=22l2LOmOQkBkojJYJ86mOdjL2lsnDy4JWsWEacmD/nZkIBOuOdcbDZ2pXPb7WcZHTX
 mbHxe9i19viHh2UlJMnAm8jN2W0g1WFjvguAxoES68K6ipBz3ypvN18m29bCZ8X370gQ
 e/K3l7ZjusJZdRsLJKAdjuMSZ9xN36kg0Mp9SgaPSayB06vVQrqnwRXpzzPJFpUnANKb
 OvQxLsD+nJJ7PKoveduQjshYfB8mLiSTw7mA/Uz+gUzYd6lqVgSazTn5bViAwK7wE31l
 fLMDU4PTQIYn7VsZrEKTeVP4+r8o0w2KFUBwovPiwRElzWOu6zMo0sgwCqUGqLGz4eqW
 OK0w==
X-Gm-Message-State: AO0yUKWKTgzQO7aJBq+t7gjjitsCMyeSwxFw09up2dF6jdKmCvm8WKGM
 0TJvP8km0oPrs0SVTngxHMM=
X-Google-Smtp-Source: AK7set9uBH1IEdS5caA0NsadN0JraxcoEyiaqZTtiJt25gcTfJD2f4f+/jMxjc2QNlzyRT4puPTrhg==
X-Received: by 2002:a17:906:eb8b:b0:878:7f6e:38a7 with SMTP id
 mh11-20020a170906eb8b00b008787f6e38a7mr12114060ejb.44.1675002715769; 
 Sun, 29 Jan 2023 06:31:55 -0800 (PST)
Received: from localhost.localdomain (83.6.123.74.ipv4.supernova.orange.pl.
 [83.6.123.74]) by smtp.gmail.com with ESMTPSA id
 jr23-20020a170906515700b0086f4b8f9e42sm5410128ejc.65.2023.01.29.06.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 06:31:55 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/3] dt-bindings: display: panel: sitronix,
 st7701: Add another panel
Date: Sun, 29 Jan 2023 15:31:39 +0100
Message-Id: <20230129143141.173413-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129143141.173413-1-maccraft123mc@gmail.com>
References: <20230129143141.173413-1-maccraft123mc@gmail.com>
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
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible for 854x480 Elida KD50T048A panel, found in Odroid Go Super and Odroid Go Ultra

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 34d5e20c6cb3..dbc92c4e26ed 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - densitron,dmt028vghmcmi-1a
           - techstar,ts8550b
+          - elida,kd50t048a
       - const: sitronix,st7701
 
   reg:
-- 
2.39.1

