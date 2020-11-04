Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA82A60A0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 10:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906306E987;
	Wed,  4 Nov 2020 09:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819EE6E981
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 09:37:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so21309090wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=YYEEW3UbmhXd0B1aMy7MWCgR8m6NIV4U+OB9a3y1k9k=;
 b=FnDLAdGcCV6ETtzy4Tf5Nq4xYrfWUG/criVC7JQrfL4I2I0kuPKNEpNIcy8Ts7/a+p
 gGrlg68b8eFthe4moLNCH6ogaJ2PtfNgK/aIK0EpFkoZeYFN2qpdl0W4X7m46tm5KZ43
 x0RWR6t7JBYlU3bn47NvjLZZjqx9pa8ySrv6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=YYEEW3UbmhXd0B1aMy7MWCgR8m6NIV4U+OB9a3y1k9k=;
 b=i7PIlA/L4nnqyqXVj98UTTX1Cw2e5w2KqCSd3Zhqmq76UEPtJbopGPZkMYtsprtqJX
 i6TjUXhj0g7MHgfwtiCJKWW52KPaNOvF8MgSVT2qraOd2Ha2M1ml5i8+3/k44GnFPMG4
 MUetsgjA4iy5jtKLxjO7xSiShAVAZE4MUvVeOebjawO0IBg8ZZYrS2mvcN/teAAefwt7
 794zgjS9qWMVIvyyGxXqgP0/+8VXZ/OXRA64RXwGgqH1J/gV4mj81A6XS1hHN0AokAGc
 f8ItU8+Hv+E+vYWje10EbCuyr4MfNctu32kYCzjKlqADZuokXNaclS1t4yYkfGkgGZKy
 IUJw==
X-Gm-Message-State: AOAM533w51IdOmOsApmKHYgpwSQVL4VD6qld7go14cdXt9w7c8fytldo
 87kZxDH7WF4XphF11qbPzfv5dQ==
X-Google-Smtp-Source: ABdhPJxLU7Advn0naDmr3cmo0ridL4r+VJaswD7Q8bcFCEysNBMB243d3m5Nm7vNKMI+xFOcfeKV5A==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr30602099wri.230.1604482645125; 
 Wed, 04 Nov 2020 01:37:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j13sm1472764wrt.80.2020.11.04.01.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:37:24 -0800 (PST)
Date: Wed, 4 Nov 2020 10:37:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201104093722.GK401619@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
 <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
 <f89640fb-6994-76dc-7862-a3b26b67dc24@suse.de>
 <20201103103832.gwjqf4urrn5y7zk5@gilmour.lan>
 <20201103105508.GD401619@phenom.ffwll.local>
 <20201103112522.oescqpkrzbwohhnq@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103112522.oescqpkrzbwohhnq@gilmour.lan>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 12:25:22PM +0100, Maxime Ripard wrote:
> Hi!
> 
> On Tue, Nov 03, 2020 at 11:55:08AM +0100, Daniel Vetter wrote:
> > On Tue, Nov 03, 2020 at 11:38:32AM +0100, Maxime Ripard wrote:
> > > On Tue, Nov 03, 2020 at 11:10:27AM +0100, Thomas Zimmermann wrote:
> > > > Hi
> > > > 
> > > > Am 03.11.20 um 10:52 schrieb Maxime Ripard:
> > > > > On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> > > > >> Add new api devm_drm_irq_install() to register interrupts,
> > > > >> no need to call drm_irq_uninstall() when the drm module is removed.
> > > > >>
> > > > >> v2:
> > > > >> fixed the wrong parameter.
> > > > >>
> > > > >> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> > > > >> ---
> > > > >>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> > > > >>  include/drm/drm_drv.h     |  3 ++-
> > > > >>  2 files changed, 25 insertions(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > > >> index cd162d4..0fe5243 100644
> > > > >> --- a/drivers/gpu/drm/drm_drv.c
> > > > >> +++ b/drivers/gpu/drm/drm_drv.c
> > > > >> @@ -39,6 +39,7 @@
> > > > >>  #include <drm/drm_color_mgmt.h>
> > > > >>  #include <drm/drm_drv.h>
> > > > >>  #include <drm/drm_file.h>
> > > > >> +#include <drm/drm_irq.h>
> > > > >>  #include <drm/drm_managed.h>
> > > > >>  #include <drm/drm_mode_object.h>
> > > > >>  #include <drm/drm_print.h>
> > > > >> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *parent,
> > > > >>  	return ret;
> > > > >>  }
> > > > >>  
> > > > >> +static void devm_drm_dev_irq_uninstall(void *data)
> > > > >> +{
> > > > >> +	drm_irq_uninstall(data);
> > > > >> +}
> > > > >> +
> > > > >> +int devm_drm_irq_install(struct device *parent,
> > > > >> +			 struct drm_device *dev, int irq)
> > > > >> +{
> > > > >> +	int ret;
> > > > >> +
> > > > >> +	ret = drm_irq_install(dev, irq);
> > > > >> +	if (ret)
> > > > >> +		return ret;
> > > > >> +
> > > > >> +	ret = devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> > > > >> +	if (ret)
> > > > >> +		devm_drm_dev_irq_uninstall(dev);
> > > > >> +
> > > > >> +	return ret;
> > > > >> +}
> > > > >> +EXPORT_SYMBOL(devm_drm_irq_install);
> > > > >> +
> > > > > 
> > > > > Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
> > > > > instead of tying it to the underlying device?
> > > > 
> > > > If the HW device goes away, there won't be any more interrupts. So it's
> > > > similar to devm_ functions for I/O memory. Why would you use the drmm_
> > > > interface?
> > > 
> > > drm_irq_install/uninstall do more that just calling request_irq and
> > > free_irq though, they will also run (among other things) the irq-related
> > > hooks in the drm driver (irq_preinstall, irq_postinstall irq_uninstall)
> > > and wake anything waiting for a vblank to occur, so we need the DRM
> > > device and driver to still be around when we run drm_irq_uninstall.
> > > That's why (I assume) you have to pass the drm_device as an argument and
> > > not simply the device.
> > 
> > drm_device is guaranteed to outlive devm_, plus the hooks are meant to
> > shut down hw. hw isn't around anymore when we do drmm_ cleanup, at least
> > not in full generality.
> 
> drm_dev_put is either called through devm or in remove / unbind, and the
> drm_device takes a reference on its parent device, so how can the
> drm_device outlive its parent device?

Oh there's more than just that going on. struct device has 2 lifetime
things:
- devres resources: These are release on a) on driver unbind b) driver
  bind failure. Which means if you hotunplug, then devres is gone
- the kmalloced piece of memory containing the struct device, refcounted
  with kref. Totally independent.

So hw resources like irq should be managed with devres. Memory allocations
(to prevent use-after-free) should be refcounted by a kref somewhere. In
the case of struct device that's done by the driver core. In the case of
struct drm_device and all the stuff hanging off that, it's done by drmm_
(ideally at least, since in practice all drivers except i915 get it wrong
without drmm_).

Managing memory allocations with devres is almost always a bug.

So when you unbind/hotunplug a device, the following happens:
- driver unbind gets called and finishes
- devres cleans up hw resources
- as one of the last devres action the drm_dev_put gets called
- (if no userspace is around or anything else that holds a drm_device
  reference) drmm_ cleans up drm_device resources
- as the last cleanup drmm_ calls put_device()
- the actual struct device gets released

> > > This probably works in most case since you would allocate the drm_device
> > > with devm_drm_dev_alloc, and then run drm_irq_install, so in the undoing
> > > phase you would have first drm_irq_uninstall to run, and everything is
> > > fine.
> > > 
> > > However, if one doesn't use devm_drm_dev_alloc but would use
> > > devm_drm_irq_install, you would have first remove being called that
> > > would free the drm device, and then drm_irq_uninstall which will use a
> > > free'd pointer.
> > 
> > Don't do that, it's broken :-)
> 
> Well, yeah it's usually a pretty bad situation, but if we can fix it for
> free it doesn't hurt?

See my comment somewhere, if the devm_drm_irq_install also holds a
drm_dev_get reference, then no matter which wrong way you set stuff up,
the right thing should happen.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
