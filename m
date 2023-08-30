Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2278D69A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661C10E539;
	Wed, 30 Aug 2023 14:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3703910E539
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:44:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52713d2c606so7368266a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693406668; x=1694011468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsYMETSOU6129tG8HXblnzx60u2U2xz76fCR1ofRupQ=;
 b=eCz4OuvRfXgLoFP86npapHCGGe/6q35CfU54cTE6HriU49mdTcxIC+MrEU5SxM3xfl
 h4AEJJq6P+r0vOGfi2Z4IcCvAa9u9VWkhRpDfd0jY88iVbQfePsN91OwEwDDkr3lXwRF
 kkLolHbLM7wGZTDRAMIEWOInHcCCULSnkwGse4Sslmd192cx/lC396jOtelq2nAoQSNb
 b+7nhc6++j6R0WBSNJn1ge/VRMxJUsnFzWbCKMV5ZP9AItPXjk+lxHCFUlz5RESZmUlV
 KFeiKFQPxNwoHnbhIvL9L1iIyjve5R9dm1+ofyaan7+f22yPvrCTt5rg5/AwIoZOp9SD
 jIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693406668; x=1694011468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CsYMETSOU6129tG8HXblnzx60u2U2xz76fCR1ofRupQ=;
 b=NcbadV2tUt/ore7WCqyqp4YRIkiq7DSFH4Burq3tclsh8C3POFbkxvwr2Xb8qhi0Di
 viUVeSafxuN0fedEBgBp0i9eDs8ljWUC0kjcojL1/XaHnIPvgPdfTgQHhGjNMkRPFRvB
 FHdD52p+wt3U64g52hur3Cj7NaCZNVLp/Ww4hDbfxRYYd7T2/eYyUlE3sQvEedsoH3Ls
 Np14fqRGVuwIZ3yWyW0V7dZbZIlIr6WY2SVHOGxrVE3cXaEi5bUCnRUeP1F77BSCZyei
 K00jq/0BG7lDCrXRI8haI5h5E03gebXA2hv28MSaSqIE4A8B9CPyFpuhmdoPFjOTPPsj
 OrfA==
X-Gm-Message-State: AOJu0YztqPA79joXyIH1eYpfJEcx3odGSgfrfDpw+9DGd2kyokTESFQ1
 y4eZo+qL4ENQ9Pxl1sQThkAbf+s2VWH5SgFZKpg=
X-Google-Smtp-Source: AGHT+IFheh4sFIyhEV0de06E87iCx48uH91HVe//0t7LOUW/ly/HbssF0qp1TF6EafRg/YEMLKRO6ws5/HRiaLqEBdY=
X-Received: by 2002:aa7:d898:0:b0:523:d363:1627 with SMTP id
 u24-20020aa7d898000000b00523d3631627mr2075001edq.33.1693406667640; Wed, 30
 Aug 2023 07:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
In-Reply-To: <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 30 Aug 2023 07:44:15 -0700
Message-ID: <CAF6AEGt9M5py0M+7AfrW2YMi6XbHh6ceVszb1BobgqZFvp+w=A@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Helen Koike <helen.koike@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, vignesh.raman@collabora.com,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 linux-rockchip@lists.infradead.org, daniels@collabora.com,
 martin.blumenstingl@googlemail.com, Maxime Ripard <mripard@kernel.org>,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

replying to a couple points on this thread

On Wed, Aug 30, 2023 at 6:25=E2=80=AFAM Helen Koike <helen.koike@collabora.=
com> wrote:
>
> Hi all,
>
> Thanks for you comments.
>
> On 30/08/2023 08:37, Maxime Ripard wrote:
> > On Wed, Aug 30, 2023 at 01:58:31PM +0300, Jani Nikula wrote:
> >> On Wed, 30 Aug 2023, Maxime Ripard <mripard@kernel.org> wrote:
> >>> On Tue, Aug 22, 2023 at 04:26:06PM +0200, Daniel Vetter wrote:
> >>>> On Fri, Aug 11, 2023 at 02:19:53PM -0300, Helen Koike wrote:
> >>>>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>>
> >>>>> Developers can easily execute several tests on different devices
> >>>>> by just pushing their branch to their fork in a repository hosted
> >>>>> on gitlab.freedesktop.org which has an infrastructure to run jobs
> >>>>> in several runners and farms with different devices.
> >>>>>
> >>>>> There are also other automated tools that uprev dependencies,
> >>>>> monitor the infra, and so on that are already used by the Mesa
> >>>>> project, and we can reuse them too.
> >>>>>
> >>>>> Also, store expectations about what the DRM drivers are supposed
> >>>>> to pass in the IGT test suite. By storing the test expectations
> >>>>> along with the code, we can make sure both stay in sync with each
> >>>>> other so we can know when a code change breaks those expectations.
> >>>>>
> >>>>> Also, include a configuration file that points to the out-of-tree
> >>>>> CI scripts.
> >>>>>
> >>>>> This will allow all contributors to drm to reuse the infrastructure
> >>>>> already in gitlab.freedesktop.org to test the driver on several
> >>>>> generations of the hardware.
> >>>>>
> >>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>>>> Acked-by: Daniel Stone <daniels@collabora.com>
> >>>>> Acked-by: Rob Clark <robdclark@gmail.com>
> >>>>> Tested-by: Rob Clark <robdclark@gmail.com>
> >>>>
> >>>> Ok I pushed this into a topic/drm-ci branch in drm.git and asked sfr=
 to
> >>>> include that branch in linux-next.
> >>>>
> >>>> But also I'd like to see a lot more acks here, we should be able to =
at
> >>>> least pile up a bunch of (driver) maintainers from drm-misc in suppo=
rt of
> >>>> this. Also maybe media, at least I've heard noises that they're mayb=
e
> >>>> interested too? Plus anyone else, the more the better.
> >>>
> >>> I'm not really convinced by that approach at all, and most of the iss=
ues
> >>> I see are shown by the follow-up series here:
> >>
> >> I'm not fully convinced either, more like "let's see". In that narrow
> >> sense, ack. I don't see harm in trying, if you're also open to backing
> >> off in case it does not pan out.
> >>
> >>> https://lore.kernel.org/dri-devel/20230825122435.316272-1-vignesh.ram=
an@collabora.com/
> >>>
> >>>    * We hardcode a CI farm setup into the kernel

We do have farm status out of tree so we don't need to push a kernel
patch for outages.

Other than that, I can go either way, with the scripts and related yml
in tree or out of tree.  But the expectation files (ie. the patch you
are complaining about) absolutely need to be in-tree.  It must be
possible to update them in sync with driver changes that fix tests.
There may be a bit of related churn initially ie. based on our lengthy
experience at this point with mesa CI, we can't know about all the
flaky tests until people start using CI in anger ;-)

>
>
> These could be out of tree.
>
> There is a version outside the kernel tree where you just point the CI
> configuration to a url:
> https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/merge_requests/1
>
> We were discussing it here
> https://www.linuxtv.org/cgi-bin/mailman/private/linuxtv-ci/2023-August/00=
0027.html
>
> (I guess Sima's reply didn't got into the mailing list) but the argument
> of not having out of tree repo is due to historical bad experience of
> having to sync the kernel with the code and it can become messy.
>
>
> >>>
> >>>    * We cannot trust that the code being run is actually the one bein=
g
> >>>      pushed into gitlab
>
>
> We can improve this if this is a requirement.
> For DTS configuration we can work with overlays (which is the current
> modification on that patchset). For other changes that are not suitable
> to upstream (and should be rare) we can see if we work with the
> `-external-fixes` approach or another approach, we can check it case by
> case to understand why it is not suitable for upstream.
>

IMHO the occasional need for extra patches is a fact of life with the
kernel development process, and we'll have to live with this until
_all_ kernel patches run thru pre-merge CI.  (I'm not holding my
breath, but who knows..)

If some particular board doesn't boot because of some early-rc
breakage elsewhere in the kernel, then we can't run CI.

>
> >>>
> >>>    * IMO, and I know we disagree here, any IGT test we enable for a g=
iven
> >>>      platform should work, period. Allowing failures and flaky tests =
just
> >>>      sweeps whatever issue is there under the rug. If the test is at
> >>>      fault, we should fix the test, if the driver / kernel is at faul=
t,
> >>>      then I certainly want to know about it.
>
>
> I believe we need a baseline and understand the current status of tests.
> If you check the xfails folder in the patch you can see that I had to
> add a few tests on *-skips.txt since those tests crashes the system and
> other on *-fails.txt that are consistently not passing.
>
> Since the "any IGT test we enable for a given platform should work" is
> not a reality atm, we need to have a clear view about which tests are
> not corresponding to it, so we can start fixing. First we need to be
> aware of the issues so we can start fixing them, otherwise we will stay
> in the "no tests no failures" ground :)
>

I agree with Helen here.  We need a baseline.  And sometimes someone
might fix one test without realizing the same fix fixed another.  That
is the whole purpose of xfails.  We have a long history with this
process on the mesa side, and it works.

>
> >>
> >> At least for display, where this also depends on peripheral hardware,
> >> it's not an easy problem, really.
> >
> > Aside from the Chamelium tests, which tests actually rely on peripheral
> > hardware? On EDID and hotplug, sure, but that can easily be set up from
> > the userspace, or something like
> >
> > https://www.lindy-international.com/HDMI-2-0-EDID-Emulator.htm?websale8=
=3Dld0101.ld021102&pi=3D32115
> >
> >> How reliable do you need it to be? How many nines? Who is going to
> >> debug the issues that need hundreds or thousands of runs to reproduce?
> >> If a commit makes some test less reliable, how long is it going to
> >> take to even see that or pinpoint that?

As far as flakes, at this point we have some infrastructure for
tracking those on the mesa side.. we could probably extend drm/ci over
time to do similarly.

> > I mean, that's also true for failures or success then. How many times d=
o
> > you need a test to run properly to qualify it as a meaningful test? How
> > do you know that it's not a flaky test?
> >
> > Ultimately, it's about trust. If, for a given test that just failed, I
> > can't be certain that it's because of the branch I just submitted, I
> > will just ignore the tests results after a while.

Until we have contributors directly submitting MRs (which is a place
I'd like to get to eventually) it will be the various maintainers
dealing with flakes/fails rather than individual contributors.  Ie.
the expected usage pattern would be maintainers pushing patches to a
staging branch which is then submitted as a gitlab MR where CI is run.
I would hope that maintainers have sufficient experience with the code
they are maintaining to evaluate the failure.

Basically, I think now is the time to get CI in place and start fine
tuning, before we have individual contributors submitting MRs
directly.

BR,
-R

> > This is already what plagues kernelci, and we should do better.
>
>
> This is something that is really nice on Mesa3D, a patch only gets
> merged if tests passes, which forces people to not ignore it, which
> forces the code to be fixed and the CI to be constantly maintained.
>
> Of course there are bad days there, but there is real value. Nice thread
> to check: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8635 (thanks
> Alyssa for the feedback).
>
>
> >
> > And I'm sorry, but if some part of the kernel or driver just isn't
> > reliable, then we shouldn't claim it is (except for all the times it
> > isn't). If no-one has the time to look into it, fine, but flagging it
> > under a flaky test doesn't help anyone.
>
>
> At least we would know what is there that isn't reliable.
> We could also define policies like: failing one out of 10 is fine. And
> we can have scripts that do a stress test and report back.
> It is really nice for users to know this kind of status of drivers.
>
>
> Thanks for your feedback, please keep them coming :)
>
> Regards,
> Helen
>
>
> >
> > Like, from that patch, how can I know what is the issue with
> > kms_hdmi_inject@inject-4k or kms_addfb_basic@addfb25-bad-modifier on
> > mt8173. I certainly can't. And neither of those have anything to do wit=
h
> > peripheral hardware.
> >
> > Maxime
