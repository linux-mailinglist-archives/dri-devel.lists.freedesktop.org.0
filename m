Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70427A43C93
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462E010E08C;
	Tue, 25 Feb 2025 11:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZC6MxVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFA10E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740481316; x=1772017316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D4qXsJKyQFq239rUx6rnyJ+fSvCSHO7MpMmBs3oh1ew=;
 b=MZC6MxVfIg+ZIt0sxotGfRkbHFoMhhmnfmOOkxhMpBsI5O2R7UcrCglK
 hCk/LaF46riXdiWhxR5g3hP0QutjNMV0EaykIWeDxQS/oEjRuZAlebSyT
 wQ93jCn6fc3OFIKRD40l6zQGgaeVe/Y16PcezVExN/9mc05bIvMYMcvqN
 Ydpg7yrPiEBvPgIRMXzV3QO94BRsBX40l9jAlhQNfzeST5a7HIcHfSWpq
 hApmUCI+oaGj7NiI4tS/FZCQb7fnfjJgTOqvHprZNeXsRxRejGypw0LKV
 lFqoUnk2JQ2EH3KYkf454MHHiaCphvdsyfCu4MUybilRhp3Fm3mG2uLXa g==;
X-CSE-ConnectionGUID: EDgMcVH5Qrmd+v3Fwajz3w==
X-CSE-MsgGUID: JnexW7veRRyARnIOZ32VVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44935397"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="44935397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 03:01:56 -0800
X-CSE-ConnectionGUID: Ncn+hCRgRHe+qusVAxKmWA==
X-CSE-MsgGUID: 9dNJgE7NRDCIuSZ14ws9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116127774"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 03:01:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmshB-0000000Extv-3xHr; Tue, 25 Feb 2025 13:01:49 +0200
Date: Tue, 25 Feb 2025 13:01:49 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z72jHeCG6-ByMyhh@smile.fi.intel.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72foRL3diil9icd@smile.fi.intel.com>
 <PN3PR01MB9597B5ECF47B04E3201DD56BB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597B5ECF47B04E3201DD56BB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Feb 25, 2025 at 10:48:53AM +0000, Aditya Garg wrote:
> > On 25 Feb 2025, at 4:17 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Tue, Feb 25, 2025 at 10:36:03AM +0000, Aditya Garg wrote:
> >>>> On 25 Feb 2025, at 4:03 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:

...

> >>>> +static int appletbdrm_probe(struct usb_interface *intf,
> >>>> +                const struct usb_device_id *id)
> >>>> +{
> >>>> +    struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> >>>> +    struct device *dev = &intf->dev;
> >>>> +    struct appletbdrm_device *adev;
> >>>> +    struct drm_device *drm;
> >>>> +    int ret;
> >>>> +
> >>>> +    ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> >>>> +    if (ret) {
> >>>> +        drm_err(drm, "Failed to find bulk endpoints\n");
> >>> 
> >>> This is simply wrong (and in this case even lead to crash in some circumstances).
> >>> drm_err() may not be used here. That's my point in previous discussions.
> >>> Independently on the subsystem the ->probe() for the sake of consistency and
> >>> being informative should only rely on struct device *dev,
> >> 
> >> I'm not sure how drm_err works,
> > 
> > It's a macro.
> > 
> >> but struct drm_device does have a struct device *dev as well.
> > 
> > Yes, but only when it's initialized.
> > 
> >> Anyways, this is something I'll leave for Thomas to reply.
> > 
> > The code above is wrong independently on his reply :-)
> 
> I'm kinda stuck between contrasting views of 2 kernel maintainers lol,
> so I said let Thomas reply.

Sure. I also want him to clarify my question about potential drm_err_probe().

-- 
With Best Regards,
Andy Shevchenko


