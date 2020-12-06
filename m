Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF72D06BF
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451326E4F1;
	Sun,  6 Dec 2020 19:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8966E4E8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:12 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s9so12635283ljo.11
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YJ8hNiC7fcBnhr6W4yRKfHMapnKQoLUJY6svzs3To0=;
 b=LaLHUm1Z4gGqnGZ3KZ7SHqaALYkoq/yZxYDzkQbZYV0PMY0w52MBCPt//V8+5dKQSB
 g+UgMgIcXOB/tO/E/S/ZOeqmDZyduyPkSz6vCyBp1j0j0R/blDyXa5ncboNUSyWNMmMF
 7z4bu82pAwrOMfKemks/fqOWwajOskvq7e+ffV9CjCxa+f0cR7uOpNMx1E+RO/dH8/pA
 8ku81TvvuYNVjpeSAv5GkdkAwNrotvjHD2EbOid95GXlW7DZFpHvs5+mNU86MN3GadvI
 RKAzjz2ik6cq7BN/9mn2RHD6G9PdUsn7mATzpH4xmVpu2xIiZ3Uf98S7duMImpKVvfVl
 +15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9YJ8hNiC7fcBnhr6W4yRKfHMapnKQoLUJY6svzs3To0=;
 b=r8FmQiL+dKIexsT3ZCMuLenFGe+85Xw1ALPQjf1zSr7J41st7EXn30hK7qX4vkh/Gh
 lAOWUU/kEh7idcJiwnWjXseJRTO57DYygQnuViU+j9XHSlWLsxDL5QDQadXdL92BRM/+
 GUN3Sy+YQQ5c4iutPgfrEezIc2xfXpHY3LIrCVIOpBMc2yiPmRqi5RnoIvVSUPpfeThN
 kdyN1mNQKooHDk2dMbg6e79nEbxDgULAHfuYq/Ex3vL+j9Kw1y8/ey0hGEsYeBv681di
 okmhDIcgLUiYgJNbTB5GDJ/hpu0semNf+h4DSENIgGfRmlL8Z8dxLRKmH76BWbvdodjv
 cM8g==
X-Gm-Message-State: AOAM531TaHYaJfjF8YealYJf10mSAk+Puac+Fxr8zVvhjO1MUTqxmtLo
 9Ic6I1x8WKqANr1KfzHVQdo=
X-Google-Smtp-Source: ABdhPJziPsnplTe7NiMrRGdNc3o7SXo2FpWEV9XqodakF7dSDg151GPsQjMackM7Ag3jGTKj591jlg==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr7761708ljk.439.1607281391398; 
 Sun, 06 Dec 2020 11:03:11 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 08/13] video: fbdev: wmt_ge_rops: Fix function not declared
 warnings
Date: Sun,  6 Dec 2020 20:02:42 +0100
Message-Id: <20201206190247.1861316-9-sam@ravnborg.org>
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

Include own header to fix "function not declared" warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Tony Prisk <linux@prisktech.co.nz>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/video/fbdev/wmt_ge_rops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 2445cfe617a9..42255d27a1db 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -11,6 +11,7 @@
 #include <linux/fb.h>
 #include <linux/platform_device.h>
 #include "core/fb_draw.h"
+#include "wmt_ge_rops.h"
 
 #define GE_COMMAND_OFF		0x00
 #define GE_DEPTH_OFF		0x04
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
