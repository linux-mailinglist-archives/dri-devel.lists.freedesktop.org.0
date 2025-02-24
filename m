Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C2A42787
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4062589518;
	Mon, 24 Feb 2025 16:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9Jj5woq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FF889518
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740413549; x=1771949549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rdREmAbfvGv7T/mxeNv44H5kcC43iR5zhaKSZf7pGcc=;
 b=U9Jj5woqHOYfx6jMm6K8NVF8nlEGC7BKCuhbn8oRRyOPMQYZTeHQuZMw
 EdpYAzVDJjr2pBcEoOo3V42mm6hVTbIAQm0p4tuZy9WsddTmIT5kuNqSA
 KECKi/VleeFeOMb5jld/ulT57LYCvBKsjeZpbseWYIvERkz1/NjYCPG+P
 jgL03TsILkc66nocWgxbrInZk/PAEf9Gz+xz7hIIU91JQ7RMTXxnCBa8w
 B8qdl6CNGWp8KBL5u0M/YvY6wAdLjpcfRdYFbHTFIHCieUEQ0LF9z95Qj
 WnhGVrbcheOHExOyRnmxyXJ6U6yuOeznvRgQVF95ntFL0oqI18hzEyAfo w==;
X-CSE-ConnectionGUID: 2CO5JHOgRnKSoWMh8qtpyA==
X-CSE-MsgGUID: mEV1rg+4RnS1F5QJFN3f4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58723919"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58723919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:12:28 -0800
X-CSE-ConnectionGUID: 5O4dHZ6yTBy6ZtNIKnLuXA==
X-CSE-MsgGUID: i1HKSZMrRC2v6IuGGooqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153309448"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:12:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmb49-0000000Ek8k-497E; Mon, 24 Feb 2025 18:12:21 +0200
Date: Mon, 24 Feb 2025 18:12:21 +0200
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
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7yaZVtBqhkiuNyj@smile.fi.intel.com>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yR_u6ISEQFAwsI@smile.fi.intel.com>
 <PN3PR01MB959735D463E60E2952EC0986B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yVCRIRU5V9JsWC@smile.fi.intel.com>
 <PN3PR01MB95970BAFDA466CE04A7297FBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95970BAFDA466CE04A7297FBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Feb 24, 2025 at 03:52:03PM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 9:19 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 03:39:56PM +0000, Aditya Garg wrote:
> >>>> On 24 Feb 2025, at 9:07 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Mon, Feb 24, 2025 at 03:20:13PM +0000, Aditya Garg wrote:
> >>>>>> On 24 Feb 2025, at 8:41 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>> On Mon, Feb 24, 2025 at 03:03:40PM +0000, Aditya Garg wrote:
> >>>>>>>> On 24 Feb 2025, at 8:27 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>>>> On Mon, Feb 24, 2025 at 02:32:37PM +0000, Aditya Garg wrote:
> >>>>>>>>> On 24 Feb 2025, at 7:30 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>>>>>> On Mon, Feb 24, 2025 at 01:40:20PM +0000, Aditya Garg wrote:

...

> >>>>>>>>>> +#define __APPLETBDRM_MSG_STR4(str4) ((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> >>>>>>>>> 
> >>>>>>>>> As commented previously this is quite strange what's going on with endianess in
> >>>>>>>>> this driver. Especially the above weirdness when get_unaligned_be32() is being
> >>>>>>>>> open coded and force-cast to __le32.
> >>>>>>>> 
> >>>>>>>> I would assume it was also mimicked from the Windows driver, though I haven't
> >>>>>>>> really tried exploring this there.
> >>>>>>>> 
> >>>>>>>> I’d rather be happy if you give me code change suggestions and let me review
> >>>>>>>> and test them
> >>>>>>> 
> >>>>>>> For the starter I would do the following for all related constants and
> >>>>>>> drop that weird and ugly macros at the top (it also has an issue with
> >>>>>>> the str4 length as it is 5 bytes long, not 4, btw):
> >>>>>>> 
> >>>>>>> #define APPLETBDRM_MSG_CLEAR_DISPLAY cpu_to_le32(0x434c5244) /* CLRD */
> >>>>>> 
> >>>>>> Lemme test this.
> >>>>> 
> >>>>> Just in case it won't work, reverse bytes in the integer. Because I was lost in
> >>>>> this conversion.
> >>>> 
> >>>> It works. What I understand is that you used the macro to get the final hex
> >>>> and converted it into little endian, which on the x86 macs would technically
> >>>> remain the same.
> >> 
> >> The Macro is just converting the letters into their hex form, but simply
> >> calculating them and putting the letters in comments is equally good.
> > 
> > Again, it does it in most confusing and weird way. Just kill it.
> 
> #define APPLETBDRM_PIXEL_FORMAT		cpu_to_le32(0x52474241) /* RGBA, the actual format is BGR888 */
> #define APPLETBDRM_BITS_PER_PIXEL	24
> 
> #define APPLETBDRM_MSG_CLEAR_DISPLAY	cpu_to_le32(0x434c5244) /* CLRD */
> #define APPLETBDRM_MSG_GET_INFORMATION	cpu_to_le32(0x47494e46) /* GINF */
> #define APPLETBDRM_MSG_UPDATE_COMPLETE	cpu_to_le32(0x5544434c) /* UDCL */
> #define APPLETBDRM_MSG_SIGNAL_READINESS	cpu_to_le32(0x52454459) /* REDY */
> 
> This should be good.

Yep, way better than the original code!

-- 
With Best Regards,
Andy Shevchenko


