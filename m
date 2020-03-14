Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F71855EB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 16:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DA48937C;
	Sat, 14 Mar 2020 15:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B86E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 15:31:01 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n20so7017451lfl.10
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9oaTRbmXh8YDwKHKnzGVIS7f6wuqtnZ7xd23oLTEEto=;
 b=jiH9bpypMJvdPe8XlrGt2qIBH0ac9i0GdP9NUU8Dbj21jnOYrHb0bpgF+yR2ExaTYd
 NAzRvP5rwXw9qS1pTlpVkDL1uK1h23pv4kRIx7rjoVJlKJ4JGKbRFRzPcCVKSHyr0Exa
 QYfrr56GTgIxZP4PKS3KLmbx2h8wu8mhnBIfesQ90NCsMIdxbmKKElN3L5ZdH/gmbfBb
 +mKXbkpKXgh37oIgvXP29B9BlEW9ZNN3qEa89bFCLbLLvpJ23EET2a315DQkHekpY87W
 PJnlFxnqdeB7VyXFW1bKPwiALokrPnjTfWn9E+nLuatsB2E1UE6hGwgIdU1DjH+yWgJ5
 EaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9oaTRbmXh8YDwKHKnzGVIS7f6wuqtnZ7xd23oLTEEto=;
 b=rUYoNE1R1xYaajlNSIxRa9yztNc339b01tRAMR5z/mUbk1y9DsrBZ/2u2y5RhZUxjv
 Rd45xNMaVP9VIEGUYHdYeaQcVhXiGxhy+C3CxwEHBDlJ5TWfrWALivbNSobqy8PBF8zy
 FY4uR6PkIWyb8vd5OWoZoG6GAPO/KWd3kE1+6AA5NUDss++6chWwWGg72Yw0XqmEoukq
 5/BgSfm5uSb2x4wk2Hp676SiP+Ak3/M0rfF/PwMFsa7Xr3hclalnle0inO7pb08WUkDA
 oSRt3TmJgbo8t3u18UMjGhaFgsQG5Q+DYnBQbRrfnYyG6gfv30OvKkg3s8Zg8GETJKxk
 2lfA==
X-Gm-Message-State: ANhLgQ2iBBC2dAWjB3s4gb9x+JyDFRxFDc+R3iaeNh5ML3Xf9+C7k896
 FS627AJT3WHkY3SfmwZb85M=
X-Google-Smtp-Source: ADFU+vvH1iIivBsmhWr5uHtWe7gtlRpbjBV0BUayRn5Pu0EOIMWSnmqA2h3aU7ENFknpE70YCgDJCQ==
X-Received: by 2002:a05:6512:10c4:: with SMTP id
 k4mr11585029lfg.98.1584199859650; 
 Sat, 14 Mar 2020 08:30:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n200sm15650418lfa.50.2020.03.14.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 08:30:59 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] dt-bindings: display: grammar fixes in panel/
Date: Sat, 14 Mar 2020 16:30:47 +0100
Message-Id: <20200314153047.2486-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a few grammar/editorial issues spotted by Laurent Pinchart.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/display-timings.yaml           | 8 ++++----
 .../devicetree/bindings/display/panel/panel-common.yaml   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
index c8c0c9cb0492..56903ded005e 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timings.yaml
+++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: display timing bindings
+title: display timings bindings
 
 maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
@@ -14,7 +14,7 @@ maintainers:
 description: |
   A display panel may be able to handle several display timings,
   with different resolutions.
-  The display-timings node makes it possible to specify the timing
+  The display-timings node makes it possible to specify the timings
   and to specify the timing that is native for the display.
 
 properties:
@@ -25,8 +25,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       The default display timing is the one specified as native-mode.
-      If no native-mode is specified then the first node is assumed the
-      native mode.
+      If no native-mode is specified then the first node is assumed
+      to be the native mode.
 
 patternProperties:
   "^timing":
diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..dee4faffd204 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -63,9 +63,9 @@ properties:
 
   display-timings:
     description:
-      Some display panels supports several resolutions with different timing.
+      Some display panels supports several resolutions with different timings.
       The display-timings bindings supports specifying several timings and
-      optional specify which is the native mode.
+      optionally specify which is the native mode.
     allOf:
       - $ref: display-timings.yaml#
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
