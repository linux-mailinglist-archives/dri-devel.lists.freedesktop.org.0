Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597F2A890D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEE96EDE4;
	Thu,  5 Nov 2020 21:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC46EDE4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:32:01 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 184BC2006C;
 Thu,  5 Nov 2020 22:31:59 +0100 (CET)
Date: Thu, 5 Nov 2020 22:31:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Message-ID: <20201105213157.GG216923@ravnborg.org>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=OLL_FvSJAAAA:8 a=KN5_TdukHPppwH8LP0YA:9
 a=CjuIK1q_8ugA:10 a=3w7wjZy9XmMA:10 a=0Y2J-7ZVQZYA:10
 a=oIrB72frpwYPwTMnlWqB:22
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi

On Thu, Nov 05, 2020 at 02:02:37PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> This is third version of the series sent by Sebastian in February:
> 
> https://www.spinics.net/lists/linux-omap/msg153465.html
> 
> I took the patches from his git tree, and rebased on 5.10-rc2. There
> were some conflicts and compilation errors, and one bug that made dsi to
> not work (videomode variable was not initialized to 0).

I for one would be more than happy to see these patches go in.
I have looked at them before but was lost in all the conversions.
But the general impression is that the drivers are left in a much better
shape after the patch set. And the individual patches all looks good.

So I am all for getting the patches applied.
Perferably soonish so there is some time to fix any regressions that may
be reported.

	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
