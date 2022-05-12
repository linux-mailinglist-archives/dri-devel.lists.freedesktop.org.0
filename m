Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DE524E19
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEFF112043;
	Thu, 12 May 2022 13:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E74112043
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:21:26 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edf9ddb312so6569688fac.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1LkdWLl5bERB7RO9RpYQ/us9kzwvuP0AILwTfB/8W4=;
 b=V1n/chSwX/yC24Pb7iPWi90T+RcN5kcECtqlaG1lb2FQPhSjWGqyC8u1wLLBtlPBGQ
 cPmbAr+aoI8KHHy8rnBeCHl88BAf0PNQEHZ6RKwOqa/cs6eUhsZ22PLkytm8TvaV3EZ0
 GqG3x/DwoMEG/FmOy7Cq7xGIrRIA8u+0mFTSpS7kRlD/yas4kNL9gniA1YXtEI+IAFQX
 ac4x3PitUBuhA0TGej7bL8ti3Gwp/6BYgV/m+7HgP+q5xfUtF+pJp4MxCeZIlJF9z36F
 aLHpmFm0LV5yiGTWOYTEUXuL/1NlhQWm91KnC61/zjxGjS2y6xHTijiPUTZO4LIEGiWa
 Cv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1LkdWLl5bERB7RO9RpYQ/us9kzwvuP0AILwTfB/8W4=;
 b=xyHFLvMnG2d8clJVNVLPTAtA2AlJicWeJNoL1rog2OwxmACM2JpUhtjRXcf8dRUGGY
 nbRMzZ4ZJcRKGLX6b6sy5hE9fHW2saFTSY7pR+s1p3dvJ293TfHNOCH5iiwWEhxZVWaT
 gPnjbUZb7KHY2ZAyAFgPryVbNYDwl8dNgfCp35yuMvNx7jerrJrBu53lOdxVv6EYYln6
 OH+kC49e68t+598qXxDlDERynLxnANuJohqvXIV+R/FkPZfs7G6iogKS5ExGBnR7MoWu
 IJu4TI48mt4C4nmlzJct5issTIGXU5m3WI/DJwDeyL6ZcLgU3rrVRz7vrhiIxQ6rRdEZ
 UMyQ==
X-Gm-Message-State: AOAM532I42GJx9UzD7JaWZ3SjwkIesOXbIyaoWA5NXT1Y3l4f0PEGd9e
 7tRJ/SD/HgH+QpFZzAF1yFQe5Mr9HwmllI4UHjpmZA==
X-Google-Smtp-Source: ABdhPJwwmEGtUQearzvM5CoarRF5IQke11aUPGfWHgUZFWZGWDLSi4YMil+hfBnKvXUHDizXhPtCMeu7zduTNUZAPdw=
X-Received: by 2002:a05:6870:d254:b0:db:12b5:da3 with SMTP id
 h20-20020a056870d25400b000db12b50da3mr5492856oac.211.1652361685131; Thu, 12
 May 2022 06:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ab6df705b453993a@google.com>
 <00000000000035befb05d6b91185@google.com>
In-Reply-To: <00000000000035befb05d6b91185@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 12 May 2022 15:21:14 +0200
Message-ID: <CACT4Y+bi-h7PGWqM=JyjvaTHcyzkg9nndUTVCyV-rADPYgHspA@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 bitfill_aligned (2)
To: syzbot <syzbot+a4edd73d589b0b7efbeb@syzkaller.appspotmail.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, bugs-a21@moonlit-rail.com,
 maxime@cerno.tech, ngraniel@cocobongo.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Jan 2022 at 15:07, syzbot
<syzbot+a4edd73d589b0b7efbeb@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0499f419b76f94ede08304aad5851144813ac55c
> Author: Javier Martinez Canillas <javierm@redhat.com>
> Date:   Mon Jan 10 09:56:25 2022 +0000
>
>     video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1752f5c0700000
> start commit:   2a987e65025e Merge tag 'perf-tools-fixes-for-v5.16-2021-12..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7d5e878e3399b6cc
> dashboard link: https://syzkaller.appspot.com/bug?extid=a4edd73d589b0b7efbeb
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16671badb00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122beabdb00000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

Based on commit subject looks legit:

#syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
