Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92E694B56
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280010E04B;
	Mon, 13 Feb 2023 15:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EC910E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 15:38:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k16so1332655ejv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q86xsnFvfvmah1G0eGQOi1KV205lT5RC6i71PTaiGzo=;
 b=YNfKzAtIz72gcYaG7XV4PSq2NEXvrAgcCMjnPsI91+HELi7EmCHFa3h4v/3A9zLFQn
 eiH1eheI31WtpJif3x+2OOK8Xz4DoEkCcRuLK59lss1ztdCoMu8sFoOHteG1OD6KSrbL
 Ev8MEuIShNtQosDwH5de/OQhc61gNDKH73GvL/OKOWXAORkRh/yTwQGIKVUjJhYeMUYn
 DqYHQ1dZewnMIWm3Kbr8D2rRW1OUeE8IEB2dQtF0EkHYPu+q10gnQBajelD4xPxvZA1p
 kAXt7QQv6YugLjFyGT9tpF7eClkhCylEdqWoohIOa1EZ3SG724LY168OA+5zHKy/KARI
 c4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q86xsnFvfvmah1G0eGQOi1KV205lT5RC6i71PTaiGzo=;
 b=1KJV53OSmMl2LwY2qyYYq9pX1diHZJTaldtqp+x8yfhpYt2cJEG99rYsJDHiNioSqI
 vVAUrgz6NS6PQr7CJ9T4k7TtWPX2NojvSkFSC/LfcvBF+WROqDgWlUbaDULMuFs2VdXM
 3KuTfT7bMEi2sIbyCEFhJZmNHruo1VkEWAIxYljTjRdiLyU+9gGq37sHeW1yT2QXBzyn
 uc8iJqZkuyioRKzisDRwfjM39zSOdw5zmPJlfJw+t9yuED87EL1V4o7JF84tqXmjK4Mr
 IXqqfaORAotmIJkwWo5D0/ZXc904RQn8dOmBnsck53/ds4FL6h8i0CsiVhuBTKSD04d6
 2l7Q==
X-Gm-Message-State: AO0yUKVyKmvfex5sOZ4lMOPmazXrb+YdoiBlftlda+ygMliV4c2Bn60f
 puAuKtuxL9gpoqIGWcruBII=
X-Google-Smtp-Source: AK7set9rpu4uOTlLBDoMG+BkveHrcsEYP70PEWPeRWFby5VyriFa/6JKgxhk4Nenhc+awLxNZsP00A==
X-Received: by 2002:a17:906:6a1b:b0:8af:b63:b4bf with SMTP id
 qw27-20020a1709066a1b00b008af0b63b4bfmr23256890ejc.27.1676302707637; 
 Mon, 13 Feb 2023 07:38:27 -0800 (PST)
Received: from localhost.localdomain (83.24.145.108.ipv4.supernova.orange.pl.
 [83.24.145.108]) by smtp.gmail.com with ESMTPSA id
 gf17-20020a170906e21100b008b12614ee06sm115901ejb.161.2023.02.13.07.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:38:27 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: heiko@sntech.de, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: display: panel: sitronix,
 st7701: Add Elida KD50T048A Panel
Date: Mon, 13 Feb 2023 16:38:13 +0100
Message-Id: <20230213153816.213526-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213153816.213526-1-maccraft123mc@gmail.com>
References: <20230213153816.213526-1-maccraft123mc@gmail.com>
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

Add compatible for 854x480 Elida KD50T048A panel, found in Odroid Go Super
and Odroid Go Ultra

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 34d5e20c6cb3..83d30eadf7d9 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -28,6 +28,7 @@ properties:
     items:
       - enum:
           - densitron,dmt028vghmcmi-1a
+          - elida,kd50t048a
           - techstar,ts8550b
       - const: sitronix,st7701
 
-- 
2.39.1

