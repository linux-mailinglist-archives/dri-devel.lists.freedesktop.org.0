Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74802A43B96
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB24610E60B;
	Tue, 25 Feb 2025 10:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUutau1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5DB10E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740479342; x=1772015342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bQ6fvZqvVAScXUHVfi2Jgc1uaKIbM24bSW4bUHsGHUQ=;
 b=lUutau1mFYjt1s1ex9aXWOXW+1fzkr8LGIQTMagW5+k3X7zDIQXHk/BY
 CvJbOxPunj9SH8CkKgZPSRdWVjdBpJ1tChePTXa8W/BLsOZFrORNy4Kpp
 uNfvWCLXC++CB+4Nbc2XrOJFVXlGz4UwVfsOulFbxS3thxIfF/M89qosW
 TyiPY1Y7hAJou+b8m46/oBqXVttTljPS8BBsU2Z1w+AV6d3+2OdMg11Mt
 7ukRQoW6jqFztteP7ZIMnbswD3dLJIwXmplzXn0DaVeI49ZjwFzrcqT4P
 +TmDhTCFaaYxQA+XCbsxX9seftnloW5x26+Nco9aOENQQhYhOFhv51IJp w==;
X-CSE-ConnectionGUID: zGAAeXb+SVurnxwWgT/6qQ==
X-CSE-MsgGUID: ff/Jl3HVQrCfs4WFyzfgxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51914618"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51914618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:29:01 -0800
X-CSE-ConnectionGUID: 4kiwgWtzSHWSQoZWk1IDOA==
X-CSE-MsgGUID: DMZs2XXcT0ywATF+ooUJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153534389"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:28:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmsBL-0000000ExTN-21Rf; Tue, 25 Feb 2025 12:28:55 +0200
Date: Tue, 25 Feb 2025 12:28:55 +0200
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
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z72bZ3iURwhW5Pj1@smile.fi.intel.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <91a39a2e-a3ad-499d-86cd-0e621a68e282@suse.de>
 <PN3PR01MB959702F55F747E5D87D9AD56B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <54e45d37-6ada-42e3-a3ae-92d3ee475c5f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54e45d37-6ada-42e3-a3ae-92d3ee475c5f@suse.de>
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

On Tue, Feb 25, 2025 at 09:48:11AM +0100, Thomas Zimmermann wrote:
> Am 25.02.25 um 09:00 schrieb Aditya Garg:
> > > On 25 Feb 2025, at 1:22 PM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > Am 24.02.25 um 14:40 schrieb Aditya Garg:

...

> > > > +struct appletbdrm_device {
> > > > +    struct device *dev;
> > > This field should go away, please. There's drm.dev, which contains the same address.
> > > 
> > > So seems to have remove the dmadev field instead, which you'll need for
> > > dma-buf sharing. Was that a misunderstanding from the last review?
> > Yeah that was a misunderstanding. I though you meant to remove dmadev.
> > > The rest of the driver looks good.
> > Maybe you missed the left over dev_err_probe left in this patch? I'll fix
> > them.
> 
> Sure.

But can you comment on my reply where I'm asking for a clarification how
drm_err() can be used on the physical device ->probe() to begin with?

> > > > +    unsigned int in_ep;
> > > > +    unsigned int out_ep;
> > > > +
> > > > +    unsigned int width;
> > > > +    unsigned int height;
> > > > +
> > > > +    struct drm_device drm;
> > > > +    struct drm_display_mode mode;
> > > > +    struct drm_connector connector;
> > > > +    struct drm_plane primary_plane;
> > > > +    struct drm_crtc crtc;
> > > > +    struct drm_encoder encoder;
> > > > +};

-- 
With Best Regards,
Andy Shevchenko


