Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E49E94E7C0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 09:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8169410E124;
	Mon, 12 Aug 2024 07:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4ZTbnMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19C610E088
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:00:50 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso38009635ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 20:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723431650; x=1724036450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
 b=Q4ZTbnMPKavPDXhOEKYIOCP1j1obp6rA6VhQr9E2zagefrz8TLY0VG0r+iTIBZLhXj
 oQNeDVV5FCN0LjL+nnBaAa/Wf5hv1enKWBjx9lTB1ZnlZzZVy/CEwcrYLDzqcZ7QNxg3
 aZ5KIzT7AAJfVeBx6lPctajek8PvhUFtD9PkWRQ+J7D9S2+5HUt315W2WrSSHV1b+qlz
 IkvqEKfXTjEcu7D/z9iwHIE7Tu0RFJXcFmxTwKEx4beRwlWPzJeKQmVEAi05hUJzJao+
 vNYU5I/K1sTlC29fiWKCvH8bbOVGNJUEI/sj5MpH0V+Gg35LZdOwsAJBVz9UzotF1FFN
 Gxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723431650; x=1724036450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
 b=UnO1XZRxyB4X++0VnBuoY2hF4pHDK8jisL5kNEvxFsoVNF/TvxuPfJ1kHTbXfDgaAl
 ZikthielpsgeKrUuYgUeQqMXyaXxPfEAoUGNSGaBQcfU0jpMPrQMeP2ElEZnXFUOe1Kn
 k/XFMaRVD00+23Bjp/jk3dD2Eg9u2EXKty63Jw2F+v8PjvvJyI8Kme7mUMdimvEUQYOS
 WYMP0vF0o84aCzzkJGrLMh0uLB/s2ufAHIfQTCdwH472S8210H2rg0B+qqpl7HBuhhrY
 SmOgoePDQHIuF7ssBOJdgA9bsNuSrGQYTIRxdjQKmj1ItqQqpuVYWvzEPq7905Zivv98
 lKtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0zRxsfPAkKWlvaOuUg3Wi1EiQItroNbS90WzTMmHo+jFodTCITEsvrtckpHVxc3sGFXGsktqipSfTS53iXV9Dcj9P7uqD6np1pGE0/Gim
X-Gm-Message-State: AOJu0Ywb7AL8uP7ngP2yZljNxI+4Zq6BdSAL+D84s6oDR6x4fTa+nOo5
 Q8FY5DDPwHKvv+SAVp0ACgdF7wEsqAu7s6P6KCNxjNaiCfKoHLY8
X-Google-Smtp-Source: AGHT+IEJ8WTy8J8fye8zaROoWmQq6+cN0Kjc/PExZ7qxH8LD7+eVyHDYBQi9qAS7vBp9rMYvHruCaA==
X-Received: by 2002:a17:902:ea08:b0:1fd:9420:1044 with SMTP id
 d9443c01a7336-200ae4fa836mr117585105ad.16.1723431650367; 
 Sun, 11 Aug 2024 20:00:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 20:00:49 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 12 Aug 2024 03:00:43 +0000
Message-Id: <20240812030045.20831-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Aug 2024 07:27:30 +0000
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   97 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1109 +++++++++++++++++
 4 files changed, 1215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1

