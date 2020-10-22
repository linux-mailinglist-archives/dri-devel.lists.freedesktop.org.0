Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB6295F7B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 15:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93E6E1F8;
	Thu, 22 Oct 2020 13:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD566E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 13:13:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n18so2337847wrs.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=polAEo+fouhUObqT4GwO+ngR9KW3GJJmYPdAvKfkSMw=;
 b=aPnV2U3oqsJQB7QRmwqQKJiihlvHdYrGmmribbsuXEUE7nSJdOZr2tm8XXG0Fmxq+I
 ZaQzr9dURXr3/JfzAxGSE0JnFyKTLtSFyCGgfKHRTJT10HnVT6vtQprlcnb2pTqznz4u
 c/7Y4LpmNcX7tg0tD6jIrLARKW2TAqQexWzJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=polAEo+fouhUObqT4GwO+ngR9KW3GJJmYPdAvKfkSMw=;
 b=Itp/AKJNbXDNbeV7XQ3RL29zhZ7jCBIEQBUFxVBWmkjrEJer1UkTLyrSJcHORHnZ0I
 OvHyDvzoxs/MgJRQIxC6Nm79quWT0PFxzS18a4BW+0lH4GPcqBYta/NtBEE1YlAwonc8
 E9rVLpFwWFpYmRl0jSmf99POIBc5ZgXcxShC/YHyuBEsJeB/UR6HEIb6zklNmGB4xN/F
 CSuu2t3pTnHat5Dpb+ZDC5kMoI2sDrn9CmS6l3xaMuAxjm8iEC4A01RyR1aQvUgu/zlO
 HiANW+UUEVodJzWbba0tprvszXMcvYabvOFSnmyVjgbWY7QRbaaavk0vAcu76R6Mx++r
 a9cA==
X-Gm-Message-State: AOAM5328xAF7BPOQ5YlHiIINOpmrSu6tOXdzhjPzEQtPGygL7hi+rV22
 6ngzfZppRkIPQTcjnbmZXA/3EA==
X-Google-Smtp-Source: ABdhPJwDSa2Up5u64X9Jzfyvomb2AHTBB6MzmcOOLwvrDeBmMRXMBS3fvoqpcZIlnKBExeeF8r2RNg==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr2486609wro.291.1603372428404; 
 Thu, 22 Oct 2020 06:13:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u15sm3909784wrm.77.2020.10.22.06.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:13:47 -0700 (PDT)
Date: Thu, 22 Oct 2020 15:13:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201022131345.GX401619@phenom.ffwll.local>
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
 <20201017091307.GA2885@bogon.m.sigxcpu.org>
 <20201017104736.GA2822081@ravnborg.org>
 <20201019154437.GE401619@phenom.ffwll.local>
 <20201020115711.GA102703@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115711.GA102703@bogon.m.sigxcpu.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 20, 2020 at 01:57:11PM +0200, Guido G=FCnther wrote:
> Hi Daniel, Sam,
> On Mon, Oct 19, 2020 at 05:44:37PM +0200, Daniel Vetter wrote:
> > On Sat, Oct 17, 2020 at 12:47:36PM +0200, Sam Ravnborg wrote:
> > > Hi Guido.
> > > =

> > > On Sat, Oct 17, 2020 at 11:13:07AM +0200, Guido G=FCnther wrote:
> > > > Hi Sam,
> > > > On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> > > > > Hi Guido.
> > > > > On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
> > > > [..snip..]
> > > > > > =

> > > > > > Changes from v1:
> > > > > >  - As per review comments by Fabio Estevam
> > > > > >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF=
8wvOxgq7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> > > > > >    - Fix typo in commit messages
> > > > > >  - As per review comments by Rob Herring
> > > > > >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bo=
gus/
> > > > > >    - Don't use an array of reset lines
> > > > > > =

> > > > > > Guido G=FCnther (3):
> > > > > >   drm/panel: mantix: Don't dereference NULL mode
> > > > > >   drm/panel: mantix: Fix panel reset
> > > > > >   dt-binding: display: Require two resets on mantix panel
> > > > > =

> > > > > All applied to drm-misc-next and pushed out.
> > > > > And then I remembered you had commit right - sigh.
> > > > =

> > > > Thanks! Is there any special care needed to get that into 5.10? The
> > > > driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.
> > > =

> > > As the patches was applied to drm-misc-next the easiet path would
> > > be to cherry-pick them and apply to drm-misc-fixes.
> > > dim has cherry-pick support - try to use it rahter than doing it by
> > > hand.
> > =

> > drm-misc-next-fixes while we're between freeze and merge window end:
> > =

> > https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.h=
tml#where-do-i-apply-my-patch
> =

> Great. Thanks for the pointer, that works. Now i get:
> =

>   $ ../maintainer-tools/dim push --dry-run
>   dim: 3532f0117258 ("dt-binding: display: Require two resets on mantix p=
anel"): mandatory review missing.
>   dim: c90f95ad6d05 ("drm/panel: mantix: Fix panel reset"): mandatory rev=
iew missing.
>   dim: 8b557f793e69 ("drm/panel: mantix: Don't dereference NULL mode"): m=
andatory review missing.
>   dim: ERROR: issues in commits detected, aborting

Ah yes, if author !=3D committer then dim assumes there has been some
oversight and review.

But when you cherry-pick over then it's again author =3D=3D committer and in
that case dim is looking for an a-b or r-b line, hence why the cherry-pick
fails.

For a bit of context.
-Daniel

> and in fact there's only Signed-off-by's on it:
> =

>   Fixes: 72967d5616d3 ("drm/panel: Add panel driver for the Mantix MLAF05=
7WE51-X DSI panel")
>   Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
>   Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>   Link: https://patchwork.freedesktop.org/patch/msgid/ba71a8ab010d263a805=
8dd4f711e3bcd95877bf2.1602584953.git.agx@sigxcpu.org
> =

> Sam, I assume your Signed-off-by's should have been Reviewed-by ?
> O.k. to fix that up in the commit message before pushing to
> drm-misc-next?
> =

> Cheers,
>  -- Guido
> =

> > =

> > Cheers, Daniel
> > =

> > > =

> > =

> > > When you apply to drm-misc-fixes include a Fixes: tag so the tooling
> > > will pick the patches automagically.
> > > =

> > > In hindsight the patches should have carried a Fixes: tag from a start
> > > and should have been applied to drm-misc-fixes from a start too.
> > > =

> > > I have done something like above once or twice but anyway reach out if
> > > you have questions. Or ask at #dri-devel.
> > > =

> > > 	Sam
> > =

> > -- =

> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
