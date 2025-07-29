Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D326AB151FC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED22610E395;
	Tue, 29 Jul 2025 17:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="l6zPQ/b6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99210E395
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:19:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=KtOg56+S4xfGCOYiMQ0mc7kx1YDPunzosiHCMEL6Lnc=; 
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753809529; v=1; x=1754241529;
 b=l6zPQ/b6tFVgjCiE07rNfSwynt4+rG+JW4SaQgn6QLoOLrl7bQu30/PFlWn3Obxwph6KaWZp
 ffrDMaH0yNYxo7jvfKIRqDddvv9EgdGE4GcfabhhIOuw69b0W6pr/2ngwCjEYmDWxhVByrpKNNr
 vGi6o388rs15BPK/YYJ+awyl485oiAKf0d7nx4wybw5aGZ3SU22/isYjJjlCuFINiEetMXVq6B5
 iKqC1PDW9yAXMLC0WIr0QdnDQRvL4Pi32LKRPnaXPOkNnM0T4whWO4NCXQUOvaaD/n3qH7ycJZM
 YVvM2xbt1oA56ixs5CaQ9Z1p1hElZQgCDUYsqYz8ydvEg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id fd44c069; Tue, 29 Jul 2025 19:18:49 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 29 Jul 2025 19:18:30 +0200
Subject: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
In-Reply-To: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=duje@dujemihanovic.xyz; 
 s=20240706; h=from:subject:message-id;
 bh=bvWDVVpk4oQ7rFFnlM8bA7rrp960UJMZcCVetBY4MuY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmdTOXied73I7Zl7j4tyjU9pG3+go1LOKest1AKj89Ru
 MyxJte6o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACbyfz/D/zCBeN7Wif9+SRlb
 3997LL8kUj2t3XD2ttSKKxPWrg186cjIcEBPW3tjpCR3rEPkH7aH3bt8M27/3qGawnX51ck7wan
 17AA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
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

The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
sure this dependency is not left unsatisfied.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/video/backlight/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208ceebbf8b3c27976e9cb4d725939b942..37341474beb9982f7099711e5e2506081061df46 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
 
 config BACKLIGHT_KTD2801
 	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB || COMPILE_TEST
 	select LEDS_EXPRESSWIRE
 	help
 	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire

-- 
2.50.1

