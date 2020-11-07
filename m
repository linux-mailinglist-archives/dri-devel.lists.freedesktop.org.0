Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A72AA485
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 12:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD26E047;
	Sat,  7 Nov 2020 11:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2326E047
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 11:05:31 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A254C20023;
 Sat,  7 Nov 2020 12:05:27 +0100 (CET)
Date: Sat, 7 Nov 2020 12:05:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/2] Add LT9611UXC DSI to HDMI bridge support
Message-ID: <20201107110526.GA912360@ravnborg.org>
References: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=EUspDBNiAAAA:8 a=8n8SyL_cAAAA:8
 a=gyEoD_T1ygFEYnNRWQQA:9 a=CjuIK1q_8ugA:10 a=rMCfJy6NHDicN4J276Yl:22
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Mon, Nov 02, 2020 at 04:14:33AM +0300, Dmitry Baryshkov wrote:
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
> Changes since v3:
>  - Support for firmware upgrades
>  - Simplified modes table to include only used fields (w, h, refresh)
>  - Added more entries to display modes table, as more modes are
>    supported by the firmware
>  - Wait for EDID to be available from the hardware before reading it
>  - Do not store EDID in the interim buffer, lowering the size of
>    per-device struct

Thanks, driver is now applied to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
