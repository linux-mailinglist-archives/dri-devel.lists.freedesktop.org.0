Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D44E6FF2F8
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1610E25B;
	Thu, 11 May 2023 13:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A76B10E251
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:34:19 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a516fb6523so80950375ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683812058; x=1686404058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYUYLtbs7KfpLD4I5Dqpb8BMTQvZKnVJ8qVnL1hB5C8=;
 b=at6ka6jNGjd4UsPayk9jEy1oDKwDu1ittNtsmOXT6qcnBSsGsR2izC3GWnK37KP+Hm
 rYaEQ/kR1edGF1qztqgQ1QR6/uRsGcB1tPG2wj6Y90u+/eTnbvykrY21zfxA2xdiK1cX
 MTDVeYEFXMY7zJhSAyhgD6tFvpsIbCdlPJ3RH+jAI6ZaIvo+O8XJ0dbEqwwGw+icrK4j
 Cl0Xum9N2KrxofQ+QzrPS7wAzNueHVaPpxxe1XcCDhnE3LHaNmJ+fzzhhch99G7IbyM6
 YDv7jf/9Paew6HAiuzUnr5WpmxretGw15dZwru+CVY20o5v6MaIkVpfuVqns9M1fTyUK
 rOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812058; x=1686404058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYUYLtbs7KfpLD4I5Dqpb8BMTQvZKnVJ8qVnL1hB5C8=;
 b=UKbadaY6dBEFG7zvN5LVsuAzU69GaABMCAw0LClbbylVcqVhnFRp9KD8QkO/T7H27w
 rCUCGLkiJXGU3F0hSvxxDpsF3vnTV9AqBRhbM59ctV+9jNFgJberawvbJxSh84XBrTED
 yesUytK64YbCahSYYsal06Aw0j5qFAr3iNidBZcUJlVRmHo8BePiKiTbCNmO+voj7uzC
 CxfGLEoQ42r3YnODPt67kjzuR+Iwwsom5e0DnEjryJhPWhutLDAvd+PH3CS3puUAz8Tl
 p5tEFOY9eIbggxDRMH3D0pSy23qo/dx0B5FotTUvzOv5AA/tL4onn3OghGJ0lasXxhtb
 x3Eg==
X-Gm-Message-State: AC+VfDwzDXfFHeyv5TSHLoDlL2A7aN78WHTCbTky76xIsCuT5M6dejCL
 AlNHklgIPsYCOaHv++R3xnI=
X-Google-Smtp-Source: ACHHUZ4ZCa3MPyTZWwhE0hr8Onh5crSmnn9r3Df3rija7+vx/kqL4xMF4JqUIaOPGaMpaopRBNbInw==
X-Received: by 2002:a17:903:32c7:b0:1ac:7345:f254 with SMTP id
 i7-20020a17090332c700b001ac7345f254mr20259399plr.33.1683812058459; 
 Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a170902a5c100b001a9581ed7casm5904903plq.141.2023.05.11.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 840A5106881; Thu, 11 May 2023 20:34:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH 01/10] agp/amd64: Remove GPL distribution notice
Date: Thu, 11 May 2023 20:33:57 +0700
Message-Id: <20230511133406.78155-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=bagasdotme@gmail.com;
 h=from:subject; bh=cTXyfFqh4XIWuVIHAAZjFpEqWqW9DnmtbLxCr872mbU=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx747te/M8Vo+lMJXzhvjKUKFq1Vs3W55/lkz/JrGk2
 vKBf+eHjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEykUoORYbnT/G8dH37kx7V4
 bal3cy17/G/1BsF7nrM1gmOy7G8W/WZkuH5xZ8eJt5tjJjr89OdpK/lTU6G01P7gsZC38zZ3zLm
 5jhkA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>,
 Tom Rix <trix@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Dan Carpenter <error27@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Minghao Chi <chi.minghao@zte.com.cn>, Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Archana <craechal@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is already SPDX tag which does the job, so remove the redundant
notice.

Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index ce8651436609fc..b93b0f836e52ba 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2001-2003 SuSE Labs.
- * Distributed under the GNU public license, v2.
  *
  * This is a GART driver for the AMD Opteron/Athlon64 on-CPU northbridge.
  * It also includes support for the AMD 8151 AGP bridge,
-- 
An old man doll... just what I always wanted! - Clara

