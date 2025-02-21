Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B69A3F967
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3DB10EABC;
	Fri, 21 Feb 2025 15:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2J6HmyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9A10EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740153084; x=1771689084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vPnGBuoiFN+rapBDrtIDIJGXal1oiR/Y9ccwXwbtNnc=;
 b=E2J6HmyAWjHzOGp2QxBwdbeM7aUzJ7q5PZFllCOYimCducr3DEHYW8xO
 jM7xUWQr4hc9RO70Dvg3G4VqHi/PQ8h2ba+gFwqx6cE3RN177YaVVnG+y
 V0CbjSlHQJDURQqEh10KJJRXz9FUOoF6BbEyU7xpTSt0VvsHCLeZKVclg
 F+uhihEySO+DkDrF0CDADt19z94AB3rgbYMJHNxzAeqgAcNs0EsieZBCG
 1f2atGnu3v+91iAC/hUvuQfR+N9x7WSESaLs5g55kwY/OOuXoCVBAZ7pR
 IGR89UZyVjB4C3E5I4GSOKGlYZbfqqafZK7I17ZuzSbfGujRRU2whUtPT g==;
X-CSE-ConnectionGUID: Y3QrdL3qQRaSs5vZgpb4mA==
X-CSE-MsgGUID: bqNVbzR5T0amYLsTjJ15Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66340969"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="66340969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:51:24 -0800
X-CSE-ConnectionGUID: bP+ES1DSSYups3Xn+KJcoA==
X-CSE-MsgGUID: CuNXA0VLQISSIv90x3lSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119525320"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:51:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlVJ2-0000000DgNg-1aMo; Fri, 21 Feb 2025 17:51:12 +0200
Date: Fri, 21 Feb 2025 17:51:12 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
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

On Fri, Feb 21, 2025 at 11:36:00AM +0000, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> Add XRGB8888 emulation helper for devices that only support BGR888.

...

> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		/* write red-green-blue to output in little endianness */
> +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> +		*dbuf8++ = (pix & 0x000000ff) >> 0;

put_unaligned_be24()

> +	}

...

> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		3,
> +	};

One line?

	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = { 3 };

-- 
With Best Regards,
Andy Shevchenko


