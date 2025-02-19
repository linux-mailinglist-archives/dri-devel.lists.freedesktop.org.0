Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A8A3C43C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480B810E341;
	Wed, 19 Feb 2025 15:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+PsfPPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16CA10E341
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739980577; x=1771516577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uV3soKwL+HCNAvSymtrWOzDP+EtcGO1BQkAUCm5Wg+g=;
 b=l+PsfPPADquQnvwHDcuEa3gtjaaNpW3+RvgcuJnvQJ84VE9D6d7Ly0FW
 aXVPeLeNseU3VLkvXdscrXLGm0l7W3oQvWTYyY/b8tytW/M+42dm7XfId
 +P3x93FSTqqLx1AAZq7Z7tP6xvJvpn4Cp4TPFdWV1GahXM+pzJnz29ref
 oYT7dd1hT2Mkatm9IrGmh6BJ+tUXAw+WTYJvolGwOiF+d8QmZc6usIsyb
 pRyDieZP2BzK/Jrj4IuPPsACwCMPctuJ+q9FodpRuipp48wwNst05q6I6
 XxQSUVM3jrsndqtwBK4YP6aL7GiNksPGb+iKYs5emv1hhfgyawwsZX2Ym g==;
X-CSE-ConnectionGUID: T0G8GhdMSd2cegZRHI2cdw==
X-CSE-MsgGUID: hStApfhyRx6IGkV4TySXdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44641213"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44641213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:56:15 -0800
X-CSE-ConnectionGUID: 9tQ7e4C6QyWDwrfSehe6Ew==
X-CSE-MsgGUID: pjGdWZJjSauXppPQLfgMhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="145612236"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:23:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tkluw-0000000D3ix-2SQZ; Wed, 19 Feb 2025 17:23:18 +0200
Date: Wed, 19 Feb 2025 17:23:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <Z7X3ZvQbSe75U-AR@smile.fi.intel.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
 <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
 <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
 <CAPVz0n2WwAOb1UU7J7aDTdhXXCaAZkCpYjW_nc_CBRgkGWdEOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2WwAOb1UU7J7aDTdhXXCaAZkCpYjW_nc_CBRgkGWdEOw@mail.gmail.com>
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

On Wed, Feb 19, 2025 at 05:13:15PM +0200, Svyatoslav Ryhel wrote:
> ср, 19 лют. 2025 р. о 17:07 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> пише:
> > On Wed, Feb 19, 2025 at 04:36:38PM +0200, Svyatoslav Ryhel wrote:
> > > ср, 19 лют. 2025 р. о 16:27 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> пише:

...

> > > MFD part is removed since MFD cells binding is unconditional, while
> > > the device supports any amount of children grater then one. For
> > > example, my  device uses only backlight at bank A, while all other
> > > subdevices are not present and used. This patch switches to dynamic
> > > bind of children.
> >
> > MFD does the same. Please, take your time and get familiar with how MFD works.
> 
> It does not. I have tried. If mfd cell binding is missing, driver will
> complain and fail.

I really don't know what exactly is going on here, you can check it later, but
I'm 100% sure that MFD works for only driver that are present. What you are
describing is how component framework is designed.

To proove my words you can check drivers/mfd/intel_soc_pmic_*.c and find listed
cells that never had a driver in the Linux kernel. They are just placeholders.

...

> > --
> > With Best Regards,
> > Andy Shevchenko

Please, when answering, remove unrelated context from the replies.

...

> Let this driver rot for now, I might return to it. At some point

Up to you. But thanks for trying!

-- 
With Best Regards,
Andy Shevchenko


