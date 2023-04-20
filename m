Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30146E9233
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3294A10E0AA;
	Thu, 20 Apr 2023 11:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD70E10E0AA;
 Thu, 20 Apr 2023 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681989161; x=1713525161;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xebxl7NafZdy1ESS2RpvDfKKxgdLR6cmqxtuplixmFM=;
 b=HUckGaP+doyGEMB5DTiC4gAJlPl2v+W3e6q0pKuNTfqr9xaRJ7n7Pio+
 h1mn1H+71B0UjWDeRl7EBh4dZBhO8XXjT6qeMKqAReXC/RWUaPAWug/6R
 KY9wDgKlS532aloKi18SfNfsFb6XaaaGUZm9f6Byy9/1jL1hmcnAy17YZ
 gB5QsJCkwOhBkKGpIGq+QH8wWW0yBBj8UjQVsgoYDWsjXslDEKIwCAzAd
 /7NwQjycWGG5ALiHDAw9JYoBeL0xlrj8MrKWRK24AwK0Y5LdgFDvM8lqn
 u+22AIhDIqdK4gsdvSMHrzxWV4qillfvBIQMqBdYJidlivCFlFshxJqcC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345711478"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="345711478"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691876147"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="691876147"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:12:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/mtl: Define GSC Proxy
 component interface
In-Reply-To: <f8a0afc25630acc1e73bfa5a46dcc94ea559234a.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-2-daniele.ceraolospurio@intel.com>
 <f8a0afc25630acc1e73bfa5a46dcc94ea559234a.camel@intel.com>
Date: Thu, 20 Apr 2023 14:12:16 +0300
Message-ID: <87edoex0xb.fsf@intel.com>
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Apr 2023, "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com> wrote:
> On Wed, 2023-03-29 at 09:56 -0700, Ceraolo Spurio, Daniele wrote:
>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>> 
>> GSC Proxy component is used for communication between the
>> Intel graphics driver and MEI driver.
>
>
>
>> diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/i915_gsc_proxy_mei_interface.h
>> new file mode 100644
>> index 000000000000..e817bb316d5c
>> --- /dev/null
>> +++ b/include/drm/i915_gsc_proxy_mei_interface.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (c) 2022-2023 Intel Corporation
>> + */
>> +
>> +#ifndef _I915_GSC_PROXY_MEI_INTERFACE_H_
>> +#define _I915_GSC_PROXY_MEI_INTERFACE_H_
>> +
>> +#include <linux/mutex.h>
>
> alan: i notice u have included mutex.h but don't have any mutex use in this header.
> side note: looking at at least one other component interfaces (pxp), I see a mutex in the
> component struct but don't see it being used at all - a topic for a different series.
>
>
>> +#include <linux/device.h>
> alan: any reason we should include "device.h"? as opposed to just define the ptr type
> (since w only reference the ptrs). this could save us a little on build time

The only thing required is <linux/types.h>. Everything else can be
forward declared.

BR,
Jani.

>
>> +
>> +/**
>> + * struct i915_gsc_proxy_component_ops - ops for GSC Proxy services.
>> + * @owner: Module providing the ops
>> + * @send: sends data through GSC proxy
>> + * @recv: receives data through GSC proxy
> alan: nit: to be more specific "... from i915 through GSC proxy"
>
>> + */
>> +struct i915_gsc_proxy_component_ops {
>> +	struct module *owner;
>> +
>> +	int (*send)(struct device *dev, const void *buf, size_t size);
>> +	int (*recv)(struct device *dev, void *buf, size_t size);
>> +};
> alan: i believe we should have proper documentation on the possible list of
> return values for the various error conditions (assuming 0 is success).
>
>> +
>> +/**
>> + * struct i915_gsc_proxy_component - Used for communication between i915 and
>> + * MEI drivers for GSC proxy services
>> + * @mei_dev: device that provide the GSC proxy service.
>> + * @ops: Ops implemented by GSC proxy driver, used by i915 driver.
>> + */
>> +struct i915_gsc_proxy_component {
>> +	struct device *mei_dev;
>> +	const struct i915_gsc_proxy_component_ops *ops;
>> +};
>> +
>> +#endif /* _I915_GSC_PROXY_MEI_INTERFACE_H_ */
>

-- 
Jani Nikula, Intel Open Source Graphics Center
