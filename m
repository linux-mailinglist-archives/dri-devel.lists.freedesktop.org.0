Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0716C174627
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A750F6E2DC;
	Sat, 29 Feb 2020 10:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8EB6EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 08:02:12 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id z79so2564948ilf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 00:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=1F6QPB2AKxQKkbwngYuex+ythgWDXEu9f8wBzkprX/k=;
 b=iQyO4EI+AJQ7wkasbTzbUanwr4cLA3xiAQVOHBg7IGTxITK/VK6xPG/rkA2MnZbdbv
 ReS9taH0N/lkkbA1ok8dIr8cu4fH7rIqk/kyOgfQqWmePC+eTiEQGPSteehVziiwnZXH
 +VmaDHYF69DoOnwZCeRdyoG2C/YBrOGxnfvrhj3zQ+Zg10EUT2DFPSUGljlHsUYhROTI
 WkYPGYJuP+ayqZCqbL0E8wnd58kTG0psOchnKa2D5O97tW8q5k4+Z1gpHHCWVufVVS9a
 m1OoeyMikJAPvnuwqXFcSirz+7lsqB0SagVdAMRD/Ds8UoEQaNKuTWmbcNWoOdQY8k+R
 uygA==
X-Gm-Message-State: APjAAAXULWIBzbLHFHaWmoGTGUcizqr0MXirsNjSHtsN0o7yxGyh/G2r
 /KtI392ByLB1dUQVZAvphJ6E2QVfJt/6uBZXw7/2cvUi2nxB
X-Google-Smtp-Source: APXvYqxZ9gEkMkdQklGzMnNVCnk+p9vHrNJcx3ZgSr4fyoEdO9KrfufCKBEV6C7rY7YOdZ1PYafI/aStyzaxESHVe4uOP8/zThGl
MIME-Version: 1.0
X-Received: by 2002:a02:9988:: with SMTP id a8mr2420608jal.33.1582876931843;
 Fri, 28 Feb 2020 00:02:11 -0800 (PST)
Date: Fri, 28 Feb 2020 00:02:11 -0800
In-Reply-To: <00000000000080f1d305988bb8ba@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003eeb63059f9e41d2@google.com>
Subject: Re: BUG: unable to handle kernel paging request in
 ion_heap_clear_pages
From: syzbot <syzbot+be6ccf3081ce8afd1b56@syzkaller.appspotmail.com>
To: arve@android.com, christian@brauner.io, devel@driverdev.osuosl.org, 
 dja@axtens.net, dri-devel@lists.freedesktop.org, dvyukov@google.com, 
 gregkh@linuxfoundation.org, joel@joelfernandes.org, 
 kasan-dev@googlegroups.com, labbott@redhat.com, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, maco@android.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tkjos@android.com
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bug is marked as fixed by commit:
kasan: support vmalloc backing of vm_map_ram()
But I can't find it in any tested tree for more than 90 days.
Is it a correct commit? Please update it by replying:
#syz fix: exact-commit-title
Until then the bug is still considered open and
new crashes with the same signature are ignored.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
