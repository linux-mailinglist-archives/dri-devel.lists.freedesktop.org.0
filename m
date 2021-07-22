Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC53D272E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC8F6EC5F;
	Thu, 22 Jul 2021 16:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720D66EC97
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:06:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b26so8736546lfo.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=sq3WFwTOtj9kKuM6XYMC9kzFMB26rvdchXWIsRyAs9CSwzaUFhxpEhwvI6dABcicCn
 dMQjhCw6/Op/IR2zpeWN1vsPFW/2QeztnxdXppvV3RiNUCnCPZI56C0bJ+8xllCqaYoE
 9Q2E1GZE87mzzFuiipLwZcvrrMn3Gdm6+8Fl5NTDXAffFhO8iZVxj1xGexRWCvx6pdzH
 aa1kCXulmyIzfOYP4BtOLqxEizIGZrYON6nC4VgO67rE86jjAPQSddl4B5F+a44yvKpA
 zpQKE8XsLwLT7f0yBOgNQhnWgfClARMrG1e0FDac8UG02x4OVrOvS3rCzBPPMpDnG6AL
 uVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgL0jl+mGyF6SSLvs6k02lrCaESH25yjasdaW3GUG0o=;
 b=gmylP5NOuN7UdKU1jk3sQFmxN9zO7Zt9JyAMeJhDlPIgqtEMQv6ryawOxy6D3F5sBd
 M+geGGP0WtldUKBMHPaST0Z/XdZ5K20gqlprzVN5kIru14NkeOFeZGQZbO8dT01olxFh
 dEqQUm2SP8vjuPg459gOlkQoALH+dhScSaZaYsL7RAzQAtNWS6rlsB+/h9ouVNkQ8+4B
 oPBH37TvrUXnyyj4zUmuP5nRvm0hnOqxUB/POE+BwSWSo0MYd1HZW76Dlmd2h8MT504v
 losCYkO7lDHJ7WSFO0pLLPhj7wpE4BdNyBh5K4vQuUfYJhkPYV4iq5MiQFMaQGzJLGe/
 W04w==
X-Gm-Message-State: AOAM533YCyFi/9L+HWcX4NemxYpMwpAtDoyy94MDHj/nRha+YRCnhtTd
 p/jO5L6UpzTOt6kFNSy/1SY=
X-Google-Smtp-Source: ABdhPJx9mtYdhnrB+vR926drj9lChYq1hVwCQzBc0ZUN5zDL0boUpcXA5BOB077b74mGX7OKYjGzVw==
X-Received: by 2002:a05:6512:5d9:: with SMTP id
 o25mr28894409lfo.146.1626962760867; 
 Thu, 22 Jul 2021 07:06:00 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id p8sm190584lfu.163.2021.07.22.07.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:06:00 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for QiShenglong Gopher 2b
 panel
Date: Thu, 22 Jul 2021 17:04:31 +0300
Message-Id: <20210722140432.1426173-3-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722140432.1426173-1-akawolf0@gmail.com>
References: <20210722140432.1426173-1-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jul 2021 16:00:25 +0000
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
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3624363938dd..e7f3db118c5d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -244,6 +244,8 @@ properties:
       - powertip,ph800480t013-idf02
         # QiaoDian XianShi Corporation 4"3 TFT LCD panel
       - qiaodian,qd43003c0-40
+        # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
+      - qishenglong,gopher2b-lcd-panel
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800
       - rocktech,rk101ii01d-ct
         # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-- 
2.32.0

