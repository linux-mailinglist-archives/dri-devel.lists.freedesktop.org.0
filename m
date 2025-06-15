Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62093ADC7DF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5A10E5CE;
	Tue, 17 Jun 2025 10:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QVRTC1d/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ADC10E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 17:01:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so4176102f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750006868; x=1750611668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/sh5siZYeXS4kQYIGtRbrBlQ/qYltZ7awOvbp/g/JrQ=;
 b=QVRTC1d/PRc05BrfzAXmNgF4IkFH6qvjEaZxl0Z0X6EPlEnJn/ZDZ11weDcOAYykmY
 dw7DXcGzY1AvL3b5G7YPT1sh9jhd3JdfAjtbBPwhG6dCJxVdRSYrHqnvnubDkOq1J1bG
 /OiHUV25FyJqWZ4eD0917Y84JB99Yxta0cTFKKCUT2JbvVnqMDPv+5TZk3Zg+9cTSxIZ
 ni/yQvA5FKVTuTIYuyAQPaBlxHAkAqlM42Olhq8+8so0ay7NXZgQduZAZbpgIzDCDOB4
 84a51NnzsiujfpezSFhrPx2gn4yyR3zasYD9ZXcx5HkiT7bX22GfRjM1rbuxC9b+mufL
 OxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750006868; x=1750611668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/sh5siZYeXS4kQYIGtRbrBlQ/qYltZ7awOvbp/g/JrQ=;
 b=uddvHJjtP8dNQuwMdf5bUAB3qj6akSVV0ZfJoSUetzKCoQs55B2Y2LwxBycBPgt3NZ
 nioLaDXc1H1lGw0pcOlRq0j1jdCCLUodXlZghpVWi/391qcctO2C3J+hb2cN4hCtuPMP
 56j8e8vtbHiJZ3UFVqlTRCwMS5UqgWlFgQqaQIP78MlI24KmSYt2PduElSVOh3aaydSS
 i1b9TI32HRz5x5c8Xao0PstgAPY1vLZmPxVLSZauhHx79PtmNUDM+6+OPRitHsj9rEiZ
 qnJ10cV0uFIJRzkfajAOi0qFZqPuI89mlnXGA7njGKl7BlTuAimD8StjO3Gp/Gk418xq
 BYXA==
X-Gm-Message-State: AOJu0Ywa32KpTZgQWiPJEAAi7DxmawLiuIm3pLqphHCURCKzWv9Hev26
 Bj6NY8udQkRoFvq2shxnI6dTp2knRKL40u10nbQ5wL+Aaj697QPt4Gtv72RDF0Vx
X-Gm-Gg: ASbGncshj5dRt/b/6PMEegWefXi1snhxBu2gP4I94tY7WvGH+rpc4cr6KSVCvR+z8Zc
 0/gzcQIGRcOBDxkExO92q5KHBlFDOcmoc/ZlIVEWUmgcbhuUNe3ne5I88ONl/Qk/5T9LeW6UJct
 SJxgyruDYOgdo0U9+0iyG7x5wW8bW1MLcysW9yDiXJFYCZ+EfNWZW48YUuOSeCFsspIHUsVhKlL
 ERMXT7ywz6bY7kjmzHEoWj2xO7NwqZFxFuGoS4T42MLFJfQ0CNXzptr4wa0brL+wSlnhrIrObNv
 gwJX6TNmLAHh0VL8nwxsDdwsATXWrnO0iTKbqr5Oq+bfKZ3mQOEYsSdf3eXPi9+XW8/5ggqb7nK
 CDW3gVGY3eEDdUzJK3dha
X-Google-Smtp-Source: AGHT+IEqoYnFxcSp8JeoZ32Oz5ywt7A14HBXQNS4xC1qbvccg0l7FYe47NioqUY5Z+mFkENmCdaNbw==
X-Received: by 2002:a05:6000:4208:b0:3a5:57b7:cd7b with SMTP id
 ffacd0b85a97d-3a5723a1991mr4128877f8f.22.1750006868226; 
 Sun, 15 Jun 2025 10:01:08 -0700 (PDT)
Received: from micron.home (a79-169-148-25.cpe.netcabo.pt. [79.169.148.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e2618f0sm113423795e9.37.2025.06.15.10.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 10:01:07 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o?= <joaodavid2001@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jo=C3=A3o?= <joaodavid2001@gmail.com>
Subject: [PATCH libdrm] amdgpu: added some missing PCI id entries
Date: Sun, 15 Jun 2025 18:01:04 +0100
Message-ID: <20250615170104.25916-1-joaodavid2001@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Jun 2025 10:16:27 +0000
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

Added a missing PCI entry for the integrated graphics of the Ryzen 5600G and 5700G and 7600X(C7)

Signed-off-by: João Vieira <joaodavid2001@gmail.com>
---
 data/amdgpu.ids | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/data/amdgpu.ids b/data/amdgpu.ids
index 6075ed9d..32be60bc 100644
--- a/data/amdgpu.ids
+++ b/data/amdgpu.ids
@@ -166,8 +166,10 @@
 15DD,	D9,	AMD Radeon Vega 6 Graphics
 15DD,	E1,	AMD Radeon Vega 3 Graphics
 15DD,	E2,	AMD Radeon Vega 3 Graphics
+1638,	C9,	AMD Radeon Vega 7 Graphics
 163F,	AE,	AMD Custom GPU 0405
 163F,	E1,	AMD Custom GPU 0405
+164E,	C7, AMD Radeon Raphael Graphics
 164E,	D8,	AMD Radeon 610M
 164E,	D9,	AMD Radeon 610M
 164E,	DA,	AMD Radeon 610M
-- 
2.49.0

