Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A246344D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1211B10E45B;
	Tue, 22 Nov 2022 19:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49AA10E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:48:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id i10so38126969ejg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 11:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lVbDlvvtZ6kOnIDHKIHd3lgjSqvnp2Onmrr/hjcCiKI=;
 b=ZpmZGbA0yEeAQcmw1YRD+tH2k3dpJ2h+GQqA2nTW/+AmrJijfthJJ1JBDQ4b17naWX
 Gc/gxxKP+B5FUvV3VGk2W0G9ETX/IIVaM8yBzDUKEelLWQEv8b4KysweuE9QpJ6XQVSd
 wJVG2oDQ+oPdHYZz0NjKMihQlfjjhbkia8/Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lVbDlvvtZ6kOnIDHKIHd3lgjSqvnp2Onmrr/hjcCiKI=;
 b=RlVovMBk7vz+FgBDD0Ogyt32vjOrFrROVoIpRHK+/011E2DduZNIWZXmLSXsDqJ8RM
 7z+1jvg9RbhY0hwtm1GQVLBO35Ileq9ip3VGwkh/cJmjgNjR5Hmvemgg2/tpntVWpMwY
 S4vCIzbvHDeCQpyLgUsmXyvNAJkGW/58o88pPNvdewmlVUxny41WScHQcuVmexNZtHy7
 D6T4SL6EFzKTRhShi5NP80X8oYRRGs7mqcTL7/be7O/2+pgugrONWdTDEOPVKNM4nsNu
 zNRbhtHdzLEsVq3sJiCj54JEvqcDPJNKTlG4eH6O0FgaE4jOqlkF1OfD0xUJDO3jXQFZ
 x9CQ==
X-Gm-Message-State: ANoB5plE2fRcBb0E7bjxL6zQ4g5fqniFW8lZctP3dwqpyfHQpTUivDFy
 ngyL+1bBG8DCxoU15RcEUAL0ZzZ2kvadlGf1zZzX7A==
X-Google-Smtp-Source: AA0mqf7G2K2KCHsUYtNjGbSQRIe5kptdRvJjIPo2u6XacsktiIWjTo1Gtdxekg6+ahn0rSaoqbcgPDkabc4jvu8znZE=
X-Received: by 2002:a17:906:d7b8:b0:79f:9ff6:6576 with SMTP id
 pk24-20020a170906d7b800b0079f9ff66576mr20147812ejb.414.1669146496324; Tue, 22
 Nov 2022 11:48:16 -0800 (PST)
MIME-Version: 1.0
References: <00000000000021719805d692e035@google.com>
 <000000000000cbce8405eded1951@google.com>
In-Reply-To: <000000000000cbce8405eded1951@google.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Nov 2022 20:48:05 +0100
Message-ID: <CAKMK7uFj2oouRmLyTZH5YLsk_V8FE=XUR-o0QkoMk1macyPDOg@mail.gmail.com>
Subject: Re: [syzbot] inconsistent lock state in sync_info_debugfs_show
To: syzbot <syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com>
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
Cc: mark.rutland@arm.com, hdanton@sina.com, wanpengli@tencent.com,
 kvm@vger.kernel.org, peterz@infradead.org, gustavo@padovan.org,
 dri-devel@lists.freedesktop.org, hpa@zytor.com, will@kernel.org,
 sumit.semwal@linaro.org, joro@8bytes.org, x86@kernel.org, mingo@redhat.com,
 linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linaro-mm-sig@lists.linaro.org, bp@alien8.de,
 linaro-mm-sig-bounces@lists.linaro.org, tglx@linutronix.de,
 jmattson@google.com, seanjc@google.com, linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, vkuznets@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 20 Nov 2022 at 21:51, syzbot
<syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit 997acaf6b4b59c6a9c259740312a69ea549cc684
> Author: Mark Rutland <mark.rutland@arm.com>
> Date:   Mon Jan 11 15:37:07 2021 +0000
>
>     lockdep: report broken irq restoration

Ok this looks funny. I'm pretty sure the code in
drivers/dma-buf/sw_sync.c around sync_timeline_fence_lock is correct.
And we don't do anything that this patch claims to catch, it's all
just plain spin_lock_irq and spin_lock_irqsave usage. Only thing that
crossed my mind here is that maybe lockdep somehow ends up with two
different keys for the same spinlock? I'm really confused ...
-Daniel

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=115b350d880000
> start commit:   84368d882b96 Merge tag 'soc-fixes-6.1-3' of git://git.kern..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=135b350d880000
> console output: https://syzkaller.appspot.com/x/log.txt?x=155b350d880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6f4e5e9899396248
> dashboard link: https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164376f9880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16cf0965880000
>
> Reported-by: syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com
> Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
