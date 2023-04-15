Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F96E30D2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B5210E0CF;
	Sat, 15 Apr 2023 10:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FA10E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:47:09 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gc14so6756543ejc.5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555627; x=1684147627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dISlVJnWoSaQPOrIVy9KR50yRndMlP9B9wtDi4lm21g=;
 b=SCjs3vMvK2vVbIo4PEH9d6VWabMBvQohKJbY+fgeqC2sQFvisjZ0GgspZWffRy8dZk
 y6KeaK7MPnpTR4p3cA/zb5IZvkRki0fwPrItKuI39DExUfQP+Eo6qx7mgNs/2FEkigiQ
 j565yQ+cmOkG8X7Zts82eUD6V5SoTeVooL9sBYn1KlKioXjtggB3zFRdkewj9WJlvryy
 0GUlkG4BcmAyatKWEVvcsIcLHMIomzkba4xtVOiqTgWqI4AzbA9mWG1hk0mSGJrbvd1B
 ghkuN13whkF8Wf6Z0FDvWBOofX5TIOv6hWP2k1UpuJbPYjl5OsdvaoMlFNnxs+Vhc7eL
 70qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555627; x=1684147627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dISlVJnWoSaQPOrIVy9KR50yRndMlP9B9wtDi4lm21g=;
 b=Y5aVhmqrfP3Ig4bzbSI7vtjssKEAPBGjnchRQKx/HQ2nzb74fV6Iw9778PiPEmUvM1
 XCoN4nfckuQGqlR5RRj9dEqOywMOExRivDXfSHKThfQm3W61WmTLfGiYxkWIwvHnp6Kq
 LAR3O1CnVPOiU4ygoORcP3i+da4IvHScrwAhivesS/SDrjkoZj7qh3vNJ9Jo0vWFNoYt
 e5d2qSmVJdZApiuQvBeMMoRm6DXAnxP6rC/vZDLK8c7HPEqbT4ifdLXyozRda5//Q4Jp
 NHhShwpfRNpyYa1716LkG+LOKZ+muYBoiaJcIFx3kwQw5JFNXXjEBr5CKzrzn7Cln0Ak
 rW9w==
X-Gm-Message-State: AAQBX9foAmUdUijRLBtS5hGRnFShFK3bIkJQMahYuJb6DEo28dIJlNFd
 /0nAjWHuP7gib5I8iB/fk2k=
X-Google-Smtp-Source: AKy350Y5afmiBhKRprtC5SNEdZYPWt8T99YvHJGrJGHbqb6r+TSAdL+giiW/xUXtzn4KHSMx6NBvAg==
X-Received: by 2002:a17:907:2149:b0:94a:4d06:3de3 with SMTP id
 rk9-20020a170907214900b0094a4d063de3mr1493742ejb.72.1681555627031; 
 Sat, 15 Apr 2023 03:47:07 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:47:06 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 samuel@sholland.org
Subject: [PATCH 3/3] ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC
Date: Sat, 15 Apr 2023 12:46:13 +0200
Message-Id: <20230415104613.61224-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415104613.61224-1-jernej.skrabec@gmail.com>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Beelink X2 uses software implementation of CEC even though DW-HDMI has
working hardware implementation.

Disable unused DW-HDMI CEC.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index a6d38ecee141..38f40d69e5c5 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -150,6 +150,7 @@ &emac {
 };
 
 &hdmi {
+	snps,disable-cec;
 	status = "okay";
 };
 
-- 
2.40.0

