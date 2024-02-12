Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F091851D40
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC8710E74F;
	Mon, 12 Feb 2024 18:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KlpIyrml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B3110E6A3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:50:03 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-59612e4a21eso1402614eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763802; x=1708368602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAxk6zsY006+CdXJFHNEbBOsPg1Aj77aFmaDPPFfc8o=;
 b=KlpIyrmlcH1CONIeKcOXqNCDdA2FNxnELK0rxNL5uhUkRbm++n+QzK6tX5vfPcVPPc
 zELU5AtRpg4sRMIZelAYRikQ6SlcSVtUHdTgR0uuUoQ26Yr8lnaetL84Z7WbpHKMaGLr
 1XZ9IbvznhxMBh8RkO4dDL0xMyJdudKREP7EPU2CMHAjXXkj59C+pwm6Z+txGXxK1zAM
 MMs/je43vVeIwyTidG1hoRCA9/kCm4Q9mT99SEY8TQBBjB/KNEgFZE3qGw61ByNp6s7m
 SJIMkZJaFiuWGqztdZZ1qU3mXzZvxDH5eFjDiNn6DlPTR2Cw0hy61UsFY8zo79Xm6U42
 BJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763802; x=1708368602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAxk6zsY006+CdXJFHNEbBOsPg1Aj77aFmaDPPFfc8o=;
 b=DhGyYpbyBZOeIDJjMoGHleH/16HQMHUoS07gNwdSnHrvlqkK6T2fyCjiMuBSdFSSQW
 T5XQ/V+XB7jyvVgR44vHrQ3w+c5XrCZsKfi95sortr81whvqhHPxIsQ/T1tyD7sEubuW
 971Ju2mwtBHicZNTLvTgCiwXccafzKt3KQicleBhACV+ZkaUx7TcWb2P9wQmbCgDp5Fs
 HKKWy+PYcg6tuxbF7aya/ikqe4C9N4PlIN2izopb3BmxwAq9At9vFAg7J8sQD7oXh0GF
 72Dkfp4PQDT6p+DCVUqPDt6DIQqts2BSs7EA9DgItw++FwuVyYcfGxbNEQSVybwAMGxC
 N+AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFTv5XZ7oKS+CauTl5XrrgNEwbYcoScm3lDmcTBwOKSaWaKIhs4+vGC6lF8sf/jQaOurw+dz2ditOBuZJ9AyUxPvsaVM1Nqn4SMWUjZaOW
X-Gm-Message-State: AOJu0YwuIUO0FiHIzNjeGChiyGTKVG+8ofQUOzhhxM+19jIOasw7v3Ho
 9T7c8YuB4TCYFYfz/x+LsQEuBquGbt/nCN8CEq44T+R8Lxv3VxwT
X-Google-Smtp-Source: AGHT+IG4JPNFvgManuBh98r3P3BSUJPLxom8f7QyRDcXHUAlIIydohC2YLLtPabAms2kr1vtYZp36Q==
X-Received: by 2002:a05:6820:c0f:b0:59d:4a67:cebc with SMTP id
 eh15-20020a0568200c0f00b0059d4a67cebcmr4021084oob.8.1707763802286; 
 Mon, 12 Feb 2024 10:50:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMe37f4x8CkBxc259TgyyFevQ4PbfKk2cgrpJtoMQJprs4FHbRuHdqk6qGveNFCAO7mz0AUXnTqouRTOea3ifPqPOxxpUmzXeaPH3jiPiyNJz1Mx8lH3KjypKRbfSPqGXLxVrp88B2i8rqXcuV8B1aMScc/mynw4vtGfEQHGom3QBgVcTOAgv8MOZkRwHJqrq+LrSdwgnwQOS6+NjK4Q9CF7JQRBoyH1uIADgcuDKqOFQbBgt2AFBCQtYxrlP2qdiUNQhmvtVmM8Ls9sNqplA+VFY2/Jr7lPDLRg0/j+yRbxIiQhrKlVqICWjYZtFch4oAzixg+8yDgSjJ0kxxqAZIsCCAXtcPUokAbrAiDLr88KJ5ezBmVCilzL/lvSeac36P39iKP1IPyKA2QPGxBn4bJEHZV/62IswtO6LBNTD1piuZKoc5WeIL0Vk/GR614iuwOAnvl5ctMVY21O0upAUut/kN/LGzLNlspsRGZIHTdc84elIkBZbrT9XRrxVqKHDgPVl/YGjeqeB2YzU+PQq9VjZf8jMal/HH52dngMfkUugHFBhCJdNTkGTu
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:50:02 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 6/7] dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
Date: Mon, 12 Feb 2024 12:49:49 -0600
Message-Id: <20240212184950.52210-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RGB10MAX3 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5cf5cbef2cf5..4ab0b92cf241 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -692,6 +692,7 @@ properties:
       - description: Powkiddy RK3566 Handheld Gaming Console
         items:
           - enum:
+              - powkiddy,rgb10max3
               - powkiddy,rgb30
               - powkiddy,rk2023
               - powkiddy,x55
-- 
2.34.1

