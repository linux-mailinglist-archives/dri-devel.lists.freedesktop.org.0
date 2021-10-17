Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E2430B43
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7BD6E81E;
	Sun, 17 Oct 2021 17:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEE86E81E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:38:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1bac7ece-2f71-11ec-9c3f-0050568c148b;
 Sun, 17 Oct 2021 17:38:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C5264194B1A;
 Sun, 17 Oct 2021 19:39:03 +0200 (CEST)
Date: Sun, 17 Oct 2021 19:38:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Sony Tulip Truly NT35521 panel support
Message-ID: <YWxfrrORowd58dM1@ravnborg.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051008.6172-1-shawn.guo@linaro.org>
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

Hi Shawn,

On Mon, Aug 09, 2021 at 01:10:06PM +0800, Shawn Guo wrote:
> It adds driver for Sony Tulip Truly NT35521 5.24" 1280x720 DSI panel,
> which can be found on Sony Xperia M4 Aqua phone.
> 
> Changes for v2:
> - Add `port` node into bindings.
> - Re-create the driver using linux-mdss-dsi-panel-driver-generator[1].
> - Rename the driver to include Sony Tulip.
> - Model 5V control GPIOs with regulators.
> - Rename Backlight GPIO as "backlight-gpios".
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> 
> Shawn Guo (2):
>   dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
>   drm/panel: Add Sony Tulip Truly NT35521 driver

I finally got around to process drm patches again. I have applied the
driver to drm-misc-next and it will show up in -next in 1 to 2 weeks.

Sorry for the long delay!

	Sam
