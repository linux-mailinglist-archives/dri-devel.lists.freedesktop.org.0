Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05361FE63
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909E10E045;
	Mon,  7 Nov 2022 19:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222D10E045;
 Mon,  7 Nov 2022 19:13:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id t62so13174336oib.12;
 Mon, 07 Nov 2022 11:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f59wYRMNftOBb5rSBsbZDY6wI3DkLvLMGTZcBK3XZeo=;
 b=BaTsSLb5HH7ESNy2M5U8DhIlpmp4vUHilUY5aCIuvSzC0TR2FkYoDLeb/qLbZX4puz
 23EonjZZSsmNUGAcszomRVzwGHNZnoebcREo5WCk5v2oUkE+SNoMc9RYYMtG5y05qjSy
 PNHISt9gq+ZhDCx+cbYveDy2qZ5f+vkeplrtqfkb147FtXiovAbIeIcw705lGWi7hQpS
 QhxuwW6NRs7vkTN/HzalmsjeNdjThRTLbOnEep2H6R6c88MGLGeBf5bN6i6bzIBDVbhD
 vciKu29KxuDuJ6o6aeFIZ3z7YZXaWlqCi6VpjGAj3UJPt8aNzp0Z/3ezoS42eAR9FIpC
 vFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f59wYRMNftOBb5rSBsbZDY6wI3DkLvLMGTZcBK3XZeo=;
 b=Gm+8YmcdFksJtke1wdX7CstvTPfYk17UMRRNvyTdpYI3B+rMkqRS4xSitHkm4vJPlc
 Kg54yXkkWlh4Nn+oEQ/570YjgfkAEq/KFQOfTlgE6odcShHr53y7MQeeGdJHJi0htflj
 Wyr1xwuDEj0S/rOgEUKlEwcFptaFgt0HAnWymDpRQfArjgP6ZapsI5SpBE8D1DFpQ1N2
 CTLnHtV35xqS/0+YBGRhcPuwj6s3fm8OZrDWpPoQtOXrdW+2kCKOsZgo0Ps+2cIquH1B
 wXdyk82eI2vI+16PXm9WyKb2lbMXTdmxfeu8SgSvU+szj0uD8rcgRqXaQK3SiOy6Z+jW
 C3EA==
X-Gm-Message-State: ACrzQf2kmlEPjmHOh+skOoVVFhctXx6ESSPJ0WWfzsfUw24zzvCW1Tl4
 RXzNft6WTPprgpFYW3jXer7oOONtZAa2lBKEbSc=
X-Google-Smtp-Source: AMsMyM5F0JXgIcWuP5IM7NLhe5q/g43k2aFp+bQhm5zHcqINECGf2ga087060OlimhNyz6oQA8E35PWMVruq9htyA3E=
X-Received: by 2002:a05:6808:300d:b0:35a:7041:1200 with SMTP id
 ay13-20020a056808300d00b0035a70411200mr7174760oib.38.1667848429924; Mon, 07
 Nov 2022 11:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <20221026081711.zj7h2rpfd4kfkpqe@houat>
 <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
 <20221107092912.q7tcsv4gmmsohmx3@houat>
In-Reply-To: <20221107092912.q7tcsv4gmmsohmx3@houat>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Nov 2022 11:13:38 -0800
Message-ID: <CAF6AEGt4Nj9s=JrzHVu+1StfcAWBhYc1WHU_EVnqvGDviF67bg@mail.gmail.com>
Subject: Re: Must-Pass Test Suite for KMS drivers
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 1:29 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Oct 27, 2022 at 08:08:28AM -0700, Rob Clark wrote:
> > On Wed, Oct 26, 2022 at 1:17 AM <maxime@cerno.tech> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > > > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > > > > I've discussing the idea for the past year to add an IGT test suite that
> > > > > all well-behaved KMS drivers must pass.
> > > > >
> > > > > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > > > > that are being used to validate that the drivers are sane.
> > > > >
> > > > > We should probably start building up the test list, and eventually
> > > > > mandate that all tests pass for all the new KMS drivers we would merge
> > > > > in the kernel, and be run by KCi or similar.
> > > >
> > > > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > > > first, that already gives us a mechanism similar to what we use in
> > > > mesa to track pass/fail/flake
> > >
> > > I'm not sure it's a dependency per-se, and I believe both can (and
> > > should) happen separately.
> >
> > Basically my reasoning is that getting IGT green is a process that so
> > far is consisting of equal parts IGT test fixes, to clear out
> > lingering i915'isms, etc, and driver fixes.  Yes, you could do this
> > manually but the drm/ci approach seems like it would make it easier to
> > track, so it is easier to see what tests are being run on which hw,
> > and what the pass/fail/flake status is.  And the expectation files can
> > also be updated as we uprev the igt version being used in CI.
> >
> > I could be biased by how CI has been deployed (IMHO, successfully) in
> > mesa.. my experience there doesn't make me see any value in a
> > "mustpass" list.  But does make me see value in automating and
> > tracking status.  Obviously we want all the tests to pass, but getting
> > there is going to be a process.  Tracking that progress is the thing
> > that is useful now.
>
> Yeah, I understand where you're coming from, and for CI I agree that
> your approach looks like the best one.
>
> It's not what I'm trying to address though.
>
> My issue is that, even though I have a bunch of KMS experience by now,
> every time I need to use IGT, I have exactly zero idea what test I
> need to run to check that a given driver behaves decently.
>
> I have no idea which tests I should run, which tests are supposed to be
> working but can't really because of some intel-specific behavior, which
> tests are skipped but shouldn't, which tests are broken but should be,
> etc.

yeah, I feel your pain.. I think the best suggestion I can make atm is
to compare to the xfails from the other drivers, and if in doubt ask
on #igt

BR,
-R

> I don't want to have a nice table with everything green because there
> was no regression, I want to see which bugs I haven't found out are
> still lingering in my driver. I've been chasing bugs too many times
> where it turned out that there was a test for that in IGT somewhere,
> hidden in a 70k tests haystack with zero documentation.
>
> So, yeah, I get what you're saying, it makes sense, and please go
> forward with drm/ci. I still think we need to find a beginning of a
> solution for the issue I'm talking about.
>
> Maxime
