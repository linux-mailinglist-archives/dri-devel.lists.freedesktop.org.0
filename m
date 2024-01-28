Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509B883F4EB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 11:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00910E17F;
	Sun, 28 Jan 2024 10:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC5C10F2A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 02:13:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso28718805e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 18:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706407938; x=1707012738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=35NVnUCrAoL2Bl6xgkajSyqCpv//AkjIFBnUqXmF4uw=;
 b=gnKgA2XRW98Jzp/yN5+TI84mjGEoW18XBOAgcn3wiM9VID13UGgLG5XQ3yYoLuJaA0
 nIQ9kmc4MfXhN0iTOS87GJcyw7lbtqUYv5LCEyxoEsWLJlZso7NkecdFdu/A8q3XwB9U
 XBojH3w4R9Dh+lDo2/FEW4S4s92xxGpvdDS9U7Y9nQPzyPEzUa4XG3/mw7nLNne4Pi4y
 n3QOemDLVTEIrqqHrjoGNzXEPC9gvnnRbM9wMcMyKxHP9aI+d7nbXYODxYAt+wrgkqQd
 RXQCtjEw2+eV8aZkOIsyBDOyIEfsSvTbxHw2VasYjzDRH9ukS+WBPz1lXs6+g5Vii4Fw
 Nsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706407938; x=1707012738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35NVnUCrAoL2Bl6xgkajSyqCpv//AkjIFBnUqXmF4uw=;
 b=ZRJ+b0IHf6Myi6aXqlMAiNSCx1NYE7yVigmTSX5GL3ETgnqDQkiMtPCtqMGrx+Urn1
 3K+t6Yi6TVtR57nmZGZkoCd3VQV4DNYeQcClzsEesg9ZToOmMnB1mWsCXrb3nWTY1Th5
 vUlKJx06QzvvS6D7T1ysp13HKuSuvfjvxi5lTZ0GPP2VWDmDeVFBixIN9ljulcdXmKkh
 6+lPRl97IdahAWPMVWupXy8W54J/IXqQjj1GHCI+obfQhVPpHX3KVqQvZ8C2wdgH+TsR
 fvdx9t66fjn7Tr6kkJZLaftsEmC/jZRD3bQHBHYSq1DAKPxOXoDWyOpgOfCfY8qcr2mg
 wyDw==
X-Gm-Message-State: AOJu0YyMBcR6Hg1M4hqnraGo4Bh8ZT4y2602pmkAHU2ZkV7mqqSHKJ1Y
 1e4KWe5n21mcLommRJIbgyVfERm88m4uTY5B4ng4skUTVjAyyFUX
X-Google-Smtp-Source: AGHT+IEo8cNmJXwaNwrkTYAWovtC2KyoIaSk7smKh0ZeQYCnrFJYEEedA3Jfbp0Dn+6UaDve7kkhww==
X-Received: by 2002:adf:f011:0:b0:337:c73f:db0f with SMTP id
 j17-20020adff011000000b00337c73fdb0fmr1789723wro.41.1706407938053; 
 Sat, 27 Jan 2024 18:12:18 -0800 (PST)
Received: from Hacc-ARM64-PC.. ([2a02:908:4f4:84e1::1051])
 by smtp.gmail.com with ESMTPSA id
 cl10-20020a5d5f0a000000b0033aeb20f5b8sm64584wrb.13.2024.01.27.18.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 18:12:17 -0800 (PST)
From: Ao Zhong <hacc1225@gmail.com>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH RESEND 0/1] drm/panel: st7703: Fix Panel Initialization for
 Anbernic RG353V-V2
Date: Sun, 28 Jan 2024 03:10:47 +0100
Message-ID: <20240128021048.6059-1-hacc1225@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Jan 2024 10:11:19 +0000
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
Cc: Ao Zhong <hacc1225@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Purism Kernel Team <kernel@puri.sm>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to parameter errors, the Anbernic RG353V-V2 screen couldn't be 
properly initialized, resulting in a black screen and unable to
display anything. After correcting these parameters by referencing the
device tree in JELOS (which uses the BSP kernel for RK3566), the panel
started to work properly.

Fixes: 0ed9208cb120 ("drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support")

Ao Zhong (1):
  drm/panel: st7703: Fix Panel Initialization for Anbernic RG353V-V2

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

