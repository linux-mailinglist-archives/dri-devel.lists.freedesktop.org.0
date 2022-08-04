Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603B58978F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 07:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E8111AD58;
	Thu,  4 Aug 2022 05:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C924113C5D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 05:52:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o22so8508784edc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 22:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ycPE2Cu6aU1QIKtvU9pwb7W6byoSfFvVJ1sdHjuliz0=;
 b=HzswFvQeQsQn9alrwZKXZKVRit/CaeV8RbluY0O/DRYlsRbfuXQnL1uL8uWRVB0Omj
 khkn4DA6JrOZLPQPHV4OFhFXjyG0QuT8m3iDgSi5gcXuB0JdJrHF/SczsGMCKtVc3YXH
 3dswerDAZseU3dJdTTbsaxCOgB/7l6aQsraS0744fUkhph8pM3tKVGXSOpvrw90/GklO
 sgGucl390L5rNGJkp+HgIEf+dAn94TcNd71N8OoXe7ZHxUT+VDq2kUu0mdRW0lzAwD5z
 9eWMAIeI6M4wEbMTS+H3KzY7BZQ1iY1Jy2MC4CmwnoWo0x7Z3D0/2rlzmF5cWy0W/0Kx
 lAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ycPE2Cu6aU1QIKtvU9pwb7W6byoSfFvVJ1sdHjuliz0=;
 b=Ppacy3LHTI6Gb0wIyXMw6BO22vWnDQ87qPfTCKOhqyyhoF/rsmAKal3riiXZY7GOF+
 4NZRRRNrNdYN4Av9NTyx88izpyt4rIDW7qZpjlNknBSVBFGYADPBYETW7Cv1HxVZJnon
 r0yy8J8+XYk8mCXitxAkh1lxmHzkiYkvNsryCa2fHWdwebOQvMZb1oSUi/wfm1GSuxoB
 DtFacJX180Kn9E4/6aGCGXHTrp9HgvQAWmpaMgOGuH8HPpPAUlHiXHlbx80VGUc6nQJy
 nWJq6OQke+32AdJ6173r08bzHayIPodQL5j7MUHtjV/YmgK6SU2inRWzMakKOwDXZRYt
 oc2Q==
X-Gm-Message-State: ACgBeo11jzhfuy2DSJV0Zg3MgYii9TZTYXs0N+QqEMqhL50pWEoXkmw2
 JBDxjCKHR9Xg3YlBocyf/Sb6fWboJHhgHMcPrA36EyHU3cM=
X-Google-Smtp-Source: AA6agR4aEuVjdYTMIi8ac+Iz6qf8aed84F8hlkR46UR6fpb5wbCPkpqpsKl5eJFrYNj6fAQX4RccW8dPPcARAriLBuI=
X-Received: by 2002:a05:6402:249b:b0:43c:8ce6:8890 with SMTP id
 q27-20020a056402249b00b0043c8ce68890mr355130eda.74.1659592356779; Wed, 03 Aug
 2022 22:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
 <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
 <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
 <CAPM=9twUvRoVcWHhBH7yuDDVj8K8aM0APQ8Yx3cx19keLJP8Gg@mail.gmail.com>
 <CAHk-=wjbfAuN1eV+F0wWFsWEaMmJsT2p3DXnUvxo7bQ-xJwKCQ@mail.gmail.com>
 <CAHk-=wih3NEubvTye4URZOmLYu6G+ZT9cngepo0z++ogCWUymQ@mail.gmail.com>
 <CAPM=9twRb4c62e0mU9CwOTAYMkR6YCRR5=KLTrSKoLbJ7RB9xw@mail.gmail.com>
In-Reply-To: <CAPM=9twRb4c62e0mU9CwOTAYMkR6YCRR5=KLTrSKoLbJ7RB9xw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 15:52:25 +1000
Message-ID: <CAPM=9txwzNZgUCJUTxww3hYmTnbrNH-2zdjxamxB4=yW9sFHxQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 15:25, Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 4 Aug 2022 at 14:46, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Aug 3, 2022 at 9:27 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > I'll do a few more. It's close enough already that it should be just
> > > four more reboots to pinpoint exactly which commit breaks.
> >
> > commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f is the first bad commit.
> >
> > I think it's supposed to make no semantic changes, but it clearly does.
> >
> > What a pain to figure out what's wrong in there, and I assume it
> > doesn't revert cleanly either.
> >
> > Bringing in the guilty parties. See
> >
> >   https://lore.kernel.org/all/CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com/
> >
> > for the beginning of this thread.
>
> I think I've tracked it down, looks like it would only affect GFX8
> cards, which might explain why you and I have seen it, and I haven't
> seen any other reports.
>
> pretty sure you have an rx580, and I just happen to have a fiji card
> in this machine right now.
>
> I'll retest on master and send you a fixup patch.

To close the loop

https://lore.kernel.org/all/20220804055036.691670-1-airlied@redhat.com/T/#u

Seems to fix it here.

Dave.
