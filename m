Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3F803DD8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5C10E3E1;
	Mon,  4 Dec 2023 18:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0410E3C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:34 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-58e1ddc68b2so1950331eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716253; x=1702321053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmJdBsEIoaHpkciH4cOKP2SWtpRhXc0Wn244MKf8EyU=;
 b=Bxnut9o9A8AJ9zEYMaDLAzpmXighG62Bxk4d12z+GIY0Ou99H8PaHqy+nXee6LDgLb
 N1gHCGlEiWiP51fv+9aO0tRT3UAOLBfDflQSpM6zGv0PtCRgDqBPeFT0TJMLhj6CdC8h
 rUtoStx2sRXAIJOnguoqyVN9udOnc/r3bUnSdSNu1TEmkN7RvNn4Z9HpwICNorwMA9SF
 ff0Mj85aLsWiXUpkGtdfAioTI+MdD7a39TvdQY8L/W8lzLzHgaCxvLtVNGVgFvse9+TD
 puq/SaVLBnhkiZc9q9te+lFsaOnoCv4/QBD8S2z3e9F9nIl8Pb5Qzti8s6KIet++QviV
 qXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716253; x=1702321053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gmJdBsEIoaHpkciH4cOKP2SWtpRhXc0Wn244MKf8EyU=;
 b=LJDM7tAGCuUcv4u+fViuZ1SunRSGpe+FaBwaSZ4uVzwNqNqjajiCSt0bACqdFFJjZY
 Rdc4V2lc28Tnx3FzYlEISocnsGnwRlCnb0jLi5f5dmKgY2oXGbRWrSDoVwEP7rcNtUsi
 04aE6n1cFj6c4VO8uaN/u77ZPyZUtGJmoJPxc9M3OXS0nKYnoZ5F2IhYkboHppgkPtEA
 feiwkfa2Mk2oinqeJ0M7LrFSpcJSFS6xxDmgGtg8TK5Q5hLewkHVsdXjDJT5ImJ/jF3u
 kl+XzUrAXDISz5KbP9VST4AINU5f/+x4vWMICA4ej6IK21BtL/9KR1sYAE2THxspmhdC
 RG9Q==
X-Gm-Message-State: AOJu0YzolQwFT3Jy2ABPNHzGYU5MXCh668aSjCqqyJGqWIw+lMSe3mVm
 L/IQ7zoDkp1AHN5C71kprmQ=
X-Google-Smtp-Source: AGHT+IFQGyE/M8sayDjI/7D2oxRg41bIw/oTyLd8Z0sAIq2ffMyqLkUXBu0XuWHn+CEm/Ver7+3Bkw==
X-Received: by 2002:a05:6820:2291:b0:58e:2845:d43b with SMTP id
 ck17-20020a056820229100b0058e2845d43bmr4008004oob.4.1701716253433; 
 Mon, 04 Dec 2023 10:57:33 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:33 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
Date: Mon,  4 Dec 2023 12:57:18 -0600
Message-Id: <20231204185719.569021-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC. This device is somewhat similar
to the existing Powkiddy RK3566 devices, which have been grouped
together with a previous commit[1].

[1] https://lore.kernel.org/linux-rockchip/20231117202536.1387815-1-macroalpha82@gmail.com/T/#m4764997cfafaca22fe677200de96caa5fb8f0005

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 021a0e95ba62..5e22f247ee6e 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -681,6 +681,7 @@ properties:
           - enum:
               - powkiddy,rgb30
               - powkiddy,rk2023
+              - powkiddy,x55
           - const: rockchip,rk3566
 
       - description: Radxa Compute Module 3(CM3)
-- 
2.34.1

