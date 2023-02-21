Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758A69DEC5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E04310E1A7;
	Tue, 21 Feb 2023 11:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93E410E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676978824; x=1708514824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Mu/cApGuk7VVKjAEkm4PpZVWYpUQxdGCpHYcvzLEl5o=;
 b=GSBMQJ0MVofQYEDKi7rtrXH35JZWTaHe5WJECr02Evn4+1Iqb9LisP6C
 YkWyWL2OGVdTDhpy7/zqV700spIZzlpnA3u+8sQQivEGvpu12/1AHJaEr
 m0G6nzAvfC89t8LsiykDGuxFO4SkViYTWeFqQf7+pIUU2XIeLrcV0tQRv
 rCTPj+Q8lUUDMgRrTzaJRWJkaIg0v297BHdaESx5eN9/QMfFcSsjImxwi
 V75wOrlWL4+npAoC4WlneqQ2nlSGvtFv1NT42iRg4s887dp7ZssufjMUF
 nELkBK4uzM+nXJ2DKTgoJzHCpBWv47flBrdxTCjXSxkSiqKjCFZ0d1dPG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397293432"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="397293432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 03:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="621465092"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621465092"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 21 Feb 2023 03:26:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pUQnL-009vxT-2d; Tue, 21 Feb 2023 13:26:51 +0200
Date: Tue, 21 Feb 2023 13:26:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 01/10] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y/SqezaEvOjwGkUg@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-2-treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benson Leung <bleung@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 05:50:45PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
> 
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.

...

>   * @match: Function to check and convert the connection description
>   *
>   * Find a connection with unique identifier @con_id between @fwnode and another
> - * device node. @match will be used to convert the connection description to
> - * data the caller is expecting to be returned.
> + * device node. For fwnode graph connections, the graph endpoints are also
> + * checked. @match will be used to convert the connection description to data
> + * the caller is expecting to be returned.
>   */

Please add a Return: section at the end of the kernel doc.
Otherwise it complains that there is none.

...

>   * @matches_len: Length of @matches
>   *
>   * Find up to @matches_len connections with unique identifier @con_id between
> - * @fwnode and other device nodes. @match will be used to convert the
> - * connection description to data the caller is expecting to be returned
> - * through the @matches array.
> + * @fwnode and other device nodes. For fwnode graph connections, the graph
> + * endpoints are also checked. @match will be used to convert the connection
> + * description to data the caller is expecting to be returned through the
> + * @matches array.
>   * If @matches is NULL @matches_len is ignored and the total number of resolved
>   * matches is returned.

Ditto.

-- 
With Best Regards,
Andy Shevchenko


