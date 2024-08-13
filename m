Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC67950597
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C577F10E335;
	Tue, 13 Aug 2024 12:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwLVNos1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEC910E334;
 Tue, 13 Aug 2024 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723553613; x=1755089613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s3WViNmjNJ6o3NfDc+gVFx6Ybq9EcXt5R1mltnGBdKE=;
 b=FwLVNos14bauskWYbsW4bstXfRkXT2Ri3Ts4Ch9vjaIhDMMwxDLuz0DY
 R+so4HEJKsnv2WDfvRxSbOXOb0PLs+BjHjQJWkXOrSjBK6chnE2WBtsZ0
 iaDRpfFubCSAVpnQ+ktk/NqQbFSOS6lLMYyOtZX+E28K3NF1qJrbqOEje
 tpUQwtViHKuhJQVq+JK75FeYFUpsteQDPBwaw2BQSoWvaiX5TGPcawN7N
 7VhDQufxFc1pCOe7glliGB+/Oz1gubN6KfrrtU42IIRUAZRtlvDYzoNWV
 FA+moG+J00JLEwtVMT2GdkEEmMJNgJcyivkjZHaXCupKNY3SLNFp+qqKu Q==;
X-CSE-ConnectionGUID: BpoKhHv/SquUvofV1VC1Xw==
X-CSE-MsgGUID: iXwKQhyyT0i2mnXETV630w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39163796"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="39163796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:53:32 -0700
X-CSE-ConnectionGUID: qW8nmxWuQcCi7KvEjkkwXQ==
X-CSE-MsgGUID: YBZBrvvTRwmZiwNFcbn3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="96189629"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:53:28 -0700
Date: Tue, 13 Aug 2024 15:53:25 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrtXReujITKx4rHH@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrtCIU8On4ZKILmh@black.fi.intel.com>
 <ZrtHz1aY_Lf_XIsL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrtHz1aY_Lf_XIsL@smile.fi.intel.com>
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

On Tue, Aug 13, 2024 at 02:47:27PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 13, 2024 at 02:23:13PM +0300, Raag Jadav wrote:
> > On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +	/*
> > > > +	 * HW register value is accumulated count of pulses from
> > > > +	 * PWM fan with the scale of 2 pulses per rotation.
> > > > +	 */
> > > > +	rotations = pulses >> 1;
> > > 
> > > In accordance with the comment the
> > > 
> > > 	rotations = pulses / 2;
> > > 
> > > looks better.
> > 
> > This change seems to cause a build error in v5.
> > Something to do with __udivdi3 on i386.
> 
> No, it's not this change.
> Please, read report carefully.

CI seems to point to DIV_ROUND_UP(), but it's been there since v1.
So not sure if I entirely understand.

Raag
