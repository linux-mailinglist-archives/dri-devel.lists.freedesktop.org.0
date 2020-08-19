Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99DF24AFE2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDCD6E901;
	Thu, 20 Aug 2020 07:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EAE6E560
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:39:43 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so19089402edx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yd7EYvVEuvXaQQnlQebjKHZTDtyygSQlPm6fYa8dX0c=;
 b=NH7adRKAPFPqZPXCowY/ar3Ei1f5iH0HB+od9dTrfZ2Q2zUAIfVlraBF/Fxwux/zc7
 Qesy8hn2qkE3lri4hKI8j3wtgYeFKwxVac52bl2h2WmvlLmA74QcWLk1orOx4vde9Tn2
 0IPJN7vNLSBr2JIbZ40KjUcC8mErBK/GR13YjOlhouPHETMFWv/cniY/UWH1St5nVFrw
 YVFgyD0G4Kwdpdje0udHuHg043j6p3aVp+WSUnL9erAxPMF+C3LByIAooTqKVFX4UFuL
 SiojRV6UrVcFkdC3LxawWpCpkiijD6Ej5VBcYpJjIgCt8UXcGZZzmTxm5KXQ3c95LNCU
 563Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yd7EYvVEuvXaQQnlQebjKHZTDtyygSQlPm6fYa8dX0c=;
 b=BoPRHSD1tgedJv78xuXZInV8RL1+IaaOSY5Wyg9ahw+6FAz5XJMR9MBW5DRL4COw2p
 g6CZAE2k01nqupM7hIJYvJNlabB1AMFRlyBQApO2S9QkqJY8sX3U/GUBsWqsYL/kp1aQ
 DwOMmFZETDf9caHDsT2Wz9XZ3GUZPIuUuIBYnWksr4yXUB8yu9Dq1Po1GWTchp7P2xSi
 beBVlh0y+UB0TIB6klX/V5ivxbEPb4xbD7qQQRyCXpTOzhHBZHLOEJ+DuAFU9LiFw1cb
 ajUyAa982ykk/gORFklhpHndgffLCJkntZlSjwccK78aAr3KGIc+5AcBl0PnPWZvcZri
 qK+A==
X-Gm-Message-State: AOAM531bjnI0t+IOKezYcSLiuncloXy27ovQRw1ycwMD2+S7aKrZ1uSk
 A+QhriCoGOrdOFUQ+yfn9eA=
X-Google-Smtp-Source: ABdhPJzRnOQW8YcxGuz4rNEnMK/i4+CphrpkfHFQ/9AogKnkfRQdSdNfeYjk6Gsj1pC+dzZxDPkFaw==
X-Received: by 2002:a05:6402:1443:: with SMTP id
 d3mr27266551edx.40.1597865981745; 
 Wed, 19 Aug 2020 12:39:41 -0700 (PDT)
Received: from tsnow (IGLD-83-130-68-114.inter.net.il. [83.130.68.114])
 by smtp.gmail.com with ESMTPSA id a19sm18231355edv.49.2020.08.19.12.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:39:41 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:39:34 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 2/2] staging: android: Remove BUG from ion_system_heap.c
Message-ID: <39222c3a041708c41ab3bc1be855ac83912ee07b.1597865771.git.tomersamara98@gmail.com>
References: <cover.1597865771.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597865771.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

Remove BUG()  at ion_sytem_heap.c and error handling to:
 - free_buffer_page
 - alloc_buffer_page
this fix the following checkpatch issue:
Avoid crashing the kernel - try using WARN_ON &
recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_system_heap.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
index eac0632ab4e8..56d53268b82c 100644
--- a/drivers/staging/android/ion/ion_system_heap.c
+++ b/drivers/staging/android/ion/ion_system_heap.c
@@ -30,7 +30,7 @@ static int order_to_index(unsigned int order)
 	for (i = 0; i < NUM_ORDERS; i++)
 		if (order == orders[i])
 			return i;
-	BUG();
+
 	return -1;
 }
 
@@ -48,8 +48,13 @@ static struct page *alloc_buffer_page(struct ion_system_heap *heap,
 				      struct ion_buffer *buffer,
 				      unsigned long order)
 {
-	struct ion_page_pool *pool = heap->pools[order_to_index(order)];
+	struct ion_page_pool *pool;
+	int index = order_to_index(order);
 
+	if (index < 0)
+		return NULL;
+
+	pool = heap->pools[index];
 	return ion_page_pool_alloc(pool);
 }
 
@@ -58,6 +63,7 @@ static void free_buffer_page(struct ion_system_heap *heap,
 {
 	struct ion_page_pool *pool;
 	unsigned int order = compound_order(page);
+	int index;
 
 	/* go to system */
 	if (buffer->private_flags & ION_PRIV_FLAG_SHRINKER_FREE) {
@@ -65,8 +71,11 @@ static void free_buffer_page(struct ion_system_heap *heap,
 		return;
 	}
 
-	pool = heap->pools[order_to_index(order)];
+	index = order_to_index(order);
+	if (index < 0)
+		return;
 
+	pool = heap->pools[index];
 	ion_page_pool_free(pool, page);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
