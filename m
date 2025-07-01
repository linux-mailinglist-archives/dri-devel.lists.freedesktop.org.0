Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B1AEFB20
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 15:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9289A1F;
	Tue,  1 Jul 2025 13:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e98RBByA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536989A1F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751377733; x=1782913733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COcxqTJmLCQuqGNIIvXZW8XzPWpwkkkrB4it1BwU/rw=;
 b=e98RBByAmidyKcLppr5KThRntVRU+Objwyqc8QjmOVKaQculxTHyFnCa
 va530QJvwpOsiflfL+tqNSdwMl60e5CNXduPHq6gsifUaWHUSSPlZAFOg
 wxPHQ/XMLzmMo6iNBrnz5zmIXEhxa88w1CDZ+OPhCLvOd0hy2ZBw2e/oW
 35vPVzwDjpCDn+pk+vxBA2LLTjWxxJhFQhB7QWo39ns0UpD9TJYUDu0uA
 M79Apm5w0jE5NHOniKuCJpMatj86ah+efYOUDsPU+mkM1fULa6Ple1S4f
 5xZWsDIrYBGGPnW59BcZ4qVp+rPgW3QcEYeGKmF2kGP8NpzhhwOvW144k g==;
X-CSE-ConnectionGUID: QIg2EVnnTOCLdpcEg0prCA==
X-CSE-MsgGUID: Nksyj82GQe65DdS8fksNOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53579999"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53579999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:48:52 -0700
X-CSE-ConnectionGUID: 7znLXOmqSLKgUFROLBP8PQ==
X-CSE-MsgGUID: +ro+hUc/Ta2CfGOwTALfIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153548388"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:48:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uWbLp-0000000BbxK-2psc; Tue, 01 Jul 2025 16:48:45 +0300
Date: Tue, 1 Jul 2025 16:48:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, gregkh@linuxfoundation.org,
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de,
 riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org,
 thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> leak in fbtft_framebuffer_alloc()").
> 
> An updated patch has been added as commit 505bffe21233 ("staging:
> fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> and so reverting the old patch.

Revert has its automatic line, please do not remove it.

-- 
With Best Regards,
Andy Shevchenko


