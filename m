Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3E17A0DE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4756EA57;
	Thu,  5 Mar 2020 08:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053976E158;
 Wed,  4 Mar 2020 12:07:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so1786200wmc.2;
 Wed, 04 Mar 2020 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=myVXMYFX2X/qFZZm2xeEMnLsYe1/6jCcOyrKkOqzPDw=;
 b=RoFgc9EYaJKBf1aB1IsygPxKb4ptdXvkuI/fe+HFyJ+YGDbsS/jbGRIbMzy+YfoeW9
 KmZNAFgtTleKiIUhlmvPABHtFX3g/a0/m0h665SvZ51d7YDI5Lw/uT9SoStPXkEGSK4q
 V0PhnnTM1Cmg3OoQb0XbUYCL3GknBMajIslcuCTPsO1TJBlnkLUgc79gmDnzQ83rwJF6
 Sb7UVMkoy7VsTNXHM39B/Rr5ygFKPmobnLVyTHAB8LmOS3YOVWWTMw8eaGyEB6J1Ilxp
 E3VKN5Olxi20GUwgBtoKfgGgDfpPZd4baDEp6repdRw2GCkAzUT/2H8U2lOC8MIj83qQ
 ePAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=myVXMYFX2X/qFZZm2xeEMnLsYe1/6jCcOyrKkOqzPDw=;
 b=jSPHq6N5H91S64ZKTclS+2zx7Kui2NA4RORGaKagIk43XPLDcCXsNjleqHlCrQWMPz
 suYYY9U7Q/1Nrqzm6FxumCC0wE2oxoUIcgTo4vv7So5LpzpA9hINQ624XEZYvZ8ig2ov
 Dmf4l7iFf9DKzIQQS9RuR0ICRijOEmsxX/FzXooCrAy7qGbMXSQjFeMJvVDUD7Uu4cco
 ES7sUY3ct5rr2c7Rf0TzEzVzcmyH/bw4E7UVl2jGgFmISuYaz9YK6X/2pikeu0WO68Cl
 YKCCIF5kHcuvhd3ErV3MbnRf9FZXofoGCLbhm6cjTQepsgKVqLCyUpirs6Rmjr3wX15b
 M9jw==
X-Gm-Message-State: ANhLgQ1v//sT8En5Ch+tjireo8NoKiRi/JRkiODtTBR9j422OfeSSotW
 VQg37LoRTrMZcI/PCnxkqz4=
X-Google-Smtp-Source: ADFU+vsLvouiMTzcVlXfgCXVqwVxFQI+p2PE0dPIx/YTYl4CzKad7DsO4l3zlagL0leqIqigsIv9Ew==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr3362110wmf.120.1583323641513; 
 Wed, 04 Mar 2020 04:07:21 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d16:4100:3093:39f0:d3ca:23c6])
 by smtp.gmail.com with ESMTPSA id c26sm3811993wmb.8.2020.03.04.04.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 04:07:20 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] MAINTAINERS: adjust to reservation.h renaming
Date: Wed,  4 Mar 2020 13:07:11 +0100
Message-Id: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
renamed include/linux/reservation.h to include/linux/dma-resv.h, but
missed the reference in the MAINTAINERS entry.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: include/linux/reservation.h

Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.

Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Christian, please pick this patch.
applies cleanly on current master and next-20200303

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6158a143a13e..3d6cb2789c9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 F:	drivers/dma-buf/
 F:	include/linux/dma-buf*
-F:	include/linux/reservation.h
+F:	include/linux/dma-resv.h
 F:	include/linux/*fence.h
 F:	Documentation/driver-api/dma-buf.rst
 K:	dma_(buf|fence|resv)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
