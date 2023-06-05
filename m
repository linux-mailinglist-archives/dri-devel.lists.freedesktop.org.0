Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07BC722870
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C71410E1D3;
	Mon,  5 Jun 2023 14:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7AC10E1D3;
 Mon,  5 Jun 2023 14:11:35 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-557ca32515eso3508059eaf.3; 
 Mon, 05 Jun 2023 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685974294; x=1688566294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkFk+WRaK8DJpCbECdgTGImYYiJ/3koxt3S/LYx6+NI=;
 b=SXhwucOX38CrGifxFyNT20ngbnqojLTSIR9wnhtJzHP6d+m9lTtk9Gw3AHaq0V5yyH
 TRQy8GBtK5iJ+CyyHFMmNXoax65xdnpHxXlwb5g5u1nRvzMYHZXBVJLIaV2jApATWVej
 4dCdUKZJBp6Xr0wptg9RfoRfzmUdjDPjlf4VkC9sldY7iBWAi4EwgUNhqyHXzCz/UUAP
 1XBgTL2aZ1J7mzmBcWvSmMWJCfsJebKqXNH5kcPmiHr6fhoGfJ2wqoev5BMCxNhV83wz
 gR/g3hESbdDUXF8gW0r8HmjtOOvkFN+1z/f4YJ83qrAvNfaNKiQGzABiCnEeGpmfrfMc
 LS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685974294; x=1688566294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkFk+WRaK8DJpCbECdgTGImYYiJ/3koxt3S/LYx6+NI=;
 b=LyD6TxeT1IqQFdsagIklAENCFPqB69pB4lB9pmC/rgt6FUXgKID2L1TRra2ddoUrqj
 9w93L83CaTsWy5x9flmNls0RpJ6NpK3uoKpP17pmuFpYNMUW6Xplgl8ap7N+TDwRt7CG
 2L9vW+Vd/lXPDggjhlfT+DkAr2CnLx5PG/Q/WsSaLjoYljI1R6NJjwpS6qYYCF6vy2Dp
 YcZy1YFfmGEx8gvcWBCdgGEFrjR/bKCmwj6f2eP3ITtgef7FBPXrk4AOPl5XF2ei3qc1
 I9viPMklHCeutvjP5ebKoXdSLAWumTS7FgS2Tbh2d7ysIw09PdTECmcGAAeDdnycuu4n
 gh0g==
X-Gm-Message-State: AC+VfDzduPSb7hbJtIDAkkWF+hvc5A2BuDrQ16/EmwxJ7nNZVyRqNxA5
 gL3jEYXeqjJ02w+m1L4o38lCYAyeo5d/3LirzI0=
X-Google-Smtp-Source: ACHHUZ680CB8KjSWlMoL0v9AipVoZynv3S0bgcUM2Fp8Hq0bmrpPBfrv49GwoX/ubuRiXv+W47DzK8ZeRBFn4Ove42Y=
X-Received: by 2002:a4a:d0a7:0:b0:558:cb7e:c52e with SMTP id
 t7-20020a4ad0a7000000b00558cb7ec52emr2271841oor.8.1685974294353; Mon, 05 Jun
 2023 07:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
 <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
 <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
 <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
In-Reply-To: <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Jun 2023 10:11:23 -0400
Message-ID: <CADnq5_MCXgtxNB_WBfAw+ZSKNeczSYL7gZPkpqqJ859G=LYkgA@mail.gmail.com>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
To: Felix Richter <judge@felixrichter.tech>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 3, 2023 at 10:52=E2=80=AFAM Felix Richter <judge@felixrichter.t=
ech> wrote:
>
> Hi Guys,
>
> sorry for the silence from my side. I had a lot of things to take care
> of after returning from vacation. Also I had to wait on the zfs modules
> to be updated to support kernel 6.3 for further testing.
>
> The bad news is that I am still experiencing issues. I have been able to
> get a reproducible trigger for the buggy behavior. The moment I take a
> screenshot or any other program like `wdisplays` accesses the screen
> buffer the screen starts flickering. The only way to reset it is to
> reboot the machine or log out of the desktop.
>
> With this I did a bisection to figure out which commit is responsible
> for this. I attached the logs to the mail. The short version is that I
> identified commit 81d0bcf9900932633d270d5bc4a54ff599c6ebdb as the
> culprit. Seems that there are side effects of having more flexible
> buffer placement for the case of the internal GPU. To verify that this
> actually is the cause of the issue I built the current archlinux kernel
> with an extra patch to revert the commit:
> https://github.com/ju6ge/linux/tree/v6.3.5-ju6ge. The result is that be
> bug is fixed!

+ Hamza

This is a known issue.  You can workaround it by setting
amdgpu.sg_display=3D0.  It should be issue should be fixed in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D08da182175db4c7f80850354849d95f2670e8cd9

Alex



>
> Now if this is the desired long term fix I do not know =E2=80=A6
>
> Kind regards,
> Felix Richter
>
> On 02.05.23 16:12, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 02.05.23 15:48, Felix Richter wrote:
> >> On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>> On 02.05.23 15:13, Alex Deucher wrote:
> >>>> On Tue, May 2, 2023 at 7:45=E2=80=AFAM Linux regression tracking (Th=
orsten
> >>>> Leemhuis)<regressions@leemhuis.info>  wrote:
> >>>>
> >>>>> On 30.04.23 13:44, Felix Richter wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> I am running into an issue with the integrated GPU of the Ryzen 9
> >>>>>> 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
> >>>>>> The bug materializes in from of my monitor blinking, meaning it
> >>>>>> turns full white shortly. This happens very often so that the
> >>>>>> system becomes unpleasant to use.
> >>>>>>
> >>>>>> I am running the Archlinux Kernel:
> >>>>>> The Issue happens on the bleeding edge kernel: 6.2.13
> >>>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
> >>>>>>
> >>>>>> I have two monitors attached to the system. One 42 inch 4k Display
> >>>>>> and a 24 inch 1080p Display and am running sway as my desktop.
> >>>>>>
> >>>>>> Let me know if there is more information I could provide to help
> >>>>>> narrow down the issue.
> >>>>> Thanks for the report. To be sure the issue doesn't fall through th=
e
> >>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regres=
sion
> >>>>> tracking bot:
> >>>>>
> >>>>> #regzbot ^introduced v6.1..v6.2
> >>>>> #regzbot title drm: amdgpu: system becomes unpleasant to use after
> >>>>> monitor starts blinking and turns full white
> >>>>> #regzbot ignore-activity
> >>>>>
> >>>>> This isn't a regression? This issue or a fix for it are already
> >>>>> discussed somewhere else? It was fixed already? You want to clarify
> >>>>> when
> >>>>> the regression started to happen? Or point out I got the title or
> >>>>> something else totally wrong? Then just reply and tell me -- ideall=
y
> >>>>> while also telling regzbot about it, as explained by the page liste=
d in
> >>>>> the footer of this mail.
> >>>>>
> >>>>> Developers: When fixing the issue, remember to add 'Link:' tags
> >>>>> pointing
> >>>>> to the report (the parent of this mail). See page linked in footer =
for
> >>>>> details.
> >>>> This sounds exactly like the issue that was fixed in this patch whic=
h
> >>>> is already on it's way to Linus:
> >>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f=
80850354849d95f2670e8cd9
> >>> FWIW, you in the flood of emails likely missed that this is the same
> >>> thread where you yesterday replied "If the module parameter didn't he=
lp
> >>> then perhaps you are seeing some other issue.  Can you bisect?". That=
's
> >>> why I decided to add this to the tracking. Or am I missing something
> >>> obvious here?
> >>>
> >>> /me looks around again and can't see anything, but that doesn't have =
to
> >>> mean anything...
> >>>
> >>> Felix, btw, this guide might help you with the bisection, even if it'=
s
> >>> just for kernel compilation:
> >>>
> >>> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.=
html
> >>>
> >>> And to indirectly reply to your mail from yesterday[1]. You might wan=
t
> >>> to ignore the arch linux kernel git repo and just do a bisection betw=
een
> >>> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were y=
ou
> >>> I'd also try 6.3 or even mainline before that, in case the issue was
> >>> fixed already.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@feli=
xrichter.tech/
> >>>
> >> Thanks for the pointers, I'll do a bisection on my desktop from 6.1 to
> >> the newest commit.
> > FWIW, I wonder what you actually mean with "newest commit" here: a
> > bisection between 6.1 and mainline HEAD might be a waste of time, *if*
> > this is something that only happens in 6.2.y (say due to a broken or
> > incomplete backport)
> >
> >> That was the part I was mostly unsure about =E2=80=A6 where
> >> to start from.
> >>
> >> I was planning to use PKGBUILD scripts from arch to achieve the same
> >> configuration as I would when installing
> >> the package and just rewrite the script to use a local copy of the
> >> source code instead of the repository.
> >> That way I can just use the bisect command, rebuild the package and te=
st
> >> again.
> > In my experience trying to deal with Linux distro's package managers
> > creates more trouble than it's worth.
> >
> >> But I probably won't be able to finish it this week, since I am on
> >> vacation starting tomorrow and will not have access to the computer in
> >> question. I will be back next week, by that time the patch Alex is
> >> talking about might
> >> already be in mainline. So if that fixes it, I will notice and let you
> >> know. If not I will do the bisection to figure out what the actual iss=
ue
> >> is.
> > Enjoy your vacation!
> >
> > Ciao, Thorsten
