Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538D8587D2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD89610E5AD;
	Fri, 16 Feb 2024 21:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.skole.hr (mx1.hosting.skole.hr [161.53.165.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043C10E4E4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 21:16:53 +0000 (UTC)
Received: from mx1.hosting.skole.hr (localhost.localdomain [127.0.0.1])
 by mx.skole.hr (mx.skole.hr) with ESMTP id 4D76785ED3;
 Fri, 16 Feb 2024 22:16:46 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Fri, 16 Feb 2024 22:15:43 +0100
Subject: [PATCH v2 1/2] Revert "leds: Only descend into leds directory when
 CONFIG_NEW_LEDS is set"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240216-expresswire-deps-v2-1-8be59c4a75f5@skole.hr>
References: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
In-Reply-To: <20240216-expresswire-deps-v2-0-8be59c4a75f5@skole.hr>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=qSJ1/TTcVsBzLbrf10anAAA1rn4tSH4MQZtvL9vgfq0=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlz9CFxRmO8aCVhI+x7Vyk3o4zgPCoN+3XgcQJJ
 NpHqnxdDoqJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZc/QhQAKCRCaEZ6wQi2W
 4Up1D/49POAcQZkjzsmoC6tbb2ATYuJ4+xypsjy5ftiHT8PPYhNfH++nm/LAWiDrnrYkypgvapd
 bksdzvOS+Y8dMkJa/HBO9gsH1rwbrofF03499pw8O2F3T603yHExlOMfPF088VXjC2nhMraaLK6
 K5bkxB+1oQHJwmpbMCTw0RJauc1Rb9CLVVwzkKBdQ1zll/1pqqXa5PE9jCFwfeOZhau851f71l6
 Q6s7V851M6nZws/AwNfAj65kIouCaDMKe4TPuC/Bc48J53txYJmOxvB2lbfhzhcfFX+E/IidvKa
 6qGxTeM2Talut0R3FFuwlImB1PHSklspCh5BHxdihW3srpa+w1Ra37s9XrHhOKgkozonCqNuCjw
 3m0MTKr0/cYpEhobeNjJQiedoWncEDIdFZ8FcMX9ZHvYRhWklqjHbUZspd6LUx3PHjEjo0iR+Hq
 n8EhyXu3sGDZ1zZl4mq4rzGHoKvtl4Ni4FemC7IE09bZEHWlp8e8Q8373xSUcj7wFYJdbH2z10A
 rVYuLq6cyK7cim7j+z6lCXy7SiW4IsYbRtVNYrHKcj6jfJ8NMvu5uViH5V1iiGtkYoJ4O0zXTtZ
 SRLw7ltEpmGPKRAdzwxlwK0EwLDLTgvDFhcaPeR2vP8pKje+4F9PxLEAHdDLyFfTRodRmM45wIj
 WD0L6umB+kpeo2w==
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

This reverts commit b1ae40a5db6191c42e2e45d726407096f030ee08.

The ExpressWire library introduced in commit 25ae5f5f4168 ("leds:
Introduce ExpressWire library") does not depend on NEW_LEDS, but without
this revert it would never get compiled if NEW_LEDS is not enabled.
Revert this commit to allow the library to be compiled.

Link: https://lore.kernel.org/2cacd8dc-6150-4aa2-af9e-830a202fb0a8@app.fastmail.com
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
Changes in v2:
- Add "commit" before hash to silence checkpatch
---
 drivers/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index 37fd6ce3bd7f..3bf5cab4b451 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -135,7 +135,7 @@ obj-$(CONFIG_CPU_IDLE)		+= cpuidle/
 obj-y				+= mmc/
 obj-y				+= ufs/
 obj-$(CONFIG_MEMSTICK)		+= memstick/
-obj-$(CONFIG_NEW_LEDS)		+= leds/
+obj-y				+= leds/
 obj-$(CONFIG_INFINIBAND)	+= infiniband/
 obj-y				+= firmware/
 obj-$(CONFIG_CRYPTO)		+= crypto/

-- 
2.43.1


