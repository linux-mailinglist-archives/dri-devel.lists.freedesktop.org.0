Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E630C1A7C1B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC86E4D2;
	Tue, 14 Apr 2020 13:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37C76E4D2;
 Tue, 14 Apr 2020 13:14:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d27so5059629wra.1;
 Tue, 14 Apr 2020 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ll4eqAKYtjTVgiWa+EM/tj8opR8soYnFbaqkSa8MX0w=;
 b=isQPS0YRieB7ch7fx9vRbFH6vVJ4/QFAfFtOxs7dl7WJwGeHCeTQS+qrGd9s7WRif5
 JqpVOBi2Cqe2E6ez62qE4/a7Sji/QthpWmK44OsPX7WYNXpcdiI2oOhmjb+4yRlXO5QK
 l23pyo3SDKhsQmdSNfmOZFuVUtenQdOdPK50FCKUU5z8N82ZFzdmWe+gVIcmuCw0h3Zn
 ArG3qdgBx2OhGRZcmg9uBy/DC+NSzJXr4coBZOznjpbpcYXf5kvVjA5L6qfe93w03on6
 O8wsBlWmpEmcZMWVG7vUxga9csu/DS5M8ieHTQ+WFXB78toa2EvqDVzMqTE5flLxLus+
 dqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ll4eqAKYtjTVgiWa+EM/tj8opR8soYnFbaqkSa8MX0w=;
 b=mCoYkk2xGpQnRBbM3g7SxKqAErx8G6VNj+lV5hBJmsHfuv04LxD3RCR4GqUS1Pihop
 AWHJm1wJv8GjnWRYxgIiAn5vRFNzNSP/abbVbqUJd9eb63O22RgDE+i1DMu2LvWvnkrQ
 vB/ywKVqZ1/JRZHihKG82wFdILJhR2et//GZ5fWbY4zxBu5QLdRF16yHeni6DLwBGGDV
 IBibIm6Q7XAgLUVQZAmaHKDr5EBEcFAvz1b2ENuN39/gdDjTYckqxU9ntOUHxyMXViWG
 noli2i3sg4Kn4j9cpRzzibNHqCesV5TMVno+3jTLbq5qkdFH+hgppsSuQcctrVmxymVI
 EevQ==
X-Gm-Message-State: AGi0PubaLCP0D8sqY2aBqauj9nNbRYds3gTbMBIaF8oZEXrju4b9/971
 CFPmX4/zfXr+uklLk0n4zOtJPd7QfMjvMjTyQC0=
X-Google-Smtp-Source: APiQypKDWYE7ro/xZ4gZ+BUY0l4LRMksuXmT+3J4sb0z0oWxfdy2Qap6WOfuUwiVUau7i+EWwS9jFojCnbujMqGjuj0=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr23399657wrw.402.1586870078292; 
 Tue, 14 Apr 2020 06:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200226190152.16131-1-Kenny.Ho@amd.com>
 <CAOWid-eyMGZfOyfEQikwCmPnKxx6MnTm17pBvPeNpgKWi0xN-w@mail.gmail.com>
 <20200324184633.GH162390@mtj.duckdns.org>
 <CAOWid-cS-5YkFBLACotkZZCH0RSjHH94_r3VFH8vEPOubzSpPA@mail.gmail.com>
 <20200413191136.GI60335@mtj.duckdns.org>
 <20200414122015.GR3456981@phenom.ffwll.local>
 <CAOWid-f-XWyg0o3znH28xYndZ0OMzWfv3OOuWw08iJDKjrqFGA@mail.gmail.com>
 <CAKMK7uEs5QvUrxKcTFksO30D+x=XJnV+_TA-ebawcihtLqDG0Q@mail.gmail.com>
In-Reply-To: <CAKMK7uEs5QvUrxKcTFksO30D+x=XJnV+_TA-ebawcihtLqDG0Q@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 14 Apr 2020 09:14:27 -0400
Message-ID: <CAOWid-fwEOk+4CvUAumo=byWpq4vVUoCiwW1N6F-0aEd6G7d4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, dri-devel <dri-devel@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ok.  I was hoping you can clarify the contradiction between the
existance of the spec below and your "not something any other gpu can
reasonably support" statement.  I mean, OneAPI is Intel's spec and
doesn't that at least make SubDevice support "reasonable" for one more
vendor?

Partisanship aside, as a drm co-maintainer, do you really not see the
need for non-work-conserving way of distributing GPU as a resource?
You recognized the latencies involved (although that's really just
part of the story... time sharing is never going to be good enough
even if your switching cost is zero.)  As a drm co-maintainer, are you
suggesting GPU has no place in the HPC use case?

Regards,
Kenny

On Tue, Apr 14, 2020 at 8:52 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 14, 2020 at 2:47 PM Kenny Ho <y2kenny@gmail.com> wrote:
> > On Tue, Apr 14, 2020 at 8:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > My understanding from talking with a few other folks is that
> > > the cpumask-style CU-weight thing is not something any other gpu can
> > > reasonably support (and we have about 6+ of those in-tree)
> >
> > How does Intel plan to support the SubDevice API as described in your
> > own spec here:
> > https://spec.oneapi.com/versions/0.7/oneL0/core/INTRO.html#subdevice-support
>
> I can't talk about whether future products might or might not support
> stuff and in what form exactly they might support stuff or not support
> stuff. Or why exactly that's even in the spec there or not.
>
> Geez
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
