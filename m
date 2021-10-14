Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDB42E255
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 21:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEB6EC40;
	Thu, 14 Oct 2021 19:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55526EC40
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 19:59:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4f0533f2-2d29-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 19:59:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1FC7B194B57;
 Thu, 14 Oct 2021 21:59:57 +0200 (CEST)
Date: Thu, 14 Oct 2021 21:59:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko@sntech.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 0/3] drm/panel: Proper cleanup after mipi_dsi_attach()
Message-ID: <YWiMMzvKHxQJcVoh@ravnborg.org>
References: <20210924003355.2071543-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924003355.2071543-1-briannorris@chromium.org>
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

Hi Brian,

On Thu, Sep 23, 2021 at 05:33:52PM -0700, Brian Norris wrote:
> I've tested a few dual-DSI panel drivers which choke if they PROBE_DEFER
> at the wrong time, so I patched those up in patch 1 and 2. Patch 3 fixes
> the other drivers that I couldn't test, but seem to have all the same
> problem.
> 
> 
> Brian Norris (3):
>   drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
>   drm/panel: innolux-p079zca: Delete panel on attach() failure
>   drm/panel: Delete panel on mipi_dsi_attach() failure

Thanks for fixing these up, and especially for the fix of the remaining
panel drivers.

I have applied all three patches to drm-misc-next as I did not consider
the fixes urgent.

They will show up in -next in 1-2 weeks.

	Sam
