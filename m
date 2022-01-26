Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3349D0D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 18:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886B710E379;
	Wed, 26 Jan 2022 17:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43C510E379
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643218466; x=1674754466;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K129hl5RytW5ura24/yx7HTDJHZL++ViTWK4Ed5BQCk=;
 b=B6l+3dsd2uGOrvPhqwUKHjkRpXHoCNnjQs8w1gVN/7sxOEFNiJkROdl+
 rfzvXhCfkIoFxJtffHoqqqMriRR+LIQ90v2arf6xrqs8yLgmGxptjvMhs
 BJ2TPMZpU6cwo0XoK2vetZKExAUbil/88hv00wkak95Nwdoy4aj9FRoJF
 /hCv8F7Z3powW6IIx3cfGCocO4fhz0VqHKN/vNKlXFbWKHIce+IMdLJEd
 0F+XuB6sO1VxL1oA5QqrNF6+D1krhVXVDskMFli4txY6Xac4yNoix6ohQ
 lX6Lh4XAWbnVVyDEVmoQfk2aTBQZHCw8DyFQ2gAdIdrb4gKafsyXk5zoU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230178248"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="230178248"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:34:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="624901254"
Received: from nbasu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.16.197])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 09:34:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Javier Martinez
 Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
In-Reply-To: <YfFV4EJosayH+e6C@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
Date: Wed, 26 Jan 2022 19:34:13 +0200
Message-ID: <87v8y6xuy2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 26 Jan 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> And basically create a MIPI based driver for I2C.

What does that even mean?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
