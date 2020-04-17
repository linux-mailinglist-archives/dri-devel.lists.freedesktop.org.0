Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806721AE04A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E46EC28;
	Fri, 17 Apr 2020 14:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C72D6EC28
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:59:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j2so3380949wrs.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=K1yv5KXIjcRXiQesSjtc2X/zk9fpttmuG690chef5K4=;
 b=B++GXF0em2Jzjt69Q39Jcoje491drVo7PXak75gK41WUhVDv0aVdx8aV/cNX1p4XQB
 nfKY8pEBqzhxF6X8Rdvs2Ty7OTHsI837JT1Xdv9oksgOFKgTqUUxzjTNFnrbJ9rcy9RZ
 fHUcSchGpcBcxQT6eXCfbly2gk69IFbxspBEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=K1yv5KXIjcRXiQesSjtc2X/zk9fpttmuG690chef5K4=;
 b=qO138wWMftvIFaS61YPpAt0tjmi1l0qUf7nwpzsDQGA5r2XrfJr7aTnHmul6tvqnFg
 kfnxXCoMzb01HCadUcUCZ1ANli/VJRzMhMwljsLe+G/mFT/1EKAlOmM746bgMINvKiEZ
 oSexL9f4GOy4IaGKw7IKpe6RQEAg0aU35cTypheE8bsIUDmTUI4bSdJw2bMlrcNTI6WA
 CnMsmANaabbxAZc3wVFjdjjEy20oICtaCIEhkPXY+G6jzeJZ1Q8X6PAsR/a/Rz+sdjoV
 hWjlVZ3dUPzgFGULzwNWxJjefG9hiCfwc0aYWszLWFylA9wApmx/MVbyQgif7z7D+Fif
 Hdyg==
X-Gm-Message-State: AGi0Pub1pK9sw1ahX2xTZ8dr5V9K1spHMtbRQBfohWY0R2uxnQmNrsem
 Tx4go7OHPD9BtO3o0LIWy3EroQ==
X-Google-Smtp-Source: APiQypJE75+rE9jNQuzIaX2c/0sI+SGXxBg8LzxkKXBxVn64wXyVqrLRtA/2SjtFQwLMk76TwezaMA==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr4711484wra.342.1587135551650; 
 Fri, 17 Apr 2020 07:59:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y40sm9395117wrd.20.2020.04.17.07.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 07:59:10 -0700 (PDT)
Date: Fri, 17 Apr 2020 16:59:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yussuf Khalil <dev@pp3345.net>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
Message-ID: <20200417145909.GM3456981@phenom.ffwll.local>
Mail-Followup-To: Yussuf Khalil <dev@pp3345.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simon Ser <contact@emersion.fr>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
 <87ftd6mi3e.fsf@intel.com> <87d08amhy5.fsf@intel.com>
 <20200414123404.GT3456981@phenom.ffwll.local>
 <2cfe44c96818515939050ad19e9c248e50519be2.camel@pp3345.net>
 <87r1wp5hkq.fsf@intel.com>
 <20200415111336.GZ3456981@phenom.ffwll.local>
 <35ab8ba55f661cb8fd3ee65322e790421b65ef53.camel@pp3345.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35ab8ba55f661cb8fd3ee65322e790421b65ef53.camel@pp3345.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 03:44:53PM +0200, Yussuf Khalil wrote:
> On Wed, 2020-04-15 at 13:13 +0200, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 10:33:25AM +0300, Jani Nikula wrote:
> > > On Tue, 14 Apr 2020, Yussuf Khalil <dev@pp3345.net> wrote:
> > > > On Tue, 2020-04-14 at 14:34 +0200, Daniel Vetter wrote:
> > > > > On Tue, Apr 14, 2020 at 02:21:06PM +0300, Jani Nikula wrote:
> > > > > > On Tue, 14 Apr 2020, Jani Nikula <jani.nikula@linux.intel.com
> > > > > > >
> > > > > > wrote:
> > > > > > > On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
> > > > > > > > On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <
> > > > > > > > dev@pp3345.net> wrote:
> > > > > > > > 
> > > > > > > > > DRM now has a globally available "RGB quantization
> > > > > > > > > range"
> > > > > > > > > connector
> > > > > > > > > property. i915's "Broadcast RGB" that fulfils the same
> > > > > > > > > purpose is now
> > > > > > > > > considered deprecated, so drop it in favor of the DRM
> > > > > > > > > property.
> > > > > > > > 
> > > > > > > > For a UAPI point-of-view, I'm not sure this is fine. Some
> > > > > > > > user-
> > > > > > > > space
> > > > > > > > might depend on this property, dropping it would break
> > > > > > > > such
> > > > > > > > user-space.
> > > > > > > 
> > > > > > > Agreed.
> > > > > > > 
> > > > > > > > Can we make this property deprecated but still keep it
> > > > > > > > for
> > > > > > > > backwards
> > > > > > > > compatibility?
> > > > > > > 
> > > > > > > Would be nice to make the i915 specific property an "alias"
> > > > > > > for
> > > > > > > the new
> > > > > > > property, however I'm not sure how you'd make that happen.
> > > > > > > Otherwise
> > > > > > > juggling between the two properties is going to be a
> > > > > > > nightmare.
> > > > > > 
> > > > > > Ah, the obvious easy choice is to use the property and enum
> > > > > > names
> > > > > > already being used by i915 and gma500, and you have no
> > > > > > problem.
> > > > > > Perhaps
> > > > > > they're not the names you'd like, but then looking at the
> > > > > > total
> > > > > > lack of
> > > > > > consistency across property naming makes them fit right in.
> > > > > > ;)
> > > > > 
> > > > > Yeah if we don't have contradictory usage across drivers when
> > > > > modernizing
> > > > > these properties, then let's just stick with the names already
> > > > > there.
> > > > > It's
> > > > > not pretty, but works better since more userspace/internet
> > > > > howtos
> > > > > know how
> > > > > to use this stuff.
> > > > > -Daniel
> > > > 
> > > > Note that i915's "Broadcast RGB" isn't the same as gma500's: i915
> > > > has an
> > > > "Automatic" option, whereas gma500 does not.
> > > 
> > > Adding "Automatic" option that just defaults to "Full" in gma500
> > > does
> > > not break existing userspace, but allows for extending it to do
> > > more
> > > clever things later.
> > 
> > gma500 could keep it's own property, without the "Automatic" value.
> > We've
> > done tricks like this for other properties too.
> > 
> > > > Also, radeon has a property called
> > > > "output_csc" that fulfills a similar purpose. Looking at the
> > > > code, though, it
> > > > seems that radeon does not adhere to the standard correctly (or I
> > > > am missing
> > > > something).
> > > > 
> > > > An alternative would be to leave the existing driver-specific
> > > > properties and
> > > > change them to be pseudo-aliases for the "RGB quantization range"
> > > > property.
> > > > This can be done by letting the drivers read from and write to
> > > > the new property
> > > > when user-space tries to read or modify the driver's property.
> > > > This way we could
> > > > retain full backwards compatibility for all drivers equally.
> > > > 
> > > > What do you think?
> > > 
> > > I'm obviously biased and predisposed to avoid adding extra
> > > complexity to
> > > i915 when it's not necessary. We'd have *two* connector properties
> > > for
> > > the same thing until the end of time, even if one is an alias for
> > > the
> > > other.
> > 
> > Yeah just pick one, and implement the others as aliases. Drivers can
> > do
> > the aliases in their atomic_get/set_property functions pretty easily,
> > atomic properties aren't stored anywhere else than decoded (which was
> > done
> > partially to make stuff like this work).
> > 
> > Coming up a new property name just so that everyone suffers equally
> > feels
> > silly.
> > -Daniel
> 
> Okay, I understand your point. Leaving gma500 without a proper implementation of
> the "Automatic" value isn't an option though as that would break the whole
> purpose of this patchset: having a property that works precisely the same way
> across all drivers. I'll build a patch that implements standards-compliant
> behavior for gma500 then, so that it can use the same property as the others.

Sounds best. I just generally refrain from volunteering people for work on
very old and abandoned drivers. But if you're willing to type the code,
I'm happy to take it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
