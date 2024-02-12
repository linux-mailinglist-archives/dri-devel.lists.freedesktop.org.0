Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBB851E51
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 21:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90C510E32C;
	Mon, 12 Feb 2024 20:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7F710E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 20:04:44 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id E072683BA7;
 Mon, 12 Feb 2024 21:04:36 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH 0/2] leds: expresswire: Fix dependencies
Date: Mon, 12 Feb 2024 21:03:24 +0100
Message-Id: <20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIx5ymUC/x2MQQqAIBQFrxJ/naBWYF0lWki+6m8q/FCCePek5
 TDMZBJEhtDUZIp4WPg6K5i2ofXw5w7FoTJZbXttjVVId4TIyxEq4BYFNw5wwTv4jmpW9cbpX85
 LKR8kQUMcYgAAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Hans de Goede <hdegoede@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Helge Deller <deller@gmx.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Karel Balej <balejk@matfyz.cz>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=675;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=H5SASPixAqUHq3Nu5xj+/KLu5M1naq1Am/HTSAj4Qig=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlynmgj96tx0yxiCk6LRKUNqTO/ibINXBCd6K5R
 Kv13Nu7/QWJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZcp5oAAKCRCaEZ6wQi2W
 4UtOD/9CIR17mjfkoT3abEQNFhCVDJXwkykj/eV70cTOXmLHQYJqogh+3EJOfkyCEG8Xg5jDGx1
 jRe5pKs4RXoKgOpZNN7dZ9PlGpJdTc+cW4IxpbBrAlVqKltFH5x1OBOiQgrObxnTOqe4q6u5rfB
 cW2nW8fTnLL+pFOupFa+onY+wNLeRyDXXh0/dJPEdBsDIMVzxX8VZdXN4aKbTTViXvHWWiRFljP
 cknU797dHb6Tf1K+/Dq4XgVMqCYPpQJxkgyDql9hiSuQSaYlQUc+nf0RjFOHL4NreWQX+jtipxG
 9pUAdh5AcoDVUp+PhT9giIZUSPKGaBlsnomNN2BcP4uCXh9OOleOgPzuk7yEGhnXb4/EgxrIMxx
 TVUkyYUFqQpMvAN2OlsG1roXKQm1ow/yODTY7y0Cst46f41R8n/pZ2HJ6E9UjBLG/S5P21wc7k6
 eD0ghlPYG5knL3dk9VD0npSPY9PmD13y0ixup6J1GfROEtWMdWmyUBnplvpSjdVOACrSGRSW/LO
 lL+YEx2Ccc+KBme2eTZYjkdtggldwF9XpDGCHmaoTKO8YoxNCj2A4dMOWyFPBuEVek3gsq0l1qE
 WxD0CWMpkokK8LnYySyUvjyLTrikpqRSUWiTTuQqrVZytxuihgUP+iiVQOee5y0AtWyexIron7X
 kS/qxZVpmhMJHFw==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
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

LEDS_EXPRESSWIRE does not depend on NEW_LEDS in practice but still does
in Kconfig. Fix up its Kconfig entry to reflect this and fix a Kconfig
warning.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Duje Mihanović (2):
      Revert "leds: Only descend into leds directory when CONFIG_NEW_LEDS is set"
      leds: expresswire: don't depend on NEW_LEDS

 drivers/Makefile     |  2 +-
 drivers/leds/Kconfig | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)
---
base-commit: ae00c445390b349e070a64dc62f08aa878db7248
change-id: 20240212-expresswire-deps-e895e8da8ea3

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


