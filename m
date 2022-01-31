Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0504A3EA7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A6F10F511;
	Mon, 31 Jan 2022 08:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2B4112222
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 07:50:09 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 y4-20020a056602200400b006101b618529so9351420iod.19
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 23:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=mUUhKABASSDYvCUsc04M7XBtQBbnsrCUfjP/FgUZhxY=;
 b=YB57m3/0kF0s+Qq6K1rJYdXBg4x64C39Fmg54NqIUptNNAx2DhLpGr0Z1oDRzc02PG
 8y0FcmfHCR+0h4dHBtl8pilYXoz9oTSCKsz8vbXJZnwLbVc6+6vK3MVbV6Uu/Xz0i999
 OuII5I7+APWShRa4VWvTU/qDTv4SqY4bxRbwCFS5QAHeLD/zmgR6tSdydNLnbks3BLpb
 lNyEseIGNchpdBem9HgPgBloD2yxsomfeaKOc9B1zhErVgkvixMMBDMexZdhF2pm/RjK
 pkJGxJGDxbzOXlm0JXvFc5oG6aJyZYgsxZICpVep678mrsf5Eml8ykDq+cOmBqL/kzYc
 CFUA==
X-Gm-Message-State: AOAM533x4Ghr9FvIj4BRlu2vDJVx4tatHne8or683w82iT5fOUfo3kFD
 Zv5Qva5zDzmACsbeIXFzKmoRRrE+LNZ5TCcqH7Ob68EbpyUs
X-Google-Smtp-Source: ABdhPJymwJlS8JsUdlrCW9lOYpIn2UaIQaZW0hA0lpGtEyFOwecg2a8tRTfuM68f+RfkiiN+E5hX3nWx76izWqmI0UiryQoaAMBM
MIME-Version: 1.0
X-Received: by 2002:a6b:d90c:: with SMTP id r12mr10512979ioc.99.1643615408629; 
 Sun, 30 Jan 2022 23:50:08 -0800 (PST)
Date: Sun, 30 Jan 2022 23:50:08 -0800
In-Reply-To: <0000000000008a7a1c05c9e53c87@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000942c2205d6dc0896@google.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
From: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
To: airlied@linux.ie, bugs-a21@moonlit-rail.com, christian.koenig@amd.com, 
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, javierm@redhat.com, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, maxime@cerno.tech, melissa.srw@gmail.com, 
 mripard@kernel.org, sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 31 Jan 2022 08:35:18 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot suspects this issue was fixed by commit:

commit 0499f419b76f94ede08304aad5851144813ac55c
Author: Javier Martinez Canillas <javierm@redhat.com>
Date:   Mon Jan 10 09:56:25 2022 +0000

    video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126571e0700000
start commit:   5d6ab0bb408f Merge tag 'xtensa-20211008' of git://github.c..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=32e6048063923b7b
dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11073300b00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
