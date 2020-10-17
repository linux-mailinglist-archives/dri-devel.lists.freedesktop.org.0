Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE3291034
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 08:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2966E1B5;
	Sat, 17 Oct 2020 06:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232366E1B5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 06:41:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 08C0F80608;
 Sat, 17 Oct 2020 08:41:44 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:41:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/2] Add LT9611UXC DSI to HDMI bridge support
Message-ID: <20201017064143.GI2242298@ravnborg.org>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=EUspDBNiAAAA:8 a=8n8SyL_cAAAA:8
 a=9PYKBtNqa2uEeENYDCgA:9 a=CjuIK1q_8ugA:10 a=rMCfJy6NHDicN4J276Yl:22
 a=-K6Y0kWoOJXvxDHPO-NO:22
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Wed, Sep 09, 2020 at 12:28:21PM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> This series adds support for Lontium LT9611UXC bridge chip which takes
> MIPI DSI as input and provides HDMI signal as output.
> 
> The chip can be found in Qualcomm RB5 platform [1], [2].
> 
> [1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
> [2] https://www.thundercomm.com/app_en/product/1590131656070623
> 
> Changes since v2:
>  - Squashed connector support into main patch
>  - Added comment on modes table
>  - Dropped display timings support, covered by EDID
>  - Dropped sleep mode support
>  - Dropped hpd_status reading from ISR handler
>  - Added "sentinel" comments to empty table entries
> 
> Changes since v1:
>  - Fix whitespaces/indentation
>  - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR

Sorry for taking so long time to get back to you.
Which display driver will this be used together with?

The preference is that the display driver adds support for
creating the connector so we can drop this from the bridge
as this is not how things should be done these days.

All the rest looked good.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
