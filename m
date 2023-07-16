Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F14754D62
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jul 2023 07:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B91510E065;
	Sun, 16 Jul 2023 05:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A89C10E1D1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 05:01:32 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3a4261fc598so5485716b6e.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 22:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689483691; x=1692075691;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gc8P9j4aAtUD818FUv9FldLGl7WtvU/qesSGY59z6is=;
 b=H9rMt+Tc4+pEyaFOM7lPlQvEtRLQGEmpPHOE0wbuaG3IPujynvA1i7llQ9UTxDqJ5j
 Et+xrToTR6DIwkcjbd2sIHPFSbXl+BM036FRLXzUgT80SuzG5aBsSyLnnDCNUqLX0XQ4
 6nxy1wtdUjkI4yYv2e9o3T5xKduJejOprS5QrxX2IoHCuIfVj+3sHZEzVBWlZBWegMtw
 IJYJJ82N0Cza71EmsqwRw72sjE2oRzfzX5pNRNY4LQCK5lQ0EYpk58H+q9vMtR7TBQIW
 HRenunY0epvtAKCxDwU2y0ryripi+2jHEqgSjF8vPLfzYzwHAdJUgbTlngPl1Gq04tj4
 XKew==
X-Gm-Message-State: ABy/qLaeCFoi5St5vOzVa7UCgDQjTGzmL1T0N63SDPAASjJEnyIGMn8+
 XOIVNURXcPo+mrlY0km7gAXlxJcagXhwlu5rVoE1VP8LnT0e
X-Google-Smtp-Source: APBJJlHiKkQSYHWZqiMGK6JjPBORaD5zWjOurp/X4RHYedM4t3zbGTgydgOk6gzh9XX0dFzBM53cFrKdyB0aFSTeEV/ZZD4WxY07
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1316:b0:3a1:e88d:98ab with SMTP id
 y22-20020a056808131600b003a1e88d98abmr11466633oiv.6.1689483691033; Sat, 15
 Jul 2023 22:01:31 -0700 (PDT)
Date: Sat, 15 Jul 2023 22:01:30 -0700
In-Reply-To: <20230716043411.4950-1-astrajoan@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004209890600939346@google.com>
Subject: Re: [syzbot] [dri?] KMSAN: uninit-value in drm_mode_setcrtc
From: syzbot <syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com>
To: airlied@gmail.com, astrajoan@yahoo.com, christian.koenig@amd.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, glider@google.com, 
 ivan.orlov0322@gmail.com, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 skhan@linuxfoundation.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

Reported-and-tested-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com

Tested on:

commit:         d1d7f15c DO-NOT-SUBMIT: kmsan: add the kmsan_exceed_ma..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=101d3fdaa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36e4a2f8150fbc62
dashboard link: https://syzkaller.appspot.com/bug?extid=4fad2e57beb6397ab2fc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15430342a80000

Note: testing is done by a robot and is best-effort only.
