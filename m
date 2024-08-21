Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA395A070
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AFB10E660;
	Wed, 21 Aug 2024 14:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B370cQQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4208110E666;
 Wed, 21 Aug 2024 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724252012; x=1755788012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3a0SdQK6D0YA6byEu0/lPMYxzVJPB+w3eSkokFrQBjU=;
 b=B370cQQSvI66q/SCS5e/anAQPG2+lwWqeqC4ZIy++5WAdHODTaF7m3Fz
 dxIpxxqVIJLwJ3b5dpAoeSOJcE4/eUkztsPGPk6JjI728nEqu1Jn8JzyN
 1ut0MXQ4Kq+6eLGA+NeauIETjpn7t8me6Tj1o9iuWKZ6kHa1+EN8ErX/u
 3aoNc/caFJzmjrCCV067p4cSpEnzHKj2/h8etBhBtIAspUm9x4zF7HnTt
 XdkjlxApDJHj7y5b6Zq6OA0gN/ox9oXP5EW1BSBacQWM7XaC+JZt0RCPq
 6qVBCjo6kwkCxkgVN/bt1jpvOJnrprFNI3/uDUG8XMmT5uHr4XadkzcVr g==;
X-CSE-ConnectionGUID: yerB0aQjRWqr0hJNYqrVOA==
X-CSE-MsgGUID: qx0s14oCSsWh29Qr9vLSRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22485374"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22485374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:53:32 -0700
X-CSE-ConnectionGUID: oUecD+0yQj+/o1QqWqbWdw==
X-CSE-MsgGUID: TyIrDd9fTouo2NLbve1AkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91905505"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:53:25 -0700
Date: Wed, 21 Aug 2024 16:53:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <ZsX_YQLPogCSPfSQ@ashyti-mobl2.lan>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820062010.2000873-1-raag.jadav@intel.com>
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

Hi Raag,

> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent
> +	 * readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);

once you find the correct operator here, please feel free to add:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Normally these get me confused, I'm happy Andy is looking after
it :-)

Thanks,
Andi
