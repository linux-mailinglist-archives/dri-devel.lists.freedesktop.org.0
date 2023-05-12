Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E527004B7
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D986910E669;
	Fri, 12 May 2023 10:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E3B10E664
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:01 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so3590101b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkLNdeDn6hMP5F0r+T8wUttQQ19WSpWtWoPCipbjjYk=;
 b=C2+j8v8rPTIb6HnSvnFUQwRZ66d3mXZZSmgIfsh6FVupo5JbwYPTQxueQITyQhUyTE
 XwDGChK3UNv+U1yJxKtNWgdNH59S1wnnb41F5rM5S4lZGFGbL2Vk0EgF+rzxZJydj74u
 d6Jk4j0yuBZn+Ia57JZxzq1D7JXICpZG03MRJhZD+dcsewY1jruPow6YZRNSFRaCJFsv
 6x+yo/3iVJhPuv/fvu2hMT0F4OrD+DWMCuLCPqt0Fzygq/E9VfhsedqCVUDYddgRWsw9
 vV8dxqqeq9tItBeaKZfHNLW9omhOjhh1aTduDjMAKPQv2LssIWhToyNxoodHXrI/tdwF
 BbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886020; x=1686478020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkLNdeDn6hMP5F0r+T8wUttQQ19WSpWtWoPCipbjjYk=;
 b=MszJ8w8aa1LuDrRFUlE7NiEawopGdDIdnurdPva8nrMrcykMXuz9tMuCnpE7+R+1Zy
 DMbC0LkJ2yH6rut/hH4wfbKFMAinsPBh/3qAkTg6qJgNWpg9pHnPhcCsp3SaghaGouCp
 GPxTEImvZ5TM2gFsheU/bduKlqWiIlUccsDy6AphdLWrO685nmDwC2NY6fsaf4lBZ2jq
 3MBnYJHD6sy8Mt5M7s0tXrsltoqSjagcXqAia9rduyzaYh3rgmG1iOGqfEj3NAvC6UqM
 B+/0tb270l8ZuzxYPnvS+qYMNjl8zD/+nP9rkD9y9W7A6IiBrBxV8qbJ97wkISP0l+vQ
 DKJg==
X-Gm-Message-State: AC+VfDw7zLETmxhxVrRavwsHOr3xrvKjSZMDTuZ6IDMZDc+mWIbzmDsS
 3fWXvtj68BEhYjpQlxX6JSg=
X-Google-Smtp-Source: ACHHUZ6aNdgEG2xNAjNjCSF7H8MeFm2CvViH4BalJUiUcf1A7xoIMDscaLxs+Ef+R6vxs1eys44OGw==
X-Received: by 2002:a17:902:da92:b0:1ac:94b3:3ab4 with SMTP id
 j18-20020a170902da9200b001ac94b33ab4mr15640725plx.27.1683886020395; 
 Fri, 12 May 2023 03:07:00 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a63ba19000000b0050f93a3586fsm6141726pgf.37.2023.05.12.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 762BF106B36; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 01/10] agp/amd64: Remove GPL distribution notice
Date: Fri, 12 May 2023 17:06:12 +0700
Message-Id: <20230512100620.36807-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=bagasdotme@gmail.com;
 h=from:subject; bh=BnhAyHqAAXZPpElC1S7AamhQL42pHpYqVocWHPx47Os=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/NO3Lfyz29rtyKsS8//3lktmcG+LcrlZPfXRzne6r
 BeWG8sf7ihlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEpksz/E+ZHn/97Pa1mcsX
 SRe79U8LfWr+1jyuJsSJ9dwmz6+TtfUY/ilqCr+WT7wnuHO1tmnp0jLPvboarTN8C/QeXSxye3Z
 oLw8A
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
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
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
Reviewed-by: Simon Horman <simon.horman@corigine.com>
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

