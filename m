Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576D7AEE70
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1BF10E36F;
	Tue, 26 Sep 2023 14:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3131F10E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:31:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BB72614BD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38750C433C7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695738689;
 bh=mkBLXj+ramnSsuiPXWmKzHsmrk5qMxt2DFlL297W4FA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TJilO/40mgXdgOGGhALv4oupM32sdOjtdFKEbNNlk88oYRYcwCXHuIYEeIMNwp4xE
 RHC4qHbiG9UPZPQOrMQiQwl3cRgj6oex8avRMCx522sVcS7AwoV7HTejgSkBAfuaKa
 AVCVHTe27JGRYzI5/+jGsNU1375dfdaklDuraT5S35XJPcubje51krDVPg2amZKmAw
 6qimA8bAsA7rKw4BVgge+rXV1Si9qHy0bheWVz/Y9rskbEONGGF1cafZoqg84VAUkM
 jc8lVgL/kQ5ydHOss6k5u0mfczZzgpjmVgDPIYJbGY83jQPSizoRO23SjfJFLUW8fg
 cqlOnmZ/BYnMA==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2bfea381255so151697271fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:31:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyip6yFz1zTdMC3Jh+3duI+aVbwAknZ46DK3QnvJH/KTa5k3FD8
 XEeICr+225Y8aGbN26Fj8ZzuqlQNv6GUfXNqgpY=
X-Google-Smtp-Source: AGHT+IGCokDnEGgmKMUa491gE66S/SBZNnLYF/KOknaoXZlpK861avLg1M3E57GUJe37zXMdTyz6QECZkuhKNtYQJGA=
X-Received: by 2002:a2e:9b96:0:b0:2bc:b9c7:7ba8 with SMTP id
 z22-20020a2e9b96000000b002bcb9c77ba8mr8428873lji.43.1695738687383; Tue, 26
 Sep 2023 07:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
In-Reply-To: <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Sep 2023 22:31:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
Message-ID: <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, all,

On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 13.09.23 14:02, Jaak Ristioja wrote:
> >
> > Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> > Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank
> > screen after boot until the display manager starts... if it does start
> > at all. Using the nomodeset kernel parameter seems to be a workaround.
> >
> > I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> > ("drivers/firmware: Move sysfb_init() from device_initcall to
> > subsys_initcall_sync").
>
> Hmmm, no reaction since it was posted a while ago, unless I'm missing
> something.
>
> Huacai Chen, did you maybe miss this report? The problem is apparently
> caused by a commit of yours (that Javier applied), you hence should look
> into this.
I'm sorry but it looks very strange, could you please share your config fil=
e?

Huacai

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> > git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [2dde18cd1d8fac735875f2e4987f11817cc0bc2c] Linux 6.5
> > git bisect bad 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > # bad: [b775d6c5859affe00527cbe74263de05cfe6b9f9] Merge tag 'mips_6.5'
> > of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
> > git bisect bad b775d6c5859affe00527cbe74263de05cfe6b9f9
> > # good: [3a8a670eeeaa40d87bd38a587438952741980c18] Merge tag
> > 'net-next-6.5' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > git bisect good 3a8a670eeeaa40d87bd38a587438952741980c18
> > # bad: [188d3f80fc6d8451ab5e570becd6a7b2d3033023] drm/amdgpu: vcn_4_0
> > set instance 0 init sched score to 1
> > git bisect bad 188d3f80fc6d8451ab5e570becd6a7b2d3033023
> > # good: [12fb1ad70d65edc3405884792d044fa79df7244f] drm/amdkfd: update
> > process interrupt handling for debug events
> > git bisect good 12fb1ad70d65edc3405884792d044fa79df7244f
> > # bad: [9cc31938d4586f72eb8e0235ad9d9eb22496fcee] i915/perf: Drop the
> > aging_tail logic in perf OA
> > git bisect bad 9cc31938d4586f72eb8e0235ad9d9eb22496fcee
> > # bad: [51d86ee5e07ccef85af04ee9850b0baa107999b6] drm/msm: Switch to
> > fdinfo helper
> > git bisect bad 51d86ee5e07ccef85af04ee9850b0baa107999b6
> > # good: [bfdede3a58ea970333d77a05144a7bcec13cf515] drm/rockchip: cdn-dp=
:
> > call drm_connector_update_edid_property() unconditionally
> > git bisect good bfdede3a58ea970333d77a05144a7bcec13cf515
> > # good: [123ee07ba5b7123e0ce0e0f9d64938026c16a2ce] drm: sun4i_tcon: use
> > devm_clk_get_enabled in `sun4i_tcon_init_clocks`
> > git bisect good 123ee07ba5b7123e0ce0e0f9d64938026c16a2ce
> > # bad: [20d54e48d9c705091a025afff5839da2ea606f6b] fbdev: Rename
> > fb_mem*() helpers
> > git bisect bad 20d54e48d9c705091a025afff5839da2ea606f6b
> > # bad: [728cb3f061e2b3a002fd76d91c2449b1497b6640] gpu: drm: bridge: No
> > need to set device_driver owner
> > git bisect bad 728cb3f061e2b3a002fd76d91c2449b1497b6640
> > # bad: [0f1cb4d777281ca3360dbc8959befc488e0c327e] drm/ssd130x: Fix
> > include guard name
> > git bisect bad 0f1cb4d777281ca3360dbc8959befc488e0c327e
> > # good: [0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630] dt-bindings: display=
:
> > simple: Add BOE EV121WXM-N10-1850 panel
> > git bisect good 0bd5bd65cd2e4d1335ea6c17cd2c8664decbc630
> > # bad: [60aebc9559492cea6a9625f514a8041717e3a2e4] drivers/firmware: Mov=
e
> > sysfb_init() from device_initcall to subsys_initcall_sync
> > git bisect bad 60aebc9559492cea6a9625f514a8041717e3a2e4
> > # good: [8bb7c7bca5b70f3cd22d95b4d36029295c4274f6] drm/panel:
> > panel-simple: Add BOE EV121WXM-N10-1850 panel support
> > git bisect good 8bb7c7bca5b70f3cd22d95b4d36029295c4274f6
> > # first bad commit: [60aebc9559492cea6a9625f514a8041717e3a2e4]
> > drivers/firmware: Move sysfb_init() from device_initcall to
> > subsys_initcall_sync
