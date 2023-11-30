Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546E7FF425
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7D10E71D;
	Thu, 30 Nov 2023 15:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9ED10E710
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:42 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6ce322b62aeso629653a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359801; x=1701964601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sWTB9BvFGB6WA60MMINgbzw8nAjuQT9CcbxWGyQD3o=;
 b=As5ECIGffKKTHPAPlChoFu/j2YlHia8tpyl0eE88APmqQokXv2BZl5PcNpfpFIclFj
 E6UBzztoumsMYYTRFrPllSuxJ5iT8Xs9tQ79GLo7gfIMOE8BDz3ePeV0qX3zBDD/wiPu
 YjQ1Uroag4kYDd0AQ2daQuKb5jajp1in66VYBbm+nQtbmpD87H+Veuc55aCafDCsRGpu
 wB3lZGRb6v4G2+QLPN/0m366SR4U1dbIDpzQlLagZ2C6GJs/LRpeoDahse7yczDAnuv/
 dVnOibM9FjH6I9Wg2P1OzPfFUa6kDUP6mY2KgAWffbEKrpqe0YlYEcIpLtYwwvL78pzy
 0iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359801; x=1701964601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0sWTB9BvFGB6WA60MMINgbzw8nAjuQT9CcbxWGyQD3o=;
 b=YqbL5de1stYX3omyZp3efk3J5Kl7/IiGahMML55hIzU3o9bsfzLhGLWkg61NdxZeQw
 yJHf/nIYB5albJNzoL4eQamXVlPz7mKQpZa14ZXTK6Ra/47Pn8YKscYKapV/kKpU44EJ
 dk9R0/NBcGstHRpp8lNR6ylP7wCClTzfwNCcvVKDKaLcmgm6R2/V9kKJydVKotmqy21I
 JJ2vK61iCJ3wEAKX5Dnp5QyiimwkvKeQFzBvy3NTItqWDGA5ooBg91ntA8lJZ/wc00h3
 YtOrhYReEN+FqurI8W46c+5kBL2tZvSKaKo8llbJ1MaZvq5tqTSsNTqFGXOmJlGnYKVc
 LRxg==
X-Gm-Message-State: AOJu0YykbC8JOVR2qhsiOIT/iiUpmvO1e7cuSCLn3Nf4jNVXWYrnugwr
 7SmSBMJ3eTWxMomtrSFvsXv5l3/UZRE=
X-Google-Smtp-Source: AGHT+IGhpeCC7WDuUm5wiohpgqJLZBDERA+sjaUEm5YoAWSiC2xyMiO8MrsIn2UVXz1odmuZv6XxQg==
X-Received: by 2002:a05:6830:16d9:b0:6d8:57d9:23cd with SMTP id
 l25-20020a05683016d900b006d857d923cdmr4029693otr.22.1701359801533; 
 Thu, 30 Nov 2023 07:56:41 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 8/9] dt-bindings: arm: rockchip: Add Powkiddy X55
Date: Thu, 30 Nov 2023 09:56:23 -0600
Message-Id: <20231130155624.405575-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC. This device is somewhat similar
to the existing Powkiddy RK3566 devices, which have been grouped
together with a previous commit[1].

[1] https://lore.kernel.org/linux-rockchip/20231117202536.1387815-1-macroalpha82@gmail.com/T/#m4764997cfafaca22fe677200de96caa5fb8f0005

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

