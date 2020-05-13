Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5E1D2165
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60996EA98;
	Wed, 13 May 2020 21:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27496EA98
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so1302336wrt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x7qfOFMEOKghZEcX71PCTwgo1XxvppOm/912/nC3M4w=;
 b=LekmvqEeT7CWFd+FwUdPd3q2gBtje/kStARbBm7frB7NS5yaQgKFNy0IuuNIi1dHwF
 fDT+7xUPTKJZmIl9+2vMGLDZzxr5d9ypWVGYxAawanTdP9ZCXyX7pFmC346kIeaEAQjT
 KUQLfeFLNppUox+V3SUxoSbwEdxMATcBrwkYYdl7zu9GMqjASU3UMgsNns3iNLosPpKa
 eJRMpqF/Xjv28Tjb9tsJTm4uwZIdcJxZcOgofgUpZTfDsbpF+t/WqyDygWYb4J9o/Psk
 zvynEB97S09SHpKTT/zHMCyblgAqNOp9a4kBVw9Mqk7Vnvu/tnVTVw1Y1e4mSwHDZPTk
 OI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x7qfOFMEOKghZEcX71PCTwgo1XxvppOm/912/nC3M4w=;
 b=BvEiUv8c3uovXjmcZnqXIXGldWSTTl6zeh53BSKhr0HSYyNLyuU7sJGSRvhpLhXeEt
 FYKDVq6JjjZvhva29RLAiADR/GxvmJlTBB5EopFKaWYln0hoSHk0JE363IeQLkBizk/D
 /d/y3NP2n4MujiRi6jhGE//gd09WbOYheKg1dENfeY0k9coN3e/4tqIn6tXM9B4o/mZm
 DCgwIsMIOm5t4eutJlNH8ZowCwXU6BgL1INPxjFyl6dGlEWXr8ROaP4GCbd6O/9N8vzx
 otXYZRfwJ6OQqPYYO1N+xncPQRczCJ0suB4nI9R1xKGvLxoFPuD0Jj7wZbc5VT00/T39
 V5Cw==
X-Gm-Message-State: AOAM532G+0ImMuyJ7hbaqYzo6QKMdaA77Y2VrWM6IC1ZkcMw+5hysp5m
 nHU5MZRBTsEXhsraOobb0BLO7bFN
X-Google-Smtp-Source: ABdhPJyhzyhCGx2Cl8Yj4V9mytYwksNLzoK7ZBRAORJJ7ctb+CQVFtZJueuqBS6HuhgT0C1BnCwuNw==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr1518962wrx.227.1589406409289; 
 Wed, 13 May 2020 14:46:49 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:48 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] rcu: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:51 +0100
Message-Id: <20200513214351.2138580-11-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, emil.l.velikov@gmail.com,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: rcu@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 kernel/rcu/tree_stall.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index 119ed6afd20f..4e6ed7b91f59 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -729,7 +729,7 @@ static void sysrq_show_rcu(int key)
 	show_rcu_gp_kthreads();
 }
 
-static struct sysrq_key_op sysrq_rcudump_op = {
+static const struct sysrq_key_op sysrq_rcudump_op = {
 	.handler = sysrq_show_rcu,
 	.help_msg = "show-rcu(y)",
 	.action_msg = "Show RCU tree",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
