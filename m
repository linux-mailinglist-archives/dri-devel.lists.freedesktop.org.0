Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B875974413C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7E10E4D1;
	Fri, 30 Jun 2023 17:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A6210E4D1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688146284; x=1719682284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cubLHaU/IvjeEY3WTxrpyCHJrSKe0stKwV3Mqt6qqD0=;
 b=OLSW4oCiBQiOrAAAl9DR/v9LPYH8kdheTbdEJl5k4diQS+QyIL4SiJ2z
 YCyq/ZHOKbG1sI735LJbe2alZlg+QMl7q0mSUL3NKVvrx+l7fblEyc471
 K1r0A1mluRkGJrVKcLV/0EcLgNTBPAQS4+mtkG5/zXgUTr4LwXXYb+0BK
 VCcZZWspLcRWMQT1d+jF4vbUa15RDpWpTNgiSFj/sn4mDOlS+Q8mL5CRz
 bCGE3BU9UWClFliHiXNZ+qNRU85MnKSiws5qxKN+41Nj/+EuzNAANMKY9
 B5Ld38mcC/a+cKMlVAB9oSPfBkmWK4gUcDeCi0OEV11kUvVbHh0VMAkIS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365027330"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="365027330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862359847"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="862359847"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2023 10:31:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qFHxj-001ALs-2v; Fri, 30 Jun 2023 20:31:15 +0300
Date: Fri, 30 Jun 2023 20:31:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
Message-ID: <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629225113.297512-1-javierm@redhat.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:
> This patch series splits the fbdev core support in two different Kconfig
> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
> be disabled, while still having the the core fbdev support needed for the
> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
> disabling all fbdev drivers instead of having to be disabled individually.
> 
> The reason for doing this is that now with simpledrm, there's no need for
> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros

How does simpledrm works with earlycon=efi?

> now disable them. But it would simplify the config a lot fo have a single
> Kconfig symbol to disable all fbdev drivers.
> 
> I've build tested with possible combinations of CONFIG_FB, CONFIG_FB_CORE,
> CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n'.
> 
> Patch 1/2 makes the CONFIG_FB split that is mentioned above and patch 2/2
> makes DRM fbdev emulation depend on the new FB_CORE symbol instead of FB.

-- 
With Best Regards,
Andy Shevchenko


