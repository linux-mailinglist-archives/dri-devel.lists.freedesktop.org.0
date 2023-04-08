Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BC6DBC62
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 19:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6B10E162;
	Sat,  8 Apr 2023 17:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B759B10E162
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 17:47:46 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a3e0c725cbso57210a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680976065; x=1683568065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mxx7dBXytjcvNm/rosWinVPjziS+rj8SL88BmUqc9E4=;
 b=BrNwpICCDSH3WMVLXtDJp08IMOJLzOL6jtHSWroA8TtRbW4pkVaiKyeGbnXq11ZJ+U
 jNwiKlqusYdGnoSL3QWDNc90CNOsbpgXILGxCHUCxwHdaEBO3xgV6VJfvucG4qkK7Eri
 /f02jrUpc3jeDZmpNiHJ8ugivGFzKnpEBtqD1rYrsqzcIccHjLMrVAvOxQ56s9nPFlov
 5pkRDT3IuOX9XgMCt8xwCwzTmoD14On7Nzqgbi9AmoEVyt1ioR15T13evasWWBBKX5JO
 O8VIDHx0guD5ekK5AJprthQMZL0wz+8FySzeKBwM4tEMF1CCfynljR07lB0qtJNizA/n
 MPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680976065; x=1683568065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mxx7dBXytjcvNm/rosWinVPjziS+rj8SL88BmUqc9E4=;
 b=IfsXJa69YojybC0msI+WjeEiEVl670ng/zxHAF8Nb5ueRx8mOeTjHK0Fg/FBfub9Rz
 QzUsypp70J7/9ftm8nSfXidLnbTInNiC3mGTH0iROvX3Dq4pB5kWC2lstHGNtS64oSSu
 6h2Om/71wqdPHJ10J+QUFFo8igmOtucPj6YpxhABqEUXHpvgWLhWf5k8py9KYA3ikeZi
 g48SlDDq1bC7LcsYKeXOJYnYF6+h2LhmgtJ+ZjWo78PAGnCt8rwfrTaNUrAKVnrwUfbk
 LRL7rv+qSniCaG7S7OY04Ulu0i4Z8tZyurl+BuFc1S8J9Rt5uBDyhh8AYvrSxNRM2AtB
 omhg==
X-Gm-Message-State: AAQBX9fSju7IFqMHtngLcKZ6GOvmCW50cX7psN562KtdpJEibrw8Wefz
 9fscO1T2VEATm/A+PB+jYPE=
X-Google-Smtp-Source: AKy350YfWPPhiA07t0vZNxQB6bRWNnhghQHfxIA4MFZyyof9eJboYjDRI10kDRtqt4SphuQsHTGgFQ==
X-Received: by 2002:a05:6870:b512:b0:17e:3772:bdcc with SMTP id
 v18-20020a056870b51200b0017e3772bdccmr1479902oap.5.1680976065298; 
 Sat, 08 Apr 2023 10:47:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:c705:4ba6:4922:a289])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a056830110200b006a13f7701e3sm2724210otq.32.2023.04.08.10.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 10:47:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robh+dt@kernel.org
Subject: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix the
 video-interfaces.yaml references 
Date: Sat,  8 Apr 2023 14:47:36 -0300
Message-Id: <20230408174736.1789082-1-festevam@gmail.com>
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
Cc: neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

video-interface.txt does not exist anymore, as it has been converted
to video-interfaces.yaml.

Update the references to the new file name.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 911564468c5e..967b1deb4936 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -106,7 +106,7 @@ properties:
                     description:
                       If you have 1 logical lane the bridge supports routing
                       to either port 0 or port 1.  Port 0 is suggested.
-                      See ../../media/video-interface.txt for details.
+                      See ../../media/video-interfaces.yaml for details.
 
                   - minItems: 2
                     maxItems: 2
@@ -118,7 +118,7 @@ properties:
                     description:
                       If you have 2 logical lanes the bridge supports
                       reordering but only on physical ports 0 and 1.
-                      See ../../media/video-interface.txt for details.
+                      See ../../media/video-interfaces.yaml for details.
 
                   - minItems: 4
                     maxItems: 4
@@ -132,7 +132,7 @@ properties:
                     description:
                       If you have 4 logical lanes the bridge supports
                       reordering in any way.
-                      See ../../media/video-interface.txt for details.
+                      See ../../media/video-interfaces.yaml for details.
 
               lane-polarities:
                 minItems: 1
@@ -141,7 +141,7 @@ properties:
                   enum:
                     - 0
                     - 1
-                description: See ../../media/video-interface.txt
+                description: See ../../media/video-interfaces.yaml
 
             dependencies:
               lane-polarities: [data-lanes]
-- 
2.34.1

