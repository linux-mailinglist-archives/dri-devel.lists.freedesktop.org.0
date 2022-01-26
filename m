Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4B49CBDF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9953589F75;
	Wed, 26 Jan 2022 14:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B6689F38
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643206184; x=1674742184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+bpZlvDIlAqOTrKi8qQY7oqDaN358NSulwLrW+ejnTU=;
 b=F2D1M9ZuhVpniyQkT/o3lSu+bIXwCnq+I/qg825zVLw0tp3UKHeEnZZW
 mMHocl3wXiGZcrt9r6jHA4bhmiVWS9SK+Ub8KTdvsMAKgqdmB9gR+D1jP
 XNfG2pau9BiU4mw5tzoAtS2G5/EsaaKiYNX7oK75YmqnoZ52QOcwWAdAF
 xRT17Rf9psVO6LDr214xwtCv5jtFppD6xl54ZOSopeOcQNTmjDCwmLNlu
 uSsikOTpI7ruvBdzQT+qDpW2AHueKUlx0eZ0q/p/Rp9pZ2nfr/lnMYnY8
 Jfgee18hx5G+/fHROwthxupIYUOlnKj6R81tEx1kTn/JUbQBpJiBoyIrI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246500411"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="246500411"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:09:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="581113085"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:09:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCiyO-00EcSP-TH; Wed, 26 Jan 2022 16:08:32 +0200
Date: Wed, 26 Jan 2022 16:08:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFV4EJosayH+e6C@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com> <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
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

On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
> On 1/26/22 14:12, Andy Shevchenko wrote:
> > On Wed, Jan 26, 2022 at 12:26:36PM +0100, Greg Kroah-Hartman wrote:
> >> On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> >>> On 1/26/22 11:31, Daniel Vetter wrote:
> > 
> > ...
> > 
> >>> You are describing a transitioning over to DRM - which is Ok.
> >>> But on that way there is no need to ignore, deny or even kill usage scenarios
> >>> which are different compared to your usage scenarios (e.g. embedded devices,
> >>> old platforms, slow devices, slow busses, no 3D hardware features,
> >>> low-color devices, ...).
> >>
> >> All of those should be handled by the drm layer, as Daniel keeps
> >> pointing out.  If not, then the tinydrm layer needs to be enhanced to do
> >> so.
> >>
> >> Anyone have a pointer to hardware I can buy that is one of these fbtft
> >> drivers that I could do a port to drm to see just how much work is
> >> really needed here?
> > 
> > I have bought myself (for other purposes, I mean not to convert the driver(s))
> > SSD1306 based display (SPI), SSD1331 (SPI), HX88347d (parallel).
> >
> 
> I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
> driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.

You should take ssd1307fb.c instead. And basically create a MIPI based driver
for I2C. Then we won't go same road again for other similar devices.

> I didn't find one with a SPI interface but we can later add a transport for
> that if I succeed.

-- 
With Best Regards,
Andy Shevchenko


