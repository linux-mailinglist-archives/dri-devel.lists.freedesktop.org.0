Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66558D5239
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 21:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CD112B838;
	Thu, 30 May 2024 19:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5nshUVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3C412B849
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717096880; x=1748632880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yUCC865GVkukQUQ+FPFQCsjvwp7xAwGkvRS9TdW8c4o=;
 b=i5nshUVlEHtmDt+RSGVaLuOPq6wKhVPyFQXzIdiujvROrOQvYhic1iId
 PsAnG86l+RHVAXTQTP9ri7kP2M1IGBojuKhCCTupW8uQxUIMZaXlZrBQU
 a4OF4v/ypX1I8zqmkFq9RGwgaapjOy/DmQ4kFZVUwwA1ufZrLL9DlPu70
 qixBYwDXsJipeab8kk8rD5kiz2q8GmEK8qbORTxUt4drYZZAhPMwZSB6H
 lKQ+D32iz1+Lrr58Cv5EqyU/xIS7CgfNb9TcfdmWDEad4bVBtsiqyM8bi
 yRLFyh+Ho8f77va2vlUhc8e1iSMpn3qhhGpCxunj8ynDnJ53VN4zxgfPx Q==;
X-CSE-ConnectionGUID: Cqfl1hgnRMu9messgmbMAA==
X-CSE-MsgGUID: gewcn+mETxGcDXhuG7YPvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13568760"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13568760"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:21:19 -0700
X-CSE-ConnectionGUID: 1Zh/9PhkSJuWw/nVSk4YmA==
X-CSE-MsgGUID: CStSQ2MNTfG5fPUQLo+enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36000356"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:21:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sClKn-0000000CHTB-1Do8; Thu, 30 May 2024 22:21:09 +0300
Date: Thu, 30 May 2024 22:21:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, broonie@kernel.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
 functions
Message-ID: <ZljRpSgApF6ZwGKD@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171740.2763221-1-devarsht@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 30, 2024 at 10:47:40PM +0530, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.

...

> +Rounding, absolute value, scaling and 32bit division functions
> +--------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:

Please, double check that this is correct keyword in this case.

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko


