Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F222A2C6C43
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B86F3D6;
	Fri, 27 Nov 2020 19:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE326F3C9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j10so7134873lja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hlmg0QXcyBXkSQsSrsHccJseYumWnCfsbqf3yovwsZQ=;
 b=LoQV/HRoqkupk060ExH+xj6uc2BOYCLe+/fhhXr+djyJrScexTnQiICqX2SijJ5CUX
 sx5Ye76d3HMLlLvA7Kf1y7OzeABMF+DUkMOcrgoS28hcPIaCWKe7M40Eeq/FXGxh82+n
 pHihwnrBdOe8HURp8U9Xy1lh6JW2MeWSw9XBOSAy190vGHjdAuYb0pw7WR6hoxKLdFCj
 O42Rf9Cq4OpSxJejPEixC4sl0teW/2CrwQor6MQUWalB2M5js/5w0L6rPgPz/qLgL04O
 iK9jeSH9y4e9ZE1JFRAQB5Qr5nFOSxiGwLmV9h6wxY5714YuWeAd3KS8GSyO+db1Ud9c
 aCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hlmg0QXcyBXkSQsSrsHccJseYumWnCfsbqf3yovwsZQ=;
 b=s87PjNC7tw5R+PgmE0ca4LsyqqUXAcG0Bs9NKB3ZsevnwGPG1ZAo54sreJXf+GOAxa
 uA4vV5XOcvMHI55ZtFw9yqu2Q85ovEbkiBqc9cCDK455qDaf3pMlbZnTAyv/LGh17Ieh
 YhuoFgkhHrWPqze4bxyCrStOqs1/Ee1Z8wesjK37TClDgFMLfFf5+QWPIQzERgGWMXiA
 v1IR9BvUUGBLZuNfaW0PW2yE514QM9HSc/s4/fgl8tItw4IYLZ+XcrIaOCaBXqzcop5N
 xNBIgPApDzXDPPBv6nlf95//he7Gbky9G428FSF/nNQniz4Qj2tH1L8x2x+emaWUEswT
 /s4Q==
X-Gm-Message-State: AOAM530NPTHrrg/shTUYxeJ/euXq9SdH3pKBhS418k3zswUzmAEtXMck
 xHm1Z1oI4zUjOsSNI7n9b7I=
X-Google-Smtp-Source: ABdhPJzRLomTEf1vvIm/1TdbxkZYDb34ZllLyKUDbE4zhUrgFXPDrbjJCxhX1h0uR2r7RcekIwtaLg==
X-Received: by 2002:a2e:9cd4:: with SMTP id g20mr4110075ljj.174.1606507132537; 
 Fri, 27 Nov 2020 11:58:52 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 07/28] video: fbdev: sis: Fix W=1 warnings about static
 symbols
Date: Fri, 27 Nov 2020 20:58:04 +0100
Message-Id: <20201127195825.858960-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
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
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
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
