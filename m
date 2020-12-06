Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD42D06B8
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8C96E4CD;
	Sun,  6 Dec 2020 19:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013EC6E4CF
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e7so2429740ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=awoxLOM24BlPDDqXjccUiIDJsTqNec5B33IQuldBAcA=;
 b=P5PNaFqQt3Yi6PZWkmUYqAJgQuDA/89Ks30XOudshL9zK381d4NWbc1uodB//UHAfc
 HTvn64yb6lGi9hcQh9QITUkTv7+fUOaS7TKiKVbVSuKdPrxFND1N3fXGyyEw7nKng+7s
 +mf+kOMFsoBz/AElgTQboTbNhPzEgGAzuHyrT8cJ0S0zxOqEFPBXjUl8emTYeZu97F4A
 laCvoGTSEqnMc08Y40jy5iVbAC86aMm8Xs54zO1wU4rnMsFRsk8/eUiYNxBqfyzpYpiT
 vYJe6IToXWhfEKlCngFRlpJcolu6GUdOlepGDbYPvysd6DwHh3Fr467MliJ9uYaqKsVQ
 P54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=awoxLOM24BlPDDqXjccUiIDJsTqNec5B33IQuldBAcA=;
 b=icySF7ny4M23yuiMTe5lk9dZhNQUGIIQVUtUV7zsyx3xqfU5rIeysfpmJ2bEAVmU6D
 oWuwRZERJw9hiVkdhZi9E/AD2COCGwJUwHx/Lc/HpabNGTnEFcldKiNrDKdmD0atf9Xp
 BPY1Iv7g510r+0jZLhp/99hStP120BtZCxvAXBLIUWOWiizQ+d0JWnZHHxQcwX2kY+tu
 ukX4W9KmdLQhrIWbAEMpz1BptWaKNTSssa9eIsO7OtuUSlNW4xnsFnL60hi0to8FiXaW
 f2n0Y3DSs8whroUShNT6JGTnE2PlI7BYkudbPE/bG6d7JFNIIKqp6BNkCWa3+ARGtzNZ
 iqhQ==
X-Gm-Message-State: AOAM530f+DZ18Ewrxy5vFOLwvvK/iM9jLPbOpub5D+zXFGcfGxgajJzp
 0Lxm2+t2tQ9icKRS5Gg/Yyw=
X-Google-Smtp-Source: ABdhPJwFKM/Zl7jOyF45tkIXB6X8zzxGd1xx4NWx6nsFo3s5UcMXstc7DIYYaoWF/J47Mjh04zw6vw==
X-Received: by 2002:a2e:a40e:: with SMTP id p14mr4886244ljn.63.1607281380392; 
 Sun, 06 Dec 2020 11:03:00 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:02:59 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 01/13] video: fbdev: hgafb: Fix kernel-doc warnings
Date: Sun,  6 Dec 2020 20:02:35 +0100
Message-Id: <20201206190247.1861316-2-sam@ravnborg.org>
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
 Peter Jones <pjones@redhat.com>, linux-nvidia@lists.surfsouth.com,
 Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Tony Prisk <linux@prisktech.co.nz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc comments.

v2:
  - Updated subject (Lee)

v3:
  - Add space after ':' (Randy)
  - Fix name of function in comment

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Cc: linux-nvidia@lists.surfsouth.com
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/hgafb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index a45fcff1461f..8bbac7182ad3 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -357,8 +357,8 @@ static int hga_card_detect(void)
 
 /**
  *	hgafb_open - open the framebuffer device
- *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	@info: pointer to fb_info object containing info for current hga board
+ *	@init: open by console system or userland.
  */
 
 static int hgafb_open(struct fb_info *info, int init)
@@ -370,9 +370,9 @@ static int hgafb_open(struct fb_info *info, int init)
 }
 
 /**
- *	hgafb_open - open the framebuffer device
- *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	hgafb_release - open the framebuffer device
+ *	@info: pointer to fb_info object containing info for current hga board
+ *	@init: open by console system or userland.
  */
 
 static int hgafb_release(struct fb_info *info, int init)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
