Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DE2D06BD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E736E4E6;
	Sun,  6 Dec 2020 19:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8A6E4E6
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s9so12635249ljo.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q2c8TosX3R/8fyI6+6hbgfajIYltmGAIh3MuAuO3wgI=;
 b=U8MIJ/hnXOrYJTIg5Ty/f9FVT3L8hXf/9YHCObVYWGeyhdDQDyxfUUfBTi+qMkjNEI
 OMTiD6lSuOFYPNUnRzv6kA7UjQTaO5R1tVf6tctjhXhObK4IjjAtiEGPkrtqtNGah3nx
 nit27kclFdW4q+r77Bc9rijfIQBZtU5/yCmxzGAgRBcPA3t3+UWy66kO9NBJ5Q9rom9c
 F+4stSsq2cJzJbR0dNnOEg9WjpJaFvIHHjP3HnUYTVhyHN/D3V/IfR+HiQx9MvNzhWo0
 0QT235RW3/8/oKvO+K8TPKJ7Mrf0FvPUvccFrTjNsdZrFNBYUR+L5iTkIBrehcYMBsgv
 8JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q2c8TosX3R/8fyI6+6hbgfajIYltmGAIh3MuAuO3wgI=;
 b=W/BwY7ohR4XZBKXiNROZZjwK5A+vWFMJy7DNrAG07xQPkyj/I2eVeQqkFc17fmNVED
 sM0iIc7RsQL4+r14OL3hXBQzCgUbeEDQ5C4j3TeN8irf0ZHqyQhO08Kns99AnQNDTFYC
 Dp4UuoR5zxoBm+AzcURcCupbuKypKjOJE63PE8VFlqLOejPCdQ3lZQLdEMBuVPtXMlaZ
 s+Z5w+opeGs2HZhdxAp23MMIcVNh4qJvmBFVQUuSDKXFiWoPay+uamlnjwsssPbXH4Tc
 hQPk8wEHOwFtPFPIVZH4gqyRcFZNqEo+ILe1pRyLDSYqnRIrk5GTE+//M9zKXUni16TZ
 etrw==
X-Gm-Message-State: AOAM531EBty1MJNtlJ2HhXbrFHIKJHq0Un2hWZZtbyRJZv41VEk3vEcR
 6nqRqzTh1PrzSmD8u0vGqzo=
X-Google-Smtp-Source: ABdhPJwh2HgCsQBPCpyq5dqu0dPDQ9AeMbjlOSyw3cv3zGiXAtMUTvcVRxOeuj+jvb/oXUKuQwIJMw==
X-Received: by 2002:a2e:3c15:: with SMTP id j21mr7596976lja.440.1607281389929; 
 Sun, 06 Dec 2020 11:03:09 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:09 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 07/13] video: fbdev: mmp: Fix kernel-doc warning for
 lcd_spi_write
Date: Sun,  6 Dec 2020 20:02:41 +0100
Message-Id: <20201206190247.1861316-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing parameter and drop parameter that is not present

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/mmp/hw/mmp_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev/mmp/hw/mmp_spi.c
index 1911a47769b6..16401eb95c6c 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
@@ -17,8 +17,8 @@
 
 /**
  * spi_write - write command to the SPI port
+ * @spi:  the SPI device.
  * @data: can be 8/16/32-bit, MSB justified data to write.
- * @len:  data length.
  *
  * Wait bus transfer complete IRQ.
  * The caller is expected to perform the necessary locking.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
