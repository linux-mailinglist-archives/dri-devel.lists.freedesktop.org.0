Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B65A670C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 17:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725410E112;
	Tue, 30 Aug 2022 15:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2C510E112
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661872392; x=1693408392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wTIUsBF5sTdJ6JbPdR2fBQZlqEWSeLoC7AVXPmb6j1c=;
 b=cF8HA9zl2aRv0tb2hi69bsC/kc7LoUHCIqOZw0PlDqFTRx5Ycjh1pm//
 s/S4nbwW6s8MIXUnx6LjAtUMfFuUo/bkSWcy3cxti0Kx2vs5LTVsYDZjt
 dT3Tg48bdx3J3UdJPCjGzzBqA397zGaRb+EnJ5uIy/DvJJfZcvwXfRuGk
 jaHIM6pUQIY6ZJ/3B+DmXUBqfac/adfYDlHaw32AZqJ9mviKY/U0LmiHz
 63uFowhgaJMjEThcMONk3+LNEQnQrlqvzySmCS+7LXhkzNI+aIxOY/Qy+
 UOas9UPM8uNHLNejFcoxHQeAZoaacAwWIfnm264tIvUcX4zy0ZE8rF6Th g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="381498871"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="381498871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 08:13:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; d="scan'208";a="562682956"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 08:13:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oT2vF-0060PI-2k; Tue, 30 Aug 2022 18:13:01 +0300
Date: Tue, 30 Aug 2022 18:13:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v9 00/10] Add MediaTek MT6370 PMIC support
Message-ID: <Yw4o/Sx6frEtaFDp@smile.fi.intel.com>
References: <20220830033729.9219-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830033729.9219-1-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alice_chen@richtek.com, linux-iio@vger.kernel.org, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, pavel@ucw.cz, linux-leds@vger.kernel.org,
 daniel.thompson@linaro.org, deller@gmx.de, lee@kernel.org,
 devicetree@vger.kernel.org, mazziesaccount@gmail.com, szunichen@gmail.com,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-pm@vger.kernel.org, sre@kernel.org,
 robh+dt@kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 11:37:20AM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> This patch series add MediaTek MT6370 PMIC support and add a index macro
> to <linear_range.h>. The MT6370 is a highly-integrated smart power
> management IC, which includes a single cell Li-Ion/Li-Polymer switching
> battery charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> First, in this series of patches,
> 'dt-binding: mfd', 'mfd driver' has been applied by Lee in the v7.
> https://lore.kernel.org/all/YvJdpq0MWNPQZw5c@google.com/
> https://lore.kernel.org/all/YvJdxEpC2cB58Bq9@google.com/
> 
> 'tcpci driver' has been applied by Greg in the v8.
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c2a8ea5997fdfeb43eda259d5533234c3cae05d7
> 
> Second, the LED RGB driver is based on Andy's patch which moves
> led_init_default_state_get() to the global header.
> https://lore.kernel.org/all/20220805154907.32263-3-andriy.shevchenko@linux.intel.com/
> 
> In addition, we added a macro to the <linear_range.h> for declaring the
> linear_range struct simply (see patch v9-0005) and made some changes for
> MT6370 drivers (see v9 section of the change log below).

Your cover letter is dangling. Make sure you are using --cover-letter --thread
when preparing the series.

-- 
With Best Regards,
Andy Shevchenko


