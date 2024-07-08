Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71892A8E8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 20:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4410D10E329;
	Mon,  8 Jul 2024 18:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CNANpOwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B2410E389
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:19:01 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ee98947f70so30633451fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720451939; x=1721056739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TSBUSiGrKda6Rclc8JKjTu2mlczLCGQS71CjDrMpfKo=;
 b=CNANpOwXu0a/gTNRxHDQQoluXY6Zkz5Gsc5n33Y9xFTD6EnLWuO6O5kQeCDjyFwTRX
 TI+cQlK2e/gJDDsSTkB9am0JUVPwGLCmOPVzC5VCpsjM8Xv9GSagyTn1exMLaI9V+bB/
 aEkYYajb/TGCURHaWYuyftdLQYSCO6kk2GMLyfPlJIu7GjMUJQswLVAZwdj95+YbkbdU
 m66uVdl83y27xSZy4Q739ULYhXCpOWL1fM6bpZkKljSK6mfTu3gx+wHRvzjKMQ+sVnng
 e1rMJ86xu4exKe31OahS6SFKEGjVGSxZTcrcHyEvV2pTNpJi7TG7CbzXVQHV+5uZhNPP
 NCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720451939; x=1721056739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TSBUSiGrKda6Rclc8JKjTu2mlczLCGQS71CjDrMpfKo=;
 b=ew2N74Vqon/0JJ3bAWO8TmLva8Okn9yv/8ua/Ur5wcix6OREe8QZYpdIFTmvkNXaJ/
 6/5n+ytHBLn2vcJnwregpGSvmGIpXe8Qx1UZ1ebFQJ+8B1AFU9QvL1C0MDRfq+Db9N2K
 RQP9GBHCUwRD6lVGjg8ahGGAzRmOuhhCOrGnWPE3Y0m8dFV/gAmO5Sk+/oPyJ0lNKC6S
 NpNa0QiPOK6aN5HA7qcvWSaJMuTD1hvGO/WBYfgf7tQmasoa1q5JNffJu0n9NA7ghJBf
 jrTrw5iCDfwW+NbkC1Tg39T+P+j4CpJKN1/PcpgDL2lj48j4OG7sIh2UEQvoMg8RRUBe
 SPvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYOIwAu/hFFDrR0QD3a1PsD0kxhfkA6nOLbKM37qoWBPgCJugbV+hxEl5gRu+nwFpZSqQDJkTETbPsIpsusds/2YdgpYvMCqxnIXa2gc3K
X-Gm-Message-State: AOJu0Yz7P5GiSf2z+C/A+yhe27mySHhYc39usuZKE+ccjt46k1CP9Gp8
 3HHyPDGWFuEtWaQjmiJ2a6edcq81AmczkTLgH9YvrFG8DOMwjHEp
X-Google-Smtp-Source: AGHT+IHBOpU2TpGoqEtMyb1uE3hxIskr/IILSBqTmPyQ+zwbgIxWLN7Nwf+BZwShchhySLprAWHYaw==
X-Received: by 2002:a2e:86cc:0:b0:2ed:275d:aa44 with SMTP id
 38308e7fff4ca-2eeb30fcd17mr242501fa.28.1720451939038; 
 Mon, 08 Jul 2024 08:18:59 -0700 (PDT)
Received: from GLaDOS.tastitalia.local ([37.77.97.75])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58e113d1c45sm5537837a12.64.2024.07.08.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 08:18:58 -0700 (PDT)
From: stefano.radaelli21@gmail.com
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 "Noah J . Rosa" <noahj.rosa@gmail.com>
Subject: [PATCH] dt-bindings: display: bridge: ti,
 sn65dsi83: add burst-mode-disabled
Date: Mon,  8 Jul 2024 17:18:56 +0200
Message-Id: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 08 Jul 2024 18:21:55 +0000
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

From: Stefano Radaelli <stefano.radaelli21@gmail.com>

It allows to disable Burst video mode

Co-developed-by: Noah J. Rosa <noahj.rosa@gmail.com>
Signed-off-by: Noah J. Rosa <noahj.rosa@gmail.com>
Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..eb9c8b6b6813 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -35,6 +35,9 @@ properties:
   vcc-supply:
     description: A 1.8V power supply (see regulator/regulator.yaml).
 
+  burst-mode-disabled:
+    description: Set Video Mode in Non-Burst Mode
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

