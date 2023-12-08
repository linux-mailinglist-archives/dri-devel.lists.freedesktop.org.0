Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F280A7D7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8695210EAAF;
	Fri,  8 Dec 2023 15:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FCE10E280
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:48:53 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5906048e9e3so892107eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702050533; x=1702655333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sJJJXTD3ENUousJPpiYIp/VztCtL02D+xzUtCsBqSw=;
 b=jL698DI4y3K4CfRjDu2ZbUjc5shIhgD6eQLdOFeTrGmTcziKPz4XvJdd30EM4YMAgA
 X2AMyqCMfV+Fwj9aV2W9o6AXwoT79V5roXRznvsJodmk5Eay2rrKmRUfGKxjhCizzydX
 PjpQVflEsmFdwoX2rsRzisYCaz0MfDkTKc1CgBnpYhVpzDJDYUMeQRQnagWbQRemFruA
 rrtpq9fXZvzdX6WYs67TrrL1SXTwkFjzAC2GXt1Fkdn3uTa3fbfWnk7govVJOzyobyKA
 IEtyd73JUQBHdIR1NwaSaSW4UbhdEAvR4PyG1C/Hu4mx0diNfuHUjESEx1VqSqw4VKlT
 mNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702050533; x=1702655333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sJJJXTD3ENUousJPpiYIp/VztCtL02D+xzUtCsBqSw=;
 b=Gw2awkqG5T7L9hOBaMLT0+eVOjoxMeRINZiNPGjO5nCerEsJBqKBupHWgcoqhRv4Fx
 0dFqdbFpP3Y4BfB1kMqVwM2gK+PJo2cekEGOUge/vPuxnAWXuR2EJKAKLhcNY06xupnd
 asm8jEbd/Z5aAKa/u6f2/NXkabjcrCFgKhx6UPYjY/is/WaPi4nmPJySmXGP50z6PHdj
 Cw5EOeHD5ZgOQ+MM3dmpR2kLAl0Em7o9SvgnKsGszKg9Wk++Q6UYPZVeG3gI0e9OCUfH
 Z4U4XvGHuaYZfKbBWdmwXXZfDNIwQ+OuhqLMwmsRTMAX1pLp/vGYesAQMu7Cr7KF3bNa
 xvKQ==
X-Gm-Message-State: AOJu0Ywvmm8taAsU66pkyyLGhZKnqFAeEoOvxBV82L/6QWKS3c2cxdZH
 9JCL0ZTqsoGx+her037D0pA=
X-Google-Smtp-Source: AGHT+IGJhsZaSLxxBlw2I8ajoJKeP/a3CPks6R0804004vPLyNn1UUEcixbC98/jUUDIyfaj5kOqVQ==
X-Received: by 2002:a05:6870:37ce:b0:1ff:adb:29bc with SMTP id
 p14-20020a05687037ce00b001ff0adb29bcmr498503oai.26.1702050532999; 
 Fri, 08 Dec 2023 07:48:52 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 os25-20020a0568707d1900b001fb28cd0e9asm444624oab.3.2023.12.08.07.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:48:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: st7701: Add Anbernic RG-ARC panel
Date: Fri,  8 Dec 2023 09:48:46 -0600
Message-Id: <20231208154847.130615-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208154847.130615-1-macroalpha82@gmail.com>
References: <20231208154847.130615-1-macroalpha82@gmail.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The RG-ARC panel is a panel specific to the Anbernic RG-ARC. It is 4
inches in size (diagonally) with a resolution of 480x640.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 4dc0cd4a6a77..b348f5bf0a98 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - anbernic,rg-arc-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
           - techstar,ts8550b
-- 
2.34.1

