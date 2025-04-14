Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29BA87838
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 08:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862F010E2FD;
	Mon, 14 Apr 2025 06:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/g3vG5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38A610E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744613492; x=1776149492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Ele0F1poW+d98mRXmolJyecgMIOJ5Yg0Z0vGLasXMM=;
 b=Z/g3vG5jTgrIq4nMr7FIb9vTbJ6lW+DWutqEGpAPei7Q0pc7BZOya2je
 VR76uUar+7GHv6iRpulKN/+XoPUTeBJsTmmw3tb+QeixAk4ps5XFXpv95
 WqHCCJ9qiCCHR3zvsXsNChT47hqmzICeA0ywD20axeMrTH9JIaZ24dZvv
 PfPQXjiWQAcljD+E2khNlB11JH6eaarIjWeF0InH34l0MtIWdihjh4mI7
 eaZevKqsYogSddJEPLJ/HeKZrjvi4dceGrNPgEUgmw0rlSOiyb7cYQUJw
 A/PYSFay8FxULA3QVHoi1zU+LYI4SJmbg+idhkvSrx08t3MIiFJq6KfmX A==;
X-CSE-ConnectionGUID: 8KbUuBSsQTi/sPmAjOHX5Q==
X-CSE-MsgGUID: wyuBmrhuT9Cm6iBQYmCZQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46203116"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46203116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 23:51:29 -0700
X-CSE-ConnectionGUID: g/VZw56JRP6WlA831XPG0Q==
X-CSE-MsgGUID: TU5W4yAoRUyNfwzJ82kq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="130279695"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 23:51:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u4Dey-0000000C9iZ-2r4k; Mon, 14 Apr 2025 09:51:12 +0300
Date: Mon, 14 Apr 2025 09:51:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
Message-ID: <Z_ywYNsYjuZy8v9x@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
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

On Thu, Apr 10, 2025 at 11:22:05AM +0000, Matt Coster wrote:
> On 09/04/2025 13:22, Arnd Bergmann wrote:

...

> > Rather than adding more #ifdef blocks, address this by changing the
> > existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
> > where the symbol is used but still eliminate it from the object file.
> 
> Possibly a silly question, but wouldn't adding __maybe_unused to
> stid_fmts be a simpler change here?

I'm not Arnd (and I just have read his answer), but I would like to add that
__maybe_unused should be the last resort as it has more cons than more invasive
solutions. In particular, it makes build time increase with a lot of work to
be made at link time, and also it might hide the real bugs when somebody simply
forgot to use it (depending on the configuration options) or so.

-- 
With Best Regards,
Andy Shevchenko


