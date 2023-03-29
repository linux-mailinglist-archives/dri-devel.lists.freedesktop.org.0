Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE546CF427
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6E510EC2E;
	Wed, 29 Mar 2023 20:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E97710EC2E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:12:15 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r14so6878817oiw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680120734; x=1682712734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aHANecyg10/TBvI/S8Wg+JFIeZI2UR0veb/3RxSsHAs=;
 b=ok+03mGt7V3d0XhdGropUjWdy8KbWYNZvqbv/+lPscJPcxjuWkuKd0TZn/hYNyolnf
 LJlOnegbnBOTCG1EXKBcLNqn0/BlbvMFihTtOn9JoTQUq29E+BWEOwQbUo62EE56TLwo
 ag75C7w6Nxxa5UP8/uaYTXuxAX01ZgsEEUr/AYR5Gezbn3Na+y+6eE8tpsqtJFVQpOj3
 zneslIJYNr7jGUkNT82IiDUAjCT4kL5m5FVfk6lxMmmZYJjFpxPTsoTr/WzAAIPQc5fi
 FEufxfUe7tQ8auWVtjt+N0ebBFxyblPwDvm7VWwJNcaqnIb2yV+H8ZelLjglbKrsPw3W
 Ql1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120734; x=1682712734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aHANecyg10/TBvI/S8Wg+JFIeZI2UR0veb/3RxSsHAs=;
 b=zk3dcmlwT1+nofDI8ADYa3w+WJWJ2jAqz/DTWVZgRFwtQaa4CNSsh4n5bo4e44odu0
 CxY4NQ12Ooa3UTsBa7NC9456eTiM7UYCSwDRWTbrvZGAsffuAw9lXadwX7+qRGSJ+6Ox
 FKf+em7ZaVveGLivHg2HWz+4Tm5L+lVuF+lKGpgpjQAorQ6oQ62a/ApeDxTBLvXv37SK
 FkFxnloredNe5vyQ5aNJV6OdxVm3WnthK5In1q0Mz/Ad7rnF3oPHDFthmEFNmWq3ss5P
 nEpZKTD/y/WcXlWL0tXhoB+2W29vjaEg5uKvL7kwPwgD7KYo710P/99W7flEeL70FMNM
 r/pg==
X-Gm-Message-State: AO0yUKUW3YkEJtggR7d/ysDdFoZwRcNwPnOgspg3qj3le4Fr5bhxWbdh
 88UlMbvd+W5WKVXSkfjcILs=
X-Google-Smtp-Source: AK7set+0hC7OUhRKL+uwBQ1vnKWIpkE8S882ciFQVEHI3atA0+Zhb5al5ysesjhQin/1rYbBJwm+Mg==
X-Received: by 2002:aca:bb82:0:b0:37b:8eef:55cf with SMTP id
 l124-20020acabb82000000b0037b8eef55cfmr8739455oif.1.1680120734153; 
 Wed, 29 Mar 2023 13:12:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:f61e:5f18:4687:132c])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aca1b0b000000b003872148d322sm9698025oib.22.2023.03.29.13.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:12:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2] dt-bindings: display: seiko,
 43wvf1g: Change the maintainer's contact
Date: Wed, 29 Mar 2023 17:11:50 -0300
Message-Id: <20230329201150.741106-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: marcofrk@gmail.com, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Marco's NXP email is no longer valid.

Marco told me offline that he has no interest to be listed as the
maintainer contact for this binding, so add my contact.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use my contact instead of Marco's personal email.

 .../devicetree/bindings/display/panel/seiko,43wvf1g.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
index a5426586b473..1df3cbb51ff9 100644
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
 
 maintainers:
-  - Marco Franchi <marco.franchi@nxp.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
-- 
2.34.1

