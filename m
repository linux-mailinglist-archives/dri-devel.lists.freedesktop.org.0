Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822F97E73DC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 22:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD610E927;
	Thu,  9 Nov 2023 21:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA6D10E928
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 21:50:16 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-587b1231dbeso726361eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 13:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566615; x=1700171415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMh7dJy6c7Z6dmqAsf3sJ7b9dHtCKsqZ04NpaCQ7mOU=;
 b=OOmg8++fBzh4g+U46qCtNyVBYIwDCm0zvtDrnzWcd8Y/q7pIxe6KMH0uhgDh/S3eUJ
 N+b3a4KRY/GfTXGkzrQavkEsL0Ivm2EnjCwyPcbyEVNpfb4HNjem2k5TBWUyMkcNXHXe
 78QJtvd7z2HayBiyf7jt73Oy+Q1x9juMzW8wtJeK/ONzoF3ZXvg2rsE+f7pePaXdsMe4
 VkY7oI9gmlhsZV28RX46sBTjhU0JstzEl3nGuce/dgpi9Hqf/2we4ypn1/yCWz78vMrU
 dymGB33AJAzEDTVznuS0Pa9iqNVV13hHIYN3JjPQ426YgguSdlvDpcZ515NSx6irbENK
 qMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566615; x=1700171415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMh7dJy6c7Z6dmqAsf3sJ7b9dHtCKsqZ04NpaCQ7mOU=;
 b=RuZyoDD+bJy2EPaVpXDqtPJGs+f8s2mOSS3sBe33GF5+fOcRqE2SNl8s0d7yD4Geir
 IEMKTFLmbMx0NDHENbyrjxvTjFr3fLJDdCvsUIoI8e5ipaOPWSwJ84e+rTMwvV/QFfvX
 ZPztEBLSAYgxllWX1gWONtM3M+orjO1msRpj4TdXjlI3X7nQOaQjr7eQYPgWnY/geSqP
 uFs9dyD3KPtigMpe+e7YJEbqD98ZR02zgxDCStfAg+TEYYvQ8ihIfKBTsW0sgsm18uul
 Xr2yW9FoAV9ntW+cusCIj56LaJcc6VHRnw/NYqPHOHZ0MfYahSar7uOrs9OWpLeGk72I
 1sEQ==
X-Gm-Message-State: AOJu0Yy+/lZ0sdlQvtlf55FMSLdbMM7hiv2kkBuyM2ujODktQT0p7IHh
 AUhF+R0+MCR+LxroRRYn1EAg7RB6k9g=
X-Google-Smtp-Source: AGHT+IHVkaf5YA3dz3qNIlTDI7draK5AFkU+1KX4tYYgrlpOTTqQ4WZJrARdU/LxrRrJ6a3/Gg2NuA==
X-Received: by 2002:a05:6870:1099:b0:1ef:62fc:d51c with SMTP id
 25-20020a056870109900b001ef62fcd51cmr5227511oaq.51.1699566615423; 
 Thu, 09 Nov 2023 13:50:15 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 tp22-20020a0568718b9600b001d4d8efa7f9sm864003oab.4.2023.11.09.13.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 13:50:15 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 1/4] dt-bindings: display: panel: Update NewVision NV3051D
 compatibles
Date: Thu,  9 Nov 2023 15:50:04 -0600
Message-Id: <20231109215007.66826-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109215007.66826-1-macroalpha82@gmail.com>
References: <20231109215007.66826-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update the NewVision NV3051D compatible strings by adding a new panel,
the powkiddy,rk2023-panel, and removing another entry, the
anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
rg353p-panel and is not currently in use by any existing device tree.
The rk2023-panel is similar to the rg353p-panel but has slightly
different timings.

I originally wrote the driver checking for the newvision,nv3051d
compatible string which worked fine when there was only 1 panel type.
When I added support for the 351v-panel I *should* have changed how the
compatible string was handled, but instead I simply added a check in the
probe function to look for the secondary string of
"anbernic,rg351v-panel". Now that I am adding the 3rd panel type of
"powkiddy,rk2023-panel" I am correcting the driver to do it the right
way by checking for the specific compatibles.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index cce775a87f87..7a634fbc465e 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -21,7 +21,7 @@ properties:
       - enum:
           - anbernic,rg351v-panel
           - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
+          - powkiddy,rk2023-panel
       - const: newvision,nv3051d
 
   reg: true
-- 
2.34.1

