Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA38D0EAD
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 22:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0934810EF15;
	Mon, 27 May 2024 20:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwfxDtuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B827510EF15
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716842301; x=1748378301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ij4LoZCJaP0Z3WwRoKYheiONp4dxGoT34/7Tch/SL4=;
 b=PwfxDtuPyzgKO+5gNzuqSAWpTuc33Njs1W6xumif8lDUgDyAf6gL4zKw
 /IDYHBklW6wI4SwFfwuz3fsd7l4to/iGN+197aebQs5iqk3BP+cw0LjYS
 xpN5lDTiYUb9z2gqtU2dc6zJjbit75URnkE5yPUpuKUxRgr7/jA7jiMZj
 vINc/Lamc/AkgbzM+svJajkfZJ9od6OqorhSiM/4EAxlL2lHQgd0LH8KT
 3+o2xI0lTGRNtAfgWUixvQLWhXWgQyw6qN0GvJXPFn8WEP+6kgkrGqqr6
 QNljQnDPQDwOQ/RWpH5MrFfvO6FlwZYa1EHKaEnEijMIKGiR8ZfYkj2SI Q==;
X-CSE-ConnectionGUID: 5LEDp8iqRsmrm6Iz7v4TYw==
X-CSE-MsgGUID: r8XrerEnRHieFzGb8Wgn8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11717970"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="11717970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:38:15 -0700
X-CSE-ConnectionGUID: yCvC5PYWRQyenQLni3tKYQ==
X-CSE-MsgGUID: 7w34H7sKRcmaBGSayhQRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="65660436"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:38:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sBh6b-0000000BMks-1LiV; Mon, 27 May 2024 23:38:05 +0300
Date: Mon, 27 May 2024 23:38:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
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

On Mon, May 27, 2024 at 11:37:20PM +0300, Andy Shevchenko wrote:
> On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:

...

> > +MODULE_LICENSE("GPL");
> 
> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().

And obviously + module.h in the inclusion block.

-- 
With Best Regards,
Andy Shevchenko


