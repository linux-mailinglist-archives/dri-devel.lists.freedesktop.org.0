Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9523EDA7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 15:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6E6E126;
	Fri,  7 Aug 2020 13:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BABA6E126
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 13:06:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so1623208wrl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j8M8x6OwnaxmfcKbmGaUp2UjGTHEUKREthEAoBKePPU=;
 b=S1+fV7EBUeuuNcvqZf4hc+Saw/mwtBty+p4fo1/qoOikpRpu+zZD5CwtOdat7tDIvA
 R6Qc+mApXEFCyVYdXVpPBW/t6bDatcqblH6t6qRTA1e5X9kr0oBllpwSCyypCO/ICvCf
 UtPGBRUb3kj7VvEfIjaM8E29TXYJtMfsPY/y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j8M8x6OwnaxmfcKbmGaUp2UjGTHEUKREthEAoBKePPU=;
 b=nYwuy0ntGzwstx6RDABsAUG7i6MBXhcum3AAszgFFyvFxG07gBiihMJf917HvZJx+2
 bHnOyV6yK44/jOJqwzksWJCMnmWVKzxuFtdTvZEMBhx0/dArl7qsmuCINSG0muY1adEw
 fbBsQCI8o0UEOoRyvNLBg8NGPednJeR+YkeMIDTajoIx3DinyCdcRxetzC1b4j3j7aYM
 8Lv8TfGybzmNdsA5oI4OycKUj8OTfB+eo6V7kRxqzpVQygYRCMb7yedYmeqNQH/rQBwx
 gbRFu3b5e52Gnz7GlE1twsQ+3yecicjTymamHHZ/j3MHGjl/LxabJURhajXFm2fRDnun
 jziA==
X-Gm-Message-State: AOAM533c9AZE6dAh+3h1INdjg1CUGFgJaXICcezQz21iGX4CndHQUVn+
 WQDY3NE8dzANQLj9/bLPMs2+5w==
X-Google-Smtp-Source: ABdhPJz4U0SFMKbuRetEQEZzDCRUPNGX4AS0HvGB5qXE08aSw3VbH+TXGrTMaRoGSJlbrHwwkJhR0Q==
X-Received: by 2002:adf:f207:: with SMTP id p7mr12860387wro.292.1596805600727; 
 Fri, 07 Aug 2020 06:06:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm11063196wrh.63.2020.08.07.06.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:06:38 -0700 (PDT)
Date: Fri, 7 Aug 2020 15:06:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <20200807130636.GD2352366@phenom.ffwll.local>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
 <20200807090706.GA2352366@phenom.ffwll.local>
 <20200807123802.6058baca@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807123802.6058baca@eldfell>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 12:38:02PM +0300, Pekka Paalanen wrote:
> On Fri, 7 Aug 2020 11:07:06 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Thu, Aug 06, 2020 at 10:33:31AM +0000, Simon Ser wrote:
> > > Some drivers may expose primary planes compatible with multiple CRTCs.
> > > Make this clear in the docs: the current wording may be misunderstood as
> > > "exactly one primary plane per CRTC".
> > > 
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_plane.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index b7b90b3a2e38..108a922e8c23 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -49,8 +49,8 @@
> > >   * &struct drm_plane (possibly as part of a larger structure) and registers it
> > >   * with a call to drm_universal_plane_init().
> > >   *
> > > - * Cursor and overlay planes are optional. All drivers should provide one
> > > - * primary plane per CRTC to avoid surprising userspace too much. See enum
> > > + * Cursor and overlay planes are optional. All drivers should provide at least
> > > + * one primary plane per CRTC to avoid surprising userspace too much. See enum  
> > 
> > I think that's even more confusing, since this reads like there could be
> > multiple primary planes for a specific CRTC. That's not the case, there'
> > only one pointer going from drm_crtc->primary to a drm_plane in the
> > kernel.
> 
> There could be multiple primary planes *usable* for a specific CRTC but
> just one used at a time, right?

I'm not sure what you mean here, the crtc->primary link is invariant over
the lifetime of a driver load. You can't pick a different one, that's set
at driver init before drm_dev_register (and hence before userspace ever
sees anything).

> > The problem is that userspace doesn't have a drm_property to read this
> > pointer, and needs to guess.
> > 
> > I thought the rule is:
> > 
> > Nth primary plane (or cursor) is the primary plane for the Nth crtc.
> > Enumaration with increasing drm kms object ids.
> 
> Why is that needed? With universal planes, I thought
> drmModePlane::possible_crtcs bitmask is trustworthy?

Yes it should be.

> In the legacy KMS UAPI you can't even pick your primary plane, because
> it's implied in drmModeSetCrtc(), right?

Yup, I thought this all was so userspace knows which plane is the implied
one for legacy ioctls. Which does somewhat matter, since page_flip ioctl
has more features than atomic (target frame and async mode).

> > And I guess we should explain that on some hw any plane (including primary
> > ones, since that's only a sw construct) can be freely assinged to crtc.
> > 
> > Yes it's probably the most gloriously bonkers uapi we've come up with.
> > Might be so bad that a libdrm helper to look up the primary plane for a
> > crtc (or it's cursor plane if it exists) would be in order :-)
> 
> I'm not sure I see the bonkers there.

Userspace has to guess which primary plane is for which crtc, at least if
the possible_crtc mask has more than one bit set. Which can happen.
-Daniel
> 
> 
> Thanks,
> pq
> 
> > 
> > Cheers, Daniel
> > 
> > 
> > >   * drm_plane_type for a more in-depth discussion of these special uapi-relevant
> > >   * plane types. Special planes are associated with their CRTC by calling
> > >   * drm_crtc_init_with_planes().
> > > -- 
> > > 2.28.0
> > > 
> > >   
> > 
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
