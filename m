Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EB12D791
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97636E1F6;
	Tue, 31 Dec 2019 09:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D731489F6E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 19:56:15 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f8so33743759edv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gO16AQCkNPb14dsCdpkNOICcLP4HpRwvIVTrCALZZko=;
 b=fzz92Rr5ad/tw0dAyXatXMplVhuQTUMwBoHdS2zFzvNq3breMRsKrqsAxDoCTQvjpj
 WB5JiebaJGU/chwFRmjzZtX66Re6Rm3vCKvnP2CwjjzBa3yQBa7X3ve2scCY/dC9ljry
 VJoXuBqYtHvYc2PtO3mdZDZcuEGoGUQigwd0u1XguvL8OcAP2WYRTjUbUeGFMwe3gmgh
 rOMNHL58k4ZYkEcc7vFiYn3vjtOcnLzwJ6yLVpWjnTGmvagFT0WvPI7Gc8DMp+R3rMms
 g5+qwkh3pwPpRsSJpRA4BQPwL2prIzuXHCjXa6IH9NViXz6mr2cZsL8ckh8YsSL4Hq2z
 DdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gO16AQCkNPb14dsCdpkNOICcLP4HpRwvIVTrCALZZko=;
 b=rIoubshdP7sEIMvuF2NQLm42DiSYVfX3PkjTPsDlcBFmeq6GsZXtEG88guJDzWvyYU
 GK9FnRSCyfiOXNSXIX6AVVEjNFbfiimqpWkhwXoB7b6WfiSE039hcIDB7ENV8hVUzWLb
 Z/Y05mULYWmIimLYZlbylTkel6VtSK4C+Gi9xZ+/+rZGxZ5ZD1DB06oJ1PaT1lGaypG8
 EG7Lzq3CDjDyZyp+OE3f8nielOTNLPC/qrz0ebhWD14l5V5RXgEHFJMhBcf9xf+Sb+kL
 7IgddU23orAdpdd4irbtFv2fnr7fBBGNTGZe3rDnplcdhmSeBrx5AWQ4MX1V9TffVMO6
 isxw==
X-Gm-Message-State: APjAAAXYi2CsYESuSHtGapkl47JToGzeBlXNby/9bls1Yw/eu6Tu8IZV
 Kgt50dnrf1j6hWtmJsOpN6s=
X-Google-Smtp-Source: APXvYqyK9+yOm7EZSKgP1CIAOwXYYE/RZODwwHNa9cFvR2LrqE+OdolaLn4Q9Fr4gSKqnvbUjJbFkA==
X-Received: by 2002:a05:6402:3184:: with SMTP id
 di4mr73253173edb.59.1577735774170; 
 Mon, 30 Dec 2019 11:56:14 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id ba29sm5446185edb.47.2019.12.30.11.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 11:56:13 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: declare variable as __be16
Date: Mon, 30 Dec 2019 22:56:09 +0300
Message-Id: <20191230195609.12386-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declare the temp variable as __be16 to address the following sparse
warning:
drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20: warning: incorrect type in initializer (different base types)
drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20:    expected unsigned short [unsigned] [usertype] temp
drivers/gpu/drm/panel/panel-lg-lg4573.c:45:20:    got restricted __be16 [usertype] <noident>

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lg4573.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index 20235ff0bbc4..b262b53dbd85 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -42,7 +42,7 @@ static int lg4573_spi_write_u16(struct lg4573 *ctx, u16 data)
 	struct spi_transfer xfer = {
 		.len = 2,
 	};
-	u16 temp = cpu_to_be16(data);
+	__be16 temp = cpu_to_be16(data);
 	struct spi_message msg;
 
 	dev_dbg(ctx->panel.dev, "writing data: %x\n", data);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
