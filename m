Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28E23F75C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 13:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D766E20B;
	Sat,  8 Aug 2020 11:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D86E20B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 11:28:55 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF5BD221E5;
 Sat,  8 Aug 2020 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596886135;
 bh=vBFMhdAEamx/FNEl4l+v1WdLPZvkH2+eLo10uDinHqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ue2UD2xWyI1T6gnQ/OY0ZX3oh8RfImSbhbHzKASzdDO/Weq3v/FUFSeWJHskqyoTv
 2hZ+k/CmDVj9NBVI/cEjmMB8FlTIOWThqmcerd6ksiGVBjBdhFd7n8bNENq/gvCBH7
 vOa0vtQpd/5OHwJqEUKFWyiTd/2064kSZSXw6XBU=
Date: Sat, 8 Aug 2020 13:29:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: WTF: patch "[PATCH] drm/mgag200: Remove declaration of
 mgag200_mmap() from header" was seriously submitted to be applied to the
 5.8-stable tree?
Message-ID: <20200808112908.GA3063898@kroah.com>
References: <159680700523135@kroah.com>
 <a92e73b9-c3da-76f6-9405-b2456fe68ce6@suse.de>
 <CAKMK7uFJVzm1avAOZd0kPAzRUQkTQv3LtrjafjpjXh4K8TaAHg@mail.gmail.com>
 <20200808102512.GA3039253@kroah.com>
 <CAKMK7uF2zeOS714mq2Y29TgjLB7h3A51FhKs70YL+kK84DCyRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF2zeOS714mq2Y29TgjLB7h3A51FhKs70YL+kK84DCyRQ@mail.gmail.com>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, armijn@tjaldur.nl,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 08, 2020 at 01:02:34PM +0200, Daniel Vetter wrote:
> On Sat, Aug 8, 2020 at 12:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Aug 08, 2020 at 11:13:54AM +0200, Daniel Vetter wrote:
> > > On Fri, Aug 7, 2020 at 3:54 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > >
> > > > Hi
> > > >
> > > > Am 07.08.20 um 15:30 schrieb gregkh@linuxfoundation.org:
> > > > > The patch below was submitted to be applied to the 5.8-stable tree.
> > > > >
> > > > > I fail to see how this patch meets the stable kernel rules as found at
> > > > > Documentation/process/stable-kernel-rules.rst.
> > > > >
> > > > > I could be totally wrong, and if so, please respond to
> > > > > <stable@vger.kernel.org> and let me know why this patch should be
> > > > > applied.  Otherwise, it is now dropped from my patch queues, never to be
> > > > > seen again.
> > > >
> > > > Sorry for the noise. There's no reason this should go into stable.
> > >
> > > We have a little script in our maintainer toolbox for bugfixes, which
> > > generates the Fixes: line, adds everyone from the original commit to
> > > the cc: list and also adds Cc: stable if that sha1 the patch fixes is
> > > in a release already.
> > >
> > > I guess we trained people a bit too much on using Fixes: tags like
> > > that with the tooling, since they often do that for checkpatch stuff
> > > and spelling fixes like this here too. I think the autoselect bot also
> > > loves Fixes: tags a bit too much for its own good.
> > >
> > > Not sure what to do, since telling people to "please sprinkle less
> > > Fixes: tags" doesn't sound great either. I also don't want to tell
> > > people to use the maintainer toolbox less, the autogenerated cc: list
> > > is generally the right thing to do. Maybe best if the stable team
> > > catches the obvious ones before adding them to the stable queue, if
> > > you're ok with that Greg?
> >
> > As I think this is the first time that I've had this problem for a DRM
> > submission, I don't think it's a big issue yet at all, so whatever you
> > are doing today is fine.
> >
> > I do think that the number of patches submitted for stable for
> > drm-related issues feels very very low given the rate of change and
> > number of overall patches you all submit to the kernel, so if anything,
> > you all should be increasing the number of times you tag stuff for
> > stable, not reducing it :)
> 
> Ok, sounds like we should encourage people to use the Fixes: tag and
> auto-cc tooling more, not less.
> 
> I also crunched some quick numbers:
> commits with cc: stable in drm/amd: 2.6%
> ... in drm/i915: 2.5%
> ... drm overall: 2.3%
> drivers/ overall: 3.1%
> 
> So from a quick look no big outliers at least, maybe not quite enough
> cc: stable from smaller drivers (i915+amd is about 60% of everything
> in drm). This is for the past year. Compared to drivers/ overall a bit
> lower, but not drastically so. At least if I didn't screw up my
> scripting.

Seems about right, so on those averages, you have missed about 40-50
patches that should have been cc:ed stable.

However, you are comparing yourself against stuff like drivers/net/
which shouldn't have cc: stable for most stuff (as per the networking
workflow), and other subsystems that seem to never want to cc: stable
for various reasons (offenders not mentioned to be nice...)

So let's bump that number up a bit, maybe you are missing 100 patches
this past year that should have been backported?

Feels like you all could tag more, even if the number is only 40-50 :)

Oh wait, are you sure you don't count the horrid "double commits" where
you backport something from your development branch to your "for linus"
branch, and have cc: stable on both, so that during the -rc1 merge
window I see a ton of commits that are already in the tree?  That would
inflate your numbers a lot more so your real percentages might be a lot
lower...

fun with math.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
