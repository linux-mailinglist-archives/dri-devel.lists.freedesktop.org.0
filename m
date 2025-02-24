Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA1A42665
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D722E10E3E8;
	Mon, 24 Feb 2025 15:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlzlIwEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA59310E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740411415; x=1771947415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tlqeQlxXj7Z3p6b5lmb+YRd29W7Q03s6EkuRtxcr0LI=;
 b=SlzlIwEdeWgl7LT+hfWkr5sl7wQ0bEaEsAEMDCFQpW3BF7oyd6wTURoM
 mEOjDwO315rBnPilkllICQ81IVRHPsesvvFhdIv3ruY1l5bDTQ9dwZzqj
 Up5PGQg0H7nq9cDUtqnUnnpzEbj0Go7W2hKc5vDqvTJwrKSSetpPvdbTy
 1MSPVzCv2kAXURUn4HKfzEJPQBtKB0A13/TEsEYhDu2KrToCVUILczTSc
 uNPfYcN7nlbRbqZCi1u7d7XmtwNBAtgE3Gx1QvpDKBUkBOAooaKP2db7Z
 dsY+PTpublSVe9S+TGm97RKPL8ZNeG0bQ/cDgdcxQqvdd8Za+jhbeYKiY A==;
X-CSE-ConnectionGUID: rqisn1u2Qo2hdsLNediQBA==
X-CSE-MsgGUID: cuJvhIXJRz64tsDYZ+OKGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41379038"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41379038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:36:55 -0800
X-CSE-ConnectionGUID: EppH+i3LS6CwiRoOJoJ8Hg==
X-CSE-MsgGUID: b5zUQ9CmTLu3d9WEAJr0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120211657"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:36:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmaVT-0000000EjWv-0igG; Mon, 24 Feb 2025 17:36:31 +0200
Date: Mon, 24 Feb 2025 17:36:30 +0200
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
Message-ID: <Z7yR_u6ISEQFAwsI@smile.fi.intel.com>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Feb 24, 2025 at 03:20:13PM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 8:41 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 03:03:40PM +0000, Aditya Garg wrote:
> >>>> On 24 Feb 2025, at 8:27 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Mon, Feb 24, 2025 at 02:32:37PM +0000, Aditya Garg wrote:
> >>>>> On 24 Feb 2025, at 7:30 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>> On Mon, Feb 24, 2025 at 01:40:20PM +0000, Aditya Garg wrote:

...

> >>>>>> +#define __APPLETBDRM_MSG_STR4(str4) ((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> >>>>> 
> >>>>> As commented previously this is quite strange what's going on with endianess in
> >>>>> this driver. Especially the above weirdness when get_unaligned_be32() is being
> >>>>> open coded and force-cast to __le32.
> >>>> 
> >>>> I would assume it was also mimicked from the Windows driver, though I haven't
> >>>> really tried exploring this there.
> >>>> 
> >>>> I’d rather be happy if you give me code change suggestions and let me review
> >>>> and test them
> >>> 
> >>> For the starter I would do the following for all related constants and
> >>> drop that weird and ugly macros at the top (it also has an issue with
> >>> the str4 length as it is 5 bytes long, not 4, btw):
> >>> 
> >>> #define APPLETBDRM_MSG_CLEAR_DISPLAY cpu_to_le32(0x434c5244) /* CLRD */
> >> 
> >> Lemme test this.
> > 
> > Just in case it won't work, reverse bytes in the integer. Because I was lost in
> > this conversion.
> 
> It works. What I understand is that you used the macro to get the final hex
> and converted it into little endian, which on the x86 macs would technically
> remain the same.

Right, the problem is the macro itself which does really weird things altogether.
Using integer + comment much clearer in my opinion.

> >>> (assuming we stick with __leXX for now). This will be much less confusing.

-- 
With Best Regards,
Andy Shevchenko


