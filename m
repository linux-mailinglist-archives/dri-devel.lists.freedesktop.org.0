Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38A1D2163
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E576EA86;
	Wed, 13 May 2020 21:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706E46EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m24so18532809wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SsGLhvtzNNE3Um+kD27FrquNqhBmiHi5qwlCc1MeclU=;
 b=XiuECaHuWlZtqmf2V9RziiPXPESy1M5JPlu5ULkY1Lq+ut+oFJhcdMTgwL8RtzNBUV
 slYA65/n18tW4XScYRxcfofPeB0hkM1niA79FfTflHA8206jGnBB1em5BozDhCCKIs5s
 Of+LQcm2e4gZIPPxSt6hpTQ+oD0f7H7qjnnguQvB+7bPo4Q+A8tiYIewQkjcGa0TY4M6
 2Vwfm8RIAaGCX8i19Ue/tSbRgXnuE5ME8dI8KYqGdr0JO95Bg3t63kP+vDCfdTvdEM34
 GZ8DDZzy9jiM9k8AUC6DMts6GkZaNtSXkx+Jg041oD4WxMaElsC9zd2m1/qTAbUZulrg
 N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SsGLhvtzNNE3Um+kD27FrquNqhBmiHi5qwlCc1MeclU=;
 b=eNeiUI+0U5rNWptwB4p36ZlEhdjcpG36MhQZ4SURy2ESxGbgtWGiHqcP3p1dLT4iFe
 EurghXRD7O34ZS8Hq8kkxYCs2cF/m6795g2h9dmcxzoPV+d/9JWumyQvyqJJQpIoAwgH
 v0vIKGVc6gCRb5awzQ+6sP7vc0dAqRx9Qz2qyDfS3am/Wl72s8auscl3vLqhyrC3ZlMS
 BRn1W41F6FyvI2KslJN4F46gc1y31DPI+lr2WngzvIpYcVRORvhDzI2dH/8tpgww6IEK
 Yt9I+IJpcmy8KULdba4O1pEjRcjSCM370Xo/7zkiQeNp49l4cJSHYeX0kJQk9Gc6bMJ2
 qoog==
X-Gm-Message-State: AGi0PuZx/iDQneVSXobxdcT9LcYGr7aBhJE6RPHKftrd6e9NeH+VZdue
 2AeNrTPOHJ8Ar4ugD5aYZTfhyNZM
X-Google-Smtp-Source: APiQypIjDv9j1WGGbsrXKzuvn+8PI0doRo0I/EblRla78tb2gcpayV63BaEBdC9Tkx4qISmrxAydUQ==
X-Received: by 2002:a1c:25c4:: with SMTP id l187mr42071872wml.89.1589406402802; 
 Wed, 13 May 2020 14:46:42 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:42 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] MIPS: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:45 +0100
Message-Id: <20200513214351.2138580-5-emil.l.velikov@gmail.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, emil.l.velikov@gmail.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better it this gets merged this via the tty tree.
---
 arch/mips/kernel/sysrq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/sysrq.c b/arch/mips/kernel/sysrq.c
index e5a2a6ab71ac..9c1a2019113b 100644
--- a/arch/mips/kernel/sysrq.c
+++ b/arch/mips/kernel/sysrq.c
@@ -52,7 +52,7 @@ static void sysrq_handle_tlbdump(int key)
 #endif
 }
 
-static struct sysrq_key_op sysrq_tlbdump_op = {
+static const struct sysrq_key_op sysrq_tlbdump_op = {
 	.handler        = sysrq_handle_tlbdump,
 	.help_msg       = "show-tlbs(x)",
 	.action_msg     = "Show TLB entries",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
