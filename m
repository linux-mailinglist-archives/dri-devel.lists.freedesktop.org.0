Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C710B151FF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 19:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B75B10E3F2;
	Tue, 29 Jul 2025 17:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="J98I1cvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E73910E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 17:19:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=fWm+GcZXSup2AarAdKQLnAFKN9LFFUj1rbKJ7tZFAjo=; 
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753809528; v=1; x=1754241528;
 b=J98I1cvTcGdkxSKMDpmbdFyo+EeAvkC9HCaVBlCWQ8YipmXXy/uH52lfgaAE6KaPd7tH1FcU
 Z2K0bVu+gKuMcPtpslKqO4fn4Oe8aGgDA2XHNWvjjW/eY0af3eK3kIRG4ZsGem9Xa4Hn8hZuFfF
 7BT+tJeFjThw8Yniri0dFlPaoV0ipaxaTs1DYEGk8J3aLN49Fn/Jx19hL6HOU2TgYRckJ4rVcXT
 Zwkg1iaAy2g5V1fTOnuCTrl7owf3dzFryMgSMvp7QRsV31S7tUdcAXYhcHjHL4yehJCGb9P4/+J
 I0y5ZYLe/smU/vUghgWkRguF7KvRiMdjxS0jtVJzcBinQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 86130aa1; Tue, 29 Jul 2025 19:18:48 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 29 Jul 2025 19:18:29 +0200
Subject: [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=XMO4QtQaJ+pfvF4AwsZ1qp1IuFcZe9SRZGyjHN9gGRM=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmdTOXXLCU35KzMtPx44qbsbetfSnEli3Q7T0/j4Jm28
 GnqEmHhjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZiIrAPDb7ZntkeDT34vqGtj
 b7rQOn+W4t9tK6r3PnzY3qvaoDZnQQtQRXnNFwOZ8HMm3mJyG27rt0c93fotqlLrwwYWzrrnf1d
 wAAA=
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

While moving said config symbol out of the "if NEW_LEDS" block, I
accidentally left a copy inside that block. Remove it.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
Fixes: 2cd0d1db31e7 ("leds: expresswire: Don't depend on NEW_LEDS")
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/leds/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6e3dce7e35a490df050cb4cd8e98611028c8dce1..8098b7b49c9decb591a894fe514a7ee757da5b44 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -214,10 +214,6 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
-config LEDS_EXPRESSWIRE
-	bool
-	depends on GPIOLIB
-
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS_MULTICOLOR

-- 
2.50.1

