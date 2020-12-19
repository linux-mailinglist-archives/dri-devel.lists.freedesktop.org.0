Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1A2DF51D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EAA6E14F;
	Sun, 20 Dec 2020 11:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43A89B0D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 02:50:04 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id m9so3327660ioa.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 18:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=WRrWdLXnVhXMEnkyXGJyYpT7gv4ZpleApkGyNqnGXBQ=;
 b=AJZZkYc+Cb66h4OZcNk2tS4ns5YTzB20DRaEuFlOkVWcbu9I4sjym5685iyZupukK4
 P6xFGO/Q0Mo7JhKoK1BTyk1hVcA/fJUfuiBzraML7qYuPktG4g3xmShSISWY2CuB0Tae
 GrYuwo+BUD9oMCtn9PegeqBK0j7XwPsY/sfEJDBtCdSjv9NXdHi0tAceHetjanATI5mI
 /q4KM8hncFxeHw2nvJ0VN8yTf+KsOWSq7hIJlSHm3IlUUC/r/Yhgm3TXTeqW1Iqts/Uc
 DVI6+zS1k+GwO8HShb4jgID0P6Oa/ygddgCr9GHCCywiFKXQhwhb2ISfaz0pcS6RL8zG
 IIRg==
X-Gm-Message-State: AOAM531mUDcWmOP1dAWz080n4hTQA3PP87sa41rCwx8+4TRnsdmmwfIl
 XSYdumCrQ60cjSMVAdVt6+VM2nhtUKSBawD+tqUG6wvMiv6x
X-Google-Smtp-Source: ABdhPJyqSpVlgYZ7Kv69L7Yr5/7ngYre/wE2XMXivojNJWXyCwLM/npg30emmg9eBU/wh6FL2jvrnSjjBcsAiYvIXyHicYnMMf/J
MIME-Version: 1.0
X-Received: by 2002:a02:9107:: with SMTP id a7mr6642547jag.12.1608346203224;
 Fri, 18 Dec 2020 18:50:03 -0800 (PST)
Date: Fri, 18 Dec 2020 18:50:03 -0800
In-Reply-To: <000000000000f415bd05a047548f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e7f4605b6c84833@google.com>
Subject: Re: kernel BUG at drivers/dma-buf/dma-buf.c:LINE!
From: syzbot <syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, arve@android.com, christian.koenig@amd.com, 
 christian@brauner.io, colin.king@canonical.com, devel@driverdev.osuosl.org, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 hridya@google.com, jbwyatt4@gmail.com, joel@joelfernandes.org, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, m.szyprowski@samsung.com, maco@android.com, 
 masahiroy@kernel.org, peterz@infradead.org, shuah@kernel.org, 
 skhan@linuxfoundation.org, sumit.semwal@linaro.org, surenb@google.com, 
 syzkaller-bugs@googlegroups.com, tkjos@android.com
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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

syzbot suspects this issue was fixed by commit:

commit e722a295cf493388dae474745d30e91e1a2ec549
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu Aug 27 12:36:27 2020 +0000

    staging: ion: remove from the tree

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d4f137500000
start commit:   abb3438d Merge tag 'm68knommu-for-v5.9-rc3' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=978db74cb30aa994
dashboard link: https://syzkaller.appspot.com/bug?extid=d6734079f30f7fc39021
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17428596900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: staging: ion: remove from the tree

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
