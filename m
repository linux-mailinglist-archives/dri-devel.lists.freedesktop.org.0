Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7836D6EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 14:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6EA6EB12;
	Wed, 28 Apr 2021 12:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9346EB17
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:01:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so5797651wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zRTwZDIMEug7eq8wLchSA3HYXcGCiSNFSb2xqcGW3kc=;
 b=RZIQbZs/DTaqDN5ZZWnAh3edmuBY9bJ0NyA+RIBALC5woZ+FyLeoQj98VU67s5cWBB
 lotrfULMBuQDxm5rB3GXpwXVT5Liayay8IxE+vgnmAmSVAC4G6DYJQtDc3v3HUfY+kZ7
 D7L5qPTL5rZV2XGiUW5TsB2bo8LJW250HdfiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zRTwZDIMEug7eq8wLchSA3HYXcGCiSNFSb2xqcGW3kc=;
 b=iku9DIkk4j1AB/wOvPdsrztpadaOQhF2XL1uR/HCHlSMwcT85iRJ98IitvE0bt8kA8
 Y/BpwjpM8Kjax4JSztWgVGsl5r8voSFIC7YL0ZsaKjcr71K7zbiD3PW0xrX1zBDBMwQT
 W9QcfrfgdsGt2YGAi7RhHoKCuxgHmLQS/O099xmtUxVHDZB2UL/rQntcWV+jT4rMBv1V
 yrJ2rD+0HWDSqmusK6IgyxjlhiF5TGBarkvzyDNB7ZLsUTOfZfhOGJ4wIrbcmY/D3SfE
 ICcIleAw9sE4DHv4dhO0fkrjruoBmXC70Z0ajv1rvYPUpTjpx2q/glUdbPr4YnnkP9MR
 HvFw==
X-Gm-Message-State: AOAM533bo3L5E6EgYs1PYO84C21WQ6z2zHm/qOZ9Q+xY084SPqlwcZdI
 1F1Wh8Zw8bsp9PpCq1JnW+G3zg==
X-Google-Smtp-Source: ABdhPJwZC8KxJWX0d619avjc+oSE0hszHoJdi563RuhAuntI+ReO7W8q1lFH/F7C1n/e5B8hpoxDBA==
X-Received: by 2002:a05:600c:2315:: with SMTP id
 21mr15191400wmo.39.1619611299185; 
 Wed, 28 Apr 2021 05:01:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x8sm7781806wru.70.2021.04.28.05.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:01:38 -0700 (PDT)
Date: Wed, 28 Apr 2021 14:01:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Display notch support
Message-ID: <YIlOoHcPyk91Pone@phenom.ffwll.local>
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
 <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
 <20210428104403.1e49f270@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428104403.1e49f270@eldfell>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martijn@brixit.nl, Caleb Connolly <caleb@connolly.tech>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 10:44:03AM +0300, Pekka Paalanen wrote:
> On Wed, 28 Apr 2021 07:21:28 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > > A solution to make this configuration generic and exposed by the kernel
> > > would standardise this across Linux  
> > 
> > Having a KMS property for this makes sense to me.
> > 
> > Chatting with Jani on IRC, it doesn't seem like there's any EDID or
> > DisplayID block for this.
> > 
> > Note, Android exposes a data structure [1] with:
> > 
> > - Margin of the cut-out for each edge of the screen
> > - One rectangle per edge describing the cut-out region
> > - Size of the curved area for each edge of a waterfall display
> > 
> > I haven't found anything describing the rounded corners of the display.
> > 
> > [1]: https://developer.android.com/reference/android/view/DisplayCutout
> 
> Hi,
> 
> I'm kind of worried whether you can design a description structure that
> would be good for a long time. That list already looks quite
> complicated. Add also watch-like devices with circular displays.
> 
> Would the kernel itself use this information at all?
> 
> If not, is there not a policy that DT is not a userspace configuration
> store?

If someone is sufficiently bored it would make sense to teach fbcon (but
not fbdev I guess for full sized boot splash) to avoid the edges/corners
for output.

But also fbcon/fbdev is I think finally dead on Android, so the
intersection of people who care about cut-outs and fbcon is likely 0.

Otherwise I can't think of anything.

> You mentioned the panel orientation property, but that is used by the
> kernel for fbcon or something, is it not? Maybe as the default value
> for the CRTC rotation property which actually turns the image?
> 
> Assuming that you succeed in describing these non-usable, funny
> (waterfall edge), funny2 (e.g. behind a shade or filter so visible but
> not normal), funny3 (e.g. phone button area with maybe tactile
> markings), and normal areas, how would userspace handle this
> information?
> 
> Funny2 and funny3 are hypothetical but maybe not too far-fetched.
> 
> Is there any provision for generic userspace to handle this generically?
> 
> This seems more like a job for the hypothetical liboutput, just like
> recognising HMDs (yes, I know, kernel does that already, but there is a
> point that kernel may not want to put fbcon on a HMD).

I think the desktop linux solution would be hwdb entries, except we've
never done this for anything display related. So yeah liboutput sounds
about right for this :-)

Btw on fbcon on HMD, I thought we're already taking care of that?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
