Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C1631671
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 21:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E0510E04B;
	Sun, 20 Nov 2022 20:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B9C10E04B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 20:51:19 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 y12-20020a056e021bec00b00302a7d5bc83so5500778ilv.16
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 12:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oDLcfZl+txYsJtzeVXqCYMCFgcOLb6wRGnlPi43ilE8=;
 b=Pw0atdkgqxlS4J1aRXATZF5Lp1o3zFtjIQVjm4yXs+nOmsGm1esHfOKliHasiduTti
 ghPFAJvK4y9uBP/B9NOCmpL0FArT8E3lFpejLgg1aufikVwkwYdK0sXYWYEnNkrLoHEy
 XJkJQBQrpXyTbFothGn1Hkt5oH7Dpr3p+VODM7rndyQDr2/nWe8yczRo6hpgT3U6y66c
 /hJRAU/bWF2czFj6zREHRzRO9tu8Aa9bjT/Jfopq+yL/mkfbC73BmGiuURLBnxAlgmET
 oWxDrYPEK9XAu7MWlB2E8rLdwCvFsVDB7MC24mrhiVqE8f9UiLSm3Yz+Rnt1+ZvhY3ZN
 Yqhw==
X-Gm-Message-State: ANoB5plso6irU5ZdMqxc+TQjc2x7aNgQ9dIZBpFTvi0msmIr0lWEXpTC
 9VEAkdtSFt4uExwSLuATyUjDAP1s8vNHwxcYfUUMfJpbFTan
X-Google-Smtp-Source: AA0mqf5CBYmEqRFQYqm1UpoVHrdbq/uYkStlCRHWaDTVvlLNGxzh0dMVaQAZBLUykBc00JqAz74S8DO7Ridn5eA4tsjxMLFw/LVU
MIME-Version: 1.0
X-Received: by 2002:a92:c64c:0:b0:2fa:de7:7c09 with SMTP id
 12-20020a92c64c000000b002fa0de77c09mr6888485ill.94.1668977479370; Sun, 20 Nov
 2022 12:51:19 -0800 (PST)
Date: Sun, 20 Nov 2022 12:51:19 -0800
In-Reply-To: <00000000000021719805d692e035@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cbce8405eded1951@google.com>
Subject: Re: [syzbot] inconsistent lock state in sync_info_debugfs_show
From: syzbot <syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com>
To: bp@alien8.de, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gustavo@padovan.org, hdanton@sina.com, hpa@zytor.com, jmattson@google.com, 
 joro@8bytes.org, kvm@vger.kernel.org,
 linaro-mm-sig-bounces@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
 pbonzini@redhat.com, peterz@infradead.org, seanjc@google.com, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 vkuznets@redhat.com, wanpengli@tencent.com, will@kernel.org, x86@kernel.org
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

commit 997acaf6b4b59c6a9c259740312a69ea549cc684
Author: Mark Rutland <mark.rutland@arm.com>
Date:   Mon Jan 11 15:37:07 2021 +0000

    lockdep: report broken irq restoration

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=115b350d880000
start commit:   84368d882b96 Merge tag 'soc-fixes-6.1-3' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=135b350d880000
console output: https://syzkaller.appspot.com/x/log.txt?x=155b350d880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f4e5e9899396248
dashboard link: https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164376f9880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16cf0965880000

Reported-by: syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com
Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
