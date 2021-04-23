Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8AD36922C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D266E219;
	Fri, 23 Apr 2021 12:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F636E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 11:58:51 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id s5so40507007qkj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to;
 bh=jr8jZmW3hWeOFIHhOThCMqo1kOiVcgfycAvoHOOzfOs=;
 b=jd2ZSHi+A82UPBSdJfxVNxKNDia794DDn9zlNQU4hMLaZTLJtq8kDI7dtMRgqBYM4v
 sFMWrsBHoMwWEekSxMNVKC0ZGrd1RLEMp3tNmq6eoRQFrhY35ZenFAr0F12sqngope9P
 Ox0oOl7Mw1AClWBQfR2fhdjwEGTejjbmULWAPVxomQ/QW5YRNIRqRmhEOKsOyt8F9yQq
 7arRaaJL8heG7ppTQgH24gTUvJlHZenYrA8zFou0xpnZkHi2nHFUlqTSRdqemKzQ2Cfy
 2c0g2HrEuzGUlQAYRkUrEfJ5E5vtDvBvf+QjGl3tbl/v47JesPHeeGiklCM3u9ZTIzKK
 DO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
 bh=jr8jZmW3hWeOFIHhOThCMqo1kOiVcgfycAvoHOOzfOs=;
 b=YFRJFWbILYR2NIKqgOCFb+K3oK1i59lkJjIhC/NSqJeL4f0d6jrxGJGqlmNeZ/iTFp
 1Rfrugm/YpiK7fUn2LbSTNU19jhgqh2gR3QZ35ozHLpSY8o3T9KYAD02qIhslOQ+twvW
 JZagosxye20nwjzH+Z704TJP68P+T71a37OJ8a5TpgkYDl8HdEmA2XR7gGZz9ugKRo8x
 McsDBsBWi/fnvj6K590EmoMMHNQSosfApCzF80q6A4ZKUxrytX7c6I6CDcb8NIZMqH2n
 kSIlAnALaQYmOZSOeshdNkIUhlXaORnP9VyYSymL2SHLg+atvBw6r6z/8QhJPxHt6iHW
 kuyg==
X-Gm-Message-State: AOAM533fsL5ymIkHeF9FxkwKCntw1hhSfbJbctR+nVoMJNz/Rlbvlnly
 Jb6ImJC7BFp+zrGmYJoljS2VfBye33z8vjIe
X-Google-Smtp-Source: ABdhPJwIKsBII5Mtzj9rNgDFZg210QHOEB7Bb5GDiLFcDbvCTj0HpRfMqPJBVcGARORQcdzTvopPaw==
X-Received: by 2002:a05:620a:4143:: with SMTP id
 k3mr3539992qko.497.1619179130373; 
 Fri, 23 Apr 2021 04:58:50 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
 [209.85.219.51])
 by smtp.gmail.com with ESMTPSA id r5sm4057411qtp.75.2021.04.23.04.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 04:58:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f51.google.com with SMTP id d1so12021168qvy.11;
 Fri, 23 Apr 2021 04:58:49 -0700 (PDT)
X-Received: by 2002:a0c:c352:: with SMTP id j18mr4237446qvi.12.1619179129716; 
 Fri, 23 Apr 2021 04:58:49 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Apr 2021 08:58:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
Message-ID: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
Subject: i.MX53 error during GPU use
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 23 Apr 2021 12:32:45 +0000
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

Hello all,

We found this error when using Freedreno driver on an i.MX53 device
with Wayland. Any idea how to fix this?

[   32.414110] [drm:msm_ioctl_gem_submit] *ERROR* invalid cmdstream size: 0
[   39.177075]
[   39.178617] ======================================================
[   39.184804] WARNING: possible circular locking dependency detected
[   39.190997] 5.10.31+g7ae1de1d2bd3 #1 Not tainted
[   39.195619] ------------------------------------------------------
[   39.201805] kworker/u2:1/68 is trying to acquire lock:
[   39.206953] c2b952fc (reservation_ww_class_mutex){+.+.}-{3:3}, at:
dma_buf_detach+0xd0/0x1e0
[   39.215448]
[   39.215448] but task is already holding lock:
[   39.221286] c2b957b0 (&msm_obj->lock){+.+.}-{3:3}, at:
msm_gem_free_work+0x118/0x1b0
[   39.229062]
[   39.229062] which lock already depends on the new lock.
[   39.229062]
[   39.237243]
[   39.237243] the existing dependency chain (in reverse order) is:
[   39.244729]
[   39.244729] -> #1 (&msm_obj->lock){+.+.}-{3:3}:
[   39.250769]        mutex_lock_nested+0x1c/0x24
[   39.255220]        msm_gem_get_and_pin_iova_range+0x38/0x170
[   39.260885]        msm_gem_get_and_pin_iova+0x24/0x2c
[   39.265946]        msm_ioctl_gem_submit+0x12c0/0x1964
[   39.271008]        drm_ioctl+0x1f0/0x3e0
[   39.274940]        sys_ioctl+0x3bc/0xbe0
[   39.278873]        ret_fast_syscall+0x0/0x28
[   39.283150]        0xbed4deac
[   39.286122]
[   39.286122] -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   39.293208]        lock_acquire+0x134/0x560
[   39.297398]        __ww_mutex_lock.constprop.0+0xbc/0x1124
[   39.302889]        ww_mutex_lock+0x68/0xb4
[   39.306993]        dma_buf_detach+0xd0/0x1e0
[   39.311271]        drm_prime_gem_destroy+0x2c/0x38
[   39.316068]        msm_gem_free_work+0xa0/0x1b0
[   39.320611]        process_one_work+0x2a8/0x7ec
[   39.325149]        worker_thread+0x4c/0x554
[   39.329339]        kthread+0x140/0x154
[   39.333095]        ret_from_fork+0x14/0x20
[   39.337196]        0x0
[   39.339560]
[   39.339560] other info that might help us debug this:
[   39.339560]
[   39.347568]  Possible unsafe locking scenario:
[   39.347568]
[   39.353491]        CPU0                    CPU1
[   39.358025]        ----                    ----
[   39.362557]   lock(&msm_obj->lock);
[   39.366061]                                lock(reservation_ww_class_mutex);
[   39.373123]                                lock(&msm_obj->lock);
[   39.379143]   lock(reservation_ww_class_mutex);
[   39.383689]
[   39.383689]  *** DEADLOCK ***
[   39.383689]
[   39.389614] 4 locks held by kworker/u2:1/68:
[   39.393888]  #0: c24138a8 ((wq_completion)msm){+.+.}-{0:0}, at:
process_one_work+0x1f4/0x7ec
[   39.402362]  #1: c26a1f20
((work_completion)(&priv->free_work)){+.+.}-{0:0}, at:
process_one_work+0x1f4/0x7ec
[   39.412312]  #2: c24188a4 (&dev->struct_mutex){+.+.}-{3:3}, at:
msm_gem_free_work+0x68/0x1b0
[   39.420784]  #3: c2b957b0 (&msm_obj->lock){+.+.}-{3:3}, at:
msm_gem_free_work+0x118/0x1b0
[   39.428996]
[   39.428996] stack backtrace:
[   39.433363] CPU: 0 PID: 68 Comm: kworker/u2:1 Not tainted
5.10.31+g7ae1de1d2bd3 #1
[   39.440937] Hardware name: Freescale i.MX53 (Device Tree Support)
[   39.447044] Workqueue: msm msm_gem_free_work
[   39.451346] [<c0111258>] (unwind_backtrace) from [<c010ba00>]
(show_stack+0x10/0x14)
[   39.459107] [<c010ba00>] (show_stack) from [<c0e2b560>]
(dump_stack+0xdc/0x104)
[   39.466430] [<c0e2b560>] (dump_stack) from [<c01838d8>]
(check_noncircular+0xf0/0x160)
[   39.474358] [<c01838d8>] (check_noncircular) from [<c0187060>]
(__lock_acquire+0x1628/0x2e04)
[   39.482893] [<c0187060>] (__lock_acquire) from [<c01892e8>]
(lock_acquire+0x134/0x560)
[   39.490821] [<c01892e8>] (lock_acquire) from [<c0e3da60>]
(__ww_mutex_lock.constprop.0+0xbc/0x1124)
[   39.499877] [<c0e3da60>] (__ww_mutex_lock.constprop.0) from
[<c0e3ebe4>] (ww_mutex_lock+0x68/0xb4)
[   39.508844] [<c0e3ebe4>] (ww_mutex_lock) from [<c080e6a8>]
(dma_buf_detach+0xd0/0x1e0)
[   39.516771] [<c080e6a8>] (dma_buf_detach) from [<c0701d04>]
(drm_prime_gem_destroy+0x2c/0x38)
[   39.525305] [<c0701d04>] (drm_prime_gem_destroy) from [<c077d334>]
(msm_gem_free_work+0xa0/0x1b0)
[   39.534188] [<c077d334>] (msm_gem_free_work) from [<c0147588>]
(process_one_work+0x2a8/0x7ec)
[   39.542725] [<c0147588>] (process_one_work) from [<c0147b18>]
(worker_thread+0x4c/0x554)
[   39.550825] [<c0147b18>] (worker_thread) from [<c014ebb0>]
(kthread+0x140/0x154)
[   39.558229] [<c014ebb0>] (kthread) from [<c0100134>]
(ret_from_fork+0x14/0x20)
[   39.565457] Exception stack(0xc26a1fb0 to 0xc26a1ff8)
[   39.570517] 1fa0:                                     00000000
00000000 00000000 00000000
[   39.578703] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   39.586890] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000

This looks like a regression as it used to run fine on 5.4 Linux kernel.

Any idea of patch reference to test is welcome.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
