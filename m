Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FBB0B781
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 19:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DABB10E219;
	Sun, 20 Jul 2025 17:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dkd0a5l7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556510E21C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 15:24:10 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-87f4c8e9cdcso1920839241.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753025050; x=1753629850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVp2kMB/w6wTX2T2u1oRumzIS3t/oXG521zmpwRXomY=;
 b=dkd0a5l7M852m7PqI7YGzoNWRtJxcymGSPe/A758qYbxx6TqgRSOeeeUTVHb8MvCCj
 5acbs647qTCEfzwUc7skzwRApVV1WHeCJNM6WM+6+bkazy6XFY/oS69grH2DXxoPlQ2n
 GD4BxayiQcQuXunN90wM5uhtR3g1naKdY3sn95KKYqCbWHymlGIWasYwOEpzOUN6A2uW
 33auQPx7z7pgacJBOy2JMzpwXyXiFPNWvEK8VFY7LuC4e5+IJLUbyH035ioaBgizj0Et
 nTYWm5UkwZYQvKujN33KeMa10pOTitqUY4Ql7qcld4/BASWY7OmctdqkqqHkDhW0+v3B
 tWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753025050; x=1753629850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVp2kMB/w6wTX2T2u1oRumzIS3t/oXG521zmpwRXomY=;
 b=PCqvbTA7xGxhkLQQRCqeJ1BV5u0ueXVYhsXee13hd2uYURS6snbsk7UQcrojOcdoE7
 bSQIhYLCCxYoRUK1wJv1n8jbwsbFrUtCTmxy1sz2N8bK7yoR2lyxOtvQ/4VwydFREImP
 IYJ+VWMbE37GiGyLzPfGFm4GkTTenVbYTbZMqIkEZEqOP/5ilyUyl4xieQwUO+8oX3kv
 BiK4toOt3vca4egGvQmDOyHFut47veyBXNznCybJF+wMXYS8l3awYukH7ZRksJRnIXRX
 MmWXL3jRqv8hJxjuxFK29qi6CjvXkn6RKsnlM2LWBucGBZoxPkiWmCM5KBqdE8CfzQuB
 gbKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5ZxySfrRN4Q3cyGAQaTnrjtWbDQZDwzslNETQYMFSrqhuhn3MlRFS43RqFaC0cilV2zQ0p14hRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhLOTlRmbFfy0qVlm8FBlqz104c442PM0Fx+nQ1gGCANODU2FM
 clJGeBkkOArRsZcCPUdvEoCiIr4W1blT0Y+mLf9GyUOvmaYpeyx3N0zA
X-Gm-Gg: ASbGncvV27ZZ1XZcG07KYyZC+AyTDjbiCV89czijXVLJ0/XG2pFzHYYeyQ9f78wG2Si
 peMxYTeZyu68gGB/l6Po3HQuLuD/ekDeE9/yJgBonjlTY9ZRMz2hQFvT+C4zPJu5rqpNbM7NpNI
 anxaPAuVw8GUFuduYPC91rCjoGMhRD+yhC0a9CL7YqTQYDY7pEUKYFG6Io/EAaCsrBc7eQ93fQS
 kbWnVnfGvjvFalZdGp4Nitfsn0CzhUyXwUyX/o+JYwDIuU+yL14ZhtuS3mVWDqoJxYu2di9oREQ
 Tqzxk+/THeLm+QOI0rHGscN85/Xq8lT/hNm7gUq6sI8vJl4Hn9RUPYb6hPnlo+W0hcvPnQZtvsT
 cRvY70EmDinHzvvDpVjGA9KNmMi9knwB1kYo23DqQdfmq6hna49+5eEzrpyZD4bsFZXd6nEE+UD
 qQPk/hqA==
X-Google-Smtp-Source: AGHT+IHRMhGcnZqIbnc4e1wX2YKxqCMc99MYrRIYYOQDLTChJMGHa152DiivvQgHsQw0yB1RXnRfOQ==
X-Received: by 2002:a05:6122:238c:b0:531:2d55:7f54 with SMTP id
 71dfb90a1353d-5374f55bb40mr6219747e0c.3.1753025049669; 
 Sun, 20 Jul 2025 08:24:09 -0700 (PDT)
Received: from 9950X.localdomain (syn-142-197-132-170.res.spectrum.com.
 [142.197.132.170]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53764eedd3bsm2157582e0c.5.2025.07.20.08.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 08:24:09 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Ondrej Ille <ondrej.ille@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Frank Li <Frank.Li@nxp.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-i3c@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: [PATCH v2] docs: Fix kernel-doc indentation errors
Date: Sun, 20 Jul 2025 11:24:00 -0400
Message-ID: <20250720152401.70720-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Jul 2025 17:54:34 +0000
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

This is v2 of the patch to fix kernel-doc formatting issues.

Changes since v1:
- Convert problematic sections to proper ReST list format instead of 
  just fixing indentation (feedback from Randy Dunlap)
- Add GPU driver fixes (additional files with same issue found on latest
  build in linux-next)
- Remove SCSI driver (already fixed in current tree)

---
v1: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/

Luis Felipe Hernandez (1):
  docs: Fix kernel-doc indentation errors

 drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
 drivers/i3c/device.c                     | 13 ++++++++-----
 drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)

-- 
2.43.0

