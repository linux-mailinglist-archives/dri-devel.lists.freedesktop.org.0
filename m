Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC1706389
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5852310E1AC;
	Wed, 17 May 2023 09:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411B10E3E2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:04:25 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ae52ce3250so3784585ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684314265; x=1686906265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEkf8gWG96+9b1qBPiSXz5T2EndzrX4ufiHLwT0g7bA=;
 b=SbGDAIakWROfgnYElpLZK9rV6g4PdXCds6BP2sYnW5uJ1Cl+BhOK6EmSx1yHcXlVcs
 tBQ+FoQXXKOlqu1XPK+PXSMSgyA9hl3NnmZaIqpAeEFGJyL0tclIMv6PGY7Gv79bTykw
 YFS7BG3kD8AQscA5l7punlQ8lzVX82q5j2qYWhLMtaQ9aTbCUGT8hCx6uDxCh6U3dH/k
 k/ly3rVlKk9VM0G8LTS/Qf7m3cj+U+WC3afdsH47bQrmGvGkaHoWenjaoNwJQ8BtKH2q
 y2XS2SgPd/SIktblfE/gOE91e6Bw2vbLgJ1kl9y64uibv8hJYVHR15sZ3zjsZU6Jj2GU
 GNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684314265; x=1686906265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AEkf8gWG96+9b1qBPiSXz5T2EndzrX4ufiHLwT0g7bA=;
 b=ADzwqbCRQe5YjVSfcBZMq426dAWFmHDHsJ28fq4LAFlC3CZjVUxLkkkLhgTwJWuA8x
 RlXKgHPhFvPSlfHrKS2KEiefr4Xcz8J9MuBbP8A0OU+M0JuFghS9SClqNJE8x4oJX9ZZ
 TQi7EjaFkQT2wTmlYqu5SFwPlhdirKlejtNSiyrvAq59WGFZCdmMut0Ick0d4PBsYkyH
 K+k9a0h0MZLZ8DdGnOA10I4VarLMbUpqcG2HvgexYbDy/SzccOudiP7XUgxsNK93LLKV
 +XHBL4HASouVrRw3ardYI8MzlQRLsTCvheDGN15mSz3CPzWRj3gf9KF47uziqOx3DwZ0
 6kzA==
X-Gm-Message-State: AC+VfDwHXzrRdN7KjHvEsC9hMNwNjpWgbURbqGTYDYS78QXkwDoocser
 RhGJiP+iz/pK4WkWwTcMTIA=
X-Google-Smtp-Source: ACHHUZ7t0/RQfYyMq41AqIGvxIMDuFkHn6at8SENhxnEYq4oIvHD7s8nLvlufw1gaSyIy1QihOZYKg==
X-Received: by 2002:a17:903:280b:b0:1ab:197d:2de1 with SMTP id
 kp11-20020a170903280b00b001ab197d2de1mr35817406plb.2.1684314264858; 
 Wed, 17 May 2023 02:04:24 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-22.three.co.id. [180.214.233.22])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a170902c3cd00b001a6cd1e4205sm16925753plj.279.2023.05.17.02.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 02:04:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 39536106280; Wed, 17 May 2023 16:04:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>
Subject: [PATCH v3 4/4] include: synclink: Replace GPL license notice with
 SPDX identifier
Date: Wed, 17 May 2023 16:04:18 +0700
Message-Id: <20230517090418.1093091-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517090418.1093091-1-bagasdotme@gmail.com>
References: <20230517090418.1093091-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=bagasdotme@gmail.com;
 h=from:subject; bh=PkQY9HnKXIwg0IaXpF33XHuRDzB1ZRiNQ1FLD5oV4q4=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkpMybJzvK0OCn3T61kx1IWV9ftKo/2i53immRftnV+e
 5q5hmluRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZybxnDPxujkg3bbTRW5fBd
 +852O0noRG1l89E9q34vZ4/Zzlzne4iRoUn5aEL/zGVCWw90LHop42umf3daimPH3PhL78qcE3w
 msQEA
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
Cc: Karsten Keil <isdn@linux-pingi.de>, Davidlohr Bueso <dave@stgolabs.net>,
 Dan Carpenter <error27@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Simon Horman <simon.horman@corigine.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacob Keller <jacob.e.keller@intel.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Archana <craechal@gmail.com>
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

