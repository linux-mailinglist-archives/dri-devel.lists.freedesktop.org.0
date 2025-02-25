Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94782A44244
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F9410E197;
	Tue, 25 Feb 2025 14:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iG9kiwT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBB110E197
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740493055; x=1772029055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yTbYCkPyDs9HJxuZtoE4K/vi15XYDIgffTPgZMP+G3w=;
 b=iG9kiwT25FqOuogslFJ1E/mZS+2jn3pOz0PzRk7FqHQBOrhvGmx5kl6/
 M1siOGwWpvgy6g4IzuNYoswXf/XlY7D0/pwxqpiLAV4Y8g8PsA6N1hWIY
 GJ+/vLj+VT+CIarmNvWRtASZqZ9Pyv+3qzo/mfl7D8Ar8FmKqXGmuS8jD
 B7xzSRv8gMTky0csbLhbLuvHzpYNDF8fM5hBElvDv45B4F04amG4wkE5L
 aAPG2CwV4lS73Zf8rtZFXHqQhL9W/azYycxxiA21zGUXIhw1xEAjn0mW3
 CWAMOX9Z1Ret26xU1co6vje1CHRV1YJ+lots/5cl9Tdjrslvk96GOHTcS w==;
X-CSE-ConnectionGUID: nDBvXSswSTiLNW9gTEkbJg==
X-CSE-MsgGUID: pi61qf+ySsCEMyw7Um9z0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58721197"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58721197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:17:35 -0800
X-CSE-ConnectionGUID: RZ3Uz0IuSXqYNtv0TCeFew==
X-CSE-MsgGUID: VjTSyfcwSc2zxpxaTWjU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="147219225"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:17:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmvkW-0000000F0yK-03rr; Tue, 25 Feb 2025 16:17:28 +0200
Date: Tue, 25 Feb 2025 16:17:27 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z73Q99khFU9pvoNx@smile.fi.intel.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72foRL3diil9icd@smile.fi.intel.com>
 <PN3PR01MB9597B5ECF47B04E3201DD56BB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72jHeCG6-ByMyhh@smile.fi.intel.com>
 <9efdb233-2bca-4a5d-a6bc-de81fa96efb3@suse.de>
 <Z73FSWR-DK0HxMb2@smile.fi.intel.com>
 <71123020-f345-4de3-9044-ad58f8066d86@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71123020-f345-4de3-9044-ad58f8066d86@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2025 at 02:53:15PM +0100, Thomas Zimmermann wrote:
> Am 25.02.25 um 14:27 schrieb andriy.shevchenko@linux.intel.com:
> > On Tue, Feb 25, 2025 at 12:59:43PM +0100, Thomas Zimmermann wrote:
> > > Am 25.02.25 um 12:01 schrieb andriy.shevchenko@linux.intel.com:
> > > > On Tue, Feb 25, 2025 at 10:48:53AM +0000, Aditya Garg wrote:
> > > > > > On 25 Feb 2025, at 4:17 PM, andriy.shevchenko@linux.intel.com wrote:
> > > > > > On Tue, Feb 25, 2025 at 10:36:03AM +0000, Aditya Garg wrote:
> > > > > > > > > On 25 Feb 2025, at 4:03 PM, andriy.shevchenko@linux.intel.com wrote:
> > > > > > > > On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:

...

> > > > > > > > > +static int appletbdrm_probe(struct usb_interface *intf,
> > > > > > > > > +                const struct usb_device_id *id)
> > > > > > > > > +{
> > > > > > > > > +    struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> > > > > > > > > +    struct device *dev = &intf->dev;
> > > > > > > > > +    struct appletbdrm_device *adev;
> > > > > > > > > +    struct drm_device *drm;
> > > > > > > > > +    int ret;
> > > > > > > > > +
> > > > > > > > > +    ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> > > > > > > > > +    if (ret) {
> > > > > > > > > +        drm_err(drm, "Failed to find bulk endpoints\n");
> > > > > > > > This is simply wrong (and in this case even lead to crash in some circumstances).
> > > > > > > > drm_err() may not be used here. That's my point in previous discussions.
> > > > > > > > Independently on the subsystem the ->probe() for the sake of consistency and
> > > > > > > > being informative should only rely on struct device *dev,
> > > > > > > I'm not sure how drm_err works,
> > > > > > It's a macro.
> > > > > > 
> > > > > > > but struct drm_device does have a struct device *dev as well.
> > > > > > Yes, but only when it's initialized.
> > > > > > 
> > > > > > > Anyways, this is something I'll leave for Thomas to reply.
> > > > > > The code above is wrong independently on his reply :-)
> > > > > I'm kinda stuck between contrasting views of 2 kernel maintainers lol,
> > > > > so I said let Thomas reply.
> > > > Sure. I also want him to clarify my question about potential drm_err_probe().
> > > These threads get a little lengthy. What is the question?
> > How drm_err_probe() can be (consistently) implemented as there are and will be
> > cases when we want to return an error code with the message and having DRM devce
> > not being available, please?
> 
> The DRM logging works with a DRM device pointer of NULL. It'll simply leave
> out device infos.

Right and that's what makes it less informative than pure dev_*() macros.
For the probe it should really take the struct device instead of struct drm
in my opinion. Otherwise we may end up with the code like above, which has
hidden bugs.

> > Also, drm_err() has a downside of not checking for deferred probe and
> > potentially leads to the noisy log floods.
> 
> I think it should be possible to export __dev_probe_failed() [1] from the
> core and write drm_err_probe() and drm_warn_probe() around this.

Yep, we can do that

> The output then looks like a DRM logging, but behaves like dev-based logging.
> Note that DRM logging already is an elaborate wrapper around the dev-based
> logging, so it will be more of the same.

Okay, this sounds promising. My only worries are the possibilities of misuse of
the API and/or leaving it non- or less informative (in comparison to the existing
helpers).

> [1] https://elixir.bootlin.com/linux/v6.13.4/source/drivers/base/core.c#L5008

-- 
With Best Regards,
Andy Shevchenko


