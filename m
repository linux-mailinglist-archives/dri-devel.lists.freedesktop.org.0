Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77B6245D3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D586E511;
	Mon, 17 Aug 2020 07:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9289F2D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 18:40:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so12793086wrw.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=GMPBK8NnXSwBg3pxRK5LStqyUM6u/9HiM5fcS5/2YLM=;
 b=qn1tYUlMkD1N+dqWYlL9N71yUtVYbRD55m5C/8A8+k8xvwwsoRCXCFNfQgK2TFZm7C
 FsjsKSxhVnBI/ADmrdVk76KsNambeKhwe1dwmN1KulSYpo1bTPmy+cmVz74v+tnuNz2J
 Hwxj3D6mHqbEkmUKIe27kDqgSwKu4lWmejqtZ4ZFjSGxqP1yyZv+pkVJBcEAcdJ6wW7I
 dcsoXMx1HxyD1nNGMfnDFlRu0z4wZML5YrAbZd3wrVB5y2NqFFTzJWlMTyGE/p6gFg1B
 UFHE355ORj0RqYwaVm2wbYdbdt+JhUGH+Q5eIFURqNwJeSCM9+2VWZKrJU8GoFsxP+o/
 3Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=GMPBK8NnXSwBg3pxRK5LStqyUM6u/9HiM5fcS5/2YLM=;
 b=uYgggOV2wEN5nC9jFmqPjPXAiglo4DpWoGcPbhVS4RIbHZxeRQxEh98Pi6SbMHsYWB
 feImjh1GlnXgtojFRgPN8KTsFAEC8DXCZmpyDvKcDSi3BSGhc/BQ6JX2K2shBi8sBRlJ
 RsfHkH8w0lVFVHtTeX5+O0qHln9HwZpdHgACzFOsg520ZpZfleN0pGhlIqV1/rWeZGMP
 5cEcKJGn+dLXMk5cWcBdg1+DR6mjPzWXqcYf6+IhMgSVxjz410eacWdVCmIIuhS2LZsV
 4cN+jH8ZCzVAavAYk8F/bSNe/3fSWfcU54CeDtryeTtcRhYYqisNqETC6ZK0XQagxP6x
 hihA==
X-Gm-Message-State: AOAM5321LwI4h1VLd0sEBVoQge09VG2NQjEgbC+EsYyUsrfWNJat/EJk
 yNSF8TwXJfzf2cWQCVOrbR4=
X-Google-Smtp-Source: ABdhPJwedwjz3znts+4tP79UkI2LDgWwjkT5I6NMg5cOaR9plyiIwz32l67j6k2yqGPK9TPrZn1PJg==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr12305018wrv.280.1597603238417; 
 Sun, 16 Aug 2020 11:40:38 -0700 (PDT)
Received: from tsnow ([94.159.146.190])
 by smtp.gmail.com with ESMTPSA id w64sm29735632wmb.26.2020.08.16.11.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 11:40:37 -0700 (PDT)
Date: Sun, 16 Aug 2020 21:40:33 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/4] Replace BUG/BUG_ON to WARN/WARN_ON
Message-ID: <cover.1597602783.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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


This series convert BUGs/BUG_ONs to WARNs/WARN_ONs

Tomer Samara (4):
  staging: android: Replace BUG_ON with WARN_ON
  staging: android: Add error handling to ion_page_pool_shrink
  staging: android: Convert BUG to WARN
  staging: android: Add error handling to order_to_index callers

 drivers/staging/android/ion/ion_page_pool.c   | 14 ++++++++++----
 drivers/staging/android/ion/ion_system_heap.c | 16 +++++++++++++---
 2 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
