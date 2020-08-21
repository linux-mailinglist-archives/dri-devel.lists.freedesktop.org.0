Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F424E688
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826926E461;
	Sat, 22 Aug 2020 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D0A6E175
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:28:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so2237916wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+y66MqggCakjVuRG4cFz30VjWieYM9CuDcuOFxkR0Z0=;
 b=XrqNGUmj2d6Xu6Kb6GMB3M6jmXO1rzxI9r2vGH/mlHjReZ/EU9RkaCjmwICLzWY4Gn
 TGX8IBv6+v8eYu5rSay0806nirzMq65EzeJd6NOkbwQbwSEiQFJy8wdhquSBc4YOfmUG
 p5s1Bzs56kl0dmEPlRi1W31V8SFMxK3pzTUz2D6boIA6gDo8i1/ZZgcjkvirtaMc+lJ5
 UDWeWSgwgYyOdUACy2ozcc/Iz83Ln4ITtmcCsk/xqOjAcwFXWIiCIgjVAxfygoZs1p0z
 gKl3GsxfxpaqAYLtGx3HWCsRKVXuJHaNRjzlKM+z/lvf1aseKPg6eUs2uPFuZ5fcGSSB
 4/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+y66MqggCakjVuRG4cFz30VjWieYM9CuDcuOFxkR0Z0=;
 b=RLNRo8RNQvzAaxV53a/X452CxUYL4siWlTgTok80ArSh1mqjKWCRQjuPcS/EdqBGFy
 ZKeXgV1g4b7j5dknqCV1gJhWnIZo+6zrdNngnDNM5xIncm6pZqMWY4XuwNC7zZynx5Uy
 QMa+KXkZr7T1zdOMNMb1JdqjrdTJR3fsQqFxJVljjN8c9Q9TNQKsz7miPHq/Q9cLXz37
 SCObN/DcqmxBW/a69Xh8KMdrAh7lT1hJNL/hsS9kLp11wFjoRnPUyEwLqHZH3epyQv/8
 ztPPpQNS+8HGMh2mGFrxaGMX49ep5FEILSE4CGS/iunaklN+FxUF+h4cLBQc46U/mYf8
 VEQQ==
X-Gm-Message-State: AOAM533QR4kw4+GUshhEIUqWuBxqL3v3DTxHl6lA6/YPiV3wu08H1/H0
 2brBIXNsDS1CnSv79kluZIo=
X-Google-Smtp-Source: ABdhPJzsj3Ldq5q3T34rHmzgtlQJTbTH7AApriawiIsBCRv3S499thDPeosIx/PU22cuIXSKmQim4Q==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr4278996wmb.63.1598023697023; 
 Fri, 21 Aug 2020 08:28:17 -0700 (PDT)
Received: from tsnow (IGLD-83-130-85-196.inter.net.il. [83.130.85.196])
 by smtp.gmail.com with ESMTPSA id w132sm6418009wma.32.2020.08.21.08.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:28:16 -0700 (PDT)
Date: Fri, 21 Aug 2020 18:28:10 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 2/2] staging: android: Remove BUG from ion_system_heap.c
Message-ID: <a39407f84031eaeed5e65a7aab515a079edf5fcc.1598023524.git.tomersamara98@gmail.com>
References: <cover.1598023523.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1598023523.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
