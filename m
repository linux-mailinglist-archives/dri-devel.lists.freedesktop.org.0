Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508380641E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 02:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D75D10E328;
	Wed,  6 Dec 2023 01:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EE410E328
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 01:28:45 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5c67fdbe7d4so313338a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 17:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701826125; x=1702430925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oOd94CZUIFx1zLYvWrY0k1s94CAHS+icQN8gGN69rQ0=;
 b=gyTc3QRFCc29sDTWVmxhB0tIL4IImZ4v2G8leuE1hLL8MaTYZMlLIS363kEcj+fzGE
 YMGIJmI34xUF0OSztSUz/VxpvnN3qOWipoPUPeWMc/JtFOPJGBtiRJnq3/0PWb19D3vo
 KLOfmnL4RiS3T0gd9hkFIovZsmNaoPF00aabrMSc+HhpQRYOlftxm64DkYml2SXRyq/v
 yeBX7x6+onJglH07H8obfT3OL1xpI9ZgzYy/75DStOoiDm/sVSmAHWlB9MF9S5hKM2Zs
 MAiQo+U95rGnJ8dP8346kxOSfW+UJZTiQJz7zKPkCU/8GvS7yzMyGBo2gSgbPRMyTewV
 5CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701826125; x=1702430925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOd94CZUIFx1zLYvWrY0k1s94CAHS+icQN8gGN69rQ0=;
 b=pXgRqWkvz99ZuRYyiqyNv3UDHNwYbSqb5tYr5p9uvyY1Vs7WMg3i3KVfKVuCEq0nmD
 KPEWCspOTG8xluKWRsRgLqAAkjCjpAaROOkNmW7CzPpwETImwaIzof7WwbegF6oEjXH5
 fAJeLvzz5jBDG/sWLlVZZiQsMyKK5KJsuu9/NdMDwtuNvedBVKV+MV4yz5lIdT2dxIqv
 t8084zUpbX4U/K7SqJjWAMBX+FCVvARNXX1QrYAdXRu0HFFjKZleVkWL/cUMrDudUP4Z
 dNTUOMSdUIA7MWV3QhrWDFxZ92upf7JBAP/MWTwJnERXCAdNFxkYlZ061hR0bFmDGVGI
 WTGQ==
X-Gm-Message-State: AOJu0YyMtCJ/hSpSYINTc2r12rtKvruDfcw7Sxtll4fGgZHhw5/UI3e5
 /HDBteKScALb67v/WwCsPU8=
X-Google-Smtp-Source: AGHT+IE7BJv+iuT81k7v9mVcJvVovqI0N5ykMOxqOVuYDWnunBNIr+5XpteUmJ79X9xhLAaiLjcAiA==
X-Received: by 2002:a05:6a20:da8a:b0:18c:18d4:d932 with SMTP id
 iy10-20020a056a20da8a00b0018c18d4d932mr161268pzb.6.1701826125443; 
 Tue, 05 Dec 2023 17:28:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:96ba:ce56:6e82:3d82])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a63e453000000b005c1ce3c960bsm9765674pgk.50.2023.12.05.17.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 17:28:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH] dt-bindings: display: adi,adv75xx: Document #sound-dai-cells
Date: Tue,  5 Dec 2023 22:28:31 -0300
Message-Id: <20231206012831.2179356-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, aford173@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

When using audio from ADV7533 or ADV7535 and describing the audio
card via simple-audio-card, the '#sound-dai-cells' needs to be passed.

Document the '#sound-dai-cells' property to fix the following
dt-schema warning:

imx8mn-beacon-kit.dtb: hdmi@3d: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
	
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/bridge/adi,adv7533.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index 987aa83c2649..e15ae072922e 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -89,6 +89,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1, 2, 3, 4 ]
 
+  '#sound-dai-cells':
+    const: 0
+
   ports:
     description:
       The ADV7533/35 has two video ports and one audio port.
-- 
2.34.1

