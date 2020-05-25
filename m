Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0441E1174
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8765E89FA7;
	Mon, 25 May 2020 15:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CE89FA7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:15:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so13120258wru.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nZhVmkt+k/PyFcD9bZVLAYu1XJoNkOIXHLmqHm7k94U=;
 b=OwLv4qS2wQCVMlsqNIL7hzAy5rqofwmaMCuWSrDQQbULLzvLH2jVF5vSjJY39qp7ne
 XaG9HLb/49ZUZ5hVr1Xk91gF61IdTzHomegLrQWv7OGAnA9rVB0TgfDxa+pTFkHa0bsu
 4FbobgB4V2eUmWU83NuYbbQgttOk0WfZWdeZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZhVmkt+k/PyFcD9bZVLAYu1XJoNkOIXHLmqHm7k94U=;
 b=QigeIGBzVZUHBEVJnva2yXKYIM1uq6LtJR6VDifGALbTH059IUQjlpvORhRgqKOGTd
 U5ckte2mNL7SKxh3eSh5JIPZFXF1mDOaxn3bIa151/3GENwuY0yz/+Pfv8yyR7EjYv1j
 BMcWIKlj0zN1VChQQAvT+a4PTpWQsenB2+lxpGjsWCva/QvKqJqK2PodRAfkNMTtBu0U
 wt96edRdkeLtvTkYkIPtv+q7vhjjlTBxgsBHaGy9qzLuR+kDO797ncFW5OsuNLNuNK6u
 STCkKn0umznB9XxspZ2xFWUWupegyZa+Ff+HA71TT0i/CeY7g0UoZFGTQOk4OeGga4kl
 UhBQ==
X-Gm-Message-State: AOAM530+OaS+D0NBmUQ776jiDpNRyvvQMQjvutbBzYwNWtyt6BdT+fNz
 5EPfv31I87yIr6U3vkbRhaUp9w==
X-Google-Smtp-Source: ABdhPJxIJvxgJNFHAOk12epKlT8D3FmfQISZTgg/56ci6AWFGzlVao5dIvFQRUqthb2mQZOBmTT60w==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr10229237wrb.270.1590419718614; 
 Mon, 25 May 2020 08:15:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r11sm18637253wrv.14.2020.05.25.08.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:15:17 -0700 (PDT)
Date: Mon, 25 May 2020 17:15:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: uday kiran pichika <udaykiran.pichika@gmail.com>
Subject: Re: Adaptive Sync enabling in Xorg Modesetting driver
Message-ID: <20200525151515.GK206103@phenom.ffwll.local>
References: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGcx_0Yu4D6F2BiPp5CnJhMyrupGsnFnzEH0-Gv=8rFuVtDi+w@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 25, 2020 at 07:01:21PM +0530, uday kiran pichika wrote:
> Hello,
> 
> Am working on enabling the Adaptive sync feature as part of the
> Xorg/Modesetting DDX driver by taking the reference of AMD DDX Driver
> (xf86-video-amdgpu). Below is the commit which i submitted.
> https://gitlab.freedesktop.org/pichika/xserver/-/commit/682565a645bda7371cc3731ee805cc4a0ace80db
> 
> 
> I have made the below changes to enable this feature
> 1. Enable Adaptive sync in Graphics Driver
> 2. Added Xorg.conf file with VariableRefresh property which is read in the
> Modesetting driver --> This is working fine.

-modesetting, even in latest git master branch doesn't have VRR support.

So yeah this wont work.
-Daniel

> 
> After taking the above changes, am observing that Adaptive sync is not
> working.
> 
> Below are my observations.
> 1. loader_dri3_helper.c  --> Adaptive sync property is being set once the
> system is booted successfully on one Window. Once
> set_adaptive_sync_property() method gets called, adaptive_sync_active flag
> is setting to true. From the next time, when fullscreen applications are
> loaded, this property never gets set on any window.
> 2. Once this property is being set, received a notification in modesetting
> ddx driver and read the property from the Stuff->window.
> 3. But when the fullscreen application(Either DOTA or Xonotic), not
> observing that this propety is not being set on any app window.
> 
> Can any one please help me why this property is not being set in the
> application windows ?
> 
> Thanks
> Uday Kiran

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
