Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70367977912
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A3B10EC8B;
	Fri, 13 Sep 2024 07:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XITGnsX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E6610EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:12:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cd46f3ac9so14425515e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 17:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726186320; x=1726791120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1VVC89CjtWo5QJDEpjt4COs8h+KH+eSP/sYp+7PqSI=;
 b=XITGnsX89gJjCpiEoy2TIhTHJUjsV2kFmFLK4PTT1K33UbRLMwLSsrin3BjLmiCYoW
 BUmuoHw02NiPihDCgtvA3fa061zqtxLWzPxcy+pYak1ZMzxPAlszY5dx+gVgSbSJJU9q
 Y4R8PwQ+H4g5EjVYi2fvua9gJRICb2owg2GOjfm80ydD2Dx4YJQHxKcGVZbmzZltbM1g
 mKLKuwT0sxiuXWWanrgUNdjMgwrbfr5d+JA4/bmB4bpJNwX5Lz1Ay9A4UBNZuzgIUESE
 zLa9j1bJ3Cd664bNR5VMSS25zybHrABSnSn5kpoWHJp1KbcI7O2uOcw4pOkEqWBQsXOx
 PqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726186320; x=1726791120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1VVC89CjtWo5QJDEpjt4COs8h+KH+eSP/sYp+7PqSI=;
 b=KG3U7Ba54rL6ldbrwPj8Wu4OO6g9C/rzIjz2ddGnIHh03A4ApBS/RW2Z4Y0Eo1hfHt
 SCXRzmbslAAjAx+Ijnta4e7XdQ+WusSIBKKbakcGILe6NPyBmzC00fpDe3A/zQgEdVOb
 PT6v6nw5V5PmXWezQ+kA2uTxnsjIDQFvxKrSJXaNWPFbdDGcpUULz6qTWIIk0e9Tplbi
 fIGXUFy/cvpP+FS4Hd0u5Sdi8YLbtVyxeDaA6/NLSoqg4kHB1UmVPDAKBTShB2nMqJkP
 QTqgvaHi/a2bIqa2Si9+3xghgAWujHQVTEU6NxrLiOfWoJhHoB/XuGaXlT5icCiZ2n67
 1Y5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2+6rVqYTvcNHipoFcV7OeVwtWdTq/4BKMPKaN5aDT0uQ/dONdwE0rpTy/E/SszgTCILA0CBM9sOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9/KTAR53f/qHn9VjnUw1gT23t5Xcnxd5hj3jlZETuhHlq0ZVS
 fDsN1LNCXIJ0yneKrXS+vyCo43kJPgg12Cbsjh0rBnBOV/lPhXYT
X-Google-Smtp-Source: AGHT+IEGzAmYspOtVt8nmwDG+Sn38HCQP1W9OJHEufd1QFajnmY3ZWK0gmu6itOTP3RzmCrv9irZ9Q==
X-Received: by 2002:a05:600c:1c91:b0:42b:af52:2525 with SMTP id
 5b1f17b1804b1-42cdb54dd62mr40724645e9.16.1726186320227; 
 Thu, 12 Sep 2024 17:12:00 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:85e4:cf41:16db:65d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b002a9asm6433075e9.0.2024.09.12.17.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 17:11:59 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com,
 Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: [PATCH v2 0/1] Use functionality of irq_get_trigger_type()
Date: Fri, 13 Sep 2024 02:11:55 +0200
Message-Id: <20240913001156.56634-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Sep 2024 07:03:15 +0000
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

Changes in v2:
        - Split patches to subsystems
        - Add tag

---
v1: https://lore.kernel.org/all/20240902225534.130383-1-vassilisamir@gmail.com/

Vasileios Amoiridis (1):
  drm/i2c: tda998x: Make use of irq_get_trigger_type()

 drivers/gpu/drm/i2c/tda998x_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)


base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
-- 
2.25.1

