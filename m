Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D204F1D2168
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992986EA9B;
	Wed, 13 May 2020 21:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82F66EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j5so1350100wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=;
 b=rr+s2C7s3IetyBx7kdhC2xyGjmSTPhmqZhI5/PZ+FbS/2BORt8LIkjnLxdLspEASX0
 51sn7beVDeEo6rKv1MXsb0gx+hhHXvMtjVkSAXAscD3TvvRmb4hg/48XyNdRmyaAlqrx
 3HEH1yPjKSPvKuMRkSYDf4dG4oo0yAEmb0q6IFfTAFvN/fr9ekuEDG8UWgqUnxKtrxyk
 X17kJ375os2vhxJE6ezApRqMSgh8Yln4Zv5y8sltZTHJZaXqwrQDfpS+FMV1LSjKe/F7
 iymLY764L6GTLbeuBfI7gpkJRtxt42+ogtqXGM7bKsaGZj9xRX2EXol4NY+ywW8xCAON
 YbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXwPehQJdO8W/RRFT9lpEbo/rwg/NqlvrsX9ydy+gUY=;
 b=NHzKfnsVbVpES6s2vQYYuTNlLZZ/NK9X7C50KN75cyboIEJ9Cydu+OdfBkJ+OL7vLb
 K/cwCgAaj8A18iUe1X66da2iIK9E3tUmUnOd4hEZRIFayYMPYjj6IRUBIVghmG0CixDM
 xBHRXkjQ4rt/1lW0cX5TPLXUCWj/GrfKYXQ5Kbig1O56V0QWdMdBHHRKtjw0a/76L7gq
 1YD7oBYVv20itxeSAyxu+ZoPJ/hOcq40+xK+uhCOY1WJNukf58FXtRVsosWpBJgg9nuh
 ol5qV7EEMnwUNfyiDJFkDo9serS1mTIdRHAMDq3PcbfNP2SduTyk3CKVphnvyZ4C1Cik
 oe6w==
X-Gm-Message-State: AOAM530zUIRcGTrXAi5ZIovnvygo5E875SZw1PW5W+1WURmWxiHSfuA+
 ok2q+1wMs7+R2mIAuAjLpSlfSP1y
X-Google-Smtp-Source: ABdhPJw9XZ5u4qa2WDv17qZvd3SOounzZl47xyXJOSldxT3dsYn4CeJEqn0WOiupCTq6uTcy8reIZQ==
X-Received: by 2002:adf:e5c9:: with SMTP id a9mr1683725wrn.292.1589406407182; 
 Wed, 13 May 2020 14:46:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:46 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] kdb: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:49 +0100
Message-Id: <20200513214351.2138580-9-emil.l.velikov@gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 kernel/debug/debug_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..355bea54ca0e 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -920,7 +920,7 @@ static void sysrq_handle_dbg(int key)
 	kgdb_breakpoint();
 }
 
-static struct sysrq_key_op sysrq_dbg_op = {
+static const struct sysrq_key_op sysrq_dbg_op = {
 	.handler	= sysrq_handle_dbg,
 	.help_msg	= "debug(g)",
 	.action_msg	= "DEBUG",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
