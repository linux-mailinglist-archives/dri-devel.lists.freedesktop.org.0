Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D6549CA81
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97810E572;
	Wed, 26 Jan 2022 13:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AB410E572
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643202913; x=1674738913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jvn1DT8hkIC9aHCBN88BfzW6xWKdrEbGQoRpjkz2lt4=;
 b=jodYnQlA0gn+YmW3inc+Gbg3xO/VpLOOx57Fe9doyytS6VeT6CV3hhGA
 GIykQJtXYtr5RWYWT5XBPyqJMHjpR1PRVn4C2fSVPTL3h8T/g8mS9ohhd
 Rae6EgSlLsWwQmF/fyBk2xKnASA9arZlp/qG8BC6QtcHycTi2Or8nCGRy
 XSOGLwoq/WMphOOzF3kSh+K/M1FuyQpfI/n9DYxfM4bXdePRq4FZUmMLq
 mbNrwVyJk9x2QIOlKl321CD/Gd1N+mJDGBHlFs/avL0CXUK/iSTRrkrhY
 WXjP882sRjZuTqF0r1SYhKTJjkmT4jkuxRa/mDqkisCk5UuSlN8XMwh81 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309860045"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309860045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:15:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="597459201"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:15:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCi7f-00EbZf-0w; Wed, 26 Jan 2022 15:14:03 +0200
Date: Wed, 26 Jan 2022 15:14:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFJGrfMi0E1ySmH@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <CAKMK7uFhJPpiHqL-040ozbCM=QxiWNrFHp1gOEUvpEUjxbwAQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFhJPpiHqL-040ozbCM=QxiWNrFHp1gOEUvpEUjxbwAQQ@mail.gmail.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:27:19PM +0100, Daniel Vetter wrote:
> On Wed, Jan 26, 2022 at 12:18 PM Helge Deller <deller@gmx.de> wrote:
> > On 1/26/22 11:31, Daniel Vetter wrote:

...

> > You are describing a transitioning over to DRM - which is Ok.
> > But on that way there is no need to ignore, deny or even kill usage scenarios
> > which are different compared to your usage scenarios (e.g. embedded devices,
> > old platforms, slow devices, slow busses, no 3D hardware features,
> > low-color devices, ...).
> 
> This patchset isn't about killing existing support.
> 
> This is about adding new drivers to a subsystem where consensus the
> past 6 years or so was that it's closed for new drivers.

You mean fbdev?

-- 
With Best Regards,
Andy Shevchenko


