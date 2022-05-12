Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC74524DE7
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC21110FFF6;
	Thu, 12 May 2022 13:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF11910FFF6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:10:49 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d39f741ba0so6495414fac.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdLATnA0kcPNoqu23cfiMLmFcXc/ybpMfIMW+RMWEMQ=;
 b=WH/Yg/K2dHDjtYEYJw7pMyeqK00jg9PMsnBNd1pniF5ESO43pGuCO5fdpfXfdvg5GS
 dXTx+tXrKuQ2bEym+hdoMu3ZiHpWZh8HoBecQMlgoxILQUx5GP3ns+53JGTVqz81nxHs
 H8XCAbvLb1JMXpVlagB8O97aKBvYKmmLaiP9k1qxyXicWB1+cyUX/noBAfgX4Iwf+DWx
 Q/0VY3i4K/tlbkd14LKewDJl+22Dflp2EotibMBNPrwppTqRJghkISNCNY5jVSXp71Xy
 uYOFVcj6HHUiZvS0Sb2f8wEKmaPnVeXbBFwQS50AXuIsCdKGe5jPHfxGmCKc9rqrQBrU
 +CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdLATnA0kcPNoqu23cfiMLmFcXc/ybpMfIMW+RMWEMQ=;
 b=cYZCKuzt4UsiEzN+bnvv8UghNPnvoIg+zUDaKp68wBuk67OnUca7QukBnGFChMItiU
 FeTLNoGEHLWViWJuMuFS4m980rVg/gtlHthF8DnEnZURNOL8LW7V4RF4X7gb9ObORfVf
 t0UGNMig7XtGBALEec8BZJmpWBw/CUKjGK1A1qSr7nUfkkU3eTqMtESUUdp8ek0Xc0qe
 H66w/wP6SVuhacT96QtgPj/QL1os7/mru7jVO3Lda+ZaOeP9W3t/a2iNull4yNBbcNB4
 217AOKSc0PqETg392Pyo9gEghGR4t/IMnRVeBvQA1ajykz4V/AjAW37BTXhfoSciaXvH
 aoXQ==
X-Gm-Message-State: AOAM533oeLsP4ZYqoo5skiNkk/XXe2+KVzc8t8SCjJ/oRQcNrUxOtIVA
 PwSjBd8l7NcmHayCv11RTPP2xYIIk1bX56eS507hDg==
X-Google-Smtp-Source: ABdhPJyS3tE3qF+JcU9MU6Fu4rHz6PDTLQJ7dBPcxrOf3QlhTSnRdWW6XbLBXQksgHFll5uPtYKXAL4qBCTjy5JTea8=
X-Received: by 2002:a05:6870:d254:b0:db:12b5:da3 with SMTP id
 h20-20020a056870d25400b000db12b50da3mr5466937oac.211.1652361048752; Thu, 12
 May 2022 06:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008a7a1c05c9e53c87@google.com>
 <000000000000942c2205d6dc0896@google.com>
In-Reply-To: <000000000000942c2205d6dc0896@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 12 May 2022 15:10:37 +0200
Message-ID: <CACT4Y+Yfw+SFqbjqkBFw9aN7PABEgJapr7M2iY-O3nBwrMHVfQ@mail.gmail.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
To: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
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
Cc: melissa.srw@gmail.com, linaro-mm-sig-owner@lists.linaro.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel.vetter@ffwll.ch,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 bugs-a21@moonlit-rail.com, maxime@cerno.tech, daniel.vetter@intel.com,
 syzkaller-bugs@googlegroups.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 at 08:50, syzbot
<syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 0499f419b76f94ede08304aad5851144813ac55c
> Author: Javier Martinez Canillas <javierm@redhat.com>
> Date:   Mon Jan 10 09:56:25 2022 +0000
>
>     video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126571e0700000
> start commit:   5d6ab0bb408f Merge tag 'xtensa-20211008' of git://github.c..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=32e6048063923b7b
> dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11073300b00000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

Not sure, but maybe:

#syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
