Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C17004DA
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9199810E675;
	Fri, 12 May 2023 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0C610E66E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:04 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-53033a0b473so4033146a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886024; x=1686478024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEkf8gWG96+9b1qBPiSXz5T2EndzrX4ufiHLwT0g7bA=;
 b=NtT2Weul5m/pMpgN7JMgRZwAS7itAs93/P0LzS4vUShEcK4Wgq6OBo6+Iatwn9wpVD
 gjwOOVQF9lpQUpgZtCaIQd72ZQugKVSyWb/PZE3vbwTwZfVQOVRMM5yFDD9yOMR8F8v9
 Q6mqq6T2rl9lqGnp0ASIgno/r7T1raas8x36CbHSlmTglCyt796jfNmZNms+AHHWvurY
 bpdR4yzAgfnxl9sTBuFoAQ83WYpg4uDnVq+BVTki6Qok27DFkNkCpOj+hRAet1+egzhD
 pOlOJRvO3bBmkfuIVwyM2IrmdnbNpKYJ1dCyJSgwjBaFgR6C5YpCvelGbphwVnKpkpl7
 XTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886024; x=1686478024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEkf8gWG96+9b1qBPiSXz5T2EndzrX4ufiHLwT0g7bA=;
 b=LFJOz9+t33ILPd0sUccJ8+szn3bNb6JR2zLRH31onK+7qbcSfgaNZJC2uqnKZfqwr6
 viOfWgfTHHLYfLXm4E5kJEYZIjqSkUoqOIqma9nLcg+OI+fJvTYFVDRWkmHgdTp7ysSP
 OzVyLOB03Y7Iv1yMXll+TYcfrs0Vj40x9iB/mCv3AjDgtPWBI6ytsj1X4XlgZhJP62WO
 BitBAw/6TiPoL1o6wdZfTriiUhUbrlWBCl9Sg4u4rYZbdTDc1mrffHH1AjYnNyfnNfiE
 y+n7TW10ATKXR/w+J3CUow/+tgrF0ntrOY/Shklg1ewbSIg9n2MJdVN/mc3E/np6m2oM
 pDyg==
X-Gm-Message-State: AC+VfDwuepedk+4ZVG/F8U6SYh/8brrd7chB6QFivyzLTw3p7YK10gvy
 3ThpSmJUXgu3PgM0iQwVV1U=
X-Google-Smtp-Source: ACHHUZ7imq7bgHR/sJmRlazsESDion5s8yIT3WhCK3D8T5obXOuXCzu+YMDtulbCky0jUvuEXkpPNA==
X-Received: by 2002:a17:902:a609:b0:1ac:946e:4690 with SMTP id
 u9-20020a170902a60900b001ac946e4690mr12908005plq.49.1683886023679; 
 Fri, 12 May 2023 03:07:03 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a170902969500b001a634e79af0sm7528924plp.283.2023.05.12.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:07:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 49702106B43; Fri, 12 May 2023 17:06:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 10/10] include: synclink: Replace GPL license notice with
 SPDX identifier
Date: Fri, 12 May 2023 17:06:21 +0700
Message-Id: <20230512100620.36807-11-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=bagasdotme@gmail.com;
 h=from:subject; bh=PkQY9HnKXIwg0IaXpF33XHuRDzB1ZRiNQ1FLD5oV4q4=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/DNlZ3lanJT7p1ayYymLq+t2lUf7xU5xTbIv2zq/P
 c1cwzS3o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABPZwsnI0DSB1bvrwoZSud8H
 0ne/3frdnuH0pjxjmXVPMvvE5m9y3cPwP/SEaKC5kN1FhVtfGU8aFdcIxYbGRS4xOZrN1MAp9PA
 sNwA=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace unversioned GPL license notice with appropriate SPDX
identifier, which is GPL 1.0+.

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 include/linux/synclink.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/synclink.h b/include/linux/synclink.h
index f1405b1c71ba15..85195634c81dfa 100644
--- a/include/linux/synclink.h
+++ b/include/linux/synclink.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
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

