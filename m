Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646B6F44D3
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A65310E32D;
	Tue,  2 May 2023 13:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEDA10E24E;
 Tue,  2 May 2023 13:13:31 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-38dfdc1daa9so2295414b6e.1; 
 Tue, 02 May 2023 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683033210; x=1685625210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUEF3QLxn693rhXEaa/WFrAyt3GuRVvWAiFCi9LSxcE=;
 b=McJXSsAU5Kv+u7NJNkICwAIOR4MvXA5FzSyceSQyzzQVCvUrQAIBXdDLu+jLBJRSyH
 fhG6nLkQ+v+55EZoYF8f0s/3hI6JQvjXLlHpXHQ69WpwYiNElrf/63p2QdSB+O8KufCT
 uuLYqd/f/EFc4G9GKiMApMFMoy5Eq8W0W9KlhI2ezHtCc1W2yNZDFdMeyLkSAsjgpFlM
 vhWY1ESgKvfonCglKqFLulvr93RSkKxuCb010MegetYJtgEAAO01i0Jul8LYmWOrgT0Z
 5yxn2Qw/bp/qT2RaHm/2HXgqK5nvfh50XjUMOfx2G33AXTuYmjx4ELMtPaiHfvl+klGK
 izrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683033210; x=1685625210;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUEF3QLxn693rhXEaa/WFrAyt3GuRVvWAiFCi9LSxcE=;
 b=icq/TrXCxql6FwLitkwy0zGptLh5bqwYa2kxUqgxFjdDnXValZaEjyyutlF+8WBNDH
 v6lVblrqU3+Eq+iNThR6Y7FUTcnVgDbduvxjqVBA/gqOlSM5ISiICAYoFflC9FU5MpLG
 VWRfkxdY0FIsrFdPvqV64C5G1fr93XIzlsbrAG0NXb+puMdYIhDMhA9ycUFu6cF45DV9
 EgEj7COPzHn08GVQk2TISLkWLbTi0Dq2TVl47e+E8CFRu+K6LXdSymBoGPM+mwjvQq+n
 zfKVfijp9sZFqpqS8SnDCUxssEPIo7/7j22Ko4u/d1lQ6bDCO4OlbmW4WwrdXuYkb5ZQ
 JpPA==
X-Gm-Message-State: AC+VfDwlSO/XK4Khe7J0wstx/GiNWnD+lCEzEFOIJjYiusrzC6JsSFfG
 HL7evaerfHHVe44QddE5e9RG7tTwbVBmOTIN7bdDVgHDVXg=
X-Google-Smtp-Source: ACHHUZ6aRVheMqHSh8QUmB0hKQpMwgH2/GyX3GEgmh2IQMnlT7Oe56Km5F6q9EowHCCWC2dThF6LQAf2An0Psav2uq4=
X-Received: by 2002:a05:6808:4285:b0:38d:f03f:935b with SMTP id
 dq5-20020a056808428500b0038df03f935bmr8748291oib.24.1683033210002; Tue, 02
 May 2023 06:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
In-Reply-To: <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 May 2023 09:13:18 -0400
Message-ID: <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
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

On Tue, May 2, 2023 at 7:45=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
>
> On 30.04.23 13:44, Felix Richter wrote:
> > Hi,
> >
> > I am running into an issue with the integrated GPU of the Ryzen 9 7950X=
. It seems to be a regression from kernel version 6.1 to 6.2.
> > The bug materializes in from of my monitor blinking, meaning it turns f=
ull white shortly. This happens very often so that the system becomes unple=
asant to use.
> >
> > I am running the Archlinux Kernel:
> > The Issue happens on the bleeding edge kernel: 6.2.13
> > Switching back to the LTS kernel resolves the issue: 6.1.26
> >
> > I have two monitors attached to the system. One 42 inch 4k Display and =
a 24 inch 1080p Display and am running sway as my desktop.
> >
> > Let me know if there is more information I could provide to help narrow=
 down the issue.
>
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
>
> #regzbot ^introduced v6.1..v6.2
> #regzbot title drm: amdgpu: system becomes unpleasant to use after
> monitor starts blinking and turns full white
> #regzbot ignore-activity
>
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
>
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.

This sounds exactly like the issue that was fixed in this patch which
is already on it's way to Linus:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f8085035=
4849d95f2670e8cd9

Alex

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
