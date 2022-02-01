Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2CC4A5DDD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B3A10E4EA;
	Tue,  1 Feb 2022 14:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA7D10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643724224; x=1675260224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4cD8Nnk/cAjxUMAyT4wL7Ctq8gRWHUD/fFe2hLfCcRo=;
 b=QT+7fbTkuYLMQHLMIbTz+Rekxy5dRCf0uzrmsIy3+x8rSusiMjKej/pY
 UpTe+x6QChRG59C+Y0vFfZGiOXfIGQEg0MZI+CgpjtNnWV4a0djCtg37f
 8hAH5qfjUUPMbF8KWxZoNDYlh2TyGcLcYEqwsHZGYFgp5suPEcrfnS7jA
 lcXWSi2jkWbF8NmqylQUmJGEdYheKjDZ005EEAqdTI7RXDycOpJ1W5Hiu
 yPKadMxP5dl2gyzPMcjCBguSnEafjArtlqt4mtF90bIH2oA93GsHUxcaY
 qXf8sWlwoOlgSbZWiKGAdPs/vDPKWpRATZDBcwD1f/DjfzQjbqiuL3C9d A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247911987"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="247911987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 06:03:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="626738935"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 06:03:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEtjz-00HKFy-02; Tue, 01 Feb 2022 16:02:39 +0200
Date: Tue, 1 Feb 2022 16:02:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Message-ID: <Yfk9fuazUSgI6C9n@smile.fi.intel.com>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
 <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
 <YfkA4ER/52I2v1JP@smile.fi.intel.com>
 <9ddd8a8c-4aa9-bc4a-5637-66197a7342d1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ddd8a8c-4aa9-bc4a-5637-66197a7342d1@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 12:45:53PM +0100, Javier Martinez Canillas wrote:
> On 2/1/22 10:44, Andy Shevchenko wrote:
> > On Tue, Feb 01, 2022 at 01:14:22AM +0100, Javier Martinez Canillas wrote:

...

> > The problem with no backward compatibility means that removal of old driver
> > makes users unhappy since DT is kinda ABI and we do not break it.
> > 
> 
> I think that's the crux of the issue. Do we want people to update their
> kernel but using their existing Device Tree and be able to switch to the
> DRM driver ?
> 
> My take is that we should and that's why I kept the backward compatibility.
> 
> Maybe we could do that in the meantime and at some point introduce new DT
> bindings (with a different compatible string) that would use the latest
> and greatest conventions in DT ? That seems to be a good compromise.

I have over-read in this discussion that current binding is not fully
correct from hw perspective. If it's indeed the case (and I believe it's),
then probably we should come with brand new driver with ssd130x name and
incompatible bindingas (*).

Otherwise in this driver we continue to be incorrect in them.

*) But even though I think it would be good if you take the old one under your
   maintainership.

-- 
With Best Regards,
Andy Shevchenko


