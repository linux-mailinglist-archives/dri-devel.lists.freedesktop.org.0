Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC277AF6A80
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 08:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060C10E149;
	Thu,  3 Jul 2025 06:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP1/+6cI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3793910E097;
 Thu,  3 Jul 2025 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524851; x=1783060851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YhFQAJQdCvg0cBsdVnC7y9VdNk7JH03UkGe+kdFg3uo=;
 b=UP1/+6cIxDlqF28pfQnkUYVGXh0cED+4u48ILIVWl/CUjuhOOu8lDBMV
 M0+VR0g7OUoSaaiYH44VhuziLAwZhaFRbp66fj040byJqSznLIc1Csmek
 b6Hq9/Tez9lGh4ckSFaQ9Eb0mZmaoK+63FzxLFPlf+saKppqWoZmXsvRP
 T+bTc/hgPepd5FQVvfiqL0S6bMZm2XMosvqJRhF+4F4OWsv/sbBAm5+iz
 PD2Ysl/flN1+ceo5QtELLsWRgeipl0Qr2ydAyzx8ddm0xOaRaBwa72F6E
 LQZOZS93PD5oguOwuEI3ZMQ0/xfLqg3t6wjRI+5lHB+Mfd5KdR5y5quxg g==;
X-CSE-ConnectionGUID: ezirlvdTQ+u5OcsZiosQVA==
X-CSE-MsgGUID: UWk1GpY3QimFIN4UALYJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57513108"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="57513108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:40:51 -0700
X-CSE-ConnectionGUID: da7FJVDTT4SvqOJG+t+Kqw==
X-CSE-MsgGUID: 6+AkE70hTpKPUBKRrQ6oow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="159982634"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:40:47 -0700
Date: Thu, 3 Jul 2025 09:40:44 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/7] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aGYl7IVj5T92VbXh@black.fi.intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-2-riana.tauro@intel.com>
 <aGYBu-6bAEc1il4O@black.fi.intel.com>
 <170d80ad-a12d-4a31-bb6c-abb8a132a689@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170d80ad-a12d-4a31-bb6c-abb8a132a689@intel.com>
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

On Thu, Jul 03, 2025 at 10:50:53AM +0530, Riana Tauro wrote:
> On 7/3/2025 9:36 AM, Raag Jadav wrote:
> > On Wed, Jul 02, 2025 at 07:41:11PM +0530, Riana Tauro wrote:
> > > Certain errors can cause the device to be wedged and may
> > > require a vendor specific recovery method to restore normal
> > > operation.
> > > 
> > > Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> > > must provide additional recovery documentation if this method
> > > is used.

...

> > > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > index 08b3b2467c4c..40a4caaa6313 100644
> > > --- a/include/drm/drm_device.h
> > > +++ b/include/drm/drm_device.h
> > > @@ -26,10 +26,14 @@ struct pci_controller;
> > >    * Recovery methods for wedged device in order of less to more side-effects.
> > >    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > >    * use any one, multiple (or'd) or none depending on their needs.
> > > + *
> > > + * If DRM_WEDGE_RECOVERY_VENDOR method is used, vendors must provide additional
> > > + * documentation outlining further recovery steps.
> > 
> > The original documentation is sufficient so let's not duplicate specific
> > cases here.
> 
> Added it here so anyone checking the code directly is aware.

Then a reference to uapi doc would be more useful.

Raag
