Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299402D06C0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D346E4F9;
	Sun,  6 Dec 2020 19:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BBE6E4F1
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j10so12663066lja.5
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kt+OQKqeEYVX/LquXQdXcmS8yIcFdc6k57DQM+M9oPU=;
 b=STZEcMk+wb0l3UdJ+w4DLF0jFXx8DnBowF7giFgGM4j8hOag/FpJ3NUdtoZl01umkO
 CJ0hrczLQanZCBtkp+DClr3pgNMRlx+QAah7U+tqKMY3jNczQ1mp4yq4rk0ZEy66/X4n
 cKs6U/iRyR8LV0FuqV+zjtW5Bz+LVrTGbXizScvbIJzKOo9oiBDofvUrS/8ph0Mhi9lM
 0qke4Q1lpTeGGlUu/5TI+VkjsUjQ05RBsvtLg4khuatGKHZsz2JI0VzkhcG3URBw8dXU
 g86Z/r2lNjTgeaBoeVYgkTD6QL0youwlGJ4BDPY1ABX1cUNmu8mo2cPuqx8mShfk5yEd
 Vftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kt+OQKqeEYVX/LquXQdXcmS8yIcFdc6k57DQM+M9oPU=;
 b=sHbLIi2eHTJEDYzSaLTwD/DwiYHQ+LxO9s5dN0/y/vqkXoAiio6tvxVN940i7moOv7
 XMioZke3aqArsT6EY1ty9ktx+9j51457J4AD7P/FO++Pjk4rETcKOaT6R/tzgvKO6IhE
 /oaxFygN0INBpjtBocCJVYtdVLzDIlu/n92nQKSnAyY7TOSJL/srztTtiUPLCU9XBhu7
 IaSmJcz4XLM7VtNwIoAPzThwvqJp5R+35wlVOsbfh7etYZj3tqjGunrYefi+T131YDn7
 yloOxeEjWSXvPuwD4siFhRpcbv4uVQwvjF3sciE5zu9206x25jOygR3k3suPPRr+MPkJ
 Kl1Q==
X-Gm-Message-State: AOAM5322wF/SBv39HWKr5GIOsUrMRQm3mmB/Jto5//nvOfxunUmKCaIC
 vGUU0C8DV5o0Cdd7hvQyoj0=
X-Google-Smtp-Source: ABdhPJwKtkjVCJWvIkTsbN4Y12+y0IxNqsqpikK8ueZbFLo3Nyh8mSQt2+/iNy4h8gmKIAfP/b+CjA==
X-Received: by 2002:a2e:8982:: with SMTP id c2mr7943919lji.121.1607281392832; 
 Sun, 06 Dec 2020 11:03:12 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:12 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 09/13] video: fbdev: goldfishfb: Fix defined but not used
 warning
Date: Sun,  6 Dec 2020 20:02:43 +0100
Message-Id: <20201206190247.1861316-10-sam@ravnborg.org>
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

The goldfish_fb_acpi_match table is only used with ACPI enabled.
Ifdef it out unless it is needed.
This is a similar fix to what other acpi drivers do.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/goldfishfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index 9c83ec3f8e1f..2b885cd046fe 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -305,11 +305,13 @@ static const struct of_device_id goldfish_fb_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, goldfish_fb_of_match);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id goldfish_fb_acpi_match[] = {
 	{ "GFSH0004", 0 },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, goldfish_fb_acpi_match);
+#endif
 
 static struct platform_driver goldfish_fb_driver = {
 	.probe		= goldfish_fb_probe,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
