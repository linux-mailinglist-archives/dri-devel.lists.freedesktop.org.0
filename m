Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8F534938
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 05:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF410E0A4;
	Thu, 26 May 2022 03:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B5110E222
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 03:16:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so3305674pjg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=f6jLMtJrLguZvRlHX76uP5bxS6yNfg/KmTP+kPMFw2A=;
 b=NeNH04nEYmKlxRrFKbjU/A5gGFIWu4QfR8rsFuFLIoMj/OrRI/CL7ER+lH9qLFt6v7
 ooZ8tD4znoyV6cfroKC0X30K+JpBNll7tDwyoQEOt1T0x31lWIx3QTniGgdXW7dIvOtc
 b4aaIVHO7NsdfcTDz7PzU/L+pt0XpbvhZgKefdOaQjl+N/0EiOKDACOvqf0WbJ2hsd8J
 4w2hNrFaONz10ivo7QxmqlKWabHG9lJ26TdaR4QRjHgfuLuKGy51TlVwRzWEHXe1l3Yn
 SOYziVzsEMKCg13T/uWvBClWFNplGswFouHdSq9sQdGi607cYz47CyI8t2H7vZtNMnC7
 gTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=f6jLMtJrLguZvRlHX76uP5bxS6yNfg/KmTP+kPMFw2A=;
 b=O431bANB5kJJlZnDWH1zJPc8Hl7ORW77Izwt2FX9zkx5yiaKGyDl90OA9mfv3yRla4
 SPzdAzppwV58jBiytvEjNC/+ODWih/gFVehToOH8YzdIzykHgeDr93RdRjTigw+wnzN1
 q+o0s42QROxmc4vaDyUqjP1uBDr0ydxud97Qrwf9gv73JvfW4jhzPWpuoZbMsaJK2Jdw
 fPVKp+IsZyYxgv8uLqNdtqMi7e65L8ODkzgWTdMaqSqbPuOjxvw+jchS8YGTIlnvfr2j
 kiK/lOwBBuLi6DEV6tPZKPFGX7rutGyFMeosvjGfAPQy7H9mLv6HJuD/QbeYZ4XD3q6y
 cDFA==
X-Gm-Message-State: AOAM5306bGoqcA4WJJwQOwV+NuHUaIs5elPjCuqljDS05h80FGzz77fC
 753fu8BcrJYyGHtcQk89V2tXN2dqqrs4fQ==
X-Google-Smtp-Source: ABdhPJz/ng9MEzMr2C0bCqTgfwmdUaqu1tPBtgobFs5R3bzVReetE9dkkSyLpZEelrkVQ1dPShLBuQ==
X-Received: by 2002:a17:903:2309:b0:163:5c82:640e with SMTP id
 d9-20020a170903230900b001635c82640emr5614243plh.100.1653535003625; 
 Wed, 25 May 2022 20:16:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:6b12:f420:101e:bfc0:b57c])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa79479000000b0050dc7628181sm152964pfq.91.2022.05.25.20.16.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 20:16:43 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH 0/2] Add the property to make ocp level selectable
Date: Thu, 26 May 2022 11:16:33 +0800
Message-Id: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series is to make ocp level selectable.

Some application design use small inductor. And it's easy to trigger the
over current protection. Due to the OCP limit, It make the brightness current
not match the configured value.

To meet the HW design, the ocp level have to be selectable.

ChiYuan Huang (2):
  dt-bindings: backlight: rt4831: Add the new property for ocp level
    selection
  backlight: rt4831: Add the property parsing for ocp level selection

 .../bindings/leds/backlight/richtek,rt4831-backlight.yaml   |  8 ++++++++
 drivers/video/backlight/rt4831-backlight.c                  | 13 +++++++++++++
 include/dt-bindings/leds/rt4831-backlight.h                 |  5 +++++
 3 files changed, 26 insertions(+)

-- 
2.7.4

