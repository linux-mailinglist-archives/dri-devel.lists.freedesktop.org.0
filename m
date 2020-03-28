Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F4197532
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2637A89FC3;
	Mon, 30 Mar 2020 07:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7126EAA3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 00:42:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g62so14742265wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CyGjashJridaD7EOncRRtljYVEVx0U+lNGZaPp2V68Y=;
 b=IptMWCxZLROI05RPdivzL/MiF45cGIjZgNtc4RWBqeNsCIeOsisxtfQTPTt8Frvkew
 GN/AxvkeF6atRjS6S3g9JimBi6e+6Bk82g8Kht9L/S2NyD5pdcnOoFcg6aMxUMN7S7/u
 9DmgWye5ERHiBSRmiJVyop0S9l/19iYR7YoPc5B/PmaQbJROP7HSsMhoD8qFkmqU7SI+
 +9J1dr3mbTpX/ha7onANt5lsOl1GTqzf1YdcHKEgMCx4uvTtHWNiSVf7Urvn53nWD4uL
 vkx8ECR9Qg+8tqrr/FJk/rLzrqcjuIG3FB9/ejW24U2df8cK+RUZkhLP3bARtDZUy+ex
 HboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CyGjashJridaD7EOncRRtljYVEVx0U+lNGZaPp2V68Y=;
 b=F+qCy7aZRqmLEkSBjhyXAiSBXQe4muK/xgOXs4WyAzFlWxYR+zIl8lsvXHM2pHGgPF
 /ISMjTbYng/a4by11IquCqQpFRSDv+8bwxAHoy/3DSaZXOTfPPr6Mq3JDclGK/zeNz6L
 SZl6IBg1rq9vccJIsqJvePfA6qHyDOC0WYyzRHpV6fQzD8rrmRqX5lKpw9EH5yyUiIox
 AAKyn/a1Ww8z5pIP1+PwBC6vppD6q2C65Ds01SQyt/2TBu/ElWqDoeoS7aCX2J6t3yXf
 /p7rsGRxf3K3D9Z7JaMn7dnaKiHy6H2v2Er3fiJmPy5TGmgWBK+vH9cRKPbtw3QY+fVd
 JaDg==
X-Gm-Message-State: ANhLgQ2QGYoweDAzVk0Fub8aWh03fHojHok/E5UOTdPet58i6JnyaoUH
 1V2TGQjvtcXuyLhtzvCxopI=
X-Google-Smtp-Source: ADFU+vvlJnYzsX+ao1dSJir0qYJy7B2HfzwRuyqzEeXskD58u19UIKeamdohRQLTKyIpvAMohyf5Ng==
X-Received: by 2002:a1c:96d1:: with SMTP id y200mr1376296wmd.114.1585356135213; 
 Fri, 27 Mar 2020 17:42:15 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p21sm10783857wma.0.2020.03.27.17.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 17:42:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: meson-vpu: fix indentation of
 reg-names' "items"
Date: Sat, 28 Mar 2020 01:41:57 +0100
Message-Id: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: mark.rutland@arm.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use two spaces for indentation instead of one to be consistent with the
rest of the file. No functional changes.

Fixes: 6b9ebf1e0e678b ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index d1205a6697a0..cd8ad2af52c9 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -71,9 +71,9 @@ properties:
     maxItems: 2
 
   reg-names:
-   items:
-     - const: vpu
-     - const: hhi
+    items:
+      - const: vpu
+      - const: hhi
 
   interrupts:
     maxItems: 1
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
