Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660629F9B7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 01:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84ED6E92F;
	Fri, 30 Oct 2020 00:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606CF6E92F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 00:30:54 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 23so5067735ljv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WcU6T4hccd5cIgxH69lq3LU3dv7XKAqa7a9Wy3kb2Dc=;
 b=leJqdVBahsfYuyVGnp9yBWGadv/E8WB9Ig4JGQiNyu3DnPfed0IwIVmf2uEAdtpuMB
 ICLXiiowdZVfibEEsDMCqRbfIl91S6AvQAV/+A5ydpcsVu+2/dl4vtIzGJRXDePNuGHU
 JPR7fquhT3lhSKFh61nxSr9dt9pBUBgf8JFbGPQkM4bGwd7ibRTpTjm9lhZvGS0HglWz
 qF8HP0VrVTBR8H0UY4K23h2f9qLhZe2BArWsOgoXQviCEeNcpqnmracXw+EZnSOGbP8t
 sa+c265v/OqRU1CmqKElqEBP86I09lB4vcMkMTblkYkyRH9ZwJkQPaJWCrbniyFLXYIz
 Uz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WcU6T4hccd5cIgxH69lq3LU3dv7XKAqa7a9Wy3kb2Dc=;
 b=b4xFi/yhfU//zzoFnYAvQylJyfxkt1P9APmWmEikQi4ROVlpi19Vmny9ijZ1Wx+v/D
 /PyUvR5KBfITVZsi0nvSc5Uks2q6djrwsXTYWSHYADp/hSqJICfHFPsVh5bNdAp+O131
 8mt0lrDYQ389q1hIM/VjO1FEJY3qP7y/2JVIvyzSKFwt4oJpMkHY0MIiEArJE8i515/l
 JZT7O5EsM8clSuEzBhb1Y0Kllf/mZZ2HBATTv217FZb9c77H/KRvJVgNc1fyDr4wkyXm
 Si280mLPI+yfLzt9SNo7LXrvmW8gvyyq7gJ+D0bNWZovnJYcmDe9TzQC1sbd3mli/pyv
 RQ5Q==
X-Gm-Message-State: AOAM530WDaZn9ZdFzeLIe2qwlHs8PgA8U1PT5lNuozAkNC9/bK9Z1un0
 slk1zhniEeRVsGYalI0CJN376g==
X-Google-Smtp-Source: ABdhPJysATEz/+0sEJLgj3DA4+hz7bygNlLwNnEkTdEngOO0I/TIZuUL4RDZe3S4Qiv5MhxkgBI03A==
X-Received: by 2002:a2e:8049:: with SMTP id p9mr3121422ljg.9.1604017852754;
 Thu, 29 Oct 2020 17:30:52 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id j10sm497336ljb.93.2020.10.29.17.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 17:30:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev/sh_mobile: Drop unused include
Date: Fri, 30 Oct 2020 01:28:50 +0100
Message-Id: <20201030002850.6495-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver includes <linux/gpio.h> but doesn't use any symbols
from this file.

Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index c1043420dbd3..027c74d7c010 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -16,7 +16,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/fbcon.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/ioctl.h>
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
