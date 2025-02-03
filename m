Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F8A263B4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 20:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B67610E548;
	Mon,  3 Feb 2025 19:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C08310E548
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:25:04 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3cfba1ca53bso31549135ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 11:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738610703; x=1739215503;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lhI5OIpMPH2QnJaYcIqJZFy+BM0BfyBikG6nAIf8x/g=;
 b=bOrYqlHtPeAt8hKLLRo+gx7xYTPxiBF8KRGIX2Ro/cKolAbrqD1ygHVRSOyEgQ9FNA
 gpKvvPDLiesN8A39/mvtgFkxSW5mm2/BuQVyEtkN8yddcQUlqjrEcdsH0l3vHb5gxbPG
 G7GvUjLUOE+ei8MpHgMtxLQWR2XD6Y62isu553Bg7K0iJRz1pQTkWrx3+SozhgI/EllD
 nc9i8oEqHgG1v1Cc9tYUu+x6/Yf9gMyXi8+ZdHF5cx9r352JGRbsbvOSuwQ3soOpsVLf
 iJhfnyRz0eiZjQDGsqeVkIQFMqvX/n9dyqzkNluoyV5TUNWDz5h7gP40iGKOUpXJOVni
 ZQ/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLsMwASsruFo39pAKHENW73fzDhkHgIs+atVPFLngLjnPO6OWY/1eNXx4t7IrdEVV7k+JRtQJgcPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZikthb0KkRaek7LXFNV2ExmAtS0/t8oqZg6qWQRttQY6zM1sm
 LR7tauBfpalRvsyieqPdjAapmzujYXN/0coc3fPa3Qep1UojjsIgpL1EM8ebiDXxZCru6igrVZG
 bGwMWj2QGr+TFdApF+935wlGz+dhk4ywJAn9vzi7RmCnJML1SBBwbMj0=
X-Google-Smtp-Source: AGHT+IHwY2iLqAbIe5jLZh1gn1a2tBOXNrpNK+9CnnJ9ALI7AoOC+WThdnVTKSoTTxLcTCp4ffNsncLkC8XMRSlNtlSZ9C1ZpolU
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c08:b0:3cf:cac9:b02d with SMTP id
 e9e14a558f8ab-3cffe3e5db3mr188410605ab.8.1738610703570; Mon, 03 Feb 2025
 11:25:03 -0800 (PST)
Date: Mon, 03 Feb 2025 11:25:03 -0800
In-Reply-To: <IA0PR11MB71859E012D110DCD92D7B179F8F52@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a1180f.050a0220.163cdc.004f.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, muchun.song@linux.dev, steven.sistare@oracle.com, 
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
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

Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Tested-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com

Tested on:

commit:         d1302efc selftests/udmabuf: add a test to pin first be..
git tree:       https://gitlab.freedesktop.org/Vivek/drm-tip.git syzbot_fix_htlb_reserve_v2_rebase
console output: https://syzkaller.appspot.com/x/log.txt?x=114b75f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3ed8e2f9a4233102
dashboard link: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
