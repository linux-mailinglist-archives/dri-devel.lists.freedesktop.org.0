Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455398587D1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A41B10E4E4;
	Fri, 16 Feb 2024 21:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461D410E3E1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 21:16:52 +0000 (UTC)
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id AA20687245;
 Fri, 16 Feb 2024 22:16:45 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: [PATCH v2 0/2] leds: expresswire: Fix dependencies
Date: Fri, 16 Feb 2024 22:15:42 +0100
Message-Id: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH7Qz2UC/32NQQrCMBBFr1JmbSRJbUldeQ/pIjSjGZSmzEisl
 Nzd2AO4fP/z399AkAkFzs0GjJmE0lzBHhqYop/vqChUBqvtSVtjFa4Lo8ibGFXARRS6oUMXvEP
 fQp3V+kbrrryOlSPJK/Fnf8jml/6RZaO06l3ng9FT6If2Io/0xGNkGEspX9WBO7uvAAAA
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
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=846;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=vsUzdyJf3pTQ7iUhH2zrKBom94/d9kxFvZKujmQlDa8=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlz9CFR8jXTTpNjeM5Z13FI+8f8Uv4Ix9lAQpaT
 Jn64esMzpWJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZc/QhQAKCRCaEZ6wQi2W
 4RfwEACDN/l5D7tzp7o766y36S3GhsHIEtzUEBCRk0smhUo5lpciXjTWgIQ6I+0jjopw+PcFgIG
 keEipaCgUGqaHg5rT3DMbhUYiQlloAX+Il3q4dXGtQPa66bp5+LAkMSyLiiFJd5jYNYlDED3vg5
 PDxTaXZxFKf437PJv0/9XwzMVhuDScudoKLp05K1rzil3WWxjqRnh9ljn/wlUDYZzKvnrYU73tb
 8utBDSnh7YF8/o7MLJrhH53zTya1Qd9LYXJiXcVMTG0fNaWWQLnse0LKnzjhMAL4nNiF32Uxi+h
 te2BisSHEzflz04dBfXWT3VUQZzuz5nzUDJvfSz08Hm7E9yxBLPV/bg2yhUlXkrvt1qGX2oLxQA
 iNOap3FLdazQfgl9sUPcVh6HazF9grJQ3Uo08ZQW/y00HdBgkOTtP3RIMLAt0qZIVdc3NSe0nRy
 dGARsxhrs3BzXZqh9CpZdEDP2m1xEK1Ywx8zXksC8n0Dd1+MwymROLay2ut/6i1Qxm2XN0UWovi
 HB0d+iE9JiFYKTmA9rsdpz0H8izcEbwrmonCYFiv0PywgcYqtgrzsdVeruX3qWCEu/8a9Im4Ker
 hEoPoIWK3sSX4gXRUbNs6QGiw2E5xtTiU2ztPMyerPn7Rb5OSRVV1ChUEf0xbsq2TA4h1Z86dM1
 duaZbd+56zSXTCg==
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
Changes in v2:
- Fix checkpatch errors
- Pull Daniel's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20240212-expresswire-deps-v1-0-685ad10cd693@skole.hr

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


