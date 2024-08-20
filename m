Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F63958417
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFE710E6C8;
	Tue, 20 Aug 2024 10:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUGm3zx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C678910E6C8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724149257; x=1755685257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BOgYZXPgFTNZVBz0pq3mlpmGRom2Ac7uoQ7SAmfv//c=;
 b=IUGm3zx8jAoPMo401qUiN6oLBBLtKN+DNwxrour8rvSLRibY0h87b0Ny
 L4ES3svkKdhoppWKtp90Ky5TWL9P3xjdSTJczZv9YQuYioaeXBFDNUJRH
 QmyP8gtnk1VeJQZpMnHiPgwadHVuHaXESiqUL54UkIdAoyFDXoMEK0h2O
 TFhX8TeJpC1euxJjkhU8vXw+h9k5dFjcqzdQ6l/WXCBNcip3yIfKKEwI5
 qmeBBanVjFsUMfbe1QIaVOkQwqfsBIKLs4tGumORt0qI2UDWECh6JFgrE
 Jl/cRBdumd/VryC3tfDyGcLIHKFPUvjO9kcSuQK0tfRsV0fSbFbwy1wEY g==;
X-CSE-ConnectionGUID: lAafZMcbRUOQ2momJpBnXA==
X-CSE-MsgGUID: LmiPfoMGSGqDjrcPc/lBEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="47833480"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="47833480"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:20:56 -0700
X-CSE-ConnectionGUID: gQPimq9BRqOlEJSAJG5ztg==
X-CSE-MsgGUID: Fzwy9pbeQXiig1dhKLRqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60376547"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:20:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgLym-0000000HGHE-2yxO; Tue, 20 Aug 2024 13:20:44 +0300
Date: Tue, 20 Aug 2024 13:20:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 10/17] device property: Add remote endpoint to devcon
 matcher
Message-ID: <ZsRt_I6y9MfWLawy@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-11-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-11-swboyd@chromium.org>
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

On Mon, Aug 19, 2024 at 03:38:24PM -0700, Stephen Boyd wrote:
> When a single DT node has a graph connected to more than one
> usb-c-connector node we can't differentiate which typec switch
> registered for the device is associated with the USB connector because
> the devcon matcher code assumes a 1:1 relationship between remote node
> and typec switch. Furthermore, we don't have a #typec-switch-cells
> property so there can only be one node per typec switch.
> 
> Support multiple USB typec switches exposed by one node by passing the
> remote endpoint node in addition to the remote node to the devcon
> matcher function (devcon_match_fn_t). With this change, typec switch
> drivers can register switches with the device node pointer for a graph
> endpoint so that they can support more than one typec switch if
> necessary. Either way, a DT property like 'mode-switch' is always in the
> graph's parent node and not in the endpoint node.

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <linux-usb@vger.kernel.org>
> Cc: <linux-acpi@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>

Move these after --- line below.

...

>  drivers/base/property.c     | 7 +++++--

The changes here are fine to me.

...

>  include/linux/property.h    | 5 +++--

> -typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
> -				   void *data);
> +typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
> +				   const struct fwnode_handle *endpoint,
> +				   const char *id, void *data);

Seems there is no explanation of the parameters here, can we add a kernel-doc
to this typedef (may be a separate patch)?

-- 
With Best Regards,
Andy Shevchenko


