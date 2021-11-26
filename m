Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFA45F2B4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 18:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CDA6F9F5;
	Fri, 26 Nov 2021 17:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B9A6F9F5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 17:12:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s13so20096826wrb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 09:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mKQQEOLgfwgPrpmADfBxmDv6SjJtSDclYRDJ7pHl6tc=;
 b=ZaWylaY4rzITKEjM+Or0AV4lVjmMfpJEM23p9DnUBSl9u4ZzUAG6OqrlDFiRRZxPaN
 bbHLjn+PvS1xPIdHlwG5qs1ejjGAPtoeluIP4dgXSgpryCZut+/ZvtPTv4oq8vCmO4QZ
 opIakBNoPGqZXsfwbQZx3PtYPij+xsXCV3EYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mKQQEOLgfwgPrpmADfBxmDv6SjJtSDclYRDJ7pHl6tc=;
 b=iHEAzr6eVg50RhWWjcgs3gsXhEHE3R0T3WwNukGQzEvJb9T24fY2tH9/+gdifEFY/l
 L4K7csn7bCHTktq3STMumZvLOG/+Jl8wZi6raQSlsRsivMhKCPJES2EREORhciISkLgX
 YYwNfprCx/O1zT2M7FuEvfv6DkBs3z8xhPt66dNqFc+j0Xv3xwDzmYT7vaQ+HZAEwf62
 eXy9znxxgtRolbJ63KzkPOoPOn2AEYD0IaicwbvRv02PYsZUQ0Vl4buZ2E7E1bLcrdYY
 a6EUEaXvWIgIwgeXrO8J3/QZdwNXbvcxa19kHT9Ow7imaqhmRqoDgZyFV4jF+9awpcfi
 s+tw==
X-Gm-Message-State: AOAM532kkIK14s2y9Wp2dqFYcA2zJKT1IPJkRFJk3mVJzjzXIohhOTEt
 I1dAIsbKyh3lO1IM1/QfeFNr+Q==
X-Google-Smtp-Source: ABdhPJxbue+GDzuFkqQ3DVFQY5w6TIfKh6VJnBl/tWF4U8r6RIrD9KqB5Ei5Y/12jURlFmGQiyDjYg==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr16432103wrs.291.1637946764363; 
 Fri, 26 Nov 2021 09:12:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o12sm9272376wrc.85.2021.11.26.09.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 09:12:43 -0800 (PST)
Date: Fri, 26 Nov 2021 18:12:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Message-ID: <YaEVirocULCwNNnZ@phenom.ffwll.local>
References: <20211118103814.524670-1-maxime@cerno.tech>
 <YZfKSmWs3n8zRUd0@phenom.ffwll.local>
 <20211126154349.aksr4kjhvj3xueir@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126154349.aksr4kjhvj3xueir@houat>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 04:43:49PM +0100, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Fri, Nov 19, 2021 at 05:01:14PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 18, 2021 at 11:38:01AM +0100, Maxime Ripard wrote:
> > > This is a follow-up of the work to support the interactions between the hotplug
> > > and the scrambling support for vc4:
> > > 
> > > https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tech/
> > > https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.tech/
> > > 
> > > Ville feedback was that the same discussion happened some time ago for i915,
> > > and resulted in a function to do an full disable/enable cycle on reconnection
> > > to avoid breaking the HDMI 2.0 spec.
> > > 
> > > This series improves the current scrambling support by adding generic helpers
> > > for usual scrambling-related operations, and builds upon them to provide a
> > > generic alternative to intel_hdmi_reset_link.
> > 
> > Out of curiosity, can we rebuild intel_hdmi_reset_link on top of these?
> > Always better to have two drivers to actually show the helpers help, than
> > just one.
> 
> Unfortunately, I don't have any Intel system I can test it on, and it
> looks like the changes wouldn't be trivial.
> 
> Maybe we can use dw-hdmi instead?

Hm I guess so, maybe Ville can be motivated. Just figured since this seems
at least inspired by i915 code.

Also we have CI running on intel-gfx, so if you just type well enough it
generally works out and CI catches anything you got wrong. Christian König
is pretty good at not breaking i915 with all the dma-buf and ttm changes
nowadays, much better than random arm socs dying.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
