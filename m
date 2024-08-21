Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF7959569
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2710E4DA;
	Wed, 21 Aug 2024 07:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a1OCz/Fs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1DC10E4DA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 07:11:40 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-70d1a74a43bso4406961b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724224299; x=1724829099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
 b=a1OCz/FsLp9q1pYaEpINvlSdQc+e86v9ziorSwQzH4nSp+3BUy1uB6x4pz0wh31pg2
 XcNQf6GWdZAS3jhmZvFLCwgF9pZAbFB5hTHSQ9ofozBmEws7aOrbgLX5KeVeYTgxwj5W
 VdVtXtLH0crUccxLStormxkDkVR5NEY46wBehueRUGYZeYTPO/yjoMfjEr8B0i5BkoCT
 UN9ss+m9FvmbyjaLBC+uLjh22L/1qC7Hy2EZnlDcctK8bqplAKtykFHxqGVCa7NawOEu
 T4OG1wy87mhjNPESekVUu5+L0CP/39iPj/FxtnisVffyVp39oyu6KO5HtZHvnkSI9nGL
 scTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724224299; x=1724829099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
 b=RR11OmyhoUofArvUYRPqueN/Wr7ZFFdXI0O84DFCWMB1L9EK7ywSXojNrV04YtMW4d
 tpHPHDUH3C7FW04e4HZyK7pOq8Skzb1mWTEgGCux9AF9GYcJZSIbwVBDSyqUOWlhA4tp
 V1ELUdxdB619W4ig4x+Ui0bWnop2ZaC91EDDY6pPJG/hU7m6BNfPSbji0hO7g8z9uW/Q
 U8HvmCOAJZDtbuORHeYzdhTa3taAzkqezSh9KKEBPN2XZ57mAV2gHeKEDY8si6Inb7gG
 ouE/oqpxJovqgqsaXp6KmXA3FnvjQncphGNWDmAk9smg1pvVWTWavsuQwDt1T7XbSjpd
 Qsvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGe7yovZ4HRjW9CVZwVgf5wR3ZBF5RdaUbZHhZim3aLYRfEOv4f5xP/mgYRdMM1eRORFb0WaAgyB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiAVI3d5skQdvUdTYYnmlXwja0xa1sWXzWu6SyTli2fgmpgD62
 p6zGSNvWauz+IAXOW4jEtPJpyf7oWdl5oDy7dbBgbhQYR5w1mw8r
X-Google-Smtp-Source: AGHT+IEWYZZmObSXmhFGqh/x0J/CjMh4owQPA8Y+I+83N4QUD5z+ARl4awvtakKaj7C1gklfFrVd5w==
X-Received: by 2002:a05:6a00:915b:b0:70d:281d:ee78 with SMTP id
 d2e1a72fcca58-71423462324mr1665273b3a.10.1724224299489; 
 Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v3 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 21 Aug 2024 07:11:30 +0000
Message-Id: <20240821071132.281018-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   93 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1068 +++++++++++++++++
 4 files changed, 1170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1

