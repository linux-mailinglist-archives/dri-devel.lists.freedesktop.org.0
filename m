Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318C0430296
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 14:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832336E455;
	Sat, 16 Oct 2021 12:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9506E455
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 12:27:19 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 6c4680fb-2e7c-11ec-ac3c-0050568cd888;
 Sat, 16 Oct 2021 12:27:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 11D50194B5D;
 Sat, 16 Oct 2021 14:27:25 +0200 (CEST)
Date: Sat, 16 Oct 2021 14:27:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add support for Wanchanglong panel used in px30-evb
 v11
Message-ID: <YWrFIz08A8ZVKXvi@ravnborg.org>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016102232.202119-1-michael@amarulasolutions.com>
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

Hi Michael,

On Sat, Oct 16, 2021 at 10:22:27AM +0000, Michael Trimarchi wrote:
> This patch series add support for W552946ABA panel. This panel is used
> in px30-evb v11. All the patches can be applied on top of drm-fixes
> branch. The last patch is suppose to fix a race when the panel is built
> in. Tested on px30 evb
> 
> Michael Trimarchi (5):
>   dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
>   drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA
>     panel
>   dt-bindings: ili9881c: add compatible string for Wanchanglong
>     w552946aba
>   drm/panel: ilitek-ili9881c: Make gpio-reset optional
The four patches has been applied to drm-misc-next.

>   drm/bridge: dw-mipi-dsi: Fix dsi registration during drm probing
This patch looks like it does not belong in this series.
Anyway - commented on it as I did not understand the code.

	Sam
