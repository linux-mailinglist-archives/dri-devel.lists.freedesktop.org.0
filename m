Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C132A4374
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9D56E0DA;
	Tue,  3 Nov 2020 10:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494866E0DA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:55:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c18so12256774wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=gUsJQ4jlgeqSczBy+U2k4YjIwztMvdmaxXwIjb+41FU=;
 b=VTWQ9NurePKgAsUaClFx3GKtmznFIWN5rlsBo7bF1Sjq03x7CNdxnIJJ4eNsR5YFyI
 Y37t0tw5DbpbmNVM79sI+FvyElGo+RGjwhCbV8ZVkcYfizHhLNoE3rz0zhhPiu/JKheD
 3xpB/jSSuEwc6EJezQ+UPnN9EZLRPVTU6TZVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=gUsJQ4jlgeqSczBy+U2k4YjIwztMvdmaxXwIjb+41FU=;
 b=QOJyN2PKvseid8x4hvTgZbIN113JmziEID8GrMacqHePeVllaAqrqEjjc9WsiA9tJQ
 zDQKduwYL0HOQOyPjwGI6QhUIoKka4iIQEJ0sp33Mx8iHxzcLXIUPEY0V/TEaNoAFidp
 RW3RI/UGpzzGjo/9Eun0LmmuzgQm+fhyinhobfKFxIQXGc2PnP4FOOSyZl9r3RcSXbUs
 XjfCFtiLxrMcEsV531vc503rSzZZjErY3atDZ1Zpkrg8fG0pw3gNfhRbAKZsFtcyWvuy
 CZulWsbHdqLirFytNOFurp4QFDNvx8kGoSU3rtpG7GkNkGCnDD/LZHLW6ufYuyvXIQHG
 zUMQ==
X-Gm-Message-State: AOAM5324X3hr8cwN2v258Fg1BqtZ2Jm/5D2muWZey5NwDeUQGq7i7H7P
 xl9xsM2MD7/AxgJAQ7FiXG1GgzhSXHJiXCxX
X-Google-Smtp-Source: ABdhPJx+xxyVx0A+0qNgc/hTTHDpc5KBzrgY36piD682aIdmVK9OgEsMbsY/Vk7ZkPmAiZmkDFniXQ==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr3136958wmg.68.1604400910928; 
 Tue, 03 Nov 2020 02:55:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r3sm25580561wrm.51.2020.11.03.02.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:55:10 -0800 (PST)
Date: Tue, 3 Nov 2020 11:55:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103105508.GD401619@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:38:32AM +0100, Maxime Ripard wrote:
> On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 03.11.20 um 10:52 schrieb Maxime Ripard:
> > > On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> > >> Add new api devm_drm_irq_install() to register interrupts,
> > >> no need to call drm_irq_uninstall() when the drm module is removed.
> > >>
> > >> v2:
> > >> fixed the wrong parameter.
> > >>
> > >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> > >> ---
> > >>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> > >>  include/drm/drm_drv.h     |  3 ++-
> > >>  2 files changed, 25 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >> index cd162d4..0fe5243 100644
> > >> --- a/drivers/gpu/drm/drm_drv.c
> > >> +++ b/drivers/gpu/drm/drm_drv.c
> > >> @@ -39,6 +39,7 @@
> > >>  #include <drm/drm_color_mgmt.h>
> > >>  #include <drm/drm_drv.h>
> > >>  #include <drm/drm_file.h>
> > >> +#include <drm/drm_irq.h>
> > >>  #include <drm/drm_managed.h>
> > >>  #include <drm/drm_mode_object.h>
> > >>  #include <drm/drm_print.h>
> > >> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *parent,
> > >>  	return ret;
> > >>  }
> > >>  
> > >> +static void devm_drm_dev_irq_uninstall(void *data)
> > >> +{
> > >> +	drm_irq_uninstall(data);
> > >> +}
> > >> +
> > >> +int devm_drm_irq_install(struct device *parent,
> > >> +			 struct drm_device *dev, int irq)
> > >> +{
> > >> +	int ret;
> > >> +
> > >> +	ret = drm_irq_install(dev, irq);
> > >> +	if (ret)
> > >> +		return ret;
> > >> +
> > >> +	ret = devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> > >> +	if (ret)
> > >> +		devm_drm_dev_irq_uninstall(dev);
> > >> +
> > >> +	return ret;
> > >> +}
> > >> +EXPORT_SYMBOL(devm_drm_irq_install);
> > >> +
> > > 
> > > Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
> > > instead of tying it to the underlying device?
> > 
> > If the HW device goes away, there won't be any more interrupts. So it's
> > similar to devm_ functions for I/O memory. Why would you use the drmm_
> > interface?
> 
> drm_irq_install/uninstall do more that just calling request_irq and
> free_irq though, they will also run (among other things) the irq-related
> hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall)
> and wake anything waiting for a vblank to occur, so we need the DRM
> device and driver to still be around when we run drm_irq_uninstall.
> That's why (I assume) you have to pass the drm_device as an argument and
> not simply the device.

drm_device is guaranteed to outlive devm_, plus the hooks are meant to
shut down hw. hw isn't around anymore when we do drmm_ cleanup, at least
not in full generality.

> This probably works in most case since you would allocate the drm_device
> with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoing
> phase you would have first drm_irq_uninstall to run, and everything is
> fine.
> 
> However, if one doesn't use devm_drm_dev_alloc but would use
> devm_drm_irq_install, you would have first remove being called that
> would free the drm device, and then drm_irq_uninstall which will use a
> free'd pointer.

Don't do that, it's broken :-)

> So yeah, even though the interrupt line itself is tied to the device,
> all the logic we have around the interrupt that is dealt with in
> drm_irq_install is really tied to the drm_device. And since we tie the
> life of drm_device to its underlying device already (either implicitly
> through devm_drm_dev_alloc, or explictly through manual allocation in
> probe and free in remove) we can't end up in a situation where the
> drm_device outlives its device.

Most drivers get their drm_device lifetime completely wrong. That's why I
typed drmm_ stuff. So this isn't a surprise at all, but it might motiveate
a bunch more people to fix this up correctly.

Also, these drm_irq functions are 100% optional helpers (should maybe
rename them to make this clearer) for modern drivers. They're only built
in for DRIVER_LEGACY, because hysterical raisins.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
