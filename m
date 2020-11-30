Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAB2C8633
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85CF6E4A7;
	Mon, 30 Nov 2020 14:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2FB6E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:11:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e25so6392102wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9qRzbHDy4yWskW5QhEEgT8r3UGS/MDRB/4O/1y2Si4s=;
 b=UtLJfxjqf+Ge4zZY0fdlCAz4ebigmTu4Vvevg+LzZ6mwqyMKS96zpoVkuq4vyFJQwG
 iqXm6MuH8wKhbZ4xehMWdzcooTZxxQv+jc4x1ZAmcoQUt2kEE3P4YChJHLrqux9dGx1B
 NTaJHbNjgjuOPMlM4OfuHEZ53WILC3SdhKeuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9qRzbHDy4yWskW5QhEEgT8r3UGS/MDRB/4O/1y2Si4s=;
 b=AKTgZ7Ra+AJr/80od0vFBj86JFV6um270dmW/04GI3CH/BJmvfP5ObX7/AOFqcbCFe
 W5dzFxqrm2KPRZIzpksKQGMVBLoD+BsTdb2yIVs6vi5bBUOzN/r4GQ5uYucC/wWQKPE8
 vOL7oZS+SimPAst4OowlJhf6tLL/Kc51AqY7KjSV8gRP108x5wU0nxaYxLXwcL405blb
 gwU593xdGdwlgI9VRNGpopt7BRzD55hNoDR3SXt4bNxc32uA3CxEVPKCfUS7EcYKzqat
 ZPv2Hxp+ORKDdzLk5DhfOZ+Hv3wLVGeA/UWQs7KNnz4pSrwuDcjRKs+eXr/c/nQWPKJ7
 2F/w==
X-Gm-Message-State: AOAM530qBCAu5gHJ7H/XZk2eESHsOtnUGhbhcEp4fzF1SJ6WG8SRlDuj
 XAGXMiiPVM5n3AzRc9i1T/6KLg==
X-Google-Smtp-Source: ABdhPJz3DNMzV6IOZGj/YzG8aOQV9C042jYhGfH/113iaAKJ2iK64z2bxDxbbG5AxAX4+9FaElMXAQ==
X-Received: by 2002:a05:600c:2a4b:: with SMTP id
 x11mr23851282wme.165.1606745460348; 
 Mon, 30 Nov 2020 06:11:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e1sm5815268wma.17.2020.11.30.06.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 06:10:59 -0800 (PST)
Date: Mon, 30 Nov 2020 15:10:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
Message-ID: <20201130141057.GL401619@phenom.ffwll.local>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
 <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 02:12:39PM +0200, Tomi Valkeinen wrote:
> On 30/11/2020 12:38, Laurent Pinchart wrote:
> 
> >> + * can be used when the driver exposes either only GAMMA_LUT or both GAMMA_LUT
> >> + * and DEGAMMA_LUT.
> >> + */
> >> +int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >> +				       u16 *red, u16 *green, u16 *blue,
> >> +				       uint32_t size,
> >> +				       struct drm_modeset_acquire_ctx *ctx)
> >> +{
> >> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, false);
> >> +}
> > 
> > I wonder, would it make sense to make this automatic by setting the
> > degamma LUT when only the DEGAMMA_LUT property exists, and the gamma LUT
> > otherwise ? Are there use cases for drm_atomic_helper_legacy_degamma_set
> > for drivers that support both gamma and degamma ?
> 
> Yes, I think drm_atomic_helper_legacy_gamma_set() could do that.
> 
> But if you look at the second patch, the driver deals with crtc_state->degamma_lut. Having
> .gamma_set = drm_atomic_helper_legacy_degamma_set makes it bit more explicit and clear what the
> driver is doing.
> 
> That said, documenting what drm_atomic_helper_legacy_gamma_set does if there's only degamma should
> also be clear enough, so... I don't have strong feelings either way =).

The thing is, the legacy helpers should be able to pull off what userspace
needs to do when it's using atomic anyway. Hard-coding information in the
kernel means we have a gap here. Hence imo legacy helpers doing the right
thing in all reasonable cases is imo better.

In many cases I think we should even go further, and ditch driver ability
to overwrite legacy helper hooks like this. I thought we'd need that
flexibility for legacy userspace being incompatible in awkward ways, but
wasn't ever really needed. Worse, many drivers forget to wire up the
compat hooks.

tldr, imo right thing to do here:
- move legacy gamma function from helpers into core code
- call it unconditionally for all atomic drivers (if there's no legacy
  drivers using the hook left then we can outright remove it)
- make sure it dtrt in all cases

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
