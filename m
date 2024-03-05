Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E021871941
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E6B112973;
	Tue,  5 Mar 2024 09:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gt0Ahmyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C5A112971
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709630012; x=1741166012;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3mXN8KKW4waYOcWzjRN9oSLaIcwuzNcqm3YSkZxcpzY=;
 b=Gt0Ahmyous3C15cJfbUaMnCp+ZskDMj2eu/chCdW81oul/E1pvRT8YcA
 JGEN8XdOtFSSZ10smz/RARTlKHjrBh0I5BesAnFHKFrH7kmv1xq8PCywB
 dAcj0HI04GugZhckXjK6nPygEzx14q3nSVrp7gTdSSDs0TabTmU5SNJUO
 XjbQYIOG9KTU1ACh+L1arpx65DOVziq/NINxjQJXuYlCihcyGDxAOW25d
 oCe2/ivPDIIZnZEKPQZiplyLqRs7OeaMJ1qyfp++oNunCys05aHkluCdi
 m6futw8sPtVppHM7PVbiGiUoJ4tmHh6xtCkUwBsvcB7NunPIrT99IAzB8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4031541"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4031541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="46836038"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:13:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] macintosh/via-pmu-backlight: Include
 <linux/backlight.h>
In-Reply-To: <20240305090910.26742-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-3-tzimmermann@suse.de>
Date: Tue, 05 Mar 2024 11:13:20 +0200
Message-ID: <87plw92g9b.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for the
> backlight header has recently been removed from <linux/fb.h>. Add it to
> via-pmu-backlight.c to get the necessary symbols.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/macintosh/via-pmu-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
> index c2d87e7fa85be..89450645c2305 100644
> --- a/drivers/macintosh/via-pmu-backlight.c
> +++ b/drivers/macintosh/via-pmu-backlight.c
> @@ -10,6 +10,7 @@
>  
>  #include <asm/ptrace.h>
>  #include <linux/adb.h>
> +#include <linux/backlight.h>
>  #include <linux/pmu.h>
>  #include <asm/backlight.h>

-- 
Jani Nikula, Intel
