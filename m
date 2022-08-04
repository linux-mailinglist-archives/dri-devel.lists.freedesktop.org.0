Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC7589751
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 07:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49E2AE3B;
	Thu,  4 Aug 2022 05:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDDF8D07D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 05:25:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id tl27so17072556ejc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 22:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WGTQSI2IDsep0Ep5FWuQwgSDPWRRC7GjkzJ83Cekmfs=;
 b=Zy8HoBrD482o0HXyIVzu9RXswuhGZryy6gWwsEAkcgFis3yd4cHkmfpbyU6PZBiUin
 /yy5C6sLzs6RYHAMFDwtQTKTHRCvq2+t1A1R5F3LqVtDMCk3UMscBfA7c0BtMfN5+TOm
 aY7XPZ9v9yVanu0GGoWCIliPpWPKmBY5V/v6wLjthGnym6Xd6q92J9xL4TrTHt+7cPKJ
 satCuJlS8IAevD9NS4HuDG5FzF9v6OSVLZdQ001uSC1D9ZgfLycnI6nZibeaAyt60gxW
 bRF7po+bTs7g3pCAmSMtMesNuaPpnRCPOjsGB30prKYGa5dIYjsWBrH2Kpz6EXkmvNtQ
 0Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WGTQSI2IDsep0Ep5FWuQwgSDPWRRC7GjkzJ83Cekmfs=;
 b=fopy9hNQz6NKOOHj/mUIfanM6wlWjPvwi8TAa4h6Z4TPpKFx0zIDw0M65pkEh4LTb4
 MKig2r3Hn09DJz8pKbufNyVKVVXBYYW8qE4sJQYkXC5Qmjhu7qmwBBPlZ1fbcFssr5SC
 4KBfZhFoQVUd33fSzCn5ovrqywugFDC4qxAiJ2HkpiKCWBcGmXwDe+9u1zq2eFCn2heU
 rFRSpCTvP9aN5SPwF+e3hdfqwjpieNpyLU7ZMyDUBmFdMU4TPwLEzPOpzLtdX/UgC/E5
 hMVb2p2K+YAE/cwCicQwKYro8dy/nuqXG5GYTjJEgHqrCS0TsVN22vokqbrNYq7tWK3u
 JkOA==
X-Gm-Message-State: ACgBeo3uOd1MGvchNLjTU6+i4WB24jiUcrWV6n7pEX4Oeo9zWSh0XPXP
 FPILigfaublWTMH9nsAEp72s3UJo5dwHymgXeDI=
X-Google-Smtp-Source: AA6agR6cQoFYWdNihZ9jcq0oWE0SS71XYkuqIcIySvpAa4kd8U41krPCRaiIHhK4ubW+zc9nbArvEkHl3hzwDzqRUCA=
X-Received: by 2002:a17:907:6eac:b0:730:a07f:38bb with SMTP id
 sh44-20020a1709076eac00b00730a07f38bbmr149703ejc.750.1659590746620; Wed, 03
 Aug 2022 22:25:46 -0700 (PDT)
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
In-Reply-To: <CAHk-=wih3NEubvTye4URZOmLYu6G+ZT9cngepo0z++ogCWUymQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 15:25:35 +1000
Message-ID: <CAPM=9twRb4c62e0mU9CwOTAYMkR6YCRR5=KLTrSKoLbJ7RB9xw@mail.gmail.com>
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

On Thu, 4 Aug 2022 at 14:46, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Aug 3, 2022 at 9:27 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'll do a few more. It's close enough already that it should be just
> > four more reboots to pinpoint exactly which commit breaks.
>
> commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f is the first bad commit.
>
> I think it's supposed to make no semantic changes, but it clearly does.
>
> What a pain to figure out what's wrong in there, and I assume it
> doesn't revert cleanly either.
>
> Bringing in the guilty parties. See
>
>   https://lore.kernel.org/all/CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com/
>
> for the beginning of this thread.

I think I've tracked it down, looks like it would only affect GFX8
cards, which might explain why you and I have seen it, and I haven't
seen any other reports.

pretty sure you have an rx580, and I just happen to have a fiji card
in this machine right now.

I'll retest on master and send you a fixup patch.

Dave.
