Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0D7132E2
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DB510E04B;
	Sat, 27 May 2023 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BED10E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 07:12:28 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-33832662ba5so20089565ab.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 00:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685171547; x=1687763547;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWchqKPMOFT8mRiLEkV3wc3x0GBD55yGdX9K71lIRkw=;
 b=Wekq2RlVMfU7o0q1dnlf3EXS1feYlfzPg74JaaoRTvCahCNsWV9JSNtE9QyJ09z537
 Bw1Yf955s8PMoUJjJr+b+vptnES6DBBAzEh/u1YcvkIcTqJc2rAekGKnPgEHAwHJ6fsa
 icD8OszKsV1iJgaPgj2C3i6VieAJtZU3Qmdxy8ZUPeiznFyCN9xUH4ieK2S8Jfx8dhMe
 sNjxwrMlaHCUFD0O84rDW0Z69xhlIHp3OpvSlxs9ZfqCEZQ1H3dZm+sbHfMZJT+A1Nux
 amvmiIARi1kqWVix/doefDNtL4S3c7nUbOIReGXle1le8bRg2ew+AsekNeqvacEFBTrc
 b0Xg==
X-Gm-Message-State: AC+VfDypcn42nRs0d0QSDEYV93D1NvCP0YzeFQRGKhq4zHt3wSHLBroO
 hrcF5Jvu8DYw/Z2Lzylv8WvS59xq0pZyPlXuOEfe4vYuuvqr
X-Google-Smtp-Source: ACHHUZ7Wg0GoaGFLqVjam0CAEhpAfvM9z6pAC6uClMZwq8s913zIOamgSr4CALZtFSwpmusnQ0Q6BFHqJ14Smz2Mugk4ynCOsOG9
MIME-Version: 1.0
X-Received: by 2002:a92:de02:0:b0:328:fb47:ede4 with SMTP id
 x2-20020a92de02000000b00328fb47ede4mr756567ilm.3.1685171547077; Sat, 27 May
 2023 00:12:27 -0700 (PDT)
Date: Sat, 27 May 2023 00:12:27 -0700
In-Reply-To: <77f5c7f1-83fc-514c-14b9-453311b01188@gmx.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073034505fca7936b@google.com>
Subject: Re: [syzbot] [fbdev?] general protection fault in soft_cursor
From: syzbot <syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com>
To: daniel@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com

Tested on:

commit:         9ee79acc fbcon: Prevent softcursor if no font set
git tree:       https://github.com/hdeller/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=136dee6d280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8860074b9a9d6c45
dashboard link: https://syzkaller.appspot.com/bug?extid=d910bd780e6efac35869
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
