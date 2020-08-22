Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9B24F2C3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027BD6EC65;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E1D6E519
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 19:42:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so4799925wmi.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=/FaXkTTvbwZErSBhMWgpJ+vVSqlKKdjiuZmdcAQZjG8=;
 b=Z1Tpjb1ir9zO7hPN1UUHbgsx9RjpM/Um089u7XrhvHJ5nuVjWwkL3erLU0Y/umi1Wv
 m9kuEJ+CTzhh2Ykd4itN8Vv3tG+vgSTt7BHe5kR7AyGp/X97Bl7i7fP4elG/zRIm2SO8
 EK7ow4uQSyyuZTgIjRMEUraZ9isZ66xQQATQf/OIWQVi9ufyRNRoW3eoI87LwsTOYyuy
 7MFnc1nHZtv7fWM9ANOqah2R2EQsaPABIokBe1evXXY1n2Ne6zS2chDrzbgJYg77w1is
 xkTjUmdDQN9oTEg6M8uCK2lE50/9WgAATtZjRC671HmpF4tuxgRDa2R1NI3tLR8eVJE1
 KQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=/FaXkTTvbwZErSBhMWgpJ+vVSqlKKdjiuZmdcAQZjG8=;
 b=tUZ/u5dfezcJJq41xZRkFhf1s6fTglhxO2DfCWe/XAQU13bAC/a9PLVVCbS08vCtwr
 P1io1FQgLk5NTG+dVTd2K2XHX4I6Z7WXaWawwFcLViiLiHDbIvZe+qI70eHv8dzmvZDK
 I89HBYmEk7UDuzI/E9NmTNaJHuMyY1haqLN+Rk34Y1VU1+0hZq1vhuTUttgMd5D58D4y
 JuTA5vQbJWk5WNP2foWaZl6mOoOdbdUX/Q/QGq44gS3flbACOVuX3/XBT9Z3BnO/xea+
 faITkDFOZUPDOUZsdYAMraM64Rxw/P0ZI5sGk2DgF+bdH4A6racEWeM/fktbcqDKnt/l
 d4Fw==
X-Gm-Message-State: AOAM530fUkModBtf9cUtzLOFEL5qP2IfwRU9USkO4JCNjXq9z45cMOlo
 6ElzypjGxJmKEmLaCbuq2Yw=
X-Google-Smtp-Source: ABdhPJzQZuy38Z0r04hEC3wXtjUTy0THHcyaQC8KBkpYCKawKwMJzppxfAkksADg4SahzODcEl3jSA==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr8409537wmb.164.1598125350015; 
 Sat, 22 Aug 2020 12:42:30 -0700 (PDT)
Received: from tsnow (IGLD-83-130-62-237.inter.net.il. [83.130.62.237])
 by smtp.gmail.com with ESMTPSA id n8sm12931002wra.32.2020.08.22.12.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 12:42:29 -0700 (PDT)
Date: Sat, 22 Aug 2020 22:42:17 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 0/2] staging: android: Remove BUG/BUG_ON
Message-ID: <cover.1598125227.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Remove BUG/BUG_ON from androind/ion

-v5:
	remove WARN_ON from ion_page_pool_free

-v4:
	some changes based on Dan Carpenter review:
	- Remove error check at ion_page_pool_remove (conditions are impossible)
	- Remove error check at opn_page_pool_alloc
	- restore WARN_ON at ion_page_pool_free
	- Remove unnecessary error check at ion_page_pool_shrink
	- Add /* This is impossible. */ comment at order_to_index
	- Remove error handling of order_to_index

-v3:
	remove WARN/WARN_ON as Gerg KH suggests

-v2: 
	add error check to order_to_index callers

Tomer Samara (2):
  staging: android: Remove BUG_ON from ion_page_pool.c
  staging: android: Remove BUG from ion_system_heap.c

 drivers/staging/android/ion/ion_page_pool.c   | 6 ------
 drivers/staging/android/ion/ion_system_heap.c | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
