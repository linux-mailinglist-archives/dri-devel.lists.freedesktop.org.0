Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6724F2CF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F66EC70;
	Mon, 24 Aug 2020 06:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4523B6E519
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 19:44:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so4941311wrc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+y66MqggCakjVuRG4cFz30VjWieYM9CuDcuOFxkR0Z0=;
 b=afpLZoVb9S8UX5sZ9/41+hXwLGbgiEtiHOm6f0p2P8Oh3Af7Yx/no4zrBKzKnt0F0f
 PPIT2K/9GZAWs+wbhuu+TJwBZ6LEfRYnHvZkTfv64n7pZrcffX0YS/x5cTaijqlkLzZP
 mKJR9PFZG+yGLfMKAMdJc1mackvLjGEjbz/zDBoz0qUeFGlQwPfhnSoiwq8//Z9UlFNn
 O/MvoekqmF7B2xPoXRW2cYPtM3YApr7keQHyrArRZHDI2VQmH060XReevrwNCxSlfr9i
 GY9+091wIX9sfA+wZSOhUMdgB7fs5OKUTLNqWZBlqnGeandc5Snv8rrJU3MZk9+ODRaa
 qQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+y66MqggCakjVuRG4cFz30VjWieYM9CuDcuOFxkR0Z0=;
 b=t6/3nd+GuNTyIK7Qjh7wXfAN903w/53tzCPe3X4pbBeeKl+YiyqRhF0y6opscMmKLI
 LbbFNyfiMjYe+G1YcNKq+bRG+wAA8unpcCYWDrW2/8udDPhyh1c7YhNTNpo5PSSkHxVP
 4VlOpip5lIeaDZgfGFvVcBOeS55q2Z0B+LCrh0Euonb0kuAbM2di6Ta9xWDqZVCgSCQV
 89PUCcQJp4oAIyYXwmAwDgsKRhQllXeLfYFuMfo9b9O6OK2/BDs7TNjjUQMEii+00jhk
 P+DB1qotm7AiCOy3ai+J2aYeBuzIRYdEmJSPBd28oL7v++nxsFoRAJhxml8rAFoT38iE
 zERg==
X-Gm-Message-State: AOAM5313mv2VKZkAIS2FqaipK4oaD8AAs4XEJqlcCBnfi+3glnFBT/y+
 A2LtYlfRk6ARmT2n6T8DF9M=
X-Google-Smtp-Source: ABdhPJwt5n+lLcPAY7wmuVOEPNfgK98a5ZJcSYZj6v5ca19sNHLgGR7JEhitIeLWdduX+y2ESbJtEg==
X-Received: by 2002:a5d:5485:: with SMTP id h5mr3181435wrv.247.1598125442919; 
 Sat, 22 Aug 2020 12:44:02 -0700 (PDT)
Received: from tsnow (IGLD-83-130-62-237.inter.net.il. [83.130.62.237])
 by smtp.gmail.com with ESMTPSA id k7sm3692908wrv.72.2020.08.22.12.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 12:44:02 -0700 (PDT)
Date: Sat, 22 Aug 2020 22:43:50 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 2/2] staging: android: Remove BUG from ion_system_heap.c
Message-ID: <f554a891fb433e830403091e21fe288924c5c74d.1598125227.git.tomersamara98@gmail.com>
References: <cover.1598125227.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1598125227.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Riley Andrews <riandrews@android.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hridya Valsaraju <hridya@google.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove BUG() from ion_sytem_heap.c

this fix the following checkpatch issue:
Avoid crashing the kernel - try using WARN_ON &
recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
index eac0632ab4e8..00d6154aec34 100644
--- a/drivers/staging/android/ion/ion_system_heap.c
+++ b/drivers/staging/android/ion/ion_system_heap.c
@@ -30,7 +30,7 @@ static int order_to_index(unsigned int order)
 	for (i = 0; i < NUM_ORDERS; i++)
 		if (order == orders[i])
 			return i;
-	BUG();
+	/* This is impossible. */
 	return -1;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
