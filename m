Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84B83D50B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 02:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1519D6E20C;
	Mon, 26 Jul 2021 00:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F087C6E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:03:34 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j2so7416413edp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6XZLN06O/wBfhohRoB2DP1z1G81GJ2/W5UUFUw0tTYI=;
 b=MSMemu46dYyNgq9DiKk1e8UyrvBh24IMjTBYn5gUXmjP/NEyiYtP71E/VtIkoXZ+zA
 TKzF1HvdWOtQb/G1yCEgRjdRYC2VziXsf9eiTSYlI5oiJUAl6Dg2yOPx3HI33cbWUZE/
 5P/abEKS0wWStYG8ZlrbtYhn+YD3zCD/Pxkaf2PwlVQBY8FQCyqr44hpZTFVL287WZ/T
 SAycModLjdnwDx5lJTBYlWizdK4Q2uT4XovXnZMW4PRkyTYrPt4011v78JixPvtnqPEq
 Sjst0eKwzvNYQymVeV9QT0v53CEw5R72GZfEI3ju23VoSScm5wSobQTOrE8l1uLa6Ezj
 1eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6XZLN06O/wBfhohRoB2DP1z1G81GJ2/W5UUFUw0tTYI=;
 b=gzbl1N3bg/drE0pZDxvKvhTQmLRgg8pEAedXdp3+FafARQobwDK6MJQlYSPBelYlWG
 IEdhEx8i5IJFIJOOhIMYdg2A41ccjIow5L7XhPSGssNwus2W0jvKlMOTi0x6Ttpq/fqI
 SfG0UVRolxC6r0GDDv1jb/22K76sRJvLEFdDAyUDUrvfAx+Ss5ZKOdzq5pHZ2o5N8sF3
 KCen2N7SktOql/6nv0tQbXlVwlKBYP1YY2nF9PP3X8b6v+HgNUqZ7R27mAqBytY4+2Gz
 kJ2kTGxZiKRnQVrLazt9v/lbbgWq2LqgDXEM2oWcoiGl3GrjoOrYp+L93BMZuMMa96w8
 yo8Q==
X-Gm-Message-State: AOAM533fZNjGNOT4rIbUS7d583cED82oZczzQ3DqAVJgzgSIS/lA7gyk
 u9w44xEM9M0yITLmyamAq45JCmYzjFZefSLJmoE=
X-Google-Smtp-Source: ABdhPJzsAZzC/PGRokSs9aXc+AcQSDA6tHnkGkKf04CfguS8T+z/o550tRgv9jgi9R1ADbziZji0Ohfn3p2Z10Cg3Rw=
X-Received: by 2002:a05:6402:647:: with SMTP id
 u7mr18202074edx.113.1627257813507; 
 Sun, 25 Jul 2021 17:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
 <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
In-Reply-To: <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 26 Jul 2021 10:03:22 +1000
Message-ID: <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Jul 2021 at 19:40, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.07.21 um 11:21 schrieb Daniel Vetter:
> > On Fri, Jul 23, 2021 at 11:13 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 23.07.21 um 10:47 schrieb Daniel Vetter:
> >>> On Thu, Jul 22, 2021 at 02:41:23PM +0200, Christian K=C3=B6nig wrote:
> >>>> Doing this in vmw_ttm_destroy() is to late.
> >>>>
> >>>> It turned out that this is not a good idea at all because it leaves =
pointers
> >>>> to freed up system memory pages in the GART tables of the drivers.
> >>> So I wanted to review this series, and I can't reconcile your claim h=
ere
> >>> with the demidlayering Dave has done. The driver patches here don't
> >>> ouright undo what Dave has done, but that means the bug has been
> >>> preexisting since forever (or is due to some other change?), and your
> >>> commit message is a bit confusing here.
> >>>
> >>> The final patch just undoes the demidlayering from Dave, and I really
> >>> don't see where there's even a functional change there.
> >>>
> >>> And even these patches here don't really change a hole lot with the
> >>> calling sequence for at least final teardown: ttm_tt_destroy_common c=
alls
> >>> ttm_tt_unpopulate as the first thing, so at least there there's no ch=
ange.
> >>>
> >>> Can you pls elaborate more clearly what exactly you're fixing and wha=
t
> >>> exactly needs to be reordered and where this bug is from (commit sha1=
)? As
> >>> is I'm playing detective and the evidence presented is extremely sinc=
e and
> >>> I can't reconcile it at all.
> >>>
> >>> I mean I know you don't like typing commit message and documentation,=
 but
> >>> it does get occasionally rather frustrating on the reviewer side if I=
 have
> >>> to interpolate between some very sparse hints for this stuff :-/
> >> Yeah, when have seen the history it's rather obvious what's wrong here
> >> and I expected Dave to review it himself.
> >>
> >> Previously we had three states in TTM for a tt object: Allocated ->
> >> Populated -> Bound which on destruction where done in the order unbind
> >> -> unpopulate -> free.
> >>
> >> Dave moved handling of the bound state into the drivers since it is
> >> basically a driver decision and not a TTM decision what should be boun=
d
> >> and what not (that part perfectly makes sense).
> > I haven't reviewed all the patches from Dave, only the one you pointed
> > at (in the last patch). And that one I still can't match up with your
> > description. If there's other commits relevant, can you pls dig them
> > out?
> >
> > Like it all makes sense what you're saying and matches the code, I
> > just can't match it up with the commit you're referencing.
>
> That is the patch directly following the one I've mentioned:
>
> commit 37bff6542c4e140a11657406c1bab50a40329cc1
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Thu Sep 17 13:24:50 2020 +1000
>
>      drm/ttm: move unbind into the tt destroy.
>
>      This moves unbind into the driver side on destroy paths.
>
> I will add a Fixes tag to make that clear.
>
> But this patch also just moves the undbind from the TTM destroy path to
> the driver destroy path.
>
> To be honest I'm not 100% sure either when the when the unbind moved
> from the unpopulate path into the destroy path, but I think that this
> wasn't always the case. Let me try to dig that up.
>
> >> The problem is that he also moved doing the unbind into the free
> >> callback instead of the unpopulate callback. This result in stale page
> >> pointers in the GART if that unpopulate operation isn't immediately
> >> followed by a free.
> >>
> >> Thinking more about it if we do populated->unpopulated->populated then
> >> we would also have stale pointers to the old pages which is even worse=
.
> >>
> >> This is also not de-midlayering since we already have a proper
> >> ttm_tt_init()/ttm_tt_fini() functions which should work nicely for the
> >> tt object.
> > Well you're last patch moves the ttm_tt_destroy_common stuff back into
> > ttm, which kinda is de-demidlayering. So I'm confused.
>
> Ah, yes that is correct. I've also considered to move this in
> ttm_tt_fini instead of there.
>
> But that would be a larger change and I wanted to fix the problem at
> hand first, potentially even adding a CC stable tag.
>
> > Other bit: I think it'd be good to document this properly in the
> > callbacks, and maybe ideally go about and kerneldoc-ify the entire
> > ttm_tt.h header. Otherwise when we eventually (never?) get around to
> > that, everyone has forgotten these semantic details and issues again.
>
> Already working towards including more of the TTM headers and code files
> in kerneldoc. But not quite there yet.
>
> But you know, normal human: Only equipped with one head and two hands
> and not cloneable.

I'm the same, but I'm not seeing where this problem happens at all, do
we have any backtraces or demos for this?

I split bind/unbind into the driver, but the driver should still
always be moving things to unbound states before an unpopulate is
called, is there a driver doing something unexpected here?

at worst I'd like to see a WARN_ON put in first and a test in igt that
triggers it, because right now I'm not see that path through the
drivers/ttm that leads to unpopulated pages ending up happening while
bound.

From 5.14-rc3 unpopulate is called from ttm_bo_pipeline_gutting in
non-ghost path and there is no unbind,
pipeline gutting is called from evict/validate, when there is no
placement suggested for the object, is this case getting hit somewhere
without the driver having previously unbound things?

ttm_tt_destroy_common: calls unpopulate, everyone calls this directly
after unbinding
ttm_tt_swapout: calls unpopulate, we don't swapout objects from TT
directly, we should always unbind first, this used to have an assert
against that,
ttm_tt_populate: call unpopulate in failure path

So any place I can see unpopulate getting called with a bound TT
should be a bug, and fixed, we could protect against it better but I'm
not seeing the need for this series to outright revert things back as
helping.

Dave.
