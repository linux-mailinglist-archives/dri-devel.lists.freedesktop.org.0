Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF74AB1244
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FF610EA23;
	Fri,  9 May 2025 11:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIgRaLKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C5210EA1E;
 Fri,  9 May 2025 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746790524; x=1778326524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8KIHf9OmLLgE+hOeF978U0+HWSf5VFUlCD/UL8AeEME=;
 b=UIgRaLKYjlEXHY4jphyIO/xw+DPgP0+hbxEzPazGV9aqxqzC15MPMdIQ
 QHrnDQjyPs+Q+1JPzDXi1uCBe0BOZkHrwfwcIWF3yxv8tBnJn5+pvdEh0
 WUzGaW8ii42VYL91sDc9yjwE99xUoBMxi4c+EHjmaWmLIHsNyc6HiIewz
 6h60AtJzwV26VwR/yiVTAF3i9NSv2K3Faqz7HKxCUJnrM4dH+dJSdzvbs
 An0nK/XGOt9dcYuf14aDA4nSefXC6vgzWVURjeE9i3YPMRenyiJDZijaA
 RvUp4cZ1TFfIiKlluuTvcKumxVTmo3Mxa1vXZpzaZN9q0pj7Kqoq5bifA Q==;
X-CSE-ConnectionGUID: t7azp457Q5GvozDmBGZISg==
X-CSE-MsgGUID: Uctxl0UFRrqmiyi09mgKqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="60018339"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="60018339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:35:23 -0700
X-CSE-ConnectionGUID: dnI/PA9fR7C/uvI0OgZHvg==
X-CSE-MsgGUID: rir706HgTC2/66cqhrngjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="173761276"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:35:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1uDM0X-000000004rY-0p0E; Fri, 09 May 2025 14:35:13 +0300
Date: Fri, 9 May 2025 14:35:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 arnd@arndb.de, me@kloenk.dev, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 06/11] io: move PIO_OFFSET to linux/io.h
Message-ID: <aB3ocO8xh5GugfDD@smile.fi.intel.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
 <20250509031524.2604087-7-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509031524.2604087-7-andrewjballance@gmail.com>
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

On Thu, May 08, 2025 at 10:15:19PM -0500, Andrew Ballance wrote:
> From: Fiona Behrens <me@kloenk.dev>
> 
> Move the non arch specific PIO size to linux/io.h.
> 
> This allows rust to access `PIO_OFFSET`, `PIO_MASK` and
> `PIO_RESERVED`. This is required to implement `IO_COND` in rust.

...

> +/*
> + * We encode the physical PIO addresses (0-0xffff) into the

I know this is the original text, but we have a chance to improve it a bit by
saying range more explicitly:

 * We encode the physical PIO addresses (0x0000-0xffff) into the

> + * pointer by offsetting them with a constant (0x10000) and
> + * assuming that all the low addresses are always PIO. That means
> + * we can do some sanity checks on the low bits, and don't
> + * need to just take things for granted.
> + */
> +#define PIO_OFFSET	0x10000UL
> +#define PIO_MASK	0x0ffffUL
> +#define PIO_RESERVED	0x40000UL
> +#endif


-- 
With Best Regards,
Andy Shevchenko


