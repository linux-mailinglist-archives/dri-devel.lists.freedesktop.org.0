Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18A68BCA4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3510E39A;
	Mon,  6 Feb 2023 12:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661310E39A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675685875; x=1707221875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aj4zsIGJeWIWgP0qOUxydQhPTST9g340yTBo55f3YCg=;
 b=jEitghqXXwsTQAbnF5r4IllYKK/SGp8mwOvLv0sfbPrwqySJYOiG3yLB
 613PwOOzw2XLqnhSW8lITdcF/utxhs3PAuk4aGsu5DcOSr4xYyXDdmbdQ
 Z71IeUkkO5gdsWnrJVrAcggOjAcnLisCu9qxWJjLsLQ9jm0kmI8opm2Pe
 FLbj++IfmaJA2+Pp76BD3KkAl3+bNFG2jizxuc12qsywZC+RH5Hw6jzqp
 zVnCvN1HKF0ljy7wzBdEQRps24yLTLsNOwDSGFVwW1Cm0IIhdsppBSLBn
 idjnQuI1P0u61CNkgRvas7h7EMoK15SxAIxsVb/PQ++Oms/mmfvRT++fU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415409794"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="415409794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698810814"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="698810814"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001.jf.intel.com with ESMTP; 06 Feb 2023 04:17:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pP0RL-003AN8-0c; Mon, 06 Feb 2023 14:17:43 +0200
Date: Mon, 6 Feb 2023 14:17:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 9/9] drm/bridge: it6505: Register Type C mode switches
Message-ID: <Y+Dv5uuW+nTQKv1U@smile.fi.intel.com>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-10-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-10-treapking@chromium.org>
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
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 09:30:40PM +0800, Pin-yen Lin wrote:
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.

Same / similar comments as per previous patch.

-- 
With Best Regards,
Andy Shevchenko


