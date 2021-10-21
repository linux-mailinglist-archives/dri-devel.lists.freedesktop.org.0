Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CB436CC5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621C6E4C7;
	Thu, 21 Oct 2021 21:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47176E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 21:34:58 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 y145-20020a4a4597000000b002b7d49905acso551631ooa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTwNmZooOeOdog1xCjDMl0qLSkOmdnMEB9kSUbzvyVs=;
 b=MRnKxjV2S5VmP3MI6tkI7zr9Azux0Rd/L85aFA6X0wUy+9ZtuHirQ72Ha8mPPLV6jF
 gX9Qnli2J+I2jtuv5EWT5fh8EB3OUSM4ZwE2NpnbXdI+L4PsDbkTMycEuJfnbQ2qmLdC
 Pc3cKHElfP+qJhmBBmtGRxWOK69LSNRzXfM3n0pCgoDpmlGSw/0l01/Krq3KgO3TqGMi
 IOgxIgts5EOSKRbRnacceTtAVKDEHkq9WhpZEommGBON352orr/HFQM2+lxRFLkZcDhL
 nsnWppvCWtIDV8CiwOEWpstzk0OVVrRLKTseuglUzwnGdoXL3OC5ogl2gzqmdbSyFQpa
 g2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pTwNmZooOeOdog1xCjDMl0qLSkOmdnMEB9kSUbzvyVs=;
 b=iX9NlrsVDCcH6hgN75wCJsNhNQ58/LG26HjGpsNbXHMezHTUJyioo7G7pKOgcKfb1Q
 D8ZB2zEHBnVkgYaRhU6RqVMambqXBvtR6V28vyu8oYlVsExlyuwg3uZVs9D4fOgF9yZa
 JSrwQgdSS/H/vestwt8zjZ9Pw3oh0n/HgTov0W90Z5MflJJKQ2FeVbwjg3EIRfJ+6RFD
 J6UaBXpuG8ssx00DhAb8mOUFm9AKcIesHvV0GQQ58cK15HRdiLHAIRMgj8oMM3Sq1wHz
 GjkOBHCcLm15MlZCDqU/NHou+gaj9apoulzq6r1YszFwFOQ+Dm1/po7+c6lfeYukwAhm
 pjiQ==
X-Gm-Message-State: AOAM533B6Yqj2dCbJLNhZloFnOPxmqKxvR3e9NiKugB4m3R83rGFS3OJ
 9fsKJwd4JCw86+KLLPxn9HI=
X-Google-Smtp-Source: ABdhPJwfTPpBcCCoB6iF70POe8qmJ1hWZFW1k43lF3cwrrSfvNcY6maKSjUXRG+WJEYFiMzL466hNA==
X-Received: by 2002:a4a:a34d:: with SMTP id u13mr6185244ool.53.1634852097915; 
 Thu, 21 Oct 2021 14:34:57 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-172-188-255.mycingular.net.
 [166.172.188.255])
 by smtp.gmail.com with ESMTPSA id o42sm1152386ooi.9.2021.10.21.14.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:34:57 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: sam@ravnborg.org, thierry.reding@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH RESEND v2 1/2] dt-bindings: panel-simple-dsi: add Tianma
 TL057FVXP01
Date: Thu, 21 Oct 2021 17:34:44 -0400
Message-Id: <20211021213445.17289-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds the bindings for the Tianma TL057FVXP01 DSI panel,
found on the Motorola Moto G6.

v2:
Fixed accidental whitespace deletion.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index fbd71669248f..92a702d141e1 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -55,6 +55,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Tianma Micro-electronics TL057FVXP01 5.7" 2160x1080 LCD panel
+      - tianma,tl057fvxp01

   reg:
     maxItems: 1
--
2.30.2
