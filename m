Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E04A7BBC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651C89E47;
	Wed,  2 Feb 2022 23:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx6.ucr.edu (mx.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20B89E47
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643844837; x=1675380837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uavpFDxmGoKjrnyH0fVmnFMq2r7aGr052ubiJDv8DR8=;
 b=lt8Pc7tX72TTxWbxON/gN50Yh2Woc/Fc0bEFgnIOm4qDy21egMGr3sdS
 tfqcoG27ToM28RyhnS1CSaXcA1vFeHRFLcWMxmyB3Giz61XmMVL6qHKlz
 6yUVKZRPyIZ5UPh7NgF59HjsWuIJe/mJBCNd9bOz9WiLeuE7Hlasp3VF2
 nLT9mV0QBy0C8oqkGxnx9apzVFcsj1ps5epqUk2cjTTWkR5gtZOp89vsP
 whi/FSKHCNUQOsYaPqI3iTLy28csXUHyoN3VZJK1OBHZdem43GroR7ZkZ
 Hd5lnMbR5cqsu/lju1M8XXtKxxcBUfq5d0+t4Pfwm4eyTT6ProhtY25cI w==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="278238361"
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:33:56 -0800
Received: by mail-pl1-f199.google.com with SMTP id
 p16-20020a170902a41000b0014992c5d56bso158321plq.19
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LoPhiSf2j9AFlf81eKG6xH4TR1F1QmboBbxydv3xQ7Y=;
 b=xDmZHe7b0lAJqRV03cgiwQiq8aVyFS9aT+B3OaOw+dR+d9mfsO5WhWIS1hey9PxQ/8
 pnHAutlDAUGni9R+QOz9ct54DuHYBVVF5lAGy+MaQvBMrHnR7tpJyTD+Ji0/d05HnW3U
 zPGVsGrgSzCJ8Zj7ELBZ7A+GpZsIoy7zxD5Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LoPhiSf2j9AFlf81eKG6xH4TR1F1QmboBbxydv3xQ7Y=;
 b=JSpEYduSTb+eKS6geTRBJOao9tl2Nb61AUuem8HVsdkqHg12PDDYQ7h2/I7RiZbPKm
 ZaGIh+u6l9f9kax9xqiGb1122+cjdCD3/SfX+MOj0uphitMll3Hd/GEsYPW/OAWqdmn3
 MxUZGjZCzqDqLqfOCAipcbEnbBrBLNufWHWm8OLJF7I1dIWqqVdKOkjGk1w7vWfMh19I
 2TCrXscrYxv9oAPTZ8G4cglS4yGVKdjsNMb/SFLCY57MU6Qod7Z8hSoKBD3pZH81VEJh
 scfC3zFu+V4ZrUHrNOqViC0JMDsCJhb44JNYZ/tKeYhg4Cdk4PprQx2FIADRChc6gFNy
 88fA==
X-Gm-Message-State: AOAM533CsgnRlWA89iADMdpyGaasr9B0rSd3nOze1g1Yol5/pTlMkbMI
 IUreYxn4IjQ+FW6ej7hIzG7ejKdIjStVB4kj0pY64Wbp+ePlDm1NM6MJzf0Qk8Vjf+RrlLO8Rpl
 64y72OKCW+d7AH5QVFwuEJHaaLjLuBw==
X-Received: by 2002:a17:90b:3841:: with SMTP id
 nl1mr10901904pjb.50.1643844835694; 
 Wed, 02 Feb 2022 15:33:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKw43I55RvXKUF5Oc0gQfOIu6GaU+jb9Uz6QfMkQXdHo2WKNl3sIP6kqSgU/6tvpMjh2bLug==
X-Received: by 2002:a17:90b:3841:: with SMTP id
 nl1mr10901883pjb.50.1643844835458; 
 Wed, 02 Feb 2022 15:33:55 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id s2sm26380387pgq.38.2022.02.02.15.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:33:55 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v5] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:33:58 -0800
Message-Id: <20220202233402.1477864-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <83e46d8d-ec7a-6cbd-010e-7f50f88dcf96@I-love.SAKURA.ne.jp>
References: <83e46d8d-ec7a-6cbd-010e-7f50f88dcf96@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function do_fb_ioctl(), the "arg" is the type of unsigned long,
and in "case FBIOBLANK:" this argument is casted into an int before
passig to fb_blank(). In fb_blank(), the comparision
if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
"arg" is a large number, which is possible because it comes from
the user input. Fix this by adding the check before the function
call.

Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/video/fbdev/core/fbmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..d5dec24c4d16 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (arg > FB_BLANK_POWERDOWN) {
+			unlock_fb_info(info);
+			console_unlock();
+			return -EINVAL;
+		}
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

