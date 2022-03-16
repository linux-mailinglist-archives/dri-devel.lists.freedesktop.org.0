Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013CF4DB6B6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 17:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D2010E8AC;
	Wed, 16 Mar 2022 16:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D6C10E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647449525; x=1678985525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M6xWvkasIs+4Huuwh1wbLinzgQqked41NLVqaR8etdQ=;
 b=WXI3C3oK1+UVGU4366hiEXv0IGljrTu1oircfPTZXxytoIYyerpVcAAc
 /GH+zXjmh5vtUqnQuXkIuL5h9v3uEjmdNsFylCymOwvGsKLdfvb4ennd4
 M0zwn2FUR+GjEbWh3V4XVBHQhFbeXYFeti7xYt0+UrWmHC/1xZddQ8hf3
 tXuqeO+sE626TarukYIABIu3sUO0QIMBWmYX4KrLamDRlQ7J/1iyrNLVX
 L3Enpr8SKK+POZ0+21opqdPP/T+aPXUwmxSaUoWwSLLKd8MuapNsaHgj2
 MAJPhtia4AAlb4OKRues8q0pUqndaIWOJA9LaNvecD+Hj9EVAhtVHcOCa g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="244114468"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="244114468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:52:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="635058087"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 09:52:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nUWro-0010gf-UM; Wed, 16 Mar 2022 18:51:20 +0200
Date: Wed, 16 Mar 2022 18:51:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <YjIViC4U3ZwfiXlU@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yi97SaQdudVfKV9W@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yi97SaQdudVfKV9W@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 06:28:41PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:

...

> Any reason you didn't test build this?

My test build doesn't include the WERROR for this driver, so I missed the
warning. Sorry for that. Now fixed.

> drivers/staging/fbtft/fbtft-core.c: In function ‘fbtft_init_display’:
> drivers/staging/fbtft/fbtft-core.c:1038:48: error: passing argument 3 of ‘fbtft_dbg_hex’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>  1038 |                                           s16, &par->init_sequence[i + 1], j,
>       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/fbtft/fbtft.h:441:50: note: in definition of macro ‘fbtft_par_dbg_hex’
>   441 |                 fbtft_dbg_hex(dev, sizeof(type), buf,\
>       |                                                  ^~~
> drivers/staging/fbtft/fbtft-core.c:52:26: note: expected ‘void *’ but argument is of type ‘const s16 *’ {aka ‘const short int *’}
>    52 |                    void *buf, size_t len, const char *fmt, ...)
>       |                    ~~~~~~^~~
>   LD [M]  drivers/staging/gdm724x/gdmulte.o
> cc1: all warnings being treated as errors

-- 
With Best Regards,
Andy Shevchenko


