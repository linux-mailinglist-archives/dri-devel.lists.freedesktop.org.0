Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC93E0536
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 18:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5C6E1D8;
	Wed,  4 Aug 2021 16:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05706E1D8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 16:03:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 974b6047-f53d-11eb-9082-0050568c148b;
 Wed, 04 Aug 2021 16:04:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 84625194B87;
 Wed,  4 Aug 2021 18:04:22 +0200 (CEST)
Date: Wed, 4 Aug 2021 18:03:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <YQq6ascrSCtErWrf@ravnborg.org>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804081352.30595-2-shawn.guo@linaro.org>
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

On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> managed through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Please consider adding an optional port node, so we can use this panels
in a setup using a graph.

A simple port: true would do the trick.
I am aware that it may not be used today, this is a preparation for
potential future use.

With this fixed,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
