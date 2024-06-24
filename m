Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9979155E8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 19:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFF210E554;
	Mon, 24 Jun 2024 17:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760410E546
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 17:54:03 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-37620c37ae8so55970225ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 10:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719251642; x=1719856442;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzCKyK0zAE0pyal4RPcwORnN1X/VtugtKH06mEuQykw=;
 b=mu8tWk6HIiq6pEXAVOcPmYcuvEshx/wP1Vqo7EtC9mRwbw6V7Ew9uKi51g8FcQeCNy
 itzGaer24Ghp+Kc6jMA7BZbtu8fOm+ahqmhW2Iug+kwAdGl9nPXlBOVGCPij4MpFOsbL
 Uan1g89VyHSbXbEpqCqfNlljS4WTLnB2LXdlYoPsSYRn9mxF2FZ47qwvHERofMk08Onj
 mz38VcGntLSTHY/btw8/UZzeWfbGIlyLF8gLw03cpl6BOLtBP03vGyEY0MIGJokSrLPW
 2sWcf/Z91OAfH9l5zw58dHYB2CjDyH/ahGDCx7VI2fRafiSV5XSl7VKkaLPTUlhF8ms4
 39Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrC7fNXWwGL29NA6NiFMTiHwS2KXyOq7Lb7Rg/55ydYpXnqsTaDx1mVoccSnagDf/L9/C9bR2Fs5Y+FLAWNLHR67NxWobqGlD62sd6MSkn
X-Gm-Message-State: AOJu0YyRvDtmRm5jTaRAPVS/5abi3y/F1s4OiN5cB67C47HumOu0HI3p
 R3YCEYBo9zOq2IjgiQ3R1eZNmbEskam0JdbOzs8elGRqTL9+F0bjqeE8Sttyku6SJdORrTidwnw
 P9woXPyooliQ5TJgjpvoY/MbtqzIgo+/n5rZHhgehGyCQR7i4K6dFjAM=
X-Google-Smtp-Source: AGHT+IFvlUCBRcqMRnAMMzQZCF1nxnRlu+ZLYSY5fQOEYrcnpFhzGgam/jc53s/GdBXuorTslpc96gfIFHBQgkljdpPr4HR2/pmn
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d16:b0:376:4a18:a4ca with SMTP id
 e9e14a558f8ab-3764a18a6b5mr3045875ab.4.1719251642392; Mon, 24 Jun 2024
 10:54:02 -0700 (PDT)
Date: Mon, 24 Jun 2024 10:54:02 -0700
In-Reply-To: <00000000000026100c060e143e5a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006cb461061ba67748@google.com>
Subject: Re: [syzbot] [net?] [nfc?] INFO: task hung in nfc_targets_found
From: syzbot <syzbot+2b131f51bb4af224ab40@syzkaller.appspotmail.com>
To: James.Bottomley@HansenPartnership.com, airlied@gmail.com, daniel@ffwll.ch, 
 davem@davemloft.net, deller@gmx.de, deller@kernel.org,
 dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, eadavis@qq.com, edumazet@google.com, 
 gregkh@linuxfoundation.org, hdanton@sina.com, jernej.skrabec@gmail.com, 
 krzk@kernel.org, krzysztof.kozlowski@linaro.org, kuba@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-sunxi@lists.linux.dev, mripard@kernel.org, 
 netdev@vger.kernel.org, pabeni@redhat.com, penguin-kernel@i-love.sakura.ne.jp, 
 samuel@sholland.org, stern@rowland.harvard.edu, 
 syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, 
 u.kleine-koenig@pengutronix.de, wens@csie.org
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

syzbot suspects this issue was fixed by commit:

commit 487fa28fa8b60417642ac58e8beda6e2509d18f9
Author: Helge Deller <deller@kernel.org>
Date:   Sat Apr 27 17:43:51 2024 +0000

    parisc: Define sigset_t in parisc uapi header

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17038a61980000
start commit:   acc657692aed keys, dns: Fix size check of V1 server-list h..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c882ebde8a5f3b4
dashboard link: https://syzkaller.appspot.com/bug?extid=2b131f51bb4af224ab40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103698bde80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1617e0fbe80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: parisc: Define sigset_t in parisc uapi header

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
