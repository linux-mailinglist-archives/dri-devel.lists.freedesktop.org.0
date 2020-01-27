Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AC14A079
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F256EA7D;
	Mon, 27 Jan 2020 09:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655276EA7C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:10:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so10218641wrq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 01:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=LaExmELKeqqN/VB6j8bOztxrjP/aSDG7/ka9tQvY4fk=;
 b=Y4KGEArLtLfFcYkM9T4qdX7a4awMuADTxyYdbXot2rxEuRXX1gBc7Cn9UdFb4j2+Db
 PHEjg+hhO3omHBCyaugLheiimIIawORmcYaTZJMcT8oMwvYapHdpNnlVvtfUK4m0EIFq
 u2zC7KQFOUJtSE/CunL00ayk6O79zlLEctr58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=LaExmELKeqqN/VB6j8bOztxrjP/aSDG7/ka9tQvY4fk=;
 b=bjOAXWkrEO21K9P8mcvFsaGk0k8GLtEOPLJJSoQjU83Rweb07Q9yMAfIPMvb231aBI
 Q9fPl3fx4PM9Oxpj/8omWnoK7Qv0II5MojvjZ9oeysS0znrh1k4gmPIpIYj77QO5KIJP
 gN0ykXBNNy3pG4iK1y672ngQRPGKrGPbHAKHTPy5o/6hO94xpAA13RmPPfiPIzDPISjO
 VQh7V/lE//2oVDYLgITnEVhFB+B1akP5zSAVnkHELd+HG0pzd43YFFmVW+vWysAszPmu
 foioPEFg6Czq7umBnya1wUNLN3D8YVeNYm3x8T0O3Xa3QteLx6oaZlH8sPCBSr/8y7xr
 Iskw==
X-Gm-Message-State: APjAAAU23D/MRUXA+pEjb7hJ90gYvoui8ZlLo4thIvx2fSPZhbKsDZLx
 9gBC7ogp2LYhCXKi0ef8fXmVJTjEMm8XaQ==
X-Google-Smtp-Source: APXvYqzC7sZ1/B3iVrM8iap5z9JWj2XjpCoYx7tnLotFwm+KVlGuUscVIplTRWzZkjlxGnyMoAMcFQ==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr20948867wrn.280.1580116256070; 
 Mon, 27 Jan 2020 01:10:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t12sm19150488wrs.96.2020.01.27.01.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:10:55 -0800 (PST)
Date: Mon, 27 Jan 2020 10:10:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 0/2] drm/i915/gem: conversion to new drm logging macros
Message-ID: <20200127091053.GV43062@phenom.ffwll.local>
Mail-Followup-To: Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
 <157996851987.2524.2577321446102599250@skylake-alporthouse-com>
 <20200127090557.GU43062@phenom.ffwll.local>
 <158011608131.25356.4337758241793042878@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158011608131.25356.4337758241793042878@skylake-alporthouse-com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 09:08:01AM +0000, Chris Wilson wrote:
> Quoting Daniel Vetter (2020-01-27 09:05:57)
> > On Sat, Jan 25, 2020 at 04:08:39PM +0000, Chris Wilson wrote:
> > > Quoting Wambui Karuga (2020-01-22 12:57:48)
> > > > This series is a part of the conversion to  the new struct drm_device
> > > > based logging macros in drm/i915.
> > > > This series focuses on the drm/i915/gem directory and converts all
> > > > straightforward instances of the printk based logging macros to the new
> > > > macros.
> > > 
> > > Overall, I'm not keen on this as it perpetuates the mistake of putting
> > > client debug message in dmesg and now gives them even more an air of
> > > being device driver debug messages. We need a mechanism by which we
> > > report the details of what a client did wrong back to that client
> > > (tracefs + context/client getparam to return an isolated debug fd is my
> > > idea).
> > 
> > Sean is working on that, but it's a global thing still.
> 
> Go look at how I suggest we can use tracefs in that thread :)

Hm I think we're a few threads further already? Steven Rostedt has jumped
in now too ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
