Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F924E68E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576496E44F;
	Sat, 22 Aug 2020 09:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB8D6E175
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 15:27:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x5so2304871wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=zw/VDtloWxTMBmKSwhrENnZrVtO+U7yJP3Ir4rxEdac=;
 b=QyOQFfUyFM4JBaS8ilL3u52rxZcD+q17wgykSmXsRnmcB4Ssbxj/1tNZgsLv1LYhSz
 HIpEj3W9jBmxD+vFzuyH2swn+FUK2I37JZi16oTSCg8AP7AByhvhWMwCpvCfQx5DBSNL
 evbOBIWMvL21DwF6UrxAQNIqGz6magZk09dU2kRQ8p/XyE6R4lVyyhZ9q3SUaLne7Alm
 f55D6JUfoYDw8fBzAvbIie7LC7sr9CbesYo5kbDrRQKzQLCSLa25ZzzPrak9jS/Pb9fU
 3jAwWpvInnY2ragogDkCfSE2DaHk3u2EqSmZTGR3dsaPo4LUokGwNwq/xZQPVGudteJW
 SKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=zw/VDtloWxTMBmKSwhrENnZrVtO+U7yJP3Ir4rxEdac=;
 b=HPDAFJsHD/k7TlXEuirZiBY/uQFeczJY5MK2aa1NQKmXB1b1N1aOQlMX7EowbY5tT0
 36o0Gj4YHWPr1eJwPY3YuQmOkH3Hh81XrT+vl3r3VafXNrtzv6NexDpqz15T3vDRhorS
 jXHtNyIsQ2h/vgcNtvB5OndFxZDFOGT5p900zKOeZIpC5DE1SicqaRlnRMgAh+Gcxq3R
 36aSa188/TB1KUwHfKf7bGg+VY+xZPkiECu2NGwdA7kJ0JtAP8JtX9kJPuz3YSxZwfOC
 /ZIjD+Ebg4nrTRL90252iwex9ED8EnaJeWWnTF1M74HcpsQqePMo8g86Q8i+0sPCmlqQ
 8vLQ==
X-Gm-Message-State: AOAM532opSkFIvGKECyR9RCS+pUEWbwDGwbqe6r2jAKCcOSIcd2HuPsW
 KTp7qMKkQgfmlKvkauaNHFqmDgUgBQw=
X-Google-Smtp-Source: ABdhPJxhWkhdDX+RnJTqaXlCpDIE7cYQ0ES9HhfiNrQ8TgSgajEZN9A9Ao5fD3ga/NMsjYjfJg7hKA==
X-Received: by 2002:a05:600c:c7:: with SMTP id
 u7mr3881615wmm.135.1598023630998; 
 Fri, 21 Aug 2020 08:27:10 -0700 (PDT)
Received: from tsnow (IGLD-83-130-85-196.inter.net.il. [83.130.85.196])
 by smtp.gmail.com with ESMTPSA id r12sm5451960wmh.46.2020.08.21.08.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 08:27:10 -0700 (PDT)
Date: Fri, 21 Aug 2020 18:27:04 +0300
From: Tomer Samara <tomersamara98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 0/2] staging: android: Remove BUG/BUG_ON from ion
Message-ID: <cover.1598023523.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Remove BUG/BUG_ON from androind/ion


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

 drivers/staging/android/ion/ion_page_pool.c   | 6 +-----
 drivers/staging/android/ion/ion_system_heap.c | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
