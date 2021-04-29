Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56336EDC5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BB68970E;
	Thu, 29 Apr 2021 16:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69489624
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 16:02:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l4so100615295ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SduHEnNrhcuXlfiuazV/waX2yz5XQePHJm5fB0OI2FY=;
 b=O6h2V0uQhs/Fj5ZO3S2aD6JEbP3/G0HRmK2qVjlKVHomhJEA4nlmHKDMLYVqCsxDuM
 7zhhQw45QXCUoODcSgCkeD0PH27zBOKvNOkTMgq5uU4OnBCOXSqljgBypNMQYpJVjcn2
 FHKMUVZnWd9BAhqliPHy5L46BAaAbQgIG/o+VV5DOyidkebWZRk1c7Edqlningqf2ZtJ
 uTrJp49M1ry1pwGMbQmWgGox3LdNR027iqe6CdmDZgQVpRHHYN8CM4GhhJdrt0qOUvMT
 UsRR0DY+E0EtIowHDXR+X7h+VkWw5UBQwZj+8UliV91QgPXagR8rcBL70D8C1CWWMmnw
 dhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SduHEnNrhcuXlfiuazV/waX2yz5XQePHJm5fB0OI2FY=;
 b=QqtEFFaF7cJNxr81ad2SbBukUXiIKqeFTvJW14fwlvIye3FYx3exVDH9J+sVOvt1nr
 vctmxn/ViOmDnpCETdMKvudWS6WLkOor0QcTZTGRCvz0ONPG+4u7k3R8NHKC6SXXqYAM
 9FcUeIoHuwPTQmO5N6Kx0TH/pfSHrkKtkyyD9N86iw+vAfdGqrFueIxGmncYnOUPd+qw
 tJbKOlEwWzZrZdu/paB0r2w8U3TQjW2+sUljijQWxKmWKoGmCEnq0mSRtnIJ+37b0kTB
 lgPkVZkvFGdyhZ2BkltEOvqygWC1ZawJ3NkY20C4FDysAetszYzkI/mbECusewO13oqK
 1IIg==
X-Gm-Message-State: AOAM532Si/eHNIK5pxqOxuGMOdLOnUEMLPKpU8ZkUbJVqVlks5m6/9WR
 cz187RbiVL789UIM2uqsLGB4LHx8EtL5Sfs0jbVevg==
X-Google-Smtp-Source: ABdhPJxZyPluV9CMk+j6pqHaFtLXw3iZC58yThmoUxW9gP3FoRI3BM1zLztkxgUmg+xg1D5SlL85QJ0XnKqvDuiBH7Q=
X-Received: by 2002:a17:906:f1cf:: with SMTP id
 gx15mr536137ejb.435.1619712159373; 
 Thu, 29 Apr 2021 09:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <CAOFGe979BEBSSw_0oqGRADHWZJAg4c=iyr3FiJB5oxno+YM+uw@mail.gmail.com>
 <YIqjhXiIuKc1Hw8r@phenom.ffwll.local>
In-Reply-To: <YIqjhXiIuKc1Hw8r@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 11:02:27 -0500
Message-ID: <CAOFGe96NnkV-ChcxU9txxOy2dnVjhKrm5Q6E=BDkQCV7cUFB-g@mail.gmail.com>
Subject: Re: [PATCH 08/21] drm/i915/gem: Disallow bonding of virtual engines
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 7:16 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Apr 28, 2021 at 01:58:17PM -0500, Jason Ekstrand wrote:
> > On Wed, Apr 28, 2021 at 12:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > On Wed, Apr 28, 2021 at 5:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Tue, Apr 27, 2021 at 08:51:08AM -0500, Jason Ekstrand wrote:
> > > > > I sent a v2 of this patch because it turns out I deleted a bit too
> > > > > much code.  This function in particular, has to stay, unfortunately.
> > > > > When a batch is submitted with a SUBMIT_FENCE, this is used to push
> > > > > the work onto a different engine than than the one it's supposed to
> > > > > run in parallel with.  This means we can't dead-code this function or
> > > > > the bond_execution function pointer and related stuff.
> > > >
> > > > Uh that's disappointing, since if I understand your point correctly, the
> > > > sibling engines should all be singletons, not load balancing virtual ones.
> > > > So there really should not be any need to pick the right one at execution
> > > > time.
> > >
> > > The media driver itself seems to work fine if I delete all the code.
> > > It's just an IGT testcase that blows up.  I'll do more digging to see
> > > if I can better isolate why.
> >
> > I did more digging and I figured out why this test hangs.  The test
> > looks at an engine class where there's more than one of that class
> > (currently only vcs) and creates a context where engine[0] is all of
> > the engines of that class bonded together and engine[1-N] is each of
> > those engines individually.  It then tests that you can submit a batch
> > to one of the individual engines and then submit with
> > EXEC_FENCE_SUBMIT to the balanced engine and the kernel will sort it
> > out.  This doesn't seem like a use-case we care about.
> >
> > If we cared about anything, I would expect it to be submitting to two
> > balanced contexts and expecting "pick any two" behavior.  But that's
> > not what the test is testing for.
>
> Yeah ditch it.
>
> Instead make sure that the bonded setparam/ctx validation makes sure that
> 1) no virtual engines are used
> 2) no engine used twice
> 3) anything else stupid you can come up with that we should make sure is
> blocked.

I've re-introduced the deletion and I'll add nuking that test to my
IGT series.  I did it as a separate patch as the FENCE_SUBMIT logic
and the bonding are somewhat separate concerns.

As far as validation goes, I don't think we need any more for this
case.  You used FENCE_SUBMIT and didn't properly isolate things such
that the two run on different engines.  Not our problem.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
