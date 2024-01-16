Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4582ED89
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F8810E46B;
	Tue, 16 Jan 2024 11:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301BB10E46B;
 Tue, 16 Jan 2024 11:17:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40e86bd23d7so906075e9.1; 
 Tue, 16 Jan 2024 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705403770; x=1706008570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bV4EzhRkZw5eNG7ZovPTr2GfxWsv5MIBKsQhvD/ibb8=;
 b=icUcO6vpdL2+eqz0iqbGc6rBVAlR3YlwFpQAelRx9mLVBxfV5qxUfii27FWsOpECRn
 Pxd9QB9wlmldt9EaIHCNXxjkCJ2LAVc7mA/bZxEArmIBk28jOQxsnnb7OyHZHGKqAVz/
 u7KpXqpL5ppPBIORzogfKweVj64WtoWRqfO/4DKNzlz9U1hEteAvNcz3y3o/b29lcEJI
 hKyBpLJZQEwzlese55INc8iqu4zdATsb1Gt9A0taCkGVL6uNiArRkexCwQSE6e40jkfQ
 SCNezaxFtrw+0FjctNtr5yMWUEdvsmsx1m9tAb77zT4u7EkjOWsBlAqnJQJMK3SRFTFH
 hqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705403770; x=1706008570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bV4EzhRkZw5eNG7ZovPTr2GfxWsv5MIBKsQhvD/ibb8=;
 b=MXlk/xK9TMNSqMRhPts3F6XC/QKGAX4ovMeZUZtXhcYJyb8x4MYQM762H26l8Fv9Ig
 wXV9vXct0TxmOidyaG3CJnFNJ8dpttw/li98Mzv0KlqhZ1y6LVsXVBa9vk/AlT3xe3xP
 sqmFQdFS2cUGpkNS0v8eVDmLdZ3UZ5U+meJvLAtQIiDQv3vq0LMGMU2P3mL2kxQfPnoq
 rNHb3ldpS2L0D+DdfloSG3aByOVHjSOVcXNeVQH8rW0yLyMKq3L1+YyKQ6ExfggSlAPI
 2rQavWVyyYfxytZkN8e2YtV0XoitDOKiBi+l7vwiEECtJiQ8r+xB2MYtopNTj0lxHWQ4
 Y2DQ==
X-Gm-Message-State: AOJu0Yxaqo5cHzjURcP/J4nSD6pGieH6Ggt1+U65egadjyiCqWkqUNfr
 yEQI+UMdCIjnX3nJnI76pnc=
X-Google-Smtp-Source: AGHT+IHM9MvVRGvEUj/8Da942kzvMhJ/jHKDIdyczZcz2JU+V7Py2yNESnBCAoWPKM+3iTd1BzZ+GA==
X-Received: by 2002:a05:600c:3093:b0:40e:4303:df0 with SMTP id
 g19-20020a05600c309300b0040e43030df0mr2089782wmn.258.1705403770493; 
 Tue, 16 Jan 2024 03:16:10 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c501200b0040e77ce8768sm7102765wmr.16.2024.01.16.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 03:16:10 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable ret
Date: Tue, 16 Jan 2024 11:16:09 +0000
Message-Id: <20240116111609.2258675-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ret is being assigned a value but it isn't being
read afterwards. The assignment is redundant and so ret can be
removed.

Cleans up clang scan build warning:
warning: Although the value stored to 'ret' is used in the enclosing
expression, the value is never actually read from 'ret'
[deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
index a463289962b2..e96de14ce87e 100644
--- a/drivers/gpu/drm/nouveau/nvif/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
@@ -73,9 +73,9 @@ u64
 nvif_fifo_runlist(struct nvif_device *device, u64 engine)
 {
 	u64 runm = 0;
-	int ret, i;
+	int i;
 
-	if ((ret = nvif_fifo_runlists(device)))
+	if (nvif_fifo_runlists(device))
 		return runm;
 
 	for (i = 0; i < device->runlists; i++) {
-- 
2.39.2

