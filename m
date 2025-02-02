Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D51A24F3F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 18:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F0110E12E;
	Sun,  2 Feb 2025 17:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E110E12E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 17:27:05 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d00fe9f7b3so55619625ab.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 09:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738517225; x=1739122025;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXexU36OiSygy1VKoH+pvaXyLUZp8BcdvcSSrRQAfh8=;
 b=Mscp+scOXdTjlPV47bMQSMO5xie9xMxkYN7NyLZpYlgEepYF0xNdhSQ7LpI+U24Por
 uXrksCPCK4pdRHgaqAI7ZxEF4RM9KkB3SbSSF2wH5LqcD8F5vDYdNQRaWS6mMv7yVx7Z
 AiVPqqZ//81J0U69YhidGltruHMx7ic+hxATefIFSfkWFMJQHVMx0rM5J63Wmjzp7HUf
 yxgYA3/K33oOQJlSQXmNU4bToLmn5rtYXtjqhdVCF3GnN7voxqHZ+4LfscD6ziCwX0gb
 /4IZn4VwjI2kdmdcK5N6vFL4tl9mPqTQxR/68lQj8IGHn/623hWUDpIzs1ND8YadB3TZ
 Zw7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEAAA81AkHXOrazHOaPqUINhLXr0W/rP5kARkghScF8K4GXYyRQ2ttgacLWIlxmiEsdpgeN2F/Mew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw22ToMxex60AEv3nQRw0WC3P6OXP1NCCSgix2TelWrG6nEi77y
 sixgyxjDhTJlojuWnxbQ1474arlgpWtIshuq3M5J2LiasR2AFd2+K8JOkRvYR+xctX9hKwtqw84
 6Mq4R/sL9qdtBSaw6m2GOL8GEMrnthxIvrInXwzLuoad0b/sE2tr350c=
X-Google-Smtp-Source: AGHT+IGF8I7415qb/43RYrrVed/7Jwn8N6ClVLyn1H7699DTvp3t166RV/QQQs3W3eWRqS9YuDOKJZhhfJ0DSc+G50LjShwjlLFi
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c2:b0:3cf:cd87:1bf9 with SMTP id
 e9e14a558f8ab-3cffe46994fmr164810335ab.22.1738517225016; Sun, 02 Feb 2025
 09:27:05 -0800 (PST)
Date: Sun, 02 Feb 2025 09:27:04 -0800
In-Reply-To: <677928b5.050a0220.3b53b0.004d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679faae8.050a0220.d7c5a.0073.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: airlied@redhat.com, akpm@linux-foundation.org, david@redhat.com, 
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev, 
 steven.sistare@oracle.com, syzkaller-bugs@googlegroups.com, 
 vivek.kasireddy@intel.com
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

syzbot has bisected this issue to:

commit c6a3194c05e7e6fd0e8fbfb1720084ae2503c4ac
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Jun 24 06:36:16 2024 +0000

    udmabuf: pin the pages using memfd_pin_folios() API

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12c71724580000
start commit:   69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11c71724580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16c71724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1324fddf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128b55f8580000

Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Fixes: c6a3194c05e7 ("udmabuf: pin the pages using memfd_pin_folios() API")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
