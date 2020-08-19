Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8624AFF1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90B6E90A;
	Thu, 20 Aug 2020 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EB96E802
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:34:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m20so19077276eds.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=IBIAq/aRalQqzRlQ/lTXnrrK/pEn1oTsWEQW2pLJvVY=;
 b=It2/zMJhpbNifDeupP5coNvZtaSNVOZRoWJGfjQgSuBzlPVSMNl4Q1ow7pWpVWh96+
 jOejtEagAblDa/AFoA/tK2luH611bwiDz8BYFsz2MPs3qiF654Q1AR0F1lFfpmK1+Mfh
 UEjAyGgd3AWoMdjJRRyXMSzoUpFvz2FrUddK65BN+WJz2nXHMv9YEiy5/6yoPr9eHaHt
 W9KdVlcdY/1C/4cwT9QrxU9rxjFLgHV6z5utZl6GHNUGd3hyZ33VEcrW9iBP9S91kkqH
 tjeGmmxoT6gwy9Tv0GLQzIKvJDoL7OCSlaEqximGXwWYsmBg8zRGKZeiRZzn5VDBOZSN
 r8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=IBIAq/aRalQqzRlQ/lTXnrrK/pEn1oTsWEQW2pLJvVY=;
 b=E3ApJWh6vamNBSFlH0aXqRZuEcjRpLnmkDoQIIg3VK9sxS5yHk9d1L3zhLSebNsu1r
 buwjhL6O1n+NCGEijw+wrtcc/jGvbmrgItkXOrbEwP5TCbcV1rG9gZ8yzyujV0GMQvKT
 9xEUfLZx+TqLo937Sz3/RW1ZH5jKAj7kcvu2nzovEc77gULomCV8QlURfymj65GX/iRA
 LSEzo41f/ZHRPYf184cYvWW4KQ5bUzkJSVOxRk/jMPRAG6VXyzFcrQHhOGBPuGMPuQfS
 NJxSwQApQUG6cRTHiBqvhcUX2KgSs73GUXDPEVLlDzqSaWR/xw2ab8FIjduHUguIQmDg
 isbg==
X-Gm-Message-State: AOAM532iVrd54s2/cl+/V4nAlSgUXCCc9s/d2QP3RY6kcymS1Q1hDscu
 Z3NyL2PQ8ciO7WavwukGiw8=
X-Google-Smtp-Source: ABdhPJx2cuOSho44M0UYvQyss6pr9d/vxjK+w6u+ICzKOppEkPxELogJ467lERx1j0FL2Fuc8HNNFA==
X-Received: by 2002:a05:6402:28f:: with SMTP id
 l15mr26430494edv.233.1597865688290; 
 Wed, 19 Aug 2020 12:34:48 -0700 (PDT)
Received: from tsnow (IGLD-83-130-68-114.inter.net.il. [83.130.68.114])
 by smtp.gmail.com with ESMTPSA id e14sm18640165edl.86.2020.08.19.12.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:34:47 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:34:43 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/2] staging: android: Remove BUG/BUG_ON from ion
Message-ID: <cover.1597865295.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Removeing BUG/BUG_ON from androind/ion and add error handle to calling
functions

Tomer Samara (2):
  staging: android: Remove BUG_ON from ion_page_pool.c
  staging: android: Remove BUG from ion_system_heap.c

 drivers/staging/android/ion/ion_page_pool.c   | 14 ++++++++++----
 drivers/staging/android/ion/ion_system_heap.c | 15 ++++++++++++---
 2 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
