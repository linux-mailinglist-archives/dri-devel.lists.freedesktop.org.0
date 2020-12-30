Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE82E7F70
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 11:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25189B55;
	Thu, 31 Dec 2020 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB9D89817
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 15:17:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b2so15718290edm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6F4Zg0AAbgjy+qDMetOB0daFV2AtFKYYvkDE7/8PLE=;
 b=IPbbzPx0evlffLJRP03SP8Lyyzhf6lzq4LhAxGtzN57wnZ0tei6j5FbHY9fd3vh92k
 ztNtlDLAGOspyH9TkqpLklbl0w9Q+4Yc1ACAm+8PHaMJ8lwVhMqJ/5UWA2ykp4NH4ocE
 v0KPbeBQWuV3trUMt4MKyo3lkAR7RAi3TeIsuAsUXV9WGwv+t8NRt7Nvo2GQdT+J6KmP
 yFPW0H2MlOwQXeF0ojYUtlwNDCUTjEBSyURSABmetx9W82INlHebkBtmzbp52IEYOcnV
 JVde4AEwdYQb7OUfnfRnaOGfrwzeMetwbRaPdbIiUBylS1psOw2RSmgzkJe7a3ey4ULp
 jg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6F4Zg0AAbgjy+qDMetOB0daFV2AtFKYYvkDE7/8PLE=;
 b=F7cbY35+UsZtoGq9e3rgX6mtZ3Met/VH9fe8kL8x8yshv2/60LiZkDZVSePEZ2JdBk
 2Cs/VeNtEyDIDgKN6P6FMgB/VXUlk79RBDAUxUnZad9N4U7JX9yb+sFUXwfw6ULxGDJF
 QvuUhENINsu0vDpL3HaWxAgtVZNxHQbBWaEhUfvPpOCQjyUriW7FPUMkMpOcs1kIEQxr
 g+nLFoitFTzd/SjX5kXdpVyFJBsYSrEWlgb6N1/YdF/2sgQgSqTuE59eSE/X2xPL1mSY
 ZMNRr9JuCrwDaW9zbnP5A0IJxhC7Ozj5Etw0uAlEqi7We1BJQ7rBWQ6a1bw+HjXRm/a0
 SvLw==
X-Gm-Message-State: AOAM533T5ZZiFeyn14QtVyzW8ls57KNrWciUYBRrrTVq2yIF+rm3PeGG
 sz0PbbU3P+uZBvH5ZISTzmk=
X-Google-Smtp-Source: ABdhPJwZsLXL9muSLLlmTb/brbxSzdS84Zud1rKczrIpSAMrNq2ToCl8gPT/NO6AGN8Ys9EvwrpZ/g==
X-Received: by 2002:a05:6402:1caa:: with SMTP id
 cz10mr51326967edb.345.1609341440494; 
 Wed, 30 Dec 2020 07:17:20 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id x20sm19112928ejv.66.2020.12.30.07.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 07:17:19 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] dt-bindings: panel-simple: add samsung,s6e3fa2 panel
Date: Wed, 30 Dec 2020 17:17:10 +0200
Message-Id: <20201230151711.3619846-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Dec 2020 10:42:13 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add samsung,s6e3fa2 in the allowed simple-panel compat strings.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 27fffafe5b5c0..52480ca230c7b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -241,6 +241,8 @@ properties:
       - samsung,ltn101nt05
         # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
       - samsung,ltn140at29-301
+        # Samsung Electronics 5.1" (1920x1080) AMOLED cmd panel
+      - samsung,s6e3fa2
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
       - satoz,sat050at40h12r2
         # Sharp LQ035Q7DB03 3.5" QVGA TFT LCD panel

base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
