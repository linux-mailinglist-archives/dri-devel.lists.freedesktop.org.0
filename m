Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36DB151FD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045E310E3F1;
	Tue, 29 Jul 2025 17:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="RHXZcSIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0AF10E3F1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:19:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=d03/wWoZaW4ksV5PR26r4aqD4rRo/KHEvjwMt78Y6Ss=; 
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753809528; v=1; x=1754241528;
 b=RHXZcSIql0aq2ed4UX/XfOo3Elf6Bk1AsVrRZI/vaGtDxN4ne/uqY9/odZ0p8VZnnUoSW0ll
 h13iL08zJhVIrh4SEUhaOA94ILTs9FgQE6LVGBuaa/gY1222fX4vpeoJffJjuwhUvpS1Z6IPB8r
 dQB95de8/QXMCFihHltfJQSUFP61lbzpRyK8LfP+ti32CUtXIDJ4tZx2yMI7bXEfSambsZJLsAX
 0pnr5+ih3rRZhkf/gquRiDU1s6AAAUcNFv8ugFXOsUWINyHDMoFwvzsw1bj0PZd5v0hrt0dkVhS
 cp7NAVWjGOtQdR9zTY9EoR8A3bpU0wZDa1o/MlYZwGftQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id e1aa4e3f; Tue, 29 Jul 2025 19:18:48 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH 0/2] ExpressWire dependency fixes
Date: Tue, 29 Jul 2025 19:18:28 +0200
Message-Id: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGQCiWgC/x2MQQqAMAwEvyI5G6gVsfoV8dBo1FxUGlCh+HeDx
 1lmJ4NyElboiwyJL1E5doOqLGDa4r4yymwM3vnGtb5Dfs7EqrckxplPXORBig0FihTqicCeZtj
 8V4fxfT9JWuo9ZQAAAA==
X-Change-ID: 20250729-expresswire-dep-fix-ba5b8bab83cb
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=duje@dujemihanovic.xyz; 
 s=20240706; h=from:subject:message-id;
 bh=wjHJkN76xZ9+6Pej99kANjeJrfM+//U0Dq7FGLrDcTk=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmdTOVPTn2rZ50TvW5y6lYfS0np5Nvvrd5fe7zv3DGHx
 sOb9bbXdJSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE/pQwMnyKXXpItnL+CVXB
 iGiT59d+SMeseeQWmh1g/q6iYZ37bgWG/w6uhx08ilh8Lra3rTo2b+l9mU0hrjeOrj0hLl15v+r
 BUjYA
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

Hello,

This tiny series fixes two dependency issues with the ExpressWire
library and the KTD2801 backlight driver. Thanks to Randy for reporting
these.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (2):
      leds: Drop duplicate LEDS_EXPRESSWIRE config
      backlight: ktd2801: Depend on GPIOLIB

 drivers/leds/Kconfig            | 4 ----
 drivers/video/backlight/Kconfig | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250729-expresswire-dep-fix-ba5b8bab83cb

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

