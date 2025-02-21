Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1170A3F899
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F63010EA93;
	Fri, 21 Feb 2025 15:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOeekpCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F2810EA93
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740151634; x=1771687634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Sfehn+vxaohcVVAqSihS41naG90uu0O3ieV6HHFFTfg=;
 b=YOeekpCjVT33PW3rr/AIOYrUpxI89V75xtkumPBPtqCr9nzt4zaTzIUj
 sWKTHSlRLwmQBKc6ZaWyzLHy1X1KhAyiRDaANz5EeSyNkYrwTCZRLPF49
 k7b4RImi0HZEd7Aru0Qm0ChPzFosKVZdy1b17Ajrk81TOckFtghmo8pIi
 1Gx9Pbyn3ih3tTCtdfBfg0JMGh9Gbe30m70g7KZ8CRHP6ragwxfxEUtXs
 JtaFwtdzfP872wHfLzXQyl7XXD6gLhypWddlZa96gNn4BhIoBY8lQoSu8
 zGr9CJfLH1GWGYU2Fsg01q1fZGqzbAJN8K5lM63HcGZ596uDQ3EgJGDJd g==;
X-CSE-ConnectionGUID: E1aF++m0T4GNQX/LpgM+ww==
X-CSE-MsgGUID: splIgWySRyuuJfdYc4JzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51614266"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51614266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:27:14 -0800
X-CSE-ConnectionGUID: LLjaei35SCi8ziZO34FEIg==
X-CSE-MsgGUID: naEziUDpSTKMRNtO8rc0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152589752"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:27:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlUvd-0000000Dg3A-1782; Fri, 21 Feb 2025 17:27:01 +0200
Date: Fri, 21 Feb 2025 17:27:00 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "kekrby@gmail.com" <kekrby@gmail.com>,
 "admin@kodeit.net" <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
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

On Thu, Feb 20, 2025 at 04:39:23PM +0000, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).

...

>  	orig = get_unaligned(fourcc);
> -	val = orig & ~BIT(31);
> +	switch (fmt[2]) {
> +	case 'h':
> +		val = orig;
> +		break;
> +	case 'r':
> +		orig = swab32(orig);
> +		val = orig;
> +		break;
> +	case 'l':

> +		orig = le32_to_cpu(orig);
> +		val = orig;
> +		break;
> +	case 'b':
> +		orig = be32_to_cpu(orig);

I do not see that orig is a union of different types. Have you run sparse?
It will definitely complain on this code.

> +		val = orig;
> +		break;
> +	case 'c':
> +		/* Pixel formats are printed LSB-first */
> +		val = swab32(orig & ~BIT(31));
> +		pixel_fmt = true;
> +		break;
> +	default:
> +		return error_string(buf, end, "(%p4?)", spec);
> +	}

...

> -	*p++ = ' ';
> -	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> -	p += strlen(p);

> +	if (pixel_fmt) {

Technically we can avoid a boolean by checking fmt[2] again here, but I'm okay
with a temporary holder.

> +		*p++ = ' ';
> +		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> +		p += strlen(p);
> +	}

-- 
With Best Regards,
Andy Shevchenko


