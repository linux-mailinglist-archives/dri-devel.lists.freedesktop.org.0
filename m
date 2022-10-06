Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC845F6E39
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE9710E08D;
	Thu,  6 Oct 2022 19:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777310E08D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:28:40 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 i25-20020a4a8d99000000b0047fa712fc6dso916015ook.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QylbASj8mHMoZsensOf73cgYUPu6ciE5d8nOL8LnqTw=;
 b=GVveOlL1VjgEAGjoHyLhI8srzUiM+TTa6AisI33mOwo29FUxPFH3pUyhV7rqYAbR2a
 O1xyWQ6JDA7r9Ql4bfGTVWs84D1mkmsOzlrmGHnm3ct0NUm1bXfxPj6R2BFNKYvnHGW8
 wfb3nY4hnMxN3Av6FeWdMUDs1qAv3Tyy1Q6n4TCQeFrnbliWL/P4KAtIiZRu4srskDxv
 tJoxWpyirqYAhUWoL3FRfQdDddBGWzZup+QMtVtxJnWUdwBUOopRaRBhy+UZB6rWJql+
 lAH4T7wgVKW0/9mMR3ZKUHp/fKfDgx4Z8oEKyizhyiiqdUxL+/rrcI0wemV5+13VD3lh
 AxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QylbASj8mHMoZsensOf73cgYUPu6ciE5d8nOL8LnqTw=;
 b=Y7T5kyw2cR3YmTehp5h8njtSN/RD9Kf+UBbe9+aJQYtyeVeaiwqwO8u39j7Opiz/JF
 HOoGf/PqyrXW3GP0FMCRAFI814uZUwbPsYcOYbtnP2Fgb8lHz+OW72UcP/kr46OeSINZ
 WZfhVL98kOx1AwO9mu+bGOFLOwqSrXL5E4YZCaPtT5/OKWJaz66grCcYr9zQYwdnxFmo
 Kwnvew6+s7C4+R8LWtq9mq9mwJ4AAGaGXYiULdwAAxLmIMPRSTLC9FBpQB9oN8OttXc2
 C/KTAil76MQX9zd12T+FT8BgAie1NO4UVGPV548rhtdW5jiIPoJDA0qArCe4F5xrULyI
 1Idw==
X-Gm-Message-State: ACrzQf3JrjE0z6RCOT5c8TDSphtFUNRaSvALkDvXAc+qEefRDu9wnALw
 lUdrd7bX4s6o0d4+bPJq6A4hCbAAeAlGqxyK1yc=
X-Google-Smtp-Source: AMsMyM40pemucAMFt3x2dRzM1fcF+9+BTps0a0I4ERP0s9acIagU6U36M5B5fb0R3kh6xLHbX/596A/Fd8ZmTSFD944=
X-Received: by 2002:a9d:6215:0:b0:660:f41e:513a with SMTP id
 g21-20020a9d6215000000b00660f41e513amr619627otj.123.1665084520085; Thu, 06
 Oct 2022 12:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
In-Reply-To: <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Oct 2022 15:28:28 -0400
Message-ID: <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 2:48 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Oct 4, 2022 at 8:42 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > Lots of stuff all over, some new AMD IP support and gang
> > submit support [..]
>
> Hmm.
>
> I have now had my main desktop lock up twice after pulling this.
> Nothing in the dmesg after a reboot, and nothing in particular that
> seems to trigger it, so I have a hard time even guessing what's up,
> but the drm changes are the primary suspect.
>
> I will try to see if I can get any information out of the machine, but
> with the symptom being just a dead machine ...
>
> This is the same (old) Radeon device:
>
>    49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)
>
> with dual 4k monitors, running on my good old Threadripper setup.
>
> Again, there's no explicit reason to blame the drm pull, except that
> it started after that merge (that machine ran the kernel with the
> networking pull for a day with no problems, and while there were other
> pull requests in between them, they seem to be fairly unrelated to the
> hardware I have).
>
> But the lockup is so sporadic (twice in the last day) that I really
> can't bisect it, so I'm afraid I have very very little info.
>
> Any suggestions?

Maybe you are seeing this which is an issue with GPU TLB flushes which
is kind of sporadic:
https://gitlab.freedesktop.org/drm/amd/-/issues/2113
Are you seeing any GPU page faults in your kernel log?

Alex
