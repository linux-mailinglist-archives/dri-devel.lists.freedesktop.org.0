Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30182908DFC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9D10ED7F;
	Fri, 14 Jun 2024 14:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vEqMnSdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99D110ED7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 14:56:27 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2c2eb98a64fso1926692a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718376987; x=1718981787; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LwvUq+bFsQM3xrcbj1WxFnxCDtbNpy9qSWYJxJxGyfQ=;
 b=vEqMnSdLUQ4ajG/zmg664Y/LG4dE9RdW6BrLLMGCvA8SRLfUWrYQQPrQO0NrnOmunC
 xBkK4mwBv3xCvhHhv9nkJXuD/b6ppgOG8ImxPFCzYtx58ajpLoTMqRwB5GRUWhJkIq93
 aV6ZOhWYA2mtKn4vHdmlhL40UW0dXMyCvnMcoYVUq8vfapNvYKis8Jyamoor7gbQ4i0y
 3SOnlmjoCfiEbAFx4Ahltxv3mtJBTMCbGssEciZuxTytEt7qjmJnAwIEPXikyuJar0Ri
 T+kKVJXCwsQ6Ibf68IcmQsLefLgjibaAd/mRj/6/2756BhVdvCRAOgmbSOaBIpSHjtXK
 lpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718376987; x=1718981787;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LwvUq+bFsQM3xrcbj1WxFnxCDtbNpy9qSWYJxJxGyfQ=;
 b=s64TkdQSNtkhw6Nihcl64D3CdID+CA0O80Qrwn8fc9Qurmtk+DfxzBWc3RBSoKP0Qi
 YANMLmuFh6jS+cyd5lLBELu4tvgDH4OiXlrPd+RXu2VuLZ5DFvhSb+5JPrvXF95P5KG4
 kuUGLmw0NU+savlNluCpVenLuYX0UNXp5bgfGqNVzv3PqreLCKp2E37v/bsbp7B574SU
 MrsS7Oq1n0/q2pPl7nthDoRgIwkZqpENdRdpHHgexh1wAkqn7dQq47k6uRef9Oivaf31
 5dNQuPplssCWgLgytj7FUby+TxsHQka2hehedBQmkrWmUE/CiEl1g3EUaC2ApTVbQv5c
 hb7Q==
X-Gm-Message-State: AOJu0YzeazBNsdq0Ly3ZKl7kdrQGd/fDXxQcSd0zLK/UiX2coxRBvqzD
 MP7mSTWwvgdMRE2OV5aWRSRGsiY/203wKkB34PyQw6dWXV45N9XK6bte+ASILgw=
X-Google-Smtp-Source: AGHT+IFsV5sgy7hyN2DHEA1XPsRcjaveUHUD2OKyasTaSs7h5S8bOv8+lGvy2k3pyCIj6KfwMvj3gQ==
X-Received: by 2002:a17:90a:17ad:b0:2c2:c79f:944 with SMTP id
 98e67ed59e1d1-2c4db241e4amr3288257a91.14.1718376987343; 
 Fri, 14 Jun 2024 07:56:27 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c4c467c60fsm3985913a91.53.2024.06.14.07.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:56:26 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel-simple-dsi: add
 Starry-er88577 DSI panel bindings
Date: Fri, 14 Jun 2024 22:56:08 +0800
Message-Id: <20240614145609.25432-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240614145609.25432-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

This add the bindings for the 1280x800 TFT LCD Starry-er88577 DSI panel
to panel-simple-dsi.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---

Chage since V3:

-  Separate the Starry bindings from kingdisplay, and add it to panel-simple-dsi.yaml

v2: https://lore.kernel.org/all/20240601084528.22502-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Chage since V2:

-  Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindings.
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index db5acd2807ed..1f04acefba4e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -60,6 +60,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
+      - starry,er88577
 
   reg:
     maxItems: 1
-- 
2.17.1

