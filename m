Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A28268497
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 08:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4CB6E0CC;
	Mon, 14 Sep 2020 06:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68A6E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:13:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x14so17250169wrl.12
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 23:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ipsEFmNBVTfHqxzF7vZiffax14JD/ybIvQh0uxmVDmk=;
 b=i+Z+HLoNZfL+w75HFJzLBjQLZPMY0Jrr55eVlWeTo8oVbAEj7xJ4ZJ95E1ogQvIIUI
 ++sEyylDNMDApInG8HLec2Zdbz0O++EGstMWd1I0IoSJBinPkq9XWVpQwX+mJS1VvXYW
 o6f5VTcNjFibMa6emB8p2aMhudPVctO2XkJOimDi8mkk7itjiXh8m9mF9drCByPCE2oF
 fv9eeMAEJjof2DQMq8FLyIHpP/d8+l29pUN6qNyQzlRfqtMgB9FdaSu9XRbY+4ewu2TT
 0KBVui1QcHebT9j7kwi05ILJxVZrWMWcn8Esy01EaQL0ZN0551gk5LqBBNoZtuxduCRz
 qoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ipsEFmNBVTfHqxzF7vZiffax14JD/ybIvQh0uxmVDmk=;
 b=a1kc5GqK6MrCS5bOcCEuZEQZparI/Yf7ZvasnXICc2zvDqwkjMKZt7u44OnZFO31pc
 UNGvzYsTEYm8dyrPbrv3Tll86CeFTeJIBEueI8H7L1HJNCFowp6rghpXcRXAjs7+M9as
 730eN4UvjTxAN8N4wAj91u0VSU+HJKBNgm6aoFTq+COb8gSKZUrUP6k6OTBS4KF00KLl
 YXIihXhyYR17fgCWMK9hElt2g/FBOArgN8l43c65IYy726wtR53dxN5MLkNGqDka+JEm
 3jwW8f3Nynuq3odrq9wm7Iwk/udheuL5w2ZKpUsMKHW2tvc0fjqnzze8F2/EGaPUC3wF
 6Ahg==
X-Gm-Message-State: AOAM530/nW3qFEbrRxHKQoYA3bNqN1Q+ePw1eyxX4TKqNXAbj+dk8vPN
 iz1icOFNakoqNgG8fvrRRGChr76bfaH2AUzuD/SCaGmf
X-Google-Smtp-Source: ABdhPJz2NzaBhmJvH1RaVaHSOfcHHZ3By3XV9QaFufu1gmZHdukqbCRTB559D5YE533BF9mU+R/pFzxycyM8byX+n9M=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr13892329wro.362.1600064000898; 
 Sun, 13 Sep 2020 23:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
 <20200910081836.GG438822@phenom.ffwll.local>
 <4ggVpoPfSS2JmnPLixWtD-1pcm-aPl0DBELYyqKh6boZxra-xibFZpLbxrykyvxFpW6xs5-R89O2iqdAgnoRaoMAs-DNOFRLKYWR-cZas2I=@emersion.fr>
In-Reply-To: <4ggVpoPfSS2JmnPLixWtD-1pcm-aPl0DBELYyqKh6boZxra-xibFZpLbxrykyvxFpW6xs5-R89O2iqdAgnoRaoMAs-DNOFRLKYWR-cZas2I=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2020 02:13:09 -0400
Message-ID: <CADnq5_PU71BTTEXFPLToySyub=5deOOpqBZkYZWO=7+Ht81HUw@mail.gmail.com>
Subject: Re: per-plane LUTs and CSCs?
To: Simon Ser <contact@emersion.fr>
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
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 4:29 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, September 10, 2020 10:18 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
> >
> > > On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu laurentiu.palcu@oss.nxp.com wrote:
> > >
> > > > Hi all,
> > > > I was wondering whether you could give me an advise on how to proceed further
> > > > with the following issue as I'm preparing to upstream the next set of patches
> > > > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > > > respectively. Then the output from those 3 pipes is blended together and then
> > > > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > > > needed.
> > > > Currently, downstream, we have all those CSCs and LUTs hard-coded into a header
> > > > file. Based on the colorspace, range, gamut selected for the output and/or
> > > > plane input, we pick up the right CSCs and LUTs from that header file to
> > > > configure our pipes... I guess this solution does the job, userspace doesn't
> > > > need to care much about how to generate those tables. But, it's also not very
> > > > flexible in case there is an app smart enough to know and actually generate
> > > > their own custom tables. :/
> > > > Looking through the dri-devel archives, I've seen that there was a tentative to
> > > > implement a more or less generic per-plane LUT/CSC solution but it didn't make
> > > > it in due to lack of userspace consumers...
> > >
> > > Apart from full color management mentioned by Pekka, are there other
> > > use-cases for these per-plane props?
> > > One thing I can think of is that some drivers annoyingly only apply the
> > > per-CRTC gamma LUT to the primary plane. I think it would make more
> > > sense to not attach a gamma prop to the CRTC and instead only attach it
> > > to the primary plane to make that clear. But I guess that would also
> > > break existing user-space?
> >
> > Uh, which drivers? This would be a driver bug (and there's been plenty of
> > those where the cursor has the wrong color temp and fun stuff like that).
> > We need to fix these driver issues instead of lamenting in userspace that
> > it's all kinda broken :-)
>
> Apparently this is bug with the old radeon driver [1]. It works fine on
> all i915 setups I've tried, and also works fine on amdgpu (with DC).
>
> I've opened a radeon bug.
>
> [1]: https://github.com/swaywm/wlroots/issues/968

This is a hardware limitation.  I suspend all hardware of a certain
age had this same limitation.  Old stuff didn't have multiple planes.
It had a primary plane and a cursor and gamma didn't apply to the
cursor.  The hardware supported by radeon goes back more than 20
years.

Alex


>
> > > The gamma LUT is currently used by some compositors to implement "night
> > > light"/redshift-like features.
> > >
> > > > Adding CSC and degamma LUT properties for each plane as well as a gamma
> > > > LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> > > > entirely on userspace to fill in those tables. But userspace has to know
> > > > how to generate those LUTs and colorspace conversion matrices in the
> > > > first place...
> > >
> > > So it wouldn't be enough for user-space to fill these gamma LUTs with
> > > linear ramps and get colors that look fine? Would the process be more
> > > involved? Would user-space need to know about the driver and generate
> > > gamma LUTs depending on the driver?
> > > That would be a show-stopper.
> >
> > Yeah we can't expose such an uapi, instead what I have in mind that the
> > in-kernel lut/csc for yuv/broadcast rgb and whatever else are mixed in
> > with what userspace provides. That means a slight loss of precision and
> > we'll have to have a nice fixed point math library for this stuff in the
> > kernel. But color correction hw is too special between vendors that I
> > don't think there's any other solution. E.g. even on intel we sometimes
> > have dedicated register bits/hw functions for yuv/rgb broadcast value
> > range and whatever else, and on other platforms we need to do that by
> > adjusting the lut/csc.
>
> Yeah, that makes sense to me.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
