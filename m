Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C3379359
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB3089F31;
	Mon, 10 May 2021 16:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55789F31
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:05:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v12so17182708wrq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6eqFtigL6XPzGHvJOyisC/fKX/gihfHqH7WepbpRLGM=;
 b=F3TEsHWzvJZFJyaQrrPbpZEVzsQhRp1y6QD4jZXdGpbaDNU5E0thA+IcC5hThHgB5H
 mRIU7AqDRXc1ic3jAMSuLp+Icr+Z6lC82kVLx7g3bkvOuR3FWTicBn8hdUrtgCwI0dSA
 Ing8bBWnxGumxPoJBAowFRgULclwwqwt2M9B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6eqFtigL6XPzGHvJOyisC/fKX/gihfHqH7WepbpRLGM=;
 b=IucJlg1CBkY+CvtnxlKiilbQV0i83Jj2Clh8XlR6Ptj2qDCox2NSrRQ6GaPB+jJ3xY
 vjdBoMlpcGWKI/vOZzJAaKu5MwJJqU4qKam+rpKEkfNpl6tZMggRBBOM0ATY1fDUz7aK
 ZtJjreh72cZI0RpHJt6ZZZiA+W19x/EDYxSVPMbGKLyk5hGjwFqijoi8lY6ernErB+CE
 qnFemO7z8y3PeFZ1CsbsNezkhakgSyXSKlXjfg1NcTlZXVYAf38cWE5wjVy55y4njch0
 RiTiDCGe+sWrhgmp6bjCyQs3lOCxrkljhFWQ0Y95nogyWAmSwcj6SRD9B+TxQ8r4SjH9
 TsLw==
X-Gm-Message-State: AOAM530qwQ+vpAvtMEitA9pMMn7yRED4WIJso5D+5EMZSBY4wsHihBTU
 /Xy9RG0Qes2DfvqhRT+mCZ3opw==
X-Google-Smtp-Source: ABdhPJwHouG/tt9UaNb62tWDNyPWBhtvLCmb4WgDrkynrQxo2ZQbnGVEZiPjAq9xtOuO1BTCaFnP3A==
X-Received: by 2002:adf:df04:: with SMTP id y4mr31401027wrl.358.1620662724075; 
 Mon, 10 May 2021 09:05:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p10sm3981987wmq.14.2021.05.10.09.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:05:23 -0700 (PDT)
Date: Mon, 10 May 2021 18:05:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
Message-ID: <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210508074118.1621729-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508074118.1621729-1-swboyd@chromium.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 08, 2021 at 12:41:18AM -0700, Stephen Boyd wrote:
> The device lists are poorly ordered when the component device code is
> used. This is because component_master_add_with_match() returns 0
> regardless of component devices calling component_add() first. It can
> really only fail if an allocation fails, in which case everything is
> going bad and we're out of memory. The host device (called master_dev in
> the code), can succeed at probe and be put on the device lists before
> any of the component devices are probed and put on the lists.
> 
> Within the component device framework this usually isn't that bad
> because the real driver work is done at bind time via
> component{,master}_ops::bind(). It becomes a problem when the driver
> core, or host driver, wants to operate on the component device outside
> of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> driver core doesn't understand the relationship between the host device
> and the component devices and could possibly try to operate on component
> devices when they're already removed from the system or shut down.
> 
> Normally, device links or probe defer would reorder the lists and put
> devices that depend on other devices in the lists at the correct
> location, but with component devices this doesn't happen because this
> information isn't expressed anywhere. Drivers simply succeed at
> registering their component or host with the component framework and
> wait for their bind() callback to be called once the other components
> are ready. We could make various device links between 'master_dev' and
> 'component->dev' but it's not necessary. Let's simply move the hosting
> device to the end of the device lists when the component device fully
> binds. This way we know that all components are present and have probed
> properly and now the host device has really probed so it's safe to
> assume the host driver ops can operate on any component device.
> 
> This fixes the msm display driver shutdown path when the DSI controller
> is connected to a DSI bridge that is controlled via i2c. In this case,
> the msm display driver wants to tear down the display pipeline on
> shutdown at msm_pdev_shutdown() by calling drm_atomic_helper_shutdown(),
> and it can't do that unless the whole display chain is still probed and
> active in the system. When a display bridge is on i2c, the i2c device
> for the bridge will be created whenever the i2c controller probes, which
> could be before or after the msm display driver probes. If the i2c
> controller probes after the display driver, then the i2c controller will
> be shutdown before the display controller during system wide shutdown
> and thus i2c transactions will stop working before the display pipeline
> is shut down. This means we'll have the display bridge trying to access
> an i2c bus that's shut down because drm_atomic_helper_shutdown() is
> trying to disable the bridge after the bridge is off.
> 
> Moving the host device to the end of the lists at bind time moves the
> drm_atomic_helper_shutdown() call before the i2c bus is shutdown.
> This fixes the immediate problem, but we could improve it a bit by
> modeling device links from the component devices to the host device
> indicating that they supply something, although it is slightly different
> because the consumer doesn't need the suppliers to probe to succeed.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Entirely aside, but an s/master/aggregate/ or similar over the entire
component.c codebase would help a pile in making it easier to understand
which part does what. Or at least I'm always terribly confused about which
bind binds what and all that, so maybe an additional review whether we
have a clear split into aggregate and individual components after that
initial fix is needed.

On the actual topic: I agree there's a problem here, but I'm honestly not
sure how it should be fixed. That's way over my understanding of all the
device probe and pm interactions. Of which there are plenty.

One question I have: Why is the bridge component driver not correctly
ordered wrt the i2c driver it needs? The idea is that the aggregate driver
doesn't access any hw itself, but entirely relies on all its components.
So as long as all the component drivers are sorted correctly in the device
list, things /should/ work. And as soon as we drop out a single component,
the aggregate gets unbound (and then does all the
drm_atomic_helper_shutdown and all the other drm teardown). So is the bug
perhaps that msm does the drm teardown in the wrong callback?
-Daniel

> ---
>  drivers/base/component.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index dcfbe7251dc4..de645420bae2 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -15,6 +15,8 @@
>  #include <linux/slab.h>
>  #include <linux/debugfs.h>
>  
> +#include "base.h"
> +
>  /**
>   * DOC: overview
>   *
> @@ -657,6 +659,14 @@ int component_bind_all(struct device *master_dev, void *data)
>  				c = master->match->compare[i - 1].component;
>  				component_unbind(c, master, data);
>  			}
> +	} else {
> +		/*
> +		 * Move to the tail of the list so that master_dev driver ops
> +		 * like 'shutdown' or 'remove' are called before any of the
> +		 * dependencies that the components have are shutdown or
> +		 * removed.
> +		 */
> +		device_pm_move_to_tail(master_dev);
>  	}
>  
>  	return ret;
> 
> base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
> -- 
> https://chromeos.dev
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
