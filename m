Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16CA43C20
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0D510E070;
	Tue, 25 Feb 2025 10:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhDLYPfT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D32110E070
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740480424; x=1772016424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HeA23Fblfe8AuqDknPqy/QZb+v6/Cv+7JHe3jUfuCVc=;
 b=WhDLYPfTam3vL5fz3S8KvaAdZv/zMkJrRKwPpOz2Z2IjEbUBqhBdwi1e
 AElGu7AP1+R7rOZa6xozURTZC5INNDL5FfoUaEdwlrNt8ayPosvmr4OWD
 h68AWNGFOgVMrV2EKdpvfTvTDhV70F5GboqaeXc5W4/Gdqj3Q4GuqDXuU
 QjjTsM8p7TDvzA3/i8uSZQVyelSLJjRgHPiirS25lbtHjLeCG/UlchR5A
 haI2ijLlKMAngcl9Yw+Bq2kGkKC0GVMnVPkvnjK92VT8X+lWVeTHd8U//
 FCiJmdentkWXYJYOTdvFu1v+6yB7tINTbQojh4t2gpUZFizDf73W2u4rA Q==;
X-CSE-ConnectionGUID: +EJ9M4PXQki9p7XcqKleyg==
X-CSE-MsgGUID: u1suQvuFTzmo3aM6GQyqtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58702591"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58702591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:47:03 -0800
X-CSE-ConnectionGUID: LXLpCp75TQ+IoemliAV8+g==
X-CSE-MsgGUID: TKTEqMkwRP2TNs6UWQCmnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="139596556"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:47:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmsSn-0000000Exi7-3rEA; Tue, 25 Feb 2025 12:46:57 +0200
Date: Tue, 25 Feb 2025 12:46:57 +0200
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
Message-ID: <Z72foRL3diil9icd@smile.fi.intel.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Feb 25, 2025 at 10:36:03AM +0000, Aditya Garg wrote:
> > On 25 Feb 2025, at 4:03 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Tue, Feb 25, 2025 at 10:09:42AM +0000, Aditya Garg wrote:

...

> >> +static int appletbdrm_probe(struct usb_interface *intf,
> >> +                const struct usb_device_id *id)
> >> +{
> >> +    struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> >> +    struct device *dev = &intf->dev;
> >> +    struct appletbdrm_device *adev;
> >> +    struct drm_device *drm;
> >> +    int ret;
> >> +
> >> +    ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
> >> +    if (ret) {
> >> +        drm_err(drm, "Failed to find bulk endpoints\n");
> > 
> > This is simply wrong (and in this case even lead to crash in some circumstances).
> > drm_err() may not be used here. That's my point in previous discussions.
> > Independently on the subsystem the ->probe() for the sake of consistency and
> > being informative should only rely on struct device *dev,
> 
> I'm not sure how drm_err works,

It's a macro.

> but struct drm_device does have a struct device *dev as well.

Yes, but only when it's initialized.

> Anyways, this is something I'll leave for Thomas to reply.

The code above is wrong independently on his reply :-)

-- 
With Best Regards,
Andy Shevchenko


