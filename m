Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807F6FF2F6
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8663C10E242;
	Thu, 11 May 2023 13:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFEE10E251
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:34:20 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-64395e2a715so8630872b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683812060; x=1686404060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qd85DAYUoVARV/UQur45Soj2gLrv6sKgolbKo4DNkY=;
 b=ZCDul+K7uLaQUZcXDKjVmbjfoExTphoXNgcqea3sH4Mq2pae9JTgDXEapkrH4LBnCh
 koFeeQfJmQ/FOkKcsWd4DY+MU7XEE8CM9bYo3QzTCAxZj8nHJpu2Ojmzcx4x7dMdaKRi
 r42UuJpeDO16/vpnGD3bIfCUOHKLECsNnlnSY0IUpA3UjbR/qkFQ37AKt572PdaDlIj+
 a6jSyVhx6NBA24M+nI19A2Xg/+hij072amXHVqmZNjr2RISKa95pBQKmpVN9s1rSFb93
 XRkPKcrigM+U77/k7SlYt0i2NmGnpGi8yYDR6z2VXLyJPJQm2duIWIbEZPSeSYNASCoS
 7bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812060; x=1686404060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qd85DAYUoVARV/UQur45Soj2gLrv6sKgolbKo4DNkY=;
 b=Qj6jPhFmXYg7zLB9wl+d82JnGnVrmZ4Z0mcRyMskmGm4X8jfX28Fp+iBxHs4t15zfV
 7S3Bs24jIb+skIla7Yi5t51Yo8ZL74av95NvT2aRfy8jumlaqMHhbvdcjBMo4yvdTf9u
 UI0R33BS4Rh9sDgR4ZeWwDvWVD+UXBUUAqXvX/dl1WvYl3qwVMYWPEDk00h2P2hfma30
 bBPHt7s2WAKgKd8+t8MEB/Va9/NMvG4wq/XgRmU5+mpfDQRJ4kDq+f16GTtbM13QQ9um
 LzFrkm05MzHaDwptqXJXeiT9QmSjOB5jZrSBxzXArhB0HvszulKgvltkNrc/XH/tWEvM
 Imag==
X-Gm-Message-State: AC+VfDyx9iUWi23iN0b1KRFG294f6rpdDKRav58zueNo5DlvWxLepF3Y
 1mc4rxMdlG4MMQ6KMM/kArc=
X-Google-Smtp-Source: ACHHUZ6D1SmSibupox7jsjkuLOX/BB/O6IqNdA+Os6V+bkJDhi1wS+hKNMOJm73kAVRAOMQT58zlbA==
X-Received: by 2002:a05:6a00:248f:b0:634:970e:ca09 with SMTP id
 c15-20020a056a00248f00b00634970eca09mr26611634pfv.30.1683812059896; 
 Thu, 11 May 2023 06:34:19 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7871a000000b00641114ef2dbsm5497963pfo.90.2023.05.11.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E53961068BF; Thu, 11 May 2023 20:34:11 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH 10/10] include: synclink: Replace GPL license notice with SPDX
 identifier
Date: Thu, 11 May 2023 20:34:06 +0700
Message-Id: <20230511133406.78155-11-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=bagasdotme@gmail.com;
 h=from:subject; bh=hknv61wvlrkkgOugXTBTgrVsX3ozvkcF0YqHFnV1tm8=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx706mnu9+bem1/mXJ3iyvGzNfCv0wiV53KaXoSk6/8
 jqzUoPFHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZgIgzkjw6aA6292CMWIVB2c
 9u2Mg8RUF/vsKTt1a0IW2F+WdlrdpcTIcGjZ7ygRkU//zwUuvxuUsYZRqtz4vqDKvpnWvMreTmW
 JPAA=
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

Replace unversioned GPL license notice with appropriate SPDX
identifier, which is GPL 1.0+.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/synclink.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/synclink.h b/include/linux/synclink.h
index f1405b1c71ba15..2c8436f08da44a 100644
--- a/include/linux/synclink.h
+++ b/include/linux/synclink.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /*
  * SyncLink Multiprotocol Serial Adapter Driver
  *
@@ -5,8 +6,6 @@
  *
  * Copyright (C) 1998-2000 by Microgate Corporation
  *
- * Redistribution of this file is permitted under
- * the terms of the GNU Public License (GPL)
  */
 #ifndef _SYNCLINK_H_
 #define _SYNCLINK_H_
-- 
An old man doll... just what I always wanted! - Clara

