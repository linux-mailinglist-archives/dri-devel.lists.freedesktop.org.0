Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1577523449
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29BF10E2BF;
	Wed, 11 May 2022 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044E210E2BF;
 Wed, 11 May 2022 13:33:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so3251313wmj.1; 
 Wed, 11 May 2022 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ksy6PHWBR9sVN5QwB4AlZVRAOWKrGBlUQcJanMtrZ1E=;
 b=mTDzNH2v16tSY8KR9n8XYuM9TmRFKMujDftxz6TIj6GtwaEOz1nHkwh9I23i0T3HdH
 FkRLXEX5SaHr/3aMMMm7OL/M/d+MaFHllgpxQm/fpYTPdAYgalEfYfqkuEUtmA93LCsz
 KTJ+dEbvn9aYPq/m/ywGmSofzC6L8X7kJ7GhdUszaeH8/X2mdeXpmjdv+8MkkdGJOkK5
 Gy7x53+7PYcENNJD+lBQtTteeSN2J6383EG33+HODXzESWqPsDZuh/g7svvE1fImNNif
 2mBzCB9nkBhxa2kVXx1d4gGeBI3j+8uRsqTkVokwRaI4RP3uLnVC7AdoYvSvrUEYrboU
 /Gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ksy6PHWBR9sVN5QwB4AlZVRAOWKrGBlUQcJanMtrZ1E=;
 b=Gj3N+2oL/Q2dBxA5vej5n3UctPrzxSH50iShIui66zEEYwm/mALowM6s+RJ34Iyygv
 QE145Kf6si6SkE1i4/tTYSE5iDMw7YNToO3v9qacOlzvhADtRXfsjgGR1WJiZgnxUO0W
 1ABaSPRjyoYPD04kwjLtdVPz5GSpOynDjGvycj/HXG3NN9cSghyNrpOoUYN1PW0Hs/4A
 9iyyvVGSX8e1fLsSwq9T1hatmGlPh0l9wI2S2DEsWNpQaC/oGQd3a/Pzp3vPPO5vxjiP
 7APZ3inRjytMg68rsAb35TDRaEFFJtWZSYxVTaJna4eU5q0u7QrZxQ3Xuj8WYW6C4oW8
 9dEg==
X-Gm-Message-State: AOAM532GMDE7fl8mHLdCP4c4ivjOY8BDEp5/+IGss//bkRfImYS3IpZo
 xgOjUDLMIcfrnXq5MLyRSPEfa89Lz1eddl3vROE=
X-Google-Smtp-Source: ABdhPJx0HsNmN6aXZ/qgME3QoitJWXJwbYBVMkQDcpQpvHLbKrddWJTuykdpvOlgA7X5TIZWTNkDfYvdnRN4NLyIp6Q=
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr4952413wmg.102.1652276022494; Wed, 11
 May 2022 06:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com>
 <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
 <YnujG0nkF0U6d5kd@kroah.com>
In-Reply-To: <YnujG0nkF0U6d5kd@kroah.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 May 2022 06:33:32 -0700
Message-ID: <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC v2]
 drm/msm: Add initial ci/ subdirectory
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Sean Paul <sean@poorly.run>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 4:50 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 11, 2022 at 12:26:05PM +0200, Michel D=C3=A4nzer wrote:
> > On 2022-05-11 08:22, Greg Kroah-Hartman wrote:
> > > On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
> > >>> And use it to store expectations about what the drm/msm driver is
> > >>> supposed to pass in the IGT test suite.
> > >>
> > >> I wanted to loop in Linus/Greg to see if there are any issues raised
> > >> by adding CI results file to the tree in their minds, or if any othe=
r
> > >> subsystem has done this already, and it's all fine.
> > >
> > > Why does the results need to be added to the tree?  Shouldn't they be
> > > either "all is good" or "constantly changing and a constant churn"?
> > >
> > >> I think this is a good thing after our Mesa experience, but Mesa has=
 a
> > >> lot tighter integration here, so I want to get some more opinions
> > >> outside the group.
> > >
> > > For systems that have "tight integration" this might make sense as pr=
oof
> > > that all is working for a specific commit, but I can't see how this w=
ill
> > > help the kernel out much.
> > >
> > > What are you going to do with these results being checked in all the
> > > time?
> >
> > Having the expected results in the tree keeps them consistent with the =
driver code itself, and allows putting in place gating CI to prevent mergin=
g driver changes which make any of the tests deviate from the expected resu=
lt.
>
> Shouldn't "expected result" always be "pass"?
>
> If not, then the test should be changed to be "skipped" like we have
> today in the kselftest tests.

No, we want to run tests even if they are expected to fail.  This
prevents the scenario of a test getting fixed without being noticed
(for ex, developer was working on fixing test A and didn't notice that
the fix also fixed test B).  If a fix goes unnoticed, a later
regression would also go unnoticed ;-)

I was skeptical about this approach at first with mesa CI, but having
used mesa CI for a while, I am now a firm believer in the approach.

And ofc we want the expectations to be in the kernel tree because
there could be, for example, differences between -fixes and -next
branches.  (Or even stable kernel branches if/when we get to the point
of running CI on those.)

> And how about tieing this into the kselftest process as well, why would
> this be somehow separate from the rest of the kernel tests?
>
> > Keeping them separate inevitably results in divergence between the driv=
er code and the expected test results, which would result in spurious failu=
res of such CI.
>
> Again, "pass" should be the expected results :)
>
> > I expect the main complication for the kernel will be due to driver cha=
nges merged via different trees, e.g. for cross-subsystem reworks. Since th=
ose will not go through the same CI, they may accidentally introduce incons=
istencies. The ideal solution for this IMO would be centralizing CI such th=
at the same gating tests have to pass regardless of how the code is merged.=
 But there's likely quite a long way to go until we get there. :)
>
> We have in-kernel tests for the rest of the kernel, why can't you put
> your testing stuff into there as well?

We could ofc put a lot more of the gitlab yml and scripts into the
kernel tree.  Probably all of i-g-t is a bit much to put in the kernel
tree.  Not to mention I'd like to see this expand to also run some
deqp and/or piglit tests, which is definitely too much to vendor into
the kernel tree.

The approach of this RFC was to put only what was absolutely required
in the kernel tree (such as expectations), and then link out to an
external drm-ci tree[1] which has all the necessary scripts and yml
for building and running tests, to avoid having to put a whole lot
more in the kernel tree. (We should be specifying exact commit-sha for
that tree, IMO, as it controls the version of i-g-t which gets used,
and we need to be able to update expectations in sync with an i-g-t
uprev, for example when new tests are added or if a test fix caused a
fail->pass transition.)

BR,
-R

[1] https://gitlab.freedesktop.org/gfx-ci/drm-ci

> thanks,
>
> greg k-h
