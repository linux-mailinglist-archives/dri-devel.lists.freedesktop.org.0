Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B119CDDA6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 12:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103F810E851;
	Fri, 15 Nov 2024 11:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4YwuRn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3836F10E124;
 Fri, 15 Nov 2024 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731671056; x=1763207056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e3VUqcB0z8GQT/NfcjCoDhUlNNQ4/oKCH2EfpnkhlG0=;
 b=c4YwuRn5XCa3mGTrUI8YE+J2bZ9oOF1PxPGD3hMqIBI06KOERw1l8NvC
 YveUceVgk5rY+9wddQY5tlt9YmbO6k0Vt/8g5/8mOATdpzTldORGSwojc
 kzODPjHZyiG5nAPRt9HyLbuRMD6JhsdxjsBfAxvjBDFCqisuSBRj7vctE
 HPFagSUO/UUcF9+0iB8EBUiAwQzEWeOf686HJOjP5xGGMrMviAh8IDdIL
 fMHnImdS+K6qsTV0kpiRWfsEaB+rxGrsvbPUWMI2MVeWMHcR3jJ+s39QT
 kuRZa+PnkmrJBJnGksM7/WseSYgqmoCEnkKvn7YrUT8beg4D3wqmFtg+Z w==;
X-CSE-ConnectionGUID: 3Rgg+Wl7Sn2yneQARJdSuw==
X-CSE-MsgGUID: /+4ar1H9QO+JfyGBklvwzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31431285"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31431285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:44:16 -0800
X-CSE-ConnectionGUID: BlpwiVj4RL2Ef6Qgay4U1A==
X-CSE-MsgGUID: jdja135gRbadMiCMJgQshw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88942744"
Received: from smile.fi.intel.com ([10.237.72.154])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 03:44:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBukC-0000000F2g1-340h; Fri, 15 Nov 2024 13:44:08 +0200
Date: Fri, 15 Nov 2024 13:44:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v9 2/4] drm/doc: Document device wedged event
Message-ID: <Zzc0CIb_qxi3HB5K@smile.fi.intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-3-raag.jadav@intel.com>
 <b5798f03-51d2-4517-8866-8e3368e4531d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5798f03-51d2-4517-8866-8e3368e4531d@amd.com>
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

On Fri, Nov 15, 2024 at 10:19:42AM +0100, Christian König wrote:
> Am 15.11.24 um 06:07 schrieb Raag Jadav:
> > Add documentation for device wedged event in a new 'Device wedging'
> > chapter. The describes basic definitions and consumer expectations
> > along with an example.
> > 
> > v8: Improve documentation (Christian, Rodrigo)
> > v9: Add prerequisites section (Christian)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Sounds totally sane to me, but I'm not a native speaker of English so other
> should probably look at it as well.

> Anyway feel free to add Reviewed-by: Christian König
> <christian.koenig@amd.com>.

Side note: I don't believe tools support embedded tags, so we usually give
a tag as one tag per one line without. Otherwise it adds a manual job to
harvest them and ensure no typos made during that.

-- 
With Best Regards,
Andy Shevchenko


