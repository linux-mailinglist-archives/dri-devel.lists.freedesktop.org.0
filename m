Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9584245D23
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338CA6E48E;
	Mon, 17 Aug 2020 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DE96E425
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 19:30:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f1so12866415wro.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XLquzJ4Zpz4GTbTovMw+SxCIL1JgsFNaSaKJHhRL954=;
 b=kcdFOTXxO6tcXoc/qn0h8QSC7i96hcX9E6mqbvdkkFh4/Ract8XMzLK/Jxzxp79V4J
 l6MD59eS3W5w2E61BeG1GxwFrK/jPrK1Sw0Z3vwGI+8oKnevNVPfVZgm/fquO6aSke8c
 uAoj9Z0Eol/kmopu2Z4UnYudCONS4E2KbbavGv0GejkcswogXOjWtMqnFrGY5pdm12v8
 zGhlpffW9ah0nk/BxxYpwBoP2Pve+lwlrnIO/Fbl1Yi1ylxN3F4YIuAjJeLgevIyQhj/
 lLxszNyq7swn3cIQPXqgEOia8Ed/HVrrnyzexlHhzUKMDmlW1mSkOCiV3zm79AIeXbkC
 dpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XLquzJ4Zpz4GTbTovMw+SxCIL1JgsFNaSaKJHhRL954=;
 b=GoJOF5EZQ2riuWdS8pBtUUyvU7x+3cqchjwzjjXlgUgG9tJZlg0eVKIUuB9PL8PYc4
 Y5XYxL/4czHySJu+ucESG6dJvzRCoUtO7zFDn6uMsJcVslR87MmR0L6QJQ33hRFA4wsR
 kcdpr+mNs6qyyVixCDV+3pCpEaaftW2Kcj5jU0Ut6GfqLTHFU/DDykKFuzV3iNzVS7mN
 7w+cHB3aRFcUEIUQlsVyFQG3CoS2dADDoIf2LsN4mC93Cd4LzlCb23Ktr+CFxifgFQav
 PBiy/jroSGWN/cXwyB8KmYkGQdxDQWRKtX/MZtAluoTXB4+OA8cazDQRyTWLtXw4UB7g
 PaAQ==
X-Gm-Message-State: AOAM533GrECJalb1ubcluYXB3HLPnx79y+E8g3wWUQQmstluQ28w1F3J
 nGk+nqKEMCSUwRIFA0KGU9Y=
X-Google-Smtp-Source: ABdhPJyJcXlT1TRHPVd0k3hl02Itec2AZKk9a03oJxboPilmdcG+9rNBFnVIO6i49mzETlfgGhMnhA==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr11662578wru.211.1597606214107; 
 Sun, 16 Aug 2020 12:30:14 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id b2sm25492527wmj.47.2020.08.16.12.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 12:30:13 -0700 (PDT)
Date: Sun, 16 Aug 2020 22:30:10 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/4] staging: android: Convert BUG to WARN
Message-ID: <3a483158a742a38589c8322e96fc00734da441d9.1597602783.git.tomersamara98@gmail.com>
References: <cover.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597602783.git.tomersamara98@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:43 +0000
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
