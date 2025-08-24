Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFBB32EC6
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 11:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06410E200;
	Sun, 24 Aug 2025 09:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BGQe0Aqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCAE10E200
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 09:27:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-61c51f57224so491630a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756027657; x=1756632457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=BGQe0AqrukU7fgWLcwPKTlrZFUA2F/wDjmffEqVIH4EYKi9YPCsBQVgqFzFROuSZ6e
 jew5rVQIX7Nx+41M7omiRMQjDi+eJ7aA4SOU8zG91H0CzNZsazOJUFApAVJKDAQmxSiW
 XTY1SfbWApLi0ZB0TF4kzR1Qo4X9xpf9bZT6ll29FnUGCO3Y9fl4DYwf26Tdhqw57Rx3
 c530w1qbymMuaAuYmtMxnEPykmdOfCome7vgq42550ruGCqK22j9Aibuf2BXL733Cdyq
 2dUHWyoHjbMLVnzsu6AWTPHqjDw4TLoxtjuUp4eDvRCYE4Vgu02k3l6yGYosUlTrjSgm
 b1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756027657; x=1756632457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZbRg4EAl+//ILxj7dao5FHZeWZVMErRSC6VDwPgGXM=;
 b=BnlCk9Vi+gwLi6Y8ew6yl6nxxhBuGtH7EK+FhzQN/vAFKpOYhiyDHzM6RJKO97czUq
 yUzSUq3u1LvLYZdhD7neocyA0ZREQkxPC9qCUFZmnYL6Qibwp7UaxxDMpWhNUqR95tlH
 ITo7UmVH6lw80Q0mJwRdqPOLTZ80uBNF8xtJuJcSLU45BBRptppCyvH8bj2l0uaC93h9
 TzY9U4JKFoHeLk+0z7q6F/yyyCBtV8XWP8A9aiid1+XLT9BwTJIFU8oarpQPWiPET4Ik
 /m8liqX/d9PvviUOwFbWJOMv036g/HxV1yFXETq+5ClnS5uBYajMsNzE5NZkAmL6MAyB
 9i9Q==
X-Gm-Message-State: AOJu0YzoWFg0x6de26RFIQKpjMSyGcryN2LjUWuMexcHBU6vymN2/hyT
 DtBsvUi1q+KIKnL2kPEUK36Gd5Fg9E4VnzMmv2vbHcetXN+xpoBqmihp
X-Gm-Gg: ASbGncsOxgbEXVSdEDXF7v+9fr40cSViPnD2s1fIiTGMdQoeDqrPLFrP3fNAhtGjEbS
 WKVT0wJ9h7m+J/l1s2vnIN2CZYB6q7n4caalNWTHOTbRfDoY3BD2fXXuv5QiMz8JpzQ00vCZL0P
 Txhw0kmpWTuftinRGB8StnY9Ew6bIkNXNzZiL1ks0rhQeqnSSwNmPcptxoWXtRnr0aa5BDFDD37
 XLazlR6OHL5tHxuGv/xx5rsvTaEfYwzKYqZCrjWNKd+tKv0nnBsJHG4joNvC4qtAfUQp8P1Y2f8
 Yd8/0PDvqs35AL4ERXNIrJp/tzYMimfpgbL4K9yqq02TGfIFHUaF9JgBPxMdYOJJFRmE5pf0z1Q
 GDKfDNm66UrFAqQ==
X-Google-Smtp-Source: AGHT+IHm3C4SB26ld3hs/ov0b0LmAoYAAxWshjWqcnq1DJJdqforuWTyDnkwgGX6h1mxJDWddM+Vlg==
X-Received: by 2002:a05:6402:46cf:b0:618:229d:707b with SMTP id
 4fb4d7f45d1cf-61c1b45c5a8mr6244590a12.1.1756027657455; 
 Sun, 24 Aug 2025 02:27:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c316f503dsm3035391a12.31.2025.08.24.02.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 02:27:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3 RESEND] dt-bindings: display: extend the LVDS codec
 with Triple 10-BIT LVDS Transmitter
Date: Sun, 24 Aug 2025 12:27:26 +0300
Message-ID: <20250824092728.105643-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824092728.105643-1-clamor95@gmail.com>
References: <20250824092728.105643-1-clamor95@gmail.com>
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

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 6ceeed76e88e..24e89c1d0c76 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.43.0

