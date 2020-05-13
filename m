Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B11D2161
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088106EA8C;
	Wed, 13 May 2020 21:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08F6EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so30206713wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZhpfY5SsXwRMXVq8oG2SQckFQ1KlcXnx8okrJoqKCA=;
 b=J9f+VXD35N9xl7mX+0T+f83yVVR/BgYM8RMEZCYaz1RSjI+MkVij2f44TNmQ9iGE86
 6etFqrZUffKYP1M1wze/ps4CpisiMrwWTnMSr2L2m5nhNa5DdRhGtiWzYXGCcH4SCHOR
 6bCmg4p+pF7wkc1n7vujJNPXgs88iP/adct8b8CQYCOEt+lQFy8tdVg3kvLTiy1MZ6jP
 f3tO1rfpK8afd0A1SGtKTrY4qsre9OxjLK3sQ7TXtxEP9Sff2EyVlkXtvXZteu5nRCWR
 lo+fGAss0/qYhP8AefeSr+vcsIXkj77mG7qPVT6Roqq2qA6M+07ju8yV/+hXTmOmBSQa
 zFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZhpfY5SsXwRMXVq8oG2SQckFQ1KlcXnx8okrJoqKCA=;
 b=PRI111PVMwOuc+L1mRUxHj4z5MFPoR3SSMmmnWgNHbDTc/mVI1p7v4J01PnxLMhgy8
 vcpigKwe0mOtRIFveCASJ4DJGj47cWIaqBXA0EBJ4n0MnMidgJ3jNNGTuwUKlFv78NsQ
 oHjJm5kt+oUaAfodJHkKeNQGyJ5J3zoiIS9pL8b16uB93Hq35UoO+tlni8l5EMuTizii
 7yBo4/iEQrmOQ3jusAzmF3mD1BY2aH8Gj5wKUaHl0LdwCmrKSObO7dU4pGwlWn6Jef1K
 AbRbN0DbFmA22O0MqXO+mzJXaPDS0gN/Bwf7LLAh9gBFRu5x8/IyvECyaR/US+HIakzc
 R6lw==
X-Gm-Message-State: AGi0PuYFUE0KMcEmjBcM9reZR7AWMXjVyEM9SsC3fvD9TzDt8VTEC7u/
 fTtQtwp4s+Z5MioZ3VDPraX11dh5
X-Google-Smtp-Source: APiQypIZ4r5SZkRDB6NXjJjmJhzn7tVrsiIl9AH/93M3gz7vnmZP+aNiDzxAEY/+SIIWvDX/w43OYQ==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr43223777wmb.116.1589406401788; 
 Wed, 13 May 2020 14:46:41 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:41 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] alpha: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:44 +0100
Message-Id: <20200513214351.2138580-4-emil.l.velikov@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-alpha@vger.kernel.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/alpha/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index dd7f770f23cf..6fa802c495b4 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -431,7 +431,7 @@ register_cpus(void)
 arch_initcall(register_cpus);
 
 #ifdef CONFIG_MAGIC_SYSRQ
-static struct sysrq_key_op srm_sysrq_reboot_op = {
+static const struct sysrq_key_op srm_sysrq_reboot_op = {
 	.handler	= machine_halt,
 	.help_msg       = "reboot(b)",
 	.action_msg     = "Resetting",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
