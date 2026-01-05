Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B4CF2864
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464610E2AF;
	Mon,  5 Jan 2026 08:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cvJMAT4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774710E2AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 08:51:28 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-34c9edf63a7so14980832a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 00:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767603088; x=1768207888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dl3uiFs67UDa8ZibSp3TCnzqWfwUKgTkl0JL8TbUXMo=;
 b=cvJMAT4DeFzPYhYWNV5QiLgsNsI+Sz1GAzUMXtyvMVC9qs6UXIOAmd9fPCEEDpI/Wg
 oqtq2moDcMmOiRtT1Eq4SVgHU2FQehQ32b3esNIs7+M3cVVY1etBQNvoYOlxWQs7PwTc
 RkVomGEZvYL5p3RN4tE3nWcFHPzZhzAeR350cZC4oxPL/xcykTZmk68G6KW6cwAGp2y+
 ez52mHBAVuBHUI9Axuc7RoKivmkTEoncCm0DykIQFR+2sUE4o9glgq80ExQ+JaZr0TUP
 6tQJR2k2zp7ERGs/5J2483fVjBcBbmnSxVOKut4F+DLxa4tRHwc1ZJzgmMaBT4C5Ssak
 7PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767603088; x=1768207888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dl3uiFs67UDa8ZibSp3TCnzqWfwUKgTkl0JL8TbUXMo=;
 b=g2mm0i1u5c7mg+BZ2w78+P1Ym2LJc+utHOavmHeI/MHwWJ1V5wQINqQjDO+fHlX0Ma
 KPtRuE1mpaLOt6VtmkIhIeRlUae7zIR5MUnq2aerJPr20JvEbBy7rwY6FZ6ZAHOAzMBK
 DHQlP0qc/kIbYRwXB1pxkRXVIEDtsDpgmRY9rU7ivIG2743o/mCkGh5e32N6XqzXCMZt
 C2gmxmYinw2y4yV/I/72DTJY/OsQnPV7SQCH9801EPoqiUKj9Kl9F4anY0OSrVtucuOx
 Jy+kkRdSyjcckBFvCpGGc5tAkx/q/mB21MAew55B1LEHCUgfOwK74esC5dbHzeUHxfgy
 DG3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwJl2UyKAgjyldZEqEwHl91+0jz4wmDDs6QVgl5AU+zwPwLrelsbbtRXcvUHnmbwkZl4yjuiBVLOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBI5CwMdpgFx5eCLQcE2N0AfE3Mi22gW8zzapR8bmpOw095e/o
 jQPpwjEB+zxJvSPWCv9aiElOeGC/HMgG5WvwqIsEDgfkOn5Hn08qn5IO
X-Gm-Gg: AY/fxX44PXoc0gorgDEPCK2IVTnaDODY2zpzs6gRuvETZ2I5wKmQ25mh9rJX2l//yR7
 7QXnQjW1LVD31v+XO8qTO91JpsfmRkLf1UJysf3Vfaq1IL7sMQ5gBNv3DxVEYvSB9lJf1VyKA2A
 xJDrv9mC8ECkVlmr4O0HhT6HetFmWqaI1Xv9byBJG6wnrWO3K1z+vTfpS/+kdgFEc6iLfGHxz2o
 CZL5I2ZIaNfY0hbNQdVE5zyUyw3Lchw1HWLEw7yHRr+06IlD92rK40t6iaS3dfZitRE3zswoL2U
 xz6ix0oh1vlZCY1iY1jfCDSaNC+3VN3SHEqHELksJg1zmHAZheOokprcUmkTSdC88znWxTzu8F8
 GDUJjBt432iGPn0Z7wJFQNZkTXFFvzoYsYKooLuNPkofqeXpNbQnJhV1on8/nvT6AV2PQz5ia8J
 F/059k6SCW6AcyWkO2KN+IkBjJoOE1EWQeIjaj
X-Google-Smtp-Source: AGHT+IFv5GpgGolY+Hm971OnXPqumtM8dOJ/xZWxT5pLM3JhzOyMQkgCUWKBDEgNNeae53lKPk0A8A==
X-Received: by 2002:a17:90b:2f05:b0:343:a631:28b1 with SMTP id
 98e67ed59e1d1-34e9214e781mr48976231a91.16.1767603088314; 
 Mon, 05 Jan 2026 00:51:28 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 00:51:27 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 0/2] backlight: gpio-backlight: Add support for multiple
 GPIOs
Date: Mon,  5 Jan 2026 14:21:18 +0530
Message-Id: <20260105085120.230862-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

This patch extends the gpio-backlight driver and its Device Tree 
bindings to support multiple GPIOs for controlling a single
backlight device.

Some panels require more than one GPIO to enable or disable the
backlight, and previously the driver only supported a single GPIO. 
With this change:
 - The driver now handles an array of GPIOs and updates all of them 
   based on brightness state.
 - The Device Tree binding has been updated to allow specifying 1 or 2 
   GPIOs for a backlight node.

This approach avoids describing multiple backlight devices in DT for a 
single panel. 

Thanks,
Anusha

Sudarshan Shetty (2):
  dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
  backlight: gpio: add support for multiple GPIOs for backlight control

 .../leds/backlight/gpio-backlight.yaml        | 12 +++-
 drivers/video/backlight/gpio_backlight.c      | 61 ++++++++++++++-----
 2 files changed, 56 insertions(+), 17 deletions(-)

-- 
2.34.1

