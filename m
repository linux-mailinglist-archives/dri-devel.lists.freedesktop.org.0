Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA84F4108C5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 00:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB3C6E11E;
	Sat, 18 Sep 2021 22:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8A56E11E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 22:00:56 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 72so17569409qkk.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=st5UJCa4WvVb/TsD4KIdOP8PiodC67vTxLl0JLmKI38=;
 b=E+MfgHtzbDynIbAqx4TbCI1RkzKnMKiC26x3c+X6lXXLy5eVBhn4EtFxrPW/aOwBd1
 RTguva1ac7xjIUTKoxNWgGEOyjw8UrrCxmbvBLogYOWdQCX81v1ht7utkbYwgLWWjkyJ
 f4BZHU5pAwtdPK65rGTo4gFXZs77N294L1+LQ+j4w9M+D4KPJkr6a464AIEUx9a4Fh2z
 TeAWoQOBfxqsr74VUxji0QXLKWuJcf7dqnl7+RVB5+eseOteZ7bJT/LNEMg1LWHkoGNh
 GbxJWd3KDj7L1PIP8Z/eobAUPFjL6BSOdf2H1izpfPiBRc38PjjspDXUANT+BdtRs8pv
 R4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=st5UJCa4WvVb/TsD4KIdOP8PiodC67vTxLl0JLmKI38=;
 b=U9SwPFBEAMwLcSug2rprgUfEqPG62gG3gBSnGQGXIWRLGAf8cX8hwsV5DFB6abzPEl
 FwtxR53rUyaWnvuuDv6LfyadGHuZmfkQz+CBkXARAmxYfZnDvE8e8fmrc2DwmVyKh2gA
 Lao/0u4gc2s0dzOvHP8mNSXrALnoCpqyG5/g9XhvCuyqCzLfnfYaqWNJ3zXe5wAkPF+p
 MNkdEImZ4uBcnToScd01xEg8su9WSq7XQdsRN8X0xW3UVPpqamGu7Fw8lNw//tBynpmC
 faSgyoTGhxrVUfoJLrtpS9Vm9HpSZbB8teH/l+i+FnlEf/Yh8DZ2K5wZNPm8sbMj90Ot
 D/Qg==
X-Gm-Message-State: AOAM532MyzpwJqxrm5fJbw/1/1A+NG/rJWQm8VRPWnEYYpyo220azEjo
 knxb2gzXPt93FCAnBLjBQS31slOJUTBMUvwElIs=
X-Google-Smtp-Source: ABdhPJw5BmjSXmbSbjXMmWKebBsnmITYFKXhIn0R+a2vkCT2mtDohZYYD4ndjeWppCe5Brn6WE0r5HXfBnyYvPVOfps=
X-Received: by 2002:a25:2142:: with SMTP id h63mr22414639ybh.70.1632002455618; 
 Sat, 18 Sep 2021 15:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
In-Reply-To: <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 18 Sep 2021 23:00:19 +0100
Message-ID: <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Stapelberg <michael@stapelberg.ch>,
 Maxime Ripard <maxime@cerno.tech>, 
 Emma Anholt <emma@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Sat, Sep 18, 2021 at 8:24 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 18, 2021 at 2:18 AM Michael Stapelberg
> <michael@stapelberg.ch> wrote:
> >
> > torvalds at linux-foundation.org (Linus Torvalds) writes:
> > > Did I fix it up correctly? Who knows. The code makes more sense to me
> > > now and seems valid. But I really *really* want to stress how locking
> > > is important.
> >
> > As far as I can tell, this merge conflict resolution made my Raspberry
> > Pi 3 hang on boot.
>
> Ok, that's a different merge issue than the locking one (which is
> about the amd ttm code).
>
> But the VC4 driver did have changes close to each other in the hdmi
> detection and clock setting code.
>
> And it doesn't seem to be just RPi3, there was a report back a couple
> of weeks ago about RPi4 also having regressed (with an Ubuntu
> install). That one was an oops in vc4_hdmi_audio_prepare(). I don't
> know if that got resolved, I heard nothing about it after the report.

Its still there. I am seeing it every night. This was from last night
- https://lava.qa.codethink.co.uk/scheduler/job/164#L1356
Last night's test was on top of 4357f03d6611 ("Merge tag 'pm-5.15-rc2'
of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")


-- 
Regards
Sudip
