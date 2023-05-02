Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6A6F452F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205A10E179;
	Tue,  2 May 2023 13:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A9310E14B;
 Tue,  2 May 2023 13:40:04 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3909756b8b1so1286335b6e.1; 
 Tue, 02 May 2023 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683034802; x=1685626802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKcfAF6KINjL+mhueJ06hhK8JKb3TbN7Sn3jg5eeAJE=;
 b=JpcYZT9ej5ebKzDmFamygro0+N8rzk2r26+WdfZHpliiIujvzJ1Q91SQJBhZhgFH8A
 0IDR4EP907ETyi5B838FK5CeyESxwUTC6EEwEYCOM7BJXCoAoOIDbjW8/1KuS47IrKXY
 U3PtZaHuwyw+Qisy2CreyAVc/7AtykGPbGyxh1ovxrU84K22MeboTPA9XvPjgPRBc8WE
 aHQwq6+6qQJXhoF2hrXAZIXHCnR2YidYr6sohD6pdLfnIeoWq4MnEYOPFoFqtRr4wK8z
 LhuL+xVkL8bxL1X/dvtCZsoi/teCf5izczF/nNoMRvidzM9ABM+PKjYWpV6xEh5dpZ6h
 6jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683034802; x=1685626802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKcfAF6KINjL+mhueJ06hhK8JKb3TbN7Sn3jg5eeAJE=;
 b=P+UsKTnAHJKTtQnmIdgmb0ArH0U4lik5v8A1+Ru2gxWDGq/sxLw399id+GtWXzRnAp
 d0Bu1MrWmOf9Czr8kxgBBXqqVBlIgRlen0vSVQp9GVv5KsZ9vHpC7JoVD6k8nsq7mBqG
 rZGHedvhpF6xfhyj1/tGZH8tQS6lEAzIwzaIJNpx50HYEKnSLy7Hk/8zLUwe8bGxTbtk
 8wcbyL/AAI3ZNIjG9o4DBoTA5sgDEbFk/wvPmXflgv1kO90GsAksfwJNiIm6oZdeVP1x
 40nRweEqQE3wpoIStY3ZiK/ui1EZXzrnpfsLiCvWxsLDbbUKk3wdSRZ5ESzNMh0XMJ5I
 C0kw==
X-Gm-Message-State: AC+VfDz3nhx5H40hREg0LOT97poL5hbRuM7LlGR8JLY3oru0ugU61WZi
 uJcTozurmNrEUSPB5n36+u5SRDaD38S7j84hRMc=
X-Google-Smtp-Source: ACHHUZ45XjnZrpnddK50Amaui8qF7w+xuklino4TUqS7xCTDxvj/Jyy9FWnI8lFNoDIxkT3Ehk0cgHlfNjQAbH3Cm1A=
X-Received: by 2002:a05:6808:9b3:b0:38e:a4a6:41a with SMTP id
 e19-20020a05680809b300b0038ea4a6041amr7369798oig.20.1683034802540; Tue, 02
 May 2023 06:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
In-Reply-To: <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 May 2023 09:39:51 -0400
Message-ID: <CADnq5_MLuGt4Ru3KaH24f+8RVUGYj2BAOSYvU=nWrrAO6zqyUw@mail.gmail.com>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Felix Richter <judge@felixrichter.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 9:34=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 02.05.23 15:13, Alex Deucher wrote:
> > On Tue, May 2, 2023 at 7:45=E2=80=AFAM Linux regression tracking (Thors=
ten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> >
> >> On 30.04.23 13:44, Felix Richter wrote:
> >>> Hi,
> >>>
> >>> I am running into an issue with the integrated GPU of the Ryzen 9 795=
0X. It seems to be a regression from kernel version 6.1 to 6.2.
> >>> The bug materializes in from of my monitor blinking, meaning it turns=
 full white shortly. This happens very often so that the system becomes unp=
leasant to use.
> >>>
> >>> I am running the Archlinux Kernel:
> >>> The Issue happens on the bleeding edge kernel: 6.2.13
> >>> Switching back to the LTS kernel resolves the issue: 6.1.26
> >>>
> >>> I have two monitors attached to the system. One 42 inch 4k Display an=
d a 24 inch 1080p Display and am running sway as my desktop.
> >>>
> >>> Let me know if there is more information I could provide to help narr=
ow down the issue.
> >>
> >> Thanks for the report. To be sure the issue doesn't fall through the
> >> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regressio=
n
> >> tracking bot:
> >>
> >> #regzbot ^introduced v6.1..v6.2
> >> #regzbot title drm: amdgpu: system becomes unpleasant to use after
> >> monitor starts blinking and turns full white
> >> #regzbot ignore-activity
> >>
> >> This isn't a regression? This issue or a fix for it are already
> >> discussed somewhere else? It was fixed already? You want to clarify wh=
en
> >> the regression started to happen? Or point out I got the title or
> >> something else totally wrong? Then just reply and tell me -- ideally
> >> while also telling regzbot about it, as explained by the page listed i=
n
> >> the footer of this mail.
> >>
> >> Developers: When fixing the issue, remember to add 'Link:' tags pointi=
ng
> >> to the report (the parent of this mail). See page linked in footer for
> >> details.
> >
> > This sounds exactly like the issue that was fixed in this patch which
> > is already on it's way to Linus:
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f808=
50354849d95f2670e8cd9
>
> FWIW, you in the flood of emails likely missed that this is the same
> thread where you yesterday replied "If the module parameter didn't help
> then perhaps you are seeing some other issue.  Can you bisect?". That's
> why I decided to add this to the tracking. Or am I missing something
> obvious here?

Sorry, from the wording of the message, it looked like you had missed
the earlier part of the thread.

Alex

>
> /me looks around again and can't see anything, but that doesn't have to
> mean anything...
>
> Felix, btw, this guide might help you with the bisection, even if it's
> just for kernel compilation:
>
> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.html
>
> And to indirectly reply to your mail from yesterday[1]. You might want
> to ignore the arch linux kernel git repo and just do a bisection between
> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were you
> I'd also try 6.3 or even mainline before that, in case the issue was
> fixed already.
>
> [1]
> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@felixric=
hter.tech/
>
> Ciao, Thorsten
