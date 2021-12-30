Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D150B481E79
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45B10E221;
	Thu, 30 Dec 2021 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8502010E4A4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 14:04:09 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 i12-20020a056602134c00b0060211f8b5b7so6599064iov.15
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 06:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=CLxA5XglfnNoz85p0aOYmSifVXQKJleW9SZsti4LBwI=;
 b=xZZk5Xwp4IIRf2B+zDP4AHGBmSMLzMK4qZs8aS0WgYDtN9dqX2tRXAeBFV5AbeC+qd
 rpD5gH9bpTTz/v8yr4AKHPSh4TpD6hdBaoyvj5yW7bb8UGoWfsFv+K4/aDkQN50gXEW/
 ghEWjesFpEcjaOgin7PHgehAFzoWEvWaK6Kt3T1QgzeZyRGbSqRWA3p4PbeqHgGutYDY
 dnuwnbZGApt5AWnL5lbASw6DBPHCU2M4IA3dANyDLwBWEwzifTSCRSWzdANK8pUoy6JE
 BEmKnNa698p2gpQX1Ucp5gjNKY6Esm4baPiQB9LjPaV7dZec7QnM9I9SyJmlas7U64dx
 fk9A==
X-Gm-Message-State: AOAM53101YQskPSqNqkJvMxVGxvjEB1piJPlsvMZdmw3UBFU1D1Ekp+a
 HtcKWDvYD7Wm7UaogCz9pHbK3nI+h+c6zJKq/pk1oLbfQrau
X-Google-Smtp-Source: ABdhPJx785tpqTHluOUoVroCRBPCP9AP06uygyiu8dMzkdRIbJk8+L32zGswOmo6KPDk/Bzwg41q3078PRkKkjGBHDoJUHfy5SA9
MIME-Version: 1.0
X-Received: by 2002:a02:9108:: with SMTP id a8mr9685404jag.284.1640873048481; 
 Thu, 30 Dec 2021 06:04:08 -0800 (PST)
Date: Thu, 30 Dec 2021 06:04:08 -0800
In-Reply-To: <83bf58b6-ace2-2db8-4f8b-322e78a3e198@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d250205d45d87d6@google.com>
Subject: Re: [syzbot] general protection fault in
 sg_alloc_append_table_from_pages
From: syzbot <syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, paskripkin@gmail.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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

Reported-and-tested-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com

Tested on:

commit:         eec4df26 Merge tag 's390-5.16-6' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1bce7595e2f1eaf8
dashboard link: https://syzkaller.appspot.com/bug?extid=2c56b725ec547fa9cb29
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fe2f47b00000

Note: testing is done by a robot and is best-effort only.
