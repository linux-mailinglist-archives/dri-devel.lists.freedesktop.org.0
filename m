Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6AA3C216
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCC510E320;
	Wed, 19 Feb 2025 14:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daDjzf5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4D910E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739975229; x=1771511229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vhmxI/qpUsmrpjWohWJgs/TMHfwXta/ulC9P6VHKIyA=;
 b=daDjzf5mojiz2V2cSo4fFeSy+9Bb59xvvdaG/QNr1UaoCT9y7/wUJ42C
 Tjjxv0McT9XIwPr+QDqSP9Bylb4jBkNQTuU1D3b6Z1XfEaspSMZSGfW95
 SlD2pLsRMim1TPkFviRK5LJjMBi0kzyDyiMcShPZ+CH0Mp8epUEQC9b8K
 QUyPuylO7Ppyx5Lsr2sqSJ+CEEMLOm5GHOvV2f6Qj7Uz1oRP8etvs/sdx
 2xWRBLzGsZ2fSukeMAHE9Ik5BPal73nSKrDhGrRWPc351IAVe9TZhk525
 ykbb/po1PCXI0Jqc/ZXuuXpKUuzbJsj3Jp8jqa9PtDxHj/2QM+L1eUVeX Q==;
X-CSE-ConnectionGUID: 40ScvtyOQ021XFKfW5zjaA==
X-CSE-MsgGUID: KU4JpgLWQ2ShZt4HYLrLVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="66067584"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="66067584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 06:26:56 -0800
X-CSE-ConnectionGUID: 5fTf7ojeRZiQzvfXC1fUTQ==
X-CSE-MsgGUID: zkUoBl+eRPGI1IYoJeFrYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145620194"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 06:26:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tkl2H-0000000D2xx-20EC; Wed, 19 Feb 2025 16:26:49 +0200
Date: Wed, 19 Feb 2025 16:26:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132702.114669-3-clamor95@gmail.com>
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

On Tue, Feb 18, 2025 at 03:27:00PM +0200, Svyatoslav Ryhel wrote:
> Remove platform data and fully relay on OF and device tree
> parsing and binding devices.

Thanks for following the advice, but the problem with this change as it does
too much at once. It should be split to a few simpler ones.
On top of that, this removes MFD participation from the driver but leaves it
under MFD realm. Moreover, looking briefly at the code it looks like it open
codes the parts of MFD. The latter needs a very goo justification which commit
message is missing.

...

> +static const struct of_device_id lm3533_als_match_table[] = {
> +	{ .compatible = "ti,lm3533-als" },
> +	{ },

No comma for the terminator entry. I think I already pointed that out earlier.

> +};

...

> +	device_property_read_string(&pdev->dev, "linux,default-trigger",
> +				    &led->cdev.default_trigger);

One prerequisite patch you probably want is an introduction of

	struct device *dev = &pdev->dev;

in the respective ->probe() implementations. This, in particular, makes the
above lines shorter and fit one line.

...

> +static const struct of_device_id lm3533_led_match_table[] = {
> +	{ .compatible = "ti,lm3533-leds" },
> +	{ },

As per above.

> +};

...

> +		if (!strcmp(comatible, "ti,lm3533-als"))
> +			lm3533->have_als = 1;

If you end up having this, it's not the best what we can do. OF ID tables have
a driver_data field exactly for the cases like this.

...

> +		if (!strcmp(comatible, "ti,lm3533-backlight"))
> +			lm3533->have_backlights = 1;

Ditto.

...

> +		if (!strcmp(comatible, "ti,lm3533-leds"))
> +			lm3533->have_leds = 1;

Ditto.

...

> +		ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
> +				    1 << (2 * id + 1), 1 << (2 * id + 1));

BIT() and better to use a temporary variable for this calculation.

> +		if (ret)
> +			return ret;

...

> +		ret = lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
> +				    id | id << 1, BIT(0) | BIT(1));

		mask = GENMASK();
		..., id ? mask : 0, mask);

> +		if (ret)
> +			return ret;
> +	}

...

> +	bd = devm_backlight_device_register(&pdev->dev, pdev->name, pdev->dev.parent,
> +					    bl, &lm3533_bl_ops, &props);


With the advice from above:

	bd = devm_backlight_device_register(dev, pdev->name, dev->parent, bl, &lm3533_bl_ops,
					    &props);


>  	if (IS_ERR(bd)) {
>  		dev_err(&pdev->dev, "failed to register backlight device\n");
>  		return PTR_ERR(bd);

Consider another prerequisite patch (which should come before the firstly
proposed one):

	struct device *dev = &pdev->dev; // yes, this can go in this change
	...

	if (IS_ERR(bd))
		return dev_err_probe(dev, PTR_ERR(bd), "failed to register backlight device\n");

...

> +static const struct of_device_id lm3533_bl_match_table[] = {
> +	{ .compatible = "ti,lm3533-backlight" },
> +	{ },

As per above.

> +};

-- 
With Best Regards,
Andy Shevchenko


