Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148574AF4EE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4517310E23D;
	Wed,  9 Feb 2022 15:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE310E212
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644419814; x=1675955814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ips/vlMbcMaW6wh2et2HO87qwxGUzpVO0/saNuNMm8=;
 b=dtLKVMB3945wD1Z56MpcFlDqQDhbMi2Dtmh2tgecLbk1192c9jlAlufX
 bVtkrwxxjawHbK6bzt6s6hdSYjXUKRlq9HdhhS0jF4RnVthtVUAwg5A9S
 jXWaWl7ksBOYRPVmdT+SJ29qwMYBYKfa0FjNpScfVfR/YMclB98ZRrQQY
 y+3eXbBCK+w/1/I13oHfLmuZNzjByZFqLiWMbtf3TNko12ffVhfaNOROi
 1V8Gc/956HOchrwAugqVoQ7yEJAL75vtt3qH2m/2ko8vjJ2a7+j8Y22tC
 z7vAx2CoNXBkPct2PVn5hXxHuY3T/RAH12et/IgmetEnLpjK4PGioljwi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273761681"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="273761681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:16:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="568265096"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 07:16:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHoh4-002eX3-6v; Wed, 09 Feb 2022 17:15:42 +0200
Date: Wed, 9 Feb 2022 17:15:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 4/7] drm/solomon: Add SSD130X OLED displays I2C support
Message-ID: <YgPanXaAYQxHTjMd@smile.fi.intel.com>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209090314.2511959-5-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 10:03:11AM +0100, Javier Martinez Canillas wrote:
> The ssd130x driver only provides the core support for these devices but it
> does not have any bus transport logic. Add a driver to interface over I2C.

Thanks!

...

> + * Authors: Javier Martinez Canillas <javierm@redhat.com>

s?!

...

> +#include <linux/i2c.h>
> +#include <linux/module.h>

regmap.h ?
err.h?

...

> +	ssd130x = ssd130x_probe(&client->dev, regmap);

> +

Redundant blank line.

> +	if (IS_ERR(ssd130x))
> +		return PTR_ERR(ssd130x);

...

> +	{ /* sentinel */ },

No comma for terminator entry.


-- 
With Best Regards,
Andy Shevchenko


