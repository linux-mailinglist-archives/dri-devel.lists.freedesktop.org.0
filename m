Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CA2C764F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE156ED0D;
	Sat, 28 Nov 2020 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9506E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id o24so10577677ljj.6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vo4cr0mfLt51Py8FoFo5ySrp+3Uu+WbwThawmdg5uCQ=;
 b=rr082/bfmcgQVh1oGNkvsycPHb7jgLYqu/HTlitaos9mo8dFk+MxNnQcAMKYhTOz1G
 nj1LrdF1YUNQ9IAMe2k6I+uAp+9pySXOyogw/6aYwtvF0oj11SXGTjG+hDZOVwfUW4Vh
 9LbkkP5yNUVSUdx21hrIgKOLXf+4I11SveX5JuUtwoT3jlqF5CiaXb9QZLtnQY8nZoW7
 qS7J1V4thgMvocrZcf/rGKX4zsMr7A3kx9KfFseFz/dT2giLnxQUxWawESs4WL+NuwP/
 6XE0j4Lm9xbpiCeaHhQgEO9SE8T9yzD83V6/YvBVED/MIr9LPm4A7pawwrUFNAhv83yN
 3ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vo4cr0mfLt51Py8FoFo5ySrp+3Uu+WbwThawmdg5uCQ=;
 b=ZvWeMhCGCZi8WNdzNbmsHx3DDgZe+QBZHAuR1J5YYzO85b3kd03Dj8SAgiYLkvKHba
 k2GupkBgsfBdeD3Knk80MoubRe7Evu5uFjCIznyu4lCVCG7HKt21Dn4v3RppfXP2ki79
 GtQb2Jh3s0k7XVlFzIAWsYh1DXKOuvHpxi28bdkI5AmsE4EsObQbwG/TKVobVZ9GCGr2
 Fg3pjEF0lBhrf5CH7J8T/6+7dBy5GqNURVe9uHAmDRtTMJ/Mvq9OQxJPJu6TBfCcpLMq
 WGhB5yCD7MS8XbAIJb5RojHlRVomyRTFm44j6mst8M2I6A3RkqayNd+byGZLBcpy8QHM
 ryHQ==
X-Gm-Message-State: AOAM532fdrdh5dIuwpIlqoA5yRtagKQmfE5ujoA01lgHA4Sn3zn4hm5k
 NnL+NyCt4oYc9FxkOpChPIJWPYON6zbaxw==
X-Google-Smtp-Source: ABdhPJztBDdAKHiSNBdw1ZXYn1VBf8Peg+KZ0RY/iaTzhAAH+LYmPfiKXZsj0Hc9jhgaMObrsDNovA==
X-Received: by 2002:a2e:580d:: with SMTP id m13mr6673046ljb.141.1606603295928; 
 Sat, 28 Nov 2020 14:41:35 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:35 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 07/28] video: fbdev: sis: Fix defined but not used warnings
Date: Sat, 28 Nov 2020 23:40:53 +0100
Message-Id: <20201128224114.1033617-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

init.h define static symbols, so should only be included
once. Drop the include from sis.h as it is not needed.
This fixes a lot of warnings seen with a W=1 build.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/sis/sis.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis.h b/drivers/video/fbdev/sis/sis.h
index 9f4c3093ccb3..d632f096083b 100644
--- a/drivers/video/fbdev/sis/sis.h
+++ b/drivers/video/fbdev/sis/sis.h
@@ -15,7 +15,6 @@
 
 #include "vgatypes.h"
 #include "vstruct.h"
-#include "init.h"
 
 #define VER_MAJOR		1
 #define VER_MINOR		8
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
