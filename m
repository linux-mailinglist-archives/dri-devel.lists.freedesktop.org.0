Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723161D2164
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395DC6EA95;
	Wed, 13 May 2020 21:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8706EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d207so9895133wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwEXZysR23CccmrNbp4oN3ldgqd9cJzH2UZSb4ihijw=;
 b=RW1G+ogaAUWg4GP/IAaKNDiWpKHIvYpQnbau/mVBhnk3xIed4Kf27YNjBWyThTty/b
 aa6RzDE2vVQpDzT4KYj0Hg1pX7a86XwH8Gkjh+dqN2ijY/Bh7VOGNBKaBvllUvvgTe7V
 JYtYdUkSr9CrVUUlGhGy0qMnqJzhlEs9Gg1WhRCbrsggDPN8rSk+V+Xjj/ZBwbDca1zn
 Zqxq/ucDBkApCW26k1BrUvDs0z4ynUSWmSjyaEkSz0+q23ekyBhQTXxIbOAkQi1qEUd3
 PJfBW7d+pq1xy7EbcafYMm7NFocw/Ek9E40OFAv8yotfqMA/LMU73/trnk1ziQrnvLwP
 0KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwEXZysR23CccmrNbp4oN3ldgqd9cJzH2UZSb4ihijw=;
 b=Ne3BipSFFu7P/L+7gpgnbxYF3wpUZjBAQ2UwA/srO3qCmIPEVpe9WvhujUq6YpiAz2
 JIMwQVSdZtGb11bximlIpZJdpnAiNiQiHN5jlhn8ksZUBNKH+3QMBFHDD6yUFe0Zl3gf
 uNHdvoZwaPhyvTB5kl/U1WScLkAgTYNnLpGj7t3bdfuWBLGnnP+jl0NqfgjbDgbUpUp8
 VdegCnIlwn3B2p3sastJ248XLu68uKfwS+dk0hL+aSByktnjla6by/cmrcnJAfEIUMQ3
 pzokTIUaXMrQl8xPcMpZDeNzDxaNumxbGfzoFcwjXJDFappqjvvfD5aJlAfEtXDgfWR0
 Qehw==
X-Gm-Message-State: AOAM532zGCLqX1HwN0EO1LKazXgHSAovvfN2dnv4ZVAn+MEvjphENwwE
 kXhHfvPDtzFMt1kacANG1DFTKK9W
X-Google-Smtp-Source: ABdhPJyLIg3eccKezg4f5axysxo4mad1I/De7u6J1LU+oD/g9NIWVf+Zl8ski/Ae57u9v6OoYfDaPA==
X-Received: by 2002:a1c:e188:: with SMTP id y130mr9611614wmg.105.1589406403908; 
 Wed, 13 May 2020 14:46:43 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] powerpc/xmon: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:46 +0100
Message-Id: <20200513214351.2138580-6-emil.l.velikov@gmail.com>
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jiri Slaby <jslaby@suse.com>,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7af840c0fc93..0d8ca5c9f131 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3842,7 +3842,7 @@ static void sysrq_handle_xmon(int key)
 		xmon_init(0);
 }
 
-static struct sysrq_key_op sysrq_xmon_op = {
+static const struct sysrq_key_op sysrq_xmon_op = {
 	.handler =	sysrq_handle_xmon,
 	.help_msg =	"xmon(x)",
 	.action_msg =	"Entering xmon",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
