Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F404F7E4C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA310E4A0;
	Thu,  7 Apr 2022 11:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994D210E4A0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:46:22 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r13so10292536ejd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNlkVM8baH913eguVQXGinxEDt8afashhqDzeF5Ik2E=;
 b=i1dXWgHmnJDI8rkDKnSAkmfNZ9HtWbNiSMrxyCUvh/LW16+FNCgbE/IQ/29Ieh8M52
 Jlx+vzq0NGBB2dnxLvgGURyQULpDEpSRT4KODx+a6JKiCe1RsY9k3x68/gD/6JNx43+B
 IjAPFVciM6DIWAhbcZnFu1EimDkTgFS+cwk3hSWpf1LFNcqTO2lxf7vZ64/NEmh+6CXC
 7JgfnAUVNw1AV8QjRiVl+HRY8Q+oSuzw2d36YEtPOTCr1xguzjZn1LTshFiQ2/cBztFJ
 mVdU2fpFV5UBsvIXs/N9Y3eYSbMThNgjI8JA5UQbSvrlxuDsgcoydpxgA10uKfjTJoK+
 7WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNlkVM8baH913eguVQXGinxEDt8afashhqDzeF5Ik2E=;
 b=3BdGr+crv022HlBz0orndqluzBeEDoJrOzPOm5htZpa8pAxWCuQkYKcs98/JYISZRb
 /slb0JrWcH2hFyb21gSae30K9zqcb3pSF4JG2CMDU5kz1772Qy2U4r0eVJuL2ruviXSE
 xVZrsgD7CbotTUs0OsTkPXE3T8Rp8gxG/l8jy9+BUJkt+rQHAlA/O7shKH0Duiru2Y6t
 I3PtoN6ox4vI0+dw4XL9Mk3y1m7vPEkWZPOg9t5HR4Mpihwj0R1T6OoKRG3Y27ftkx0s
 yratAYQFYwUtgFMYgW/f94NvsY9sBsmCki5l3aswO3wpoG4wWiWBgsZLkAAYQCNW6d/n
 iC1g==
X-Gm-Message-State: AOAM531L1Yqak2q7mT11bCjxXMDJuWosrpDw1KyfDq8gxnS+8TToaN7N
 Kx2UV2eSUXeNul6XKfKOyK8=
X-Google-Smtp-Source: ABdhPJzslhVGREBX4iRGrsw6/5s1NVrgnb38ZMFImGbuB9bCTl8ReEvdxMRCT1aQw3OdYBJffpob+g==
X-Received: by 2002:a17:907:3f0a:b0:6e7:5610:d35e with SMTP id
 hq10-20020a1709073f0a00b006e75610d35emr13024058ejc.366.1649331981051; 
 Thu, 07 Apr 2022 04:46:21 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 kk13-20020a170907766d00b006e1442fcff8sm7620472ejc.175.2022.04.07.04.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 04:46:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: peterz@infradead.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] futex: add missing rtmutex.h include
Date: Thu,  7 Apr 2022 13:46:19 +0200
Message-Id: <20220407114619.961750-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this isn't included here any more since the removal of ww_mutex.h
from seqlock.h which causes a build break.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 63e8768b2ad9 ("seqlock: drop seqcount_ww_mutex_t")
---
 kernel/futex/futex.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index c264cbeab71c..b5379c0e6d6d 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -3,6 +3,7 @@
 #define _FUTEX_H
 
 #include <linux/futex.h>
+#include <linux/rtmutex.h>
 #include <linux/sched/wake_q.h>
 
 #ifdef CONFIG_PREEMPT_RT
-- 
2.25.1

