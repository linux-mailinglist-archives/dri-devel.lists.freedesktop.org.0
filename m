Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96687004BD
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CA610E664;
	Fri, 12 May 2023 10:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54CC10E65F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:01 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso74678455ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxUq3YLztp4DNVv6U1fiGgpx+oeOVzDyxQ2q0biTG8I=;
 b=iokr5EotZR7X6156ihWRt57IvPCSp1+PYgZ6QJm7abWEB0uyQEKcBneJ3R2VgLW9Ol
 DMJMsqNqMsBNwxbYvQxBbwXAlvcSAj7qXEJa3KPn8a2bqpWy+AhJ9rHouHWWqa1Zxr2z
 7Fl34c5wTk18pR+a+vtjfj9gevV/cxNSz/iZ0bW17BZ9IW+SVCS4J+KmLFtH4MkboRwp
 ECRUxYVvGrEZTXXVgPRa7FD3imTANH1SzyMz/NXkIf6eMRT9IMf7inJ984Pz/6nX5GCL
 5ddD8Gj9STUa5sz5A7pPEMRo404J3JVlVl/ta31FERe+QKlKrGOcvVBG4SebNlpPHung
 GOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxUq3YLztp4DNVv6U1fiGgpx+oeOVzDyxQ2q0biTG8I=;
 b=XPa1Ay0sc34iEZZXbcTAG3v5YF3m6ZVfE3xsOCc8EenQVAG70tklRWrfPELk9XYWzk
 S8kQhqA3fNPRMmRpdn8jrkDraP5O3oIPoiYIfEAl4blrX6PrY/DRbWwYaPVY8qDggadt
 EXIy6i/ik7ntkQkvsGWxmR16upu459RiJTKrq8fD/okcNtS1spM12c7zcjK1vrwooA2l
 cTrNRFLHrYhtUB616SeOu+knQvr2GDFPLPBB1BtAc1vEpPG06doscYLVUmhE8GyONuKr
 KoGCaheH3Ntwi7VSTLOvv8HkwOM9gOH5+lAMaTHJ6H30woBAaQFWTa/DicwghzCjs8c9
 0a8g==
X-Gm-Message-State: AC+VfDwoGiXf3CmJzmUaS7Ya9kfTYQuzR2ozaJa4cLTblGvAi97NKbbO
 GfQ1LSaNe/cMxC8av2gcu6k=
X-Google-Smtp-Source: ACHHUZ5nuYpORXz/tLJ7HmMn2eHynj5Vltbgetp2+KQtQQOg6FDcgPx4N0/5dvslRAVwDR20eMRnTw==
X-Received: by 2002:a17:903:1205:b0:1ac:6d4c:c26a with SMTP id
 l5-20020a170903120500b001ac6d4cc26amr22313546plh.14.1683886020200; 
 Fri, 12 May 2023 03:07:00 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903244900b001ac94b33ab1sm7532231pls.304.2023.05.12.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 2C9D8106B33; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 03/10] net: bonding: Add SPDX identifier to remaining files
Date: Fri, 12 May 2023 17:06:14 +0700
Message-Id: <20230512100620.36807-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=bagasdotme@gmail.com;
 h=from:subject; bh=JdLGTV+zXI78x437QouL/kFbLmtamk90mD7K+ie5nOI=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/NPDL6jtPbSzO6X4WNVdToVPYa2PdRSmbJC6//w2+
 5byoIu2HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIm8sM//R+zjG+xSk69VVW
 Y/Yk3UtLEksMDOLOnmVtWn5tL5uJ+lSG/zn/wmNaI86zz5uoXZDXHSkar9OScOoRw6+Xr2r/CSt
 c5AcA
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
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Davis <tadavis@lbl.gov>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous batches of SPDX conversion missed bond_main.c and bonding_priv.h
because these files doesn't mention intended GPL version. Add SPDX identifier
to these files, assuming GPL 1.0+.

Cc: Thomas Davis <tadavis@lbl.gov>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/net/bonding/bond_main.c    | 3 ++-
 drivers/net/bonding/bonding_priv.h | 4 +---
 include/net/bonding.h              | 4 +---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 3fed888629f7b5..73059bff425729 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1,8 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * originally based on the dummy device.
  *
  * Copyright 1999, Thomas Davis, tadavis@lbl.gov.
- * Licensed under the GPL. Based on dummy.c, and eql.c devices.
+ * Based on dummy.c, and eql.c devices.
  *
  * bonding.c: an Ethernet Bonding driver
  *
diff --git a/drivers/net/bonding/bonding_priv.h b/drivers/net/bonding/bonding_priv.h
index 48cdf3a49a7d74..fef6288c6944fb 100644
--- a/drivers/net/bonding/bonding_priv.h
+++ b/drivers/net/bonding/bonding_priv.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
 /*
  * Bond several ethernet interfaces into a Cisco, running 'Etherchannel'.
  *
@@ -7,9 +8,6 @@
  * BUT, I'm the one who modified it for ethernet, so:
  * (c) Copyright 1999, Thomas Davis, tadavis@lbl.gov
  *
- *	This software may be used and distributed according to the terms
- *	of the GNU Public License, incorporated herein by reference.
- *
  */
 
 #ifndef _BONDING_PRIV_H
diff --git a/include/net/bonding.h b/include/net/bonding.h
index a60a24923b5599..50dfc9b939ecb7 100644
--- a/include/net/bonding.h
+++ b/include/net/bonding.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
 /*
  * Bond several ethernet interfaces into a Cisco, running 'Etherchannel'.
  *
@@ -7,9 +8,6 @@
  * BUT, I'm the one who modified it for ethernet, so:
  * (c) Copyright 1999, Thomas Davis, tadavis@lbl.gov
  *
- *	This software may be used and distributed according to the terms
- *	of the GNU Public License, incorporated herein by reference.
- *
  */
 
 #ifndef _NET_BONDING_H
-- 
An old man doll... just what I always wanted! - Clara

