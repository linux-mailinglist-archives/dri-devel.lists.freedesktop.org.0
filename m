Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16C23F749
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 13:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F716E207;
	Sat,  8 Aug 2020 11:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EB96E207
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 11:02:46 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id b22so4389345oic.8
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L/55pZGPIDLXEhKEN5lU7vD29On+SSemR1MbCPSEFkc=;
 b=Txc9wXgLl4lIVxktcRBgQHAIcyUPV2xOaseTWezQWdDesXAS4oFMs5wT5u529CEsLN
 6InK/JVKbENTe6goOhx+/QhccvQu+9H76ZtQ2UVtMA2+Q5ySxpf7OzB66v3YinESLM90
 9AIisL5hzIuO7GqkpEBJAPvGXGugSd6TKvm2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L/55pZGPIDLXEhKEN5lU7vD29On+SSemR1MbCPSEFkc=;
 b=CFoEv/v5lIaM+Eoks631jARzz6jd0mdVGStlYvBB0eW3gwSRC/fwGGDiSIffxcl7cO
 e8ikYorxWxhGZzpvujasmx/fdzM3vmAFU985btHKHdCZMtEuhP9UwYqtQtCpCQQCSvP7
 DTN94hvjno5nybFl3QzXHUPw5zm7AkJ/rYI6yLwCTTgPE7T95ze6n71Z87/B2c4LTIO2
 NwhOQaNWwfS0srp9wP7zSmQM/pM69WoTjFj/eRcU16ggwKHSxK8HIpPCAIStKm32Sdph
 s9f25kEWzr1w74ccJJG3RTxVPrgLFKdOHzfcRApQ+C2B7O4ZvO0vU35/mO8LmQb5ROiv
 8FXg==
X-Gm-Message-State: AOAM532TnHffs9XTSIHq9d/oT1csqWeSHuvxqCBNK4PWCzsz8XoKRx4i
 oCc8ie14mSf0tsVisqTKB93AP/e7cR7bIsueiSpoqQ==
X-Google-Smtp-Source: ABdhPJwRra8AsKT1jx5v2RE8XA39xz63ylAzCehQgRTg4imFh/aya+veG8dUwb5RKzSvLYY5i4OIZGCxsQLKUKjzfCM=
X-Received: by 2002:aca:da03:: with SMTP id r3mr14994183oig.14.1596884565271; 
 Sat, 08 Aug 2020 04:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <159680700523135@kroah.com>
 <a92e73b9-c3da-76f6-9405-b2456fe68ce6@suse.de>
 <CAKMK7uFJVzm1avAOZd0kPAzRUQkTQv3LtrjafjpjXh4K8TaAHg@mail.gmail.com>
 <20200808102512.GA3039253@kroah.com>
In-Reply-To: <20200808102512.GA3039253@kroah.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 8 Aug 2020 13:02:34 +0200
Message-ID: <CAKMK7uF2zeOS714mq2Y29TgjLB7h3A51FhKs70YL+kK84DCyRQ@mail.gmail.com>
Subject: Re: WTF: patch "[PATCH] drm/mgag200: Remove declaration of
 mgag200_mmap() from header" was seriously submitted to be applied to the
 5.8-stable tree?
To: Greg KH <gregkh@linuxfoundation.org>
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

On Sat, Aug 8, 2020 at 12:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Aug 08, 2020 at 11:13:54AM +0200, Daniel Vetter wrote:
> > On Fri, Aug 7, 2020 at 3:54 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi
> > >
> > > Am 07.08.20 um 15:30 schrieb gregkh@linuxfoundation.org:
> > > > The patch below was submitted to be applied to the 5.8-stable tree.
> > > >
> > > > I fail to see how this patch meets the stable kernel rules as found at
> > > > Documentation/process/stable-kernel-rules.rst.
> > > >
> > > > I could be totally wrong, and if so, please respond to
> > > > <stable@vger.kernel.org> and let me know why this patch should be
> > > > applied.  Otherwise, it is now dropped from my patch queues, never to be
> > > > seen again.
> > >
> > > Sorry for the noise. There's no reason this should go into stable.
> >
> > We have a little script in our maintainer toolbox for bugfixes, which
> > generates the Fixes: line, adds everyone from the original commit to
> > the cc: list and also adds Cc: stable if that sha1 the patch fixes is
> > in a release already.
> >
> > I guess we trained people a bit too much on using Fixes: tags like
> > that with the tooling, since they often do that for checkpatch stuff
> > and spelling fixes like this here too. I think the autoselect bot also
> > loves Fixes: tags a bit too much for its own good.
> >
> > Not sure what to do, since telling people to "please sprinkle less
> > Fixes: tags" doesn't sound great either. I also don't want to tell
> > people to use the maintainer toolbox less, the autogenerated cc: list
> > is generally the right thing to do. Maybe best if the stable team
> > catches the obvious ones before adding them to the stable queue, if
> > you're ok with that Greg?
>
> As I think this is the first time that I've had this problem for a DRM
> submission, I don't think it's a big issue yet at all, so whatever you
> are doing today is fine.
>
> I do think that the number of patches submitted for stable for
> drm-related issues feels very very low given the rate of change and
> number of overall patches you all submit to the kernel, so if anything,
> you all should be increasing the number of times you tag stuff for
> stable, not reducing it :)

Ok, sounds like we should encourage people to use the Fixes: tag and
auto-cc tooling more, not less.

I also crunched some quick numbers:
commits with cc: stable in drm/amd: 2.6%
... in drm/i915: 2.5%
... drm overall: 2.3%
drivers/ overall: 3.1%

So from a quick look no big outliers at least, maybe not quite enough
cc: stable from smaller drivers (i915+amd is about 60% of everything
in drm). This is for the past year. Compared to drivers/ overall a bit
lower, but not drastically so. At least if I didn't screw up my
scripting.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
