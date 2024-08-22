Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6895AF41
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DCB10E7C5;
	Thu, 22 Aug 2024 07:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8dEVsvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4010E7C5;
 Thu, 22 Aug 2024 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724311727; x=1755847727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JOmB3H1enfZrkteU613aUSjuKOs8i3PjWruFo3Cqz08=;
 b=O8dEVsvbmbzFX8HsYfA+1ksejZsh2ul6ubInl7fzX5z89KaWO97yFbVz
 QT2JhNW7OX7a6pgM+HVNweqkYMzzyz8nZQauyVIdWAdbm4FHxj5XFkS+y
 5DFZniDp58YETA6QMgXKaGkVi/F10RSWHQtIfZF0AWYt5uacGAuD/uE+s
 yczaklqwCh+eQi3I8QsgT9a02WxgxvU+/peUHmgd5xcagbZ0G6Siql00K
 xgVRZlJjfGDRwiWtuUWhsIMp57Sqo0ndQMfMd7EHn34VzQKDKEH1dJpa2
 Y9huaKt4pmKEYVWmbTFR+A/rR6cG53dIrV/V9hHCxfB346RNncRrgo9dQ w==;
X-CSE-ConnectionGUID: AnazrIcTQfiqN+ENUXlLxg==
X-CSE-MsgGUID: veFryIVzSVmQ87TtEEU/Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33371615"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="33371615"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 00:28:46 -0700
X-CSE-ConnectionGUID: JW9dLWMFT2CEn/TH1fuMtw==
X-CSE-MsgGUID: BbNyJbfDQvmkLO66SzP5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="65698857"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 00:28:41 -0700
Date: Thu, 22 Aug 2024 10:28:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <ZsbophGauSzh15lz@black.fi.intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
 <ZsRup8uKiqUvADFl@smile.fi.intel.com>
 <ZsSWTtew8nCYWrxF@black.fi.intel.com>
 <ZsSi73YyfKletmgk@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsSi73YyfKletmgk@smile.fi.intel.com>
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

On Tue, Aug 20, 2024 at 05:06:39PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 20, 2024 at 04:12:46PM +0300, Raag Jadav wrote:
> > On Tue, Aug 20, 2024 at 01:23:35PM +0300, Andy Shevchenko wrote:
> > > On Tue, Aug 20, 2024 at 11:50:10AM +0530, Raag Jadav wrote:
> > > 
> > > But it still has an issue with 64-bit division on 32-bit platforms, right?
> > > 
> > > > +	/*
> > > > +	 * Calculate fan speed in RPM by time averaging two subsequent
> > > > +	 * readings in minutes.
> > > > +	 * RPM = number of rotations * msecs per minute / time in msecs
> > > > +	 */
> > > > +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> > > 
> > > ...somewhere here?
> > 
> > Use div64_u64() instead? Or is there a better alternative?
> 
> I don't know the code well to offer anything better. Probably for a starter
> you can switch to use DIV_ROUND_UP_ULL().

This one seems to work. Does it warrant an explanation here?

Raag
