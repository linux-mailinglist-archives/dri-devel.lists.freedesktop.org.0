Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760524B1910
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409C110E1A1;
	Thu, 10 Feb 2022 23:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBD010E1A1;
 Thu, 10 Feb 2022 23:09:32 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t1so7141185qtq.13;
 Thu, 10 Feb 2022 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Il/njuSffEOrDW4E6Z5WwCggqy6XxgY6UGpPrL0AIR4=;
 b=JHJhNoUxh9ZuIiGYQov/FCIzAnjDxw6DqtVPkL1Zy1CLrsVwmf/L1YO0+GvOXbDRZ1
 pqP9mY9GzQYWTgjathqD6S833i3Jn5LhtxZir6zDdzPkcq0f+VaqtHxlBS6ulo5m01Uc
 5DJQwrfoKFPrAReQX/OlzhfusR6gY3jUDmZ2vXh/MK0XJxvb+JBDrj+24HC4sMqKBH2x
 kal6x+3q2ykI4/TCu98o6Mozggc8N7XorGZWzB7iKSz5i9wIizC8TdU+Cz+wzu1nNQay
 JFJ9W+P6+SkdtD9v9e2pIYBVGBN0oQwzdYpdb3O/UPoDayEfqa2+ziM7S0gFtv3xwP3k
 JINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Il/njuSffEOrDW4E6Z5WwCggqy6XxgY6UGpPrL0AIR4=;
 b=VCMhyiz53HcWPa12qZdBd7NM2OL3Z7DhCa0VHTYzkUp0wRdg3xmzefayZShNXwFK2I
 nDCwZBDlFFFO8io4Du3i36kMeCTsgzKW1QvxEx2dLm/arqZMdqQGTAy/kvuWQs+aGRsJ
 UnqhKf6lMQOsPFwZ71hwCz7fjWIzrocRLlLTAP6jiYiaO7/gUrhYdDeWCpEZ2K0QhGIV
 sW/uaM1BbmcuTF704V/TMQTEKuc13ypP1s6Y97Dwf7yMKL/QiS9vj0vNiwJ30G74guWI
 /0tfVg+4hs5GHv5I9vGwZ1zIgpIs01PVrZ0NQe8MFa35+yb8ViyjCBeUk/b02FuFCnll
 b3oQ==
X-Gm-Message-State: AOAM532Xh8dGFo0MYMciEhP/JAqqWG97lIvobn1aAiAMI3dlbuiIEDyq
 vG/Vk4YEKNaptrKz7hCJtDI=
X-Google-Smtp-Source: ABdhPJyv7MT5wCGfdlfCLRk0wYTBM2q1x++ztUAm4XQN4J6MUGrqRSzzk5Brej8rnmEAO7fi58Ap6g==
X-Received: by 2002:a05:622a:1304:: with SMTP id
 v4mr6649618qtk.359.1644534571568; 
 Thu, 10 Feb 2022 15:09:31 -0800 (PST)
Received: from localhost ([12.28.44.171])
 by smtp.gmail.com with ESMTPSA id s6sm11824113qtw.18.2022.02.10.15.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:09:31 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 08/49] drm: replace bitmap_weight with bitmap_empty where
 appropriate
Date: Thu, 10 Feb 2022 14:48:52 -0800
Message-Id: <20220210224933.379149-9-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smp_request_block() in drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c calls
bitmap_weight() to check if any bit of a given bitmap is set. It's
better to use bitmap_empty() in that case because bitmap_empty() stops
traversing the bitmap as soon as it finds first set bit, while
bitmap_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index d7fa2c49e741..56a3063545ec 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -68,7 +68,7 @@ static int smp_request_block(struct mdp5_smp *smp,
 	uint8_t reserved;
 
 	/* we shouldn't be requesting blocks for an in-use client: */
-	WARN_ON(bitmap_weight(cs, cnt) > 0);
+	WARN_ON(!bitmap_empty(cs, cnt));
 
 	reserved = smp->reserved[cid];
 
-- 
2.32.0

