Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E461D2167
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278536EA99;
	Wed, 13 May 2020 21:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5166EA96
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h4so28142313wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMr7J7ZMfB4ZM2f1GJQW61b2tOU+m7OCFm5Ehp2KhEg=;
 b=IJceG01RlwXhlyQYR4oDOXRYjS0suusZWN7gEsoV+UYCYVKC3AGuaacI2CYgES1w25
 KIYlnNSHLWnkh4DN5BbY3TWXS+Xz1UjZkhCmRAtLry2Q+Qtm/Y96s3FnNG/yVO0EYLMA
 elAU+lC8aibYwI1eWkjl/EAHMbK8Ett9Joh1s5kYnN4X0RcE65AOQUIFtJroEkuk1gKW
 0aG1YtYfz7u5RTiDGYyX4LJjNlPjMNEK/l7Osu6uwgYMWTvDBFem5fOGY6LJYjfLgEeI
 HW5evC0XvWEhhscypqHengf1uA2kgiuRX6YOSBZ99kdQamcW2xmIORNt5cyITPVws8+n
 wMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMr7J7ZMfB4ZM2f1GJQW61b2tOU+m7OCFm5Ehp2KhEg=;
 b=DFY5au+m6z8qCz6rT4GUJ09I4CSv9Oc3Ej3ha2/uQtrx3MBVliny4SAREEUaQo9zxz
 nVwRx34bNY2d1+JGOfUvaQRbLAPy2iv2gSFtQfqeYXD+1FoQt7+LhIVnJoBhBPBsB1o1
 TN10/bPmeBcnYJVFr7G2swSMHzQ55WwfZgSeBKBosbmlJ92LUKhSM58c0UFU0c6MvjFp
 O9ImUz4slBsbO2njy9o+7n263Csa0NebwLwNV1l4u62YYGD24Hyr3t3nHvqo0wHZT1B4
 Jg+/o0iSXoTQOg/NyD/XKh1U/7wNXnpYwtti92ENKk4k+a8QZJ8eudm0JpZYAioR07vf
 RZYA==
X-Gm-Message-State: AGi0PuYUKyAsXqCNEnA/lEC69L8t0CbOPcw9qaju8RUpAGkvikkIb6cQ
 UCvqo26tSW6SRS24Qhv7hf8YOj9E
X-Google-Smtp-Source: APiQypJbt0YC4e23V0PxrpeY5gor4dZlwWjkH+VR4hz5fssJYDKJUwqMu9BWXNbPFa3NgyDWRpCoLw==
X-Received: by 2002:a1c:5944:: with SMTP id n65mr34071597wmb.73.1589406404897; 
 Wed, 13 May 2020 14:46:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:44 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] sparc64: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:47 +0100
Message-Id: <20200513214351.2138580-7-emil.l.velikov@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/sparc/kernel/process_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index 4282116e28e7..423011e60982 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -313,7 +313,7 @@ static void sysrq_handle_globreg(int key)
 	trigger_all_cpu_backtrace();
 }
 
-static struct sysrq_key_op sparc_globalreg_op = {
+static const struct sysrq_key_op sparc_globalreg_op = {
 	.handler	= sysrq_handle_globreg,
 	.help_msg	= "global-regs(y)",
 	.action_msg	= "Show Global CPU Regs",
@@ -388,7 +388,7 @@ static void sysrq_handle_globpmu(int key)
 	pmu_snapshot_all_cpus();
 }
 
-static struct sysrq_key_op sparc_globalpmu_op = {
+static const struct sysrq_key_op sparc_globalpmu_op = {
 	.handler	= sysrq_handle_globpmu,
 	.help_msg	= "global-pmu(x)",
 	.action_msg	= "Show Global PMU Regs",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
