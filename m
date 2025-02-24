Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91447A42792
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01ED10E459;
	Mon, 24 Feb 2025 16:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNFNL/2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201CF10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740413705; x=1771949705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OO/5KgROT2R3vAvVbxK4yZELP4saE5cgPxI1MRxOLQA=;
 b=WNFNL/2hMFF4ctSCLU4y0MnS6mFizTOcyXmyVfD3H9pX3jRIQVNQupMk
 ctDGcQv+yJ+xMuPR/FwqvMsf6KIudU2DdgnEKMCsLdbKnlUND9kKvMqiT
 TyWa+6CSwOEjmfuD8Yue5qCfU6w7RAISOTJH0iQ/aJLLb2OIynVz217ou
 P3LzDa5THgwVwAm8i2O4QQ67QclPhmVbww7wf69RYbat/HhYd4sB/ZUaF
 kjjELOJZvgAjE/te+0kkJjiVij+WZFwahWQMIGpU3rSs0/kLNbi65js/G
 odnE87KYO7zZX0Mgfy9vZxFI28bhjFQsaME5Lm91TNL7kSc9DQbVas9NC g==;
X-CSE-ConnectionGUID: B5sDWaAAQ3Kr/fkvqisiMw==
X-CSE-MsgGUID: WM6lNBySRpOLrt6fAySEnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51814434"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51814434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:15:04 -0800
X-CSE-ConnectionGUID: 7BeqTr8/RxyxD6+CqFHd0w==
X-CSE-MsgGUID: jmvzcugsQeKMEw2yH0TcXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117007463"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:15:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmb6g-0000000EkAv-0aoo; Mon, 24 Feb 2025 18:14:58 +0200
Date: Mon, 24 Feb 2025 18:14:57 +0200
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
Message-ID: <Z7ybAVd3pNAhQemw@smile.fi.intel.com>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959729DB53C0D359F8A83292B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7ySdcYWZjCVd-7v@smile.fi.intel.com>
 <PN3PR01MB959780B670AB514305790D8BB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yV1rvSM2OPW_un@smile.fi.intel.com>
 <PN3PR01MB95976A734F6763F1574FC7EAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95976A734F6763F1574FC7EAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Feb 24, 2025 at 03:56:36PM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 9:23 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 03:40:29PM +0000, Aditya Garg wrote:
> >>>> On 24 Feb 2025, at 9:08 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Mon, Feb 24, 2025 at 03:32:56PM +0000, Aditya Garg wrote:
> >>>>> On 24 Feb 2025, at 8:50 PM, Aditya Garg <gargaditya08@live.com> wrote:
> >>>>>> On 24 Feb 2025, at 8:41 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>>> On Mon, Feb 24, 2025 at 03:03:40PM +0000, Aditya Garg wrote:
> >>>>>>>>> On 24 Feb 2025, at 8:27 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>>>>> On Mon, Feb 24, 2025 at 02:32:37PM +0000, Aditya Garg wrote:
> >>>>>>>>>> On 24 Feb 2025, at 7:30 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>>>>>>>>> On Mon, Feb 24, 2025 at 01:40:20PM +0000, Aditya Garg wrote:

...

> >>>>>>>>>>>>> +#define __APPLETBDRM_MSG_STR4(str4) ((__le32 __force)((str4[0] << 24) | (str4[1] << 16) | (str4[2] << 8) | str4[3]))
> >>>>>>>>>>>> 
> >>>>>>>>>>>> As commented previously this is quite strange what's going on with endianess in
> >>>>>>>>>>>> this driver. Especially the above weirdness when get_unaligned_be32() is being
> >>>>>>>>>>>> open coded and force-cast to __le32.
> >>>>>>>>>>> 
> >>>>>>>>>>> I would assume it was also mimicked from the Windows driver, though I haven't
> >>>>>>>>>>> really tried exploring this there.
> >>>>>>>>>>> 
> >>>>>>>>>>> I’d rather be happy if you give me code change suggestions and let me review
> >>>>>>>>>>> and test them
> >>>>>>>>>> 
> >>>>>>>>>> For the starter I would do the following for all related constants and
> >>>>>>>>>> drop that weird and ugly macros at the top (it also has an issue with
> >>>>>>>>>> the str4 length as it is 5 bytes long, not 4, btw):
> >>>>>>>>>> 
> >>>>>>>>>> #define APPLETBDRM_MSG_CLEAR_DISPLAY cpu_to_le32(0x434c5244) /* CLRD */
> >>>>>>>> 
> >>>>>>>> Lemme test this.
> >>>>>>> 
> >>>>>>> Just in case it won't work, reverse bytes in the integer. Because I was lost in
> >>>>>>> this conversion.
> >>>>> 
> >>>>> It works. What I understand is that you used the macro to get the final hex and converted it into little endian, which on the x86 macs would technically remain the same.
> >>>> 
> >>>> And now that I oberved again, %p4cc is actually printing these CLRD, REDY etc
> >>>> in reverse order, probably the reason %p4ch was chosen. And I am unable to
> >>>> find what macro upstream can be used.
> >>> 
> >>> %.4s should work as it technically not DRM 4cc, but specifics of the protocol
> >>> (that reminds me about ACPI that uses 4cc a lot).
> >> 
> >> I still get reverse order in that.
> > 
> > Ah, right, it will give you the first letter as LSB, indeed. At the end of the
> > day if it's so important, there are ways how to solve that without using %p4cc.
> > But if others (and esp. PRINTK maintainers) want to have / don't object having
> > that extension, why not?
> 
> Right, but what to do about the case of little endian and host endian? I
> remember the statement "for the sake of completeness" for them. Do you think
> just host endian and reverse endian should be just fine? Or you got any "no
> sparse warning" way to get it done? The macros to convert to le32/be32 expect
> a u32 value, but in those cases we actually are passing a le32/be32 value.

For now I think we better save the energy and wait for PRINTK people to tell
if they are okay in general. Otherwise it makes no sense to develop and review
something that will go to the trash bin.

-- 
With Best Regards,
Andy Shevchenko


