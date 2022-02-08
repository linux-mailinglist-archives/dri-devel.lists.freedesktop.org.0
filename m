Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C40654AD877
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 13:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1B910E325;
	Tue,  8 Feb 2022 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01A10E13E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 12:54:04 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id d10so52084069eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 04:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EdOABUNENMY5hYtYPGRPZmVz5tXWbGx6V9rHvVTwsTo=;
 b=KgFzVhnS+WwfF4ySk8R2/5G/qaN9zSc7f1Btrik8l3ywATzIA1H3npms8IV/EEj2KI
 IEWyrGEr/Q+oBaB+rZIL/nu2xrfklQucAehi0E2n5WYRj0scoAYhI4cerIdykx1YxOFA
 bOMwE/D9+192GSVfQxod36C2LT3HZ1niWajoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EdOABUNENMY5hYtYPGRPZmVz5tXWbGx6V9rHvVTwsTo=;
 b=Q3komylZk3Y0rpL8FrefrLvs6MNMqokJRFbEhTiIZZ7rLagqPzI6eAtn4EHE74h+Z/
 xI5iB6PNttA71mzr7T19b8J6+qMWIETJbLLsIA4y+q2b22Y3zrc4Y/CmpUmPctOYPoHn
 ryX/fGMt5+eqUIu3Xn94POcxn52PMADqSNzQs2LBOWqRJyyqO8yY1LTaT7kz/sQODE2u
 lHZbIltR5XQkXr6qL7SV145RAoDyoUIAevGajppBtpZQ3OVTqWfD6TJnz4dJ2RnSiObk
 eLKbc8GhZZVUsZ1T/Qipg69Ze7/w+muNAAoi7Ma6M8ACx7nn9GfD5ynv+nmOuS6DBRO3
 /DnA==
X-Gm-Message-State: AOAM530HViquVMZ2+sOgoboaUNSsvZlmVkg4FQGoU8opHB2x12TsvBKK
 pa9+rsJWb06MyKVGeIyApwdt+g==
X-Google-Smtp-Source: ABdhPJyjoXx7TZnQW6xw4xjBqA0XWuDhxN1WRj0W2ugU65gZDBqDw0EPp6tl28mczrKVDEoZQx+16g==
X-Received: by 2002:a17:906:94e:: with SMTP id
 j14mr3514523ejd.369.1644324842613; 
 Tue, 08 Feb 2022 04:54:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d18sm4740261ejd.95.2022.02.08.04.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:54:01 -0800 (PST)
Date: Tue, 8 Feb 2022 13:53:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 02/35] component: Introduce the aggregate bus_type
Message-ID: <YgJn57s8u2OsBGnW@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-3-swboyd@chromium.org>
 <YffoqgmeUdxZ56zB@kroah.com>
 <CAKMK7uFYyQ9siB5ENHku+yVPWWM1H=TEn-NZofEKqpJnuEvMmw@mail.gmail.com>
 <YfgPkliOLorgXwVE@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfgPkliOLorgXwVE@kroah.com>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 05:34:26PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 31, 2022 at 04:15:09PM +0100, Daniel Vetter wrote:
> > On Mon, Jan 31, 2022 at 2:48 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jan 27, 2022 at 12:01:08PM -0800, Stephen Boyd wrote:
> > > > The component framework only provides 'bind' and 'unbind' callbacks to
> > > > tell the host driver that it is time to assemble the aggregate driver
> > > > now that all the components have probed. The component framework doesn't
> > > > attempt to resolve runtime PM or suspend/resume ordering, and explicitly
> > > > mentions this in the code. This lack of support leads to some pretty
> > > > gnarly usages of the 'prepare' and 'complete' power management hooks in
> > > > drivers that host the aggregate device, and it fully breaks down when
> > > > faced with ordering shutdown between the various components, the
> > > > aggregate driver, and the host driver that registers the whole thing.
> > > >
> > > > In a concrete example, the MSM display driver at drivers/gpu/drm/msm is
> > > > using 'prepare' and 'complete' to call the drm helpers
> > > > drm_mode_config_helper_suspend() and drm_mode_config_helper_resume()
> > > > respectively, so that it can move the aggregate driver suspend/resume
> > > > callbacks to be before and after the components that make up the drm
> > > > device call any suspend/resume hooks they have. This only works as long
> > > > as the component devices don't do anything in their own 'prepare' and
> > > > 'complete' callbacks. If they did, then the ordering would be incorrect
> > > > and we would be doing something in the component drivers before the
> > > > aggregate driver could do anything. Yuck!
> > > >
> > > > Similarly, when trying to add shutdown support to the MSM driver we run
> > > > across a problem where we're trying to shutdown the drm device via
> > > > drm_atomic_helper_shutdown(), but some of the devices in the encoder
> > > > chain have already been shutdown. This time, the component devices
> > > > aren't the problem (although they could be if they did anything in their
> > > > shutdown callbacks), but there's a DSI to eDP bridge in the encoder
> > > > chain that has already been shutdown before the driver hosting the
> > > > aggregate device runs shutdown. The ordering of driver probe is like
> > > > this:
> > > >
> > > >  1. msm_pdev_probe() (host driver)
> > > >  2. DSI bridge
> > > >  3. aggregate bind
> > > >
> > > > When it comes to shutdown we have this order:
> > > >
> > > >  1. DSI bridge
> > > >  2. msm_pdev_shutdown() (host driver)
> > > >
> > > > and so the bridge is already off, but we want to communicate to it to
> > > > turn things off on the display during msm_pdev_shutdown(). Double yuck!
> > > > Unfortunately, this time we can't split shutdown into multiple phases
> > > > and swap msm_pdev_shutdown() with the DSI bridge.
> > > >
> > > > Let's make the component_master_ops into an actual device driver that has
> > > > probe/remove/shutdown functions. The driver will only be bound to the
> > > > aggregate device once all component drivers have called component_add()
> > > > to indicate they're ready to assemble the aggregate driver. This allows
> > > > us to attach shutdown logic (and in the future runtime PM logic) to the
> > > > aggregate driver so that it runs the hooks in the correct order.
> > >
> > > I know I asked before, but I can not remember the answer.
> > >
> > > This really looks like it is turning into the aux bus code.  Why can't
> > > you just use that instead here for this type of thing?  You are creating
> > > another bus and drivers for that bus that are "fake" which is great, but
> > > that's what the aux bus code was supposed to help out with, so we
> > > wouldn't have to write more of these.
> > >
> > > So, if this really is different, can you document it here so I remember
> > > next time you resend this patch series?
> > 
> > aux takes a device and splits it into a lot of sub-devices, each with
> > their own driver.
> > 
> > This takes a pile of devices, and turns it into a single logical
> > device with a single driver.
> > 
> > So aux is 1:N, component is N:1.
> > 
> > And yes you asked this already, I typed this up already :-)
> 
> Ok, thanks.  But then why is a bus needed if there's a single driver?
> I guess a bus for that driver?  So one bus, one driver, and one device?

Maybe? I have honestly no idea how this should be best modelled in the
linux device model.

> I think we need better documentation here...

https://dri.freedesktop.org/docs/drm/driver-api/component.html?highlight=component_del#component-helper-for-aggregate-drivers

There's a kerneldoc overview for component, but it's for driver authors
that want to use component to glue different hw pieces into a logical
driver, so it skips over these internals.

And I'm honestly not sure how we want to leak implementation internals
like the bus/driver/device structure ot users of component.c.
-Daniel

> 
> thanks,
> 
> greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
