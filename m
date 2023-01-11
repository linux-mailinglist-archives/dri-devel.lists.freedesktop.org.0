Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188A66660C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E57C10E15A;
	Wed, 11 Jan 2023 22:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980EF10E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:12:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g10so12028994wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=puQJMZAXq+jxRpYDbjjRTYdEjNDa+slLUzHEjQz6lZ0=;
 b=cKNPK2A3MWtAnKmtMV82WV7uswmiK3SiTH7n/oF2Vdu+46Se28PC5JeUl63TURvPX5
 bIk18j+EYcn5hyTiAaOvT1r6J13315KgwjxvZ4R25Mza1I2sho+CAkRkE1gzseYf6gFj
 aXa4q1YPtH2dRSt4qyE70pLmZ2BEFeur+tnNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puQJMZAXq+jxRpYDbjjRTYdEjNDa+slLUzHEjQz6lZ0=;
 b=flI08sj581qsRPuJsseRFWx5sVHvd2a/Mec7ChEd4tIYClYAKiGfWmgThhJnBxYfef
 V/S1nUGE0xid7uGzpKLzp0a4uPfBTYqJwkod4RCDkzqT4XAVs4guQmHDnqBCQd7Y7yXs
 P+nO+p8iV0D94UXlQ+WOofenT7AKxAge0IB1+WsSPMmOY153g8ckGAB/9R0DuJzx7XWo
 SYvRSvpsfQunR+GhcvBB2Ay4+5+vskrOTSxVYGP5zrL2D2xqYuNj09CgaD13Up6gaLIG
 lrJkTUtg9J814PqXbT1ARKK3RstDkodZGK+SwDItoM1VEQa6XSAxM63W+GgJDSpxo2Dr
 Ahtg==
X-Gm-Message-State: AFqh2krP2Q2aDsTG2WyXN0+1/0hmxlBGLdHI1uISLiAHAIExQGbzhtDG
 QIB2PFksDRkGobQ8a7w0P/HIZw==
X-Google-Smtp-Source: AMrXdXvJv8pUtWHBhlK19mpCwzV9aMfT/sBu3rAKnDcXWOaW6cdboVu/zcBgeBthBMPJ59ixWfL5NQ==
X-Received: by 2002:a05:600c:6003:b0:3d6:10e:68a8 with SMTP id
 az3-20020a05600c600300b003d6010e68a8mr54560513wmb.0.1673475139157; 
 Wed, 11 Jan 2023 14:12:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b003c6c3fb3cf6sm19198872wmj.18.2023.01.11.14.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:12:18 -0800 (PST)
Date: Wed, 11 Jan 2023 23:12:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <Y780QKVL6uRx3ZYp@phenom.ffwll.local>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
 <IA0PR11MB718594D9F06FC52B5CC07279F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB718594D9F06FC52B5CC07279F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 01:58:52AM +0000, Kasireddy, Vivek wrote:
> Hi Daniel,
> 
> > 
> > On Fri, Jan 06, 2023 at 09:56:40AM +0100, Gerd Hoffmann wrote:
> > > On Thu, Nov 17, 2022 at 05:30:54PM -0800, Vivek Kasireddy wrote:
> > > > Setting this property will allow the userspace to look for new modes or
> > > > position info when a hotplug event occurs.
> > >
> > > This works just fine for modes today.
> > >
> > > I assume this is this need to have userspace also check for position
> > > info updates added by patch #1)?
> > 
> > What does this thing even do? Quick grep says qxl and vmwgfx also use
> > this, but it's not documented anywhere, and it's also not done with any
> > piece of common code. Which all looks really fishy.
> [Kasireddy, Vivek] AFAIU, this property appears to be useful only for virtual
> GPU drivers to share the Host output(s) layout with the Guest compositor. The
> suggested_x/y properties are specifically used for this purpose but it looks like
> the hotplug_mode_update property also needs to be set in order to have Guest
> compositors (Mutter cares but Weston does not) look at suggested_x/y.
> 
> > 
> > I think we need to do a bit of refactoring/documenting here first.
> [Kasireddy, Vivek] Just for reference, here is Dave's commit that added this
> property for qxl:
> commit 4695b03970df378dcb93fe3e7158381f1e980fa2
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Fri Oct 11 11:05:00 2013 +1000
> 
>     qxl: add a connector property to denote hotplug should rescan modes.
> 
>     So GNOME userspace has an issue with when it rescans for modes on hotplug
>     events, if the monitor has no EDID it assumes that nothing has changed on
>     EDID as with real hw we'd never have new modes without a new EDID, and they
>     kind off rely on the behaviour now, however with virtual GPUs we would
>     like to rescan the modes and get a new preferred mode on hotplug events
>     to handle dynamic guest resizing (where you resize the host window and the
>     guest resizes with it).

Ok this is just terrible. Because _anything_ without an EDID is impacted,
and we're certainly not going to sprinkle this property all over gpu
drivers just so Gnome takes the right path.

Can we fix gnome instead to be slightly less dense about this stuff?

>     This is a simple property we can make userspace watch for to trigger new
>     behaviour based on it, and can be used to replaced EDID hacks in virtual
>     drivers.
> 
> Are you suggesting that this property needs to be part of drm_mode_config
> just like suggested_x/y properties?

I think this thing shouldn't exist :-)

> > Also in principle, userspace needs to look at everything in the connector
> > again when it gets a hotplug event. We do have hotplug events for specific
> > properties nowadays, but those are fairly new.
> [Kasireddy, Vivek] From what I understand, Mutter does probe all the
> connector properties during hotplug but it still needs this property to be set in
> order to consider suggested_x/y values. And, it appears, some customers and
> users have relied on this behavior from when these properties were first
> introduced for virtual GPU drivers.

Be more like Weston. Whatever it is mutter does, it doesn't make much
sense to me. We can't remove this from existing gpu drivers because no
regression guarantee, but we definitely shouldn't add it anywhere.

Also can you please document that this is a "do not ever use this in any
new driver" kind of property when you go about docementing these?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
