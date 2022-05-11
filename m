Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE8523A87
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 18:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96B10FF53;
	Wed, 11 May 2022 16:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F3C10FF52
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:43:42 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso3509965fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qv5UPaNLDRk7OZesf9/OmG2IAf7szhws6U9XAPIZMsU=;
 b=KHSscfX2VH88d4KZ8IH4882XNUx7gbxDp0H53sNZEcKHbBd0GlfHPCRJsWZAFSKulo
 Y+i6p6Jr8+ZVY45RCmnhekz9C/ttFtLh2dTnv4xa1Q+PpWB7Gsyuf6DhDmxbKtjc9JdO
 e2NW++2QKWi9+U6ubodpwq6eLTZOgqK/xZcJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qv5UPaNLDRk7OZesf9/OmG2IAf7szhws6U9XAPIZMsU=;
 b=dGPIZG8Mh7R/8Vjqt6c5BPyQg5jAWVUtgBVd1kH1NWvtcBb2EqNclQ8jEOSpqnurC7
 tsMdy87QqkdEXgVzp41mlCCkY8uR8iGRnzepqz4FnxG8ZyeWJ4xoEcjHd1GIN53NV45n
 o+VdRniNh4oZ5hatmiMJyToYv/NF5XynWnBAB+9UweRVoZSqNTRhW6N9P1AhdDHR3wpm
 ZzwguaV17Ke4wnH9yuvKEHXzxKjmUplcUdaYTsjbTGkfvqd4fPl+lxWOZ9dOlNxyrvqM
 zVrOfbp5Z7aUux5bDWxFuCVW0i0l046rb5qj8GF8rSp8QH/TJYsTsO7aFJOUQ9yzK1mN
 wjUw==
X-Gm-Message-State: AOAM531N3tRAXJ5zZRUUAUSfiA6dZGwfjTjpsz96jAMwgSX1XU1aYOVj
 b4sikVmd5FDXVTXsaHa+6//q8BsK+CHPWv2F7gMX7A==
X-Google-Smtp-Source: ABdhPJy4VUawIZKr2RKSdWewGiu4eDM2uIznpYK2t+g0yjD/k1O8zxOEKSecLPlBSOajA0MocZ2fHlfSRQxeSPeybkM=
X-Received: by 2002:a05:6870:b4a2:b0:ee:326e:58fb with SMTP id
 y34-20020a056870b4a200b000ee326e58fbmr3261404oap.7.1652287420253; Wed, 11 May
 2022 09:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <YntWQIXSqMCd6TYV@kroah.com>
 <1255a66a-121d-988a-19a7-316f703cb37d@mailbox.org>
 <YnujG0nkF0U6d5kd@kroah.com>
 <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
In-Reply-To: <CAF6AEGsmD-CNGj4bAE952JQpquaWA+Nxo5TGpFiHqaPK9doP-g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 11 May 2022 18:43:29 +0200
Message-ID: <CAKMK7uH8k6j5jE562yvbtBaE8EnM8JGF7zOXT4C62HdOgOs9SQ@mail.gmail.com>
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC v2]
 drm/msm: Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 at 15:33, Rob Clark <robdclark@gmail.com> wrote:
> On Wed, May 11, 2022 at 4:50 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, May 11, 2022 at 12:26:05PM +0200, Michel D=C3=A4nzer wrote:
> > > On 2022-05-11 08:22, Greg Kroah-Hartman wrote:
> > > > On Wed, May 11, 2022 at 03:06:47PM +1000, Dave Airlie wrote:
> > > >>> And use it to store expectations about what the drm/msm driver is
> > > >>> supposed to pass in the IGT test suite.
> > > >>
> > > >> I wanted to loop in Linus/Greg to see if there are any issues rais=
ed
> > > >> by adding CI results file to the tree in their minds, or if any ot=
her
> > > >> subsystem has done this already, and it's all fine.
> > > >
> > > > Why does the results need to be added to the tree?  Shouldn't they =
be
> > > > either "all is good" or "constantly changing and a constant churn"?
> > > >
> > > >> I think this is a good thing after our Mesa experience, but Mesa h=
as a
> > > >> lot tighter integration here, so I want to get some more opinions
> > > >> outside the group.
> > > >
> > > > For systems that have "tight integration" this might make sense as =
proof
> > > > that all is working for a specific commit, but I can't see how this=
 will
> > > > help the kernel out much.
> > > >
> > > > What are you going to do with these results being checked in all th=
e
> > > > time?
> > >
> > > Having the expected results in the tree keeps them consistent with th=
e driver code itself, and allows putting in place gating CI to prevent merg=
ing driver changes which make any of the tests deviate from the expected re=
sult.
> >
> > Shouldn't "expected result" always be "pass"?
> >
> > If not, then the test should be changed to be "skipped" like we have
> > today in the kselftest tests.
>
> No, we want to run tests even if they are expected to fail.  This
> prevents the scenario of a test getting fixed without being noticed
> (for ex, developer was working on fixing test A and didn't notice that
> the fix also fixed test B).  If a fix goes unnoticed, a later
> regression would also go unnoticed ;-)
>
> I was skeptical about this approach at first with mesa CI, but having
> used mesa CI for a while, I am now a firm believer in the approach.
>
> And ofc we want the expectations to be in the kernel tree because
> there could be, for example, differences between -fixes and -next
> branches.  (Or even stable kernel branches if/when we get to the point
> of running CI on those.)

Yeah result files in tree is kinda needed, even more so for the
kernel. A lot of the linux-next integration testing is only done after
patches have landed, and sometimes such breakage makes it to upstream
and then into the subsystem/driver tree. Annotating in the backmerge
what exactly broke and why helps a lot with tracking issues.

And expecting every subsystem to run every other subsystem's tests,
especially tests that run on hw, is just not going to scale. So there
will be all kinds of difference in test results.

> > And how about tieing this into the kselftest process as well, why would
> > this be somehow separate from the rest of the kernel tests?
> >
> > > Keeping them separate inevitably results in divergence between the dr=
iver code and the expected test results, which would result in spurious fai=
lures of such CI.
> >
> > Again, "pass" should be the expected results :)
> >
> > > I expect the main complication for the kernel will be due to driver c=
hanges merged via different trees, e.g. for cross-subsystem reworks. Since =
those will not go through the same CI, they may accidentally introduce inco=
nsistencies. The ideal solution for this IMO would be centralizing CI such =
that the same gating tests have to pass regardless of how the code is merge=
d. But there's likely quite a long way to go until we get there. :)
> >
> > We have in-kernel tests for the rest of the kernel, why can't you put
> > your testing stuff into there as well?
>
> We could ofc put a lot more of the gitlab yml and scripts into the
> kernel tree.  Probably all of i-g-t is a bit much to put in the kernel
> tree.  Not to mention I'd like to see this expand to also run some
> deqp and/or piglit tests, which is definitely too much to vendor into
> the kernel tree.
>
> The approach of this RFC was to put only what was absolutely required
> in the kernel tree (such as expectations), and then link out to an
> external drm-ci tree[1] which has all the necessary scripts and yml
> for building and running tests, to avoid having to put a whole lot
> more in the kernel tree. (We should be specifying exact commit-sha for
> that tree, IMO, as it controls the version of i-g-t which gets used,
> and we need to be able to update expectations in sync with an i-g-t
> uprev, for example when new tests are added or if a test fix caused a
> fail->pass transition.)

Yeah I think longer-term we should carry a lot more in upstream, at
least anything that's shared across drivers wrt the ci integration (or
build testing and running tests which are hw agnostic). Maybe even
igt, not sure (otoh xfs-tests isn't moving into the kernel either, and
there's lots more like that).

Personally I think long-term the only thing outside should be other
repos with tests or stuff you need to run them, and not really the
glue to make it all work in ci. But that's maybe a bit too much
wishful thinking if CI systems stay largely subsystem specific (which
they currently are in many ways, with some overlap).

But maybe there is enough random pieces to share here for a lot more
in-tree to make sense, and imo the fewer extra steps and indirection
CI testing and test updating has, the better.

But like Rob says, eventually there's a limit and when you put the
entire GL/vulkan stack + it's conformance testsuite (which is
maintained by khronos somewhere completely different than both
kernel.org and freedesktop.org) then it's definitely too much and wont
work. And eventually we do want to run these things too (e.g.
intel-gfx-ci does run mesa + piglit on every run).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
