Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA5908DEF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6052A10ED86;
	Fri, 14 Jun 2024 14:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="l0aQsgjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F3B10E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 14:55:31 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-6c53a315c6eso1686946a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1718376931; x=1718981731; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N/AP/1V40+BXRCtoO+lC+4Br3T26yIArvUV1nzkpXog=;
 b=l0aQsgjgOtgb6PDjP+UrcjckVryuVnLqB5uNhHWZ7aJd8q3QYYEHMPFuZre+Tri71M
 maydSceatnrBud5yzCNJ5Ksk7La0tBSpkctfdGcYahQG60sFj+7KZe1HWE3Yzy0y9MdF
 6Dg9j7P2LnYsqwbVcOKL0GicW+dn0LMT22FnbDhhQ0PBflej7RBM92OOaAYeNPkuYMkJ
 aUHkiLt1h+tCdCQZQ03VA6RILlx4lolB/95nRTF4mka6LCCLZ6c/oTFqnt8IMjEuqYJa
 EBnv/zWyWE4UBeawgeGOsaD7v5qWfdAG4LYaKVNcTpUQOKANHpGJHJKe58yEvSsywIUW
 i/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718376931; x=1718981731;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/AP/1V40+BXRCtoO+lC+4Br3T26yIArvUV1nzkpXog=;
 b=wMTgqnU8jBRbrhMqM+p+RajrboKwh6I/h0SWo5KbEvLZS5XCHsptxgca6n2OZ0L10U
 uuenQ51ohXcVHnBFQfocqL5o9Zmmjt1+LK8Hm40upTJIrDZ20TzLXHc8j689eL/vn/tD
 hkS75ccrXr8SqNszHhxOx5mfO+rBmGoVPqjpsmhtPvoU33oE/v2id2JfGjkeSU8HbPuy
 O0jfoa3POY/dTQ3Wnb+X15poYzzar9t6eDSUJ6bfUpLjhCweBJdijIf5lQ3haXYx4Qa3
 EeYvC+T/5fHQzO7NT6zlLZixiOfvbQQ50259as3sLql7STRxntSwbaseZEMnz6wu3xKa
 Mfvg==
X-Gm-Message-State: AOJu0YzcrpKpuRVkfekoCy327Wn3B3jAFkSnYBTjN2hsulswdyZ+OAmK
 JRsfrwEIkMM0xNpHCfz/qKdWD1blNfTbEiePCS3DnswkwnBbYwxmx2WF1XroeeQ=
X-Google-Smtp-Source: AGHT+IF2LhG6H8q2Mm/Niu37KRm24BCPEwk6H9tjmqhMSFmBKJ18yVkB6S4FTD6erB7IdCv2lO6EhA==
X-Received: by 2002:a17:902:ec90:b0:1f8:69ed:cfe1 with SMTP id
 d9443c01a7336-1f869edd7c5mr19731945ad.53.1718376931373; 
 Fri, 14 Jun 2024 07:55:31 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e739b7sm32914495ad.93.2024.06.14.07.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:55:30 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/4] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Date: Fri, 14 Jun 2024 22:55:08 +0800
Message-Id: <20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The kingdisplay-kd101ne3 is a 10.1" WXGA TFT-LCD panel with
jadard-jd9365da controller. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Chage since V3:

- 1. Abandon the V2 patch and add kingdisplay kd101ne3-40ti binding to 
-    jadard,jd9365da-h3.yaml again.

V2:https://lore.kernel.org/all/20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Chage since V2:

-  Drop some properties that have already been defined in panel-common.
-  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it

V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/

---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 41eb7fbf7715..6138d853a15b 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -19,6 +19,7 @@ properties:
           - chongzhou,cz101b4001
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
+          - kingdisplay,kd101ne3-40ti
       - const: jadard,jd9365da-h3
 
   reg: true
-- 
2.17.1

