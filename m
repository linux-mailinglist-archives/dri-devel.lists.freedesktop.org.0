Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3441A7AF6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99089C8F;
	Tue, 14 Apr 2020 12:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D62889C8F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:39:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r26so13799498wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kVqVDRroaaKQtSoJy25uzz5p8uAd9dTypRI0sk1gDvE=;
 b=NM/9H0Ba3/A/u5qTufZnvArvEQe5Q7qxD36rs6lySzsntAFdeZig3cW7mL+MsqR6cn
 iPtngbX167J2ULrxDwUfgVVkiBal2C45hFuo+pMugEV8FxdWCGSv/BuF+i9FxSX3Wkkk
 LQNKfTyE8lUVOug74iZRJE6Afh+n0x+KUPb2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kVqVDRroaaKQtSoJy25uzz5p8uAd9dTypRI0sk1gDvE=;
 b=YwrydXMOrbr9370SgVqhJsUfS3h3h+mRqIei8UL9dD4+eUinyyZ1Mr73G4NIfhouyI
 EMcrUZmnucxunj9iaWuyTxhTgnP8qC+9vDfaqLrzdzOn15WcKaHi8wJ0NJDAkeg09yOn
 T1+1Ye5t+xQGSxSkzKjcNeZHrLLTV8N4Vn41b4MrqH/TpqrjbBmYZqUDvVQzxojCHk+a
 9R4JBEUdfB3f9GAPp3RyRkS7dlL4ytTkClo+lrr3FG4R+aRAv4IuWmYfTFjs6TtNMiPV
 zakpHufYCkplfMfba1PKtni1+TFMbWy9YZEJIx0r4dOcXK77JzQgLTvbRrONps3vXqyp
 aNzg==
X-Gm-Message-State: AGi0PuZljXCb+xLsbBxIWvNNOuBm28GGHfnbo/Hk7GGlfYwCzu//vDes
 bnPsEDXfDmUSLh7Aeav1j3GEJQ==
X-Google-Smtp-Source: APiQypIzp1UU7FRID3t9sNxkF5a4nXlTcNhmGHWBWTQ4wDXuw5CqRYoLHqd+JB6XXk8veWuC2eZqrw==
X-Received: by 2002:a1c:98c3:: with SMTP id
 a186mr23573741wme.178.1586867988006; 
 Tue, 14 Apr 2020 05:39:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w7sm19355595wrr.60.2020.04.14.05.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:39:47 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:39:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <20200414123945.GU3456981@phenom.ffwll.local>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
 <20200414122402.GS3456981@phenom.ffwll.local>
 <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 12:34:17PM +0000, Simon Ser wrote:
> On Tuesday, April 14, 2020 2:24 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Mon, Apr 13, 2020 at 10:38:37PM +0000, Simon Ser wrote:
> >
> > > Daniel Vetter, Ville, any thoughts about this?
> >
> > Magic 8ball says "unclear", and I feel like I keep flip-flopping around on
> > this.
> >
> > I think best-case outcome here is that we're a) consistent across
> > compositors and b) document that consensus in the kernel's uapi section
> > (for lack of better places).
> 
> Agreed.
> 
> > I'm not hung up on what exactly that consensus should be, as long as it's
> > a consistent across projects. If you folks can't figure this out I'll do a
> > live youtube sessions and throw a dice :-P
> 
> It seems like everyone's fine with whatever decision we make as long as
> we make one. :P
> 
> I guess I'll summarize again my main point here: requiring user-space
> to use the KMS API to get enum values just makes it more difficult for
> user-space to use KMS. I can't think of any reason why the kernel would
> want to use different enum values for a standard property.
> 
> Does anybody remember if there was such a use-case when this UAPI was
> introduced?

I just rang across one, and boy does it suck.

So we're trying to standardize across drivers as much as possible. Within
the kernel we do that by decoding standardized properties directly into
state structures (including any backwards compat hacks), and outside of
the kernel by requiring igts so compliance across drivers can be tested.

But we still have a pile of legacy properties, and there's pure wild west
out there. Some have mispelled version of the same stuff, some have same
naming but different values. If userspace hardcodes values then we're more
screwed than if we have some indirection here to remap to standardized
properties. And legacy userspace did do that full remapping dance, because
that's how the first X property decoder for connectors was coded.

So given that I think everyone should do the symbolic decoding, so that we
can more seamlessly upgrade when we standardize props.

Like I said, I'm flip-flopping on this all the time, but since I just ran
over an example of trying to standardize another one of the old horrors,
maybe better to make that slightly easier going forward. Userspace should
be able to just stuff this all into a library and be done.

Volunteered to write the kernel patch?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
