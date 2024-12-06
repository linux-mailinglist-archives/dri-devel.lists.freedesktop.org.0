Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925589E793A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EA910F192;
	Fri,  6 Dec 2024 19:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GTy4Ue+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6361010F143
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:28:05 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-725958d5ee0so2354861b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733506085; x=1734110885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
 b=GTy4Ue+ebvIvavLWC17XGPF+yIJA5QMKYimNuOCccmSo/oHPKyE5oNBkKFLyWUIi7u
 76g8qHffhyrGZwegHhQ7w//wBu7gAf83QsLVHb4N02aIYPdUFq7vBgLLdduA5/5EU34V
 GJfoS7larI49oWs4dhSXPMjZgrCJHznRTYSCeVBvQVTuCnEO1p/mh/gLW0qz97UfcLWK
 rMTMmyTiEXS7O0V//3ICOs+k4wh3sIs40JBab0AQHn1Fn3kRH+nVFCx81O7vcDs4K5yl
 18UOID1oZbNkn0NBKVpEIhDkMgFRk+8jwVl4LGo3QOeIwd5d+BnOvnTtGwqWi1LCCJJf
 Bf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733506085; x=1734110885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
 b=jVHHst48HJNu0Z8wblSxb5JsFvyKfEBHwGhIdFlBOgWOXQQEwMsU1RmiF/Oz8pd8zi
 CiROmIAMe32pB+UbVBn4Gko6rWN1Zwc25FowW0Sx967qluHhmz+aTJ06Axh/yqLanYGt
 CBqM5vRlDQQeuRK7R64leSYc/06FPInaUfM40KIYhKf0Ykctu+bKmXo7dR2hfsgNocdJ
 9eHFNNHHj+DhNtDJLEf7DIiSeYLEpPH3N+x77APQ036CL7BEzhmhVrzee1QzEkC8SLHi
 fDBi7syrzH9ronzEkrYyCXEpuFxIj5GlpRitH6WsNHon7OK3gMEKlxSDDoRBY1VskPt/
 eEHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUORF+86tzXcl6hzxugm/0sKhElmcImIbKqsD85ub46eyGPo1gHElbGDVWbV94/HyEHnYGNh+x7Piw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8ZUhpaRiJ3bkDsmAuDNv7rw40z/jHnmo12nkBmXzHU6ndDCWy
 l/o6InG7EQynIbOomUmQQRwgVf+MkziVisnNRPMW2QXuBXZACmwb
X-Gm-Gg: ASbGncvJlqprr9+DEY8L5DLTAlceZUwmXwu21yqBdBSZGyl48je7y5VVi+e2u4Wx/8l
 mPamZgHkU9wBkYelhiJfYYiFVg5xXGz5YLXm8BgjnQ058DCxgJ0LFcmVWJHppZTZ7vLUuXpMjXN
 S27K8TyELLkUfkmVnjDod2Uu3zR4lKx9/M6RnMXqk8CfkJc3OR53eVzl/dUYaT5G0QL93hWPVUl
 Jju02okRfaZ0z8zL2i8Ew9VyNjtihk7bTyufe2nH6nZio6T1eOhJzMIPOk4ffIUcsYX
X-Google-Smtp-Source: AGHT+IHXdwewDIPQOXtv1iEJ1h+wD3M9qyi9bwIoqyxS6+rfSqoJNur+gfxUq0L2I9fps7PZzh+XJQ==
X-Received: by 2002:a05:6a00:806:b0:725:90f9:daf9 with SMTP id
 d2e1a72fcca58-725b812aaabmr5813954b3a.15.1733506084740; 
 Fri, 06 Dec 2024 09:28:04 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 09:28:04 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:32 +0800
Message-ID: <20241206172735.4310-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches 1-2 backlight controllers are attached via this interface.
Though, to software using this interface, there is effectively only one
controller to worry about since the registers changes the brightness
setting on all controllers at the same time. This series adds a backlight
driver for backlight controllers connected this way.

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  55 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 123 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1

