Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C4E8AE821
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1E10EB0D;
	Tue, 23 Apr 2024 13:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNdqC/vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C97210EB0D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713878911; x=1745414911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yoNrrYNy5bKhD63HVuLbZyATPToN/mKG82od9F3d75o=;
 b=NNdqC/vschJJyeobm2qgbhGN74+/VqzrL/TJP/o02Jov2jtuo5KTi2cw
 jdAmqMimSQnKdpgYVPohC7v2MRjxiDZPtC9R2LcDADxF6gwpVftlzRVSs
 dxqCax33IGYzLhlPOu6ZFSHpPSawyPrCT2EbxJbQduA27iMKeRaqKskdb
 fx9mx9Hq0mJOdeKjpwmni2Zy1EQJ0ujW7EDucxyVMb1ioiFvkVxWwqdi2
 ZmK1tK98gb+kE9DJyqkJa+DwP3/WP7SMgFriVzkU4eFsVoHSiWfgqARpR
 OaSmEaLS0pB1okzgfU/Pms6UQVaeS/IiGPLOYD4nDM1NMER45RHH09Lr0 g==;
X-CSE-ConnectionGUID: noft7CJXTwetUUvXFROiEA==
X-CSE-MsgGUID: Ar+1JLCkT1m7f4E85Xn2hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9326170"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9326170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:28:31 -0700
X-CSE-ConnectionGUID: zdHCHu/ATFOpMBj3rlZdFg==
X-CSE-MsgGUID: /9I2B5ueS2KjIsKTdl8HuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24816598"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:28:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rzGC9-00000000LUl-1woq; Tue, 23 Apr 2024 16:28:25 +0300
Date: Tue, 23 Apr 2024 16:28:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422164658.217037-1-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:
> Because the software node backend of the fwnode API framework lacks an
> implementation for the .device_get_match_data function callback. This
> makes it difficult to use(and/or test) a few drivers that originates

Missing space before opening parenthesis.

> from DT world on the non-DT platform.
> 
> Implement the .device_get_match_data fwnode callback, device drivers or
> platform setup codes are expected to provide a string property, named as
> "compatible", the value of this software node string property is used to
> match against the compatible entries in the of_device_id table.

Yep and again, how is this related? If you want to test a driver originating
from DT, you would probably want to have a DT (overlay) to be provided.

> This also helps to keep the three backends of the fwnode API aligned as
> much as possible, which is a fundamential step to make device driver
> OF-independent truely possible.
> 
> Fixes: ffb42e64561e ("drm/tiny/repaper: Make driver OF-independent")
> Fixes: 5703d6ae9573 ("drm/tiny/st7735r: Make driver OF-independent")

How is it a fix?

> Closes: https://lore.kernel.org/lkml/20230223203713.hcse3mkbq3m6sogb@skbuf/

Yes, and then Reported-by, which is missing here.

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>

Please, move these after the cutter '---' line (note you may have that line in
your local repo).

...

> +static const void *
> +software_node_get_match_data(const struct fwnode_handle *fwnode,
> +			     const struct device *dev)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	const struct of_device_id *matches = dev->driver->of_match_table;
> +	const char *val = NULL;
> +	int ret;

> +	ret = property_entry_read_string_array(swnode->node->properties,
> +					       "compatible", &val, 1);

And if there are more than one compatible provided?

> +	if (ret < 0 || !val)
> +		return NULL;

> +	while (matches && matches->compatible[0]) {

First part of the conditional is invariant to the loop. Can be simply

	matches = dev->driver->of_match_table;
	if (!matches)
		return NULL;

	while (...)

> +		if (!strcmp(matches->compatible, val))
> +			return matches->data;
> +
> +		matches++;
> +	}
> +
> +	return NULL;
> +}

-- 
With Best Regards,
Andy Shevchenko


