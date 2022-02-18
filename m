Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA14BB6E2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6410F2AB;
	Fri, 18 Feb 2022 10:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C35D10F2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:28:45 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so11992197pjl.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZxv3pHz6Udq1OzuuR9MJTgehSeTgSTYX6aQTnuEBto=;
 b=DelbllCB/RnzeNnQQUFk7K6N1cJt9lxouz4gqHucg3Uoadz8eU7vuIxQO54qf3Gid4
 2sNHQLHRI8ReIxh1KgWSg2K40KyZXT2/BfvwhzRgRO/prp2gzJnc/QLjoUMSFoQnrarp
 o+omlMWVM0lLTUWf1fgsOEENwOHGp+1WGm5aJNZLzVPwtr0kEqVtBhZ6UijYyRMz3FcK
 qQ2gW/WaTpyLD9ewHu/QUYzWYur+IXe7JZ3b0BjvZT5CZjMXsoSfUnBwggdcXit0/yx+
 95bvqo8tks7yD9HOQPoYm6Rbzcm2YpbVYYbynYex7LZmZMyva8lFyUUlno+jaT3xisY3
 4v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hZxv3pHz6Udq1OzuuR9MJTgehSeTgSTYX6aQTnuEBto=;
 b=neWwGkQ48P1ECDsClj6rKw8Rbire2MmbISIK4clbnTUaN0DAJagpvJ/PfMhlHbK596
 ipFBRNyw7ytl9vB+5c1EWN/eNycM28AueHo3CAGCmsLw8uY93fO8SeASYzHHFRqkNojO
 6uuIA2yi7/tzb6Dkr0FIhGp7m4vLEMRIldYUJ0B03mNxrkiEEzpWSP9sZSeT8v0uGKW2
 e5q9XfCehKLiM+DG0XQUtpv8Dd/r/qEjoApjSvsy5FKvb228sfzTLMXXmrBzqHM8Xo74
 P5JrxCa0elJs84NcBE9A4q/0qtepmw5XDptKSyBlZ5AwzL5i7IdkOJ6P43vspKXJbGfZ
 r7WA==
X-Gm-Message-State: AOAM53228okn4GM5PhTQ8sTGw9I+KiX/WfPrNDm4AiLEsAEtfpk78fsp
 hd4/QDIdjrgl5UqCZyZIq38=
X-Google-Smtp-Source: ABdhPJwxbtXRkf7mBwYXDUF8FymlXpTcaK8hVmcTvlAMUfv4/X0OyE197uN+tCZ27Bkb605Rvg773g==
X-Received: by 2002:a17:90b:1283:b0:1b9:cfb1:9cad with SMTP id
 fw3-20020a17090b128300b001b9cfb19cadmr11919710pjb.82.1645180124984; 
 Fri, 18 Feb 2022 02:28:44 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id 16sm2676856pfl.99.2022.02.18.02.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:28:44 -0800 (PST)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: display: simple: Add InnoLux n140hca-eac
 panel
Date: Fri, 18 Feb 2022 18:28:15 +0800
Message-Id: <20220218102815.1634561-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 hsinyi@chromium.org, Rex Nie <rexnie3@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for InnoLux n140hca-eac display panel. It is a 14" eDP panel
with 1920x1080 display resolution.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..f8383a8dc3dc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -180,6 +180,8 @@ properties:
       - innolux,n116bge
         # InnoLux 13.3" FHD (1920x1080) eDP TFT LCD panel
       - innolux,n125hce-gn1
+        # InnoLux 14" FHD (1920x1080) eDP TFT LCD panel
+      - innolux,n140hca-eac
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
-- 
2.25.1

