Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE8245D59
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182B06E519;
	Mon, 17 Aug 2020 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDFE89229
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 17:22:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p20so12677935wrf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XLquzJ4Zpz4GTbTovMw+SxCIL1JgsFNaSaKJHhRL954=;
 b=dra6Xs1FfI0Lb1mG/3mE38cZQ8j4WyS/0LX3/RQ3O+LfuIo1ev7JuXgB6aZbK7gCCF
 ZD+sVZVwOBVyfS9gYnU0ZHRITB9XSOBELQ8CUdgsHKGx75ZrFnwdlt3rIn2BhfIT0z1S
 nU2YHVsyUREph4Hp23fZbuxQVuw0FVjp2BvOLrz8Fd/bO3Tp/eW6IIXO0FVGZf660Fni
 LolLmA7SQCB9pRRtBnmp6/Bf+NVCHGisnh+/A0HG8J1aAlhr4HcTx4D6tGOO2dPIUeM3
 QDj2GiFpeRn1NGYDJN2/kLH1OYRmCi9csKf5xIv4rUQbSBOsYYJOe9FyM8SJlrYj2WTd
 VgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XLquzJ4Zpz4GTbTovMw+SxCIL1JgsFNaSaKJHhRL954=;
 b=S78zVkL/SuT8hRtGxfKUwg6OTrlcfSJHxWOkVdNLLHX/afzkyLfKwPRN2Kl8LBvdUh
 Ud5+IJT4571rYAKxb9omdhE5g6dlhJxPhOM6jbrYrZN9C19FCXyzT2HxdPLCXuKJ6mod
 fdEJOYk6KIYZUk9DqApt3RdcF3C0YAI6EimwjrHqtUq14vBsmgM5QvMsrEkX/bnNKZnh
 BeI3l5d+tfIiojKlTUJH1lda0OkpJAVnj//EwJUvUVPF9UZHou7ez1wEAaxwlO8pHbY0
 e99YBG5bhDQ1GDE447nUIszm5FFwza0u21s3rJtgph83WBxVbOY6uZg7RdUFTV6b4fEv
 zEmw==
X-Gm-Message-State: AOAM533YrNyHBJmlpvf/AU/XNYzS63KnkUvmhAJwIvvMg+WjRJmLik+0
 DR7Jw1gOehmG8m/1QMBD7rU=
X-Google-Smtp-Source: ABdhPJxR11i5f+Cs3K/ILM8AxeiIikHgTcvQ0euuo39kYeEg/xSCd7R/0LV7+ANNg/+PE9OC3o6s/A==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr11842768wrt.191.1597598565525; 
 Sun, 16 Aug 2020 10:22:45 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id y142sm28540563wmd.3.2020.08.16.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 10:22:45 -0700 (PDT)
Date: Sun, 16 Aug 2020 20:22:41 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/3] staging: androind: Convert BUG() to WARN()
Message-ID: <8df6206000524d4a0043a7a1df97b2be2d277995.1597597955.git.tomersamara98@gmail.com>
References: <cover.1597597955.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597597955.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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

replace BUG() with WARN() at ion_sytem_heap.c, this
fix the following checkpatch issue:
Avoid crashing the kernel - try using WARN_ON &
recovery code ratherthan BUG() or BUG_ON().

Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
---
 drivers/staging/android/ion/ion_system_heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
index eac0632ab4e8..37065a59ca69 100644
--- a/drivers/staging/android/ion/ion_system_heap.c
+++ b/drivers/staging/android/ion/ion_system_heap.c
@@ -30,7 +30,8 @@ static int order_to_index(unsigned int order)
 	for (i = 0; i < NUM_ORDERS; i++)
 		if (order == orders[i])
 			return i;
-	BUG();
+
+	WARN(1, "%s: Did not found index to order %d", __FUNCTION__, order);
 	return -1;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
