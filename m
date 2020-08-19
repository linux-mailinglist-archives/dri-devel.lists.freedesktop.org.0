Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3E24AFFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E222A6E91D;
	Thu, 20 Aug 2020 07:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB456E560
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:38:08 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id a26so27714118ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=doOVIJAl8aLbOgFBDKcIqb/ccFDrxWvGVJaNvG3le54=;
 b=Tcdqs2SGsYZ0JWSHaz3cq9atV1buOc/Z3S7+pouyoYfnhhaFd5rMUYsopHHjbbwUPj
 0G3UxSPWgoPBo4+bz5IXvoJGkZiYOo71TMJJWsTbtEWp63hs6rFIlKtiCcjKF9DhC2uH
 t2EXW/ivJ/6qFfVYyvp372hQX0ykJz4IozOHLKWzIgq+/cLJAbN8f9pbppPlS0J15HaC
 rNkuZW7zBnNy/Kbqu+t85E7PfPRSoxM3v4ImEoksBxKsyjP3MhSwWvRh35F7/T2WMDbY
 jPh5sAmKTwd2HF4dum2Yj3HjwqOKn39sD+61lwjQCKj0+tsJujkvYq4BWcqSgdH2KjaE
 J8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=doOVIJAl8aLbOgFBDKcIqb/ccFDrxWvGVJaNvG3le54=;
 b=keMVktqUeBI4ez5IqIXG3ph5jUPVkXHkXW44h7oTaMyNAUcAorVoAfwl4uDF8eyvhH
 PST8QiEFAq/rrvssrZbDkAGx2MiTcHgAkV5wJqrpp2TiItbmPP1drA0c6+fL0pDfQCuP
 TP1UI01olsPsKOQq/b4CH1ZYqaTdyua6Bkv6f6POYhdGmD2UcE6+PFE/gQdd/4GfbWsZ
 D6o8RPkJ8uhxL8ZmLJ3TVHx6OPDFNrffydU9aYNXpL7vBynX78hRozo5lJ/h34PeQsH0
 YitRE+NX3hSlcYo+li9EyHvdRdu9e193VHGdaN6FF4005ZKf4cxMmqMk+Z5K7M8ET0cr
 dMTg==
X-Gm-Message-State: AOAM532LTAKvEEjt5XPOGLFEENp1xKRODqFzR3gcz5HvTizga9i3LqEP
 doVTAQMHbk10NNn2vIJTN9c=
X-Google-Smtp-Source: ABdhPJxmx3IkW3gTtNbDIal0hKTHsYWoX6DaIFrxkZ9x+FUQvRGrfHzoGsS6nFJi9uayR13xyljY6A==
X-Received: by 2002:a17:906:d054:: with SMTP id
 bo20mr28105958ejb.9.1597865887048; 
 Wed, 19 Aug 2020 12:38:07 -0700 (PDT)
Received: from tsnow (IGLD-83-130-68-114.inter.net.il. [83.130.68.114])
 by smtp.gmail.com with ESMTPSA id hk14sm19573503ejb.88.2020.08.19.12.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:38:06 -0700 (PDT)
Date: Wed, 19 Aug 2020 22:37:58 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 0/2] staging: android: Remove BUG/BUG_ONs
Message-ID: <cover.1597865771.git.tomersamara98@gmail.com>
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

Remove BUG/BUG_ONs from androind/ion allocator and add error handling to
calling functions

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
