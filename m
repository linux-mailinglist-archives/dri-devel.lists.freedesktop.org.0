Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE32DF51C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B26E154;
	Sun, 20 Dec 2020 11:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F20489D56
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 09:41:59 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id y15so3202619qtv.5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 01:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jKNJRmx0eYAUpZpwCq5ZV9sDDOhriznJbXCWXkD9bEo=;
 b=P5yYUtVR6rdJTBAzxze64I+pP1/TkTJKW9DPb0BLE+FKPx/D2v58xhqnyxjp9wf+nX
 YOsuojepOAhUHQorncAuc7x+GEFTOqHsQkRoggcETESTLj8nCBbrZB78HwRi/Lb9oo3Z
 Nkf2KPRmsvnJv5VC4rloVWAAX4Gd87FSiX7j7TISJ2tMgtLzGvEDsvIX/O+G5hKf8DpG
 rlBDS9rzg8YxTl8UX4d7KdFDQHa7NaPUqSPUhLBLIpSRAmZyXdcYkZUyRz/Flqvdqnz+
 q9XeWXxgZIf+d6blm0egJnQeH8bDQwBwpAlbLZZzm38v0H/81ujYtNclWps8Mwqq0U6W
 etNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jKNJRmx0eYAUpZpwCq5ZV9sDDOhriznJbXCWXkD9bEo=;
 b=t3inUG8gvbuTkTboRp0tn9ATcxrDM2ibXw2mkD4d0ZMUKJX3TfFo7K3czT/na6f4bk
 Nk34QpknlgLqIgYWcJsPy+rk6jqa9QglqM0JlVN0IqMzHJ/pWh28epVQJUQwLXlNgABn
 gvOvjGhJ1p7xSaqA8fGJtsi3Czv/J2lEjDJ6SgGsMcJ9g9wLACh/8xL8dqpUAc7bahEB
 0oSzP4p3aZl5C19KXsSPrDTzw4/eO5HG+b9F3JNrBv+DLIBGcW/GMEhtMXmaqyBT2uXZ
 oQlgjjGMrTSJ6wg3zlsw1wR79+CFw7u/qIvhGGjAORRykh5wU+d/5/YYfZaKid25TRNn
 amlQ==
X-Gm-Message-State: AOAM530ZjI6KWHb3jfH9M7cpWAwMvI+ZPkPz+mQRkL0Edwc81IYic1XS
 bV5bf7Ji8Abo3pOaCDy/Sq8R65CXE4vVtbSKcL5tjQ==
X-Google-Smtp-Source: ABdhPJyeTNXDinqht80iLQ/jsytyx9IA/MtM78gFuYdt2jUWCeXu1VsZqbeDy9OJTs6GESOiOdQzvK7OWzUI2E+Y/OA=
X-Received: by 2002:aed:208f:: with SMTP id 15mr7786546qtb.290.1608370918325; 
 Sat, 19 Dec 2020 01:41:58 -0800 (PST)
MIME-Version: 1.0
References: <000000000000f415bd05a047548f@google.com>
 <0000000000001e7f4605b6c84833@google.com>
In-Reply-To: <0000000000001e7f4605b6c84833@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 19 Dec 2020 10:41:46 +0100
Message-ID: <CACT4Y+bqBib4Sb=5keBayTybKXpi3kXgF7+uAsnZjBGfpHr04g@mail.gmail.com>
Subject: Re: kernel BUG at drivers/dma-buf/dma-buf.c:LINE!
To: syzbot <syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com>
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
Cc: jbwyatt4@gmail.com, linaro-mm-sig-owner@lists.linaro.org,
 Peter Zijlstra <peterz@infradead.org>, DRI <dri-devel@lists.freedesktop.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 m.szyprowski@samsung.com,
 "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
 Suren Baghdasaryan <surenb@google.com>, masahiroy@kernel.org,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linaro-mm-sig@lists.linaro.org, Shuah Khan <skhan@linuxfoundation.org>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Colin King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 19, 2020 at 3:50 AM syzbot
<syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit e722a295cf493388dae474745d30e91e1a2ec549
> Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Date:   Thu Aug 27 12:36:27 2020 +0000
>
>     staging: ion: remove from the tree
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d4f137500000
> start commit:   abb3438d Merge tag 'm68knommu-for-v5.9-rc3' of git://git.k..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=978db74cb30aa994
> dashboard link: https://syzkaller.appspot.com/bug?extid=d6734079f30f7fc39021
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17428596900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: staging: ion: remove from the tree
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

The reproducer opens /dev/ion

#syz fix: staging: ion: remove from the tree
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
