Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE49321CF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B69910E5D0;
	Tue, 16 Jul 2024 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="meym/4yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3010E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:29:09 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-70b31272a04so3935232b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721118549; x=1721723349; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0cHEfw05PzIXTBho9roSLu3dox3EYU5nHarCYBHiFzg=;
 b=meym/4ygQ0Hwi4oqmaSzje51Ox5rFjcYk9J0BGrk01DhWzyJr/FzfNyPoyGPyz+XgX
 xpjSPKmNWbKphypH484q6ifEFKpzT0CaZKK2RLWWubIG8/Q2L6hTqyKIYjidhQiLdZYW
 ZCupftuDyuPi/eqIauDKhXJ8Fe3JfUrrbZbKX9T2U72hdzc4fwYT/w+tfHNED+XSClb3
 HiZe+7LoxKuRxsnkfgF20UdnVlxRBhIeZT4iXSPZ9+oPIpKcTvbmLuyn+epsirBjuzvr
 W4ljoMjwdr6ngkPnvvFkjjG5d07G0gIBkU8XyCDXmUA/WoaO+uuaf/iHABPRJbblhgPX
 NJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721118549; x=1721723349;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0cHEfw05PzIXTBho9roSLu3dox3EYU5nHarCYBHiFzg=;
 b=uSmhgqZUcwAZDJK+59F/lzWW04uhXLqYKbIP5YI+wVavfopZkVtMfaRNZXVF/Pf4yl
 hewlDM035Dg5AT7QilqGFGGL4foFiUSs/4JoxNUDO+A4bKp6flohm8Z8fot6RXzR55EH
 1S1cHAZv5VwIpRZlOKdTX3ACt1VRQ2meFbwpk+UuHtJTwvB1G8zgBs+/fua9Lw8879cD
 Qb1tFywx2sTem7OR+2KMdJ2FlO4HQH00mftU3rgF0TW6VUw9+pdA5HNnjMu8no2ExGUc
 Enip6uReqTIMzm2hn3gAmsqapVhhxwIXN/jmRL4rrqItqyxFX3GEUqIAzTMUJ3pkcCOF
 OLrQ==
X-Gm-Message-State: AOJu0YwSDb3irCiHeKUZVyA8TdsFXhGlxdWFXyJgiaaQRZBVA18oEYpP
 Be3WxX3plUH9E5b8vuBG0gOTx1n3fyZ5Fq0o0hRihlxORI13RSZuOP1cI98Qcjs=
X-Google-Smtp-Source: AGHT+IE3qUg41F90doDcsAXrAz8l7EtcoFuvjXP3rjxDD5uv2FyCzJPVH1EglS0lBSr/iPxY4WEPfg==
X-Received: by 2002:a05:6a20:8427:b0:1c0:ebca:963d with SMTP id
 adf61e73a8af0-1c3f1e73544mr1985199637.4.1721118549100; 
 Tue, 16 Jul 2024 01:29:09 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7e110sm5714347b3a.121.2024.07.16.01.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:29:08 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 bentiss@kernel.org, linus.walleij@linaro.org, dianders@chromium.org,
 hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 ekth6a12nay
Date: Tue, 16 Jul 2024 16:28:50 +0800
Message-Id: <20240716082851.18173-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240716082851.18173-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The Elan ekth6a12nay touch screen chip same as Elan eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V3 and V2:
-  1.  "ekth6915" isn't a fallback, modify it.
v2: https://lore.kernel.org/all/20240715073159.25064-2-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1.  Respin the series on top of v6.10.
v1: https://lore.kernel.org/all/20240704085555.11204-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index a62916d07a08..f683048fd0c4 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -24,6 +24,7 @@ properties:
               - elan,ekth5015m
           - const: elan,ekth6915
       - const: elan,ekth6915
+      - const: elan,ekth6a12nay
 
   reg:
     const: 0x10
-- 
2.17.1

