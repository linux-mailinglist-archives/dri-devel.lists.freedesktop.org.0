Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D65292AB5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 17:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4506B6EA02;
	Mon, 19 Oct 2020 15:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92F6EA02
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 15:44:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d3so307098wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ZKAL2hZ3qOMWxJzH1IwKgv2j9AVNcU1OrEysy54jR20=;
 b=FQdQEmvxir1K1aSRwc/YD4OVhWIMURxeuwSI9q/LNHwUOw91nTK9CTKgBWOc/AgZEd
 5RIIYazWw8sNuCWtZMasBoU/vyV3T+ET1FUyoh+jurtniuoLYL8lKeCvnNdjk7bpySfc
 ZQSf9esLS8szzSzrUyms+bCdcYe3U35tH/skc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ZKAL2hZ3qOMWxJzH1IwKgv2j9AVNcU1OrEysy54jR20=;
 b=s/0Kj6FJSu4JDC0K8sU2Iybv47VdbizBrn+DIOBJ7+f4NSAjb05CkUVqvEvmaUW+QY
 6s6crnykn2SoZtZh207k7Bj/A36xcY1XLZGvn+kBzCrN/YnbMsUw3sUNxH8CskjuQDUJ
 REklwmwbBp/1Kw76NFI+C9MV7/edjerSqYPNNe5oGxNHgIuVhzcRCrA8La/n379GOqYg
 H0mJlJ9wA2MVztjlzja6E/e2aBOAPBXRqVnOz93Sl5NoDLhDy+dFdRiBDVxf6E6Oakbx
 HmZyQ5PPaihuNOGwXfPEOSVYSYB3cW/gAgBR8+leey89zbg4BYb5ADgHhZbFzonE1VQs
 qukA==
X-Gm-Message-State: AOAM533ZremIFJG4QALovefpM6BtZkH8uUh3ftNRTbfB+pIvS7GwoP9j
 eUPSSDlgzWx9Z7JBPRfPkNTpxA==
X-Google-Smtp-Source: ABdhPJx+1Aku6RCS8tZ4DS52dzWXQ674ssKWd4gf8//xA0eTRcqBv49MCEwytlX/u9Aulak9Afz9VQ==
X-Received: by 2002:a1c:9854:: with SMTP id a81mr40477wme.72.1603122280474;
 Mon, 19 Oct 2020 08:44:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm486108wme.22.2020.10.19.08.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:44:39 -0700 (PDT)
Date: Mon, 19 Oct 2020 17:44:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/3] drm/panel: mantix panel reset fixes
Message-ID: <20201019154437.GE401619@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1602584953.git.agx@sigxcpu.org>
 <20201016142916.GA1184974@ravnborg.org>
 <20201017091307.GA2885@bogon.m.sigxcpu.org>
 <20201017104736.GA2822081@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017104736.GA2822081@ravnborg.org>
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
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 17, 2020 at 12:47:36PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Sat, Oct 17, 2020 at 11:13:07AM +0200, Guido G=FCnther wrote:
> > Hi Sam,
> > On Fri, Oct 16, 2020 at 04:29:16PM +0200, Sam Ravnborg wrote:
> > > Hi Guido.
> > > On Tue, Oct 13, 2020 at 12:32:45PM +0200, Guido G=FCnther wrote:
> > [..snip..]
> > > > =

> > > > Changes from v1:
> > > >  - As per review comments by Fabio Estevam
> > > >    https://lore.kernel.org/dri-devel/CAOMZO5B5ECcConvKej=3DRcaF8wvO=
xgq7nUzKJ-ad0aSAOzUqtbQ@mail.gmail.com/
> > > >    - Fix typo in commit messages
> > > >  - As per review comments by Rob Herring
> > > >    https://lore.kernel.org/dri-devel/20200929174624.GA832332@bogus/
> > > >    - Don't use an array of reset lines
> > > > =

> > > > Guido G=FCnther (3):
> > > >   drm/panel: mantix: Don't dereference NULL mode
> > > >   drm/panel: mantix: Fix panel reset
> > > >   dt-binding: display: Require two resets on mantix panel
> > > =

> > > All applied to drm-misc-next and pushed out.
> > > And then I remembered you had commit right - sigh.
> > =

> > Thanks! Is there any special care needed to get that into 5.10? The
> > driver landed there in 72967d5616d3f0c714f8eb6c4e258179a9031c45.
> =

> As the patches was applied to drm-misc-next the easiet path would
> be to cherry-pick them and apply to drm-misc-fixes.
> dim has cherry-pick support - try to use it rahter than doing it by
> hand.

drm-misc-next-fixes while we're between freeze and merge window end:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#=
where-do-i-apply-my-patch

Cheers, Daniel

> =


> When you apply to drm-misc-fixes include a Fixes: tag so the tooling
> will pick the patches automagically.
> =

> In hindsight the patches should have carried a Fixes: tag from a start
> and should have been applied to drm-misc-fixes from a start too.
> =

> I have done something like above once or twice but anyway reach out if
> you have questions. Or ask at #dri-devel.
> =

> 	Sam

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
