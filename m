Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D517489D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 19:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EFA6E391;
	Sat, 29 Feb 2020 18:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE496E391
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 18:13:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0317B20020;
 Sat, 29 Feb 2020 19:13:21 +0100 (CET)
Date: Sat, 29 Feb 2020 19:13:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT
 schema
Message-ID: <20200229181320.GA14589@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=QBz0WmAjK130PHwwYnYA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 07:15:08PM +0100, Sam Ravnborg wrote:
> This set of patches convert display-timing.txt to DT schema.
> To do that add a panel-timing.yaml file that include all the
> panel-timing properties and use this in panel-common and in display-timings.
> 
> panel-dpi was also converted so we have no .txt users left of panel-timing
> in panel/
> 
> Everything passed dt_binding_check - and the trivial errors I tried in
> the examples was all catched during validation.
> 
> This work was triggered by a patch-set from Oleksandr Suvorov aiming
> at updating panel-lvds to support panel-dpi.
> This will make it simple to add additional properties to panel-dpi.
> 
> Thanks for the quick responses on v2 and likewise the quick
> feedback on the request for the license change!
> 
> Highlight from v3 - se individual patches for details.
> - Added panel-dpi support to panel-simple.
>   We can now add a simple panel just by addding timing parameters
>   in a DT node
>   The patch [5/5] is RFC as test is pending
> - To support panel-dpi in panel-simple - add a data-mapping
>   property to panel-dpi
> 
> Highlights from v2 - see individual patches for details.
> - Got acks for the license change
> - Simplfied panel-timings bindings
> - panel-dpi can now be used without a panel specific compatible
>   So panel-dpi can be used as a generic binding for dumb panels
> 
> Feedback welcome!
> 
> 	Sam
> 
> Sam Ravnborg (5):
>       dt-bindings: display: add panel-timing.yaml
>       dt-bindings: display: convert display-timings to DT schema
>       dt-bindings: display: convert panel-dpi to DT schema
>       dt-bindings: display: add data-mapping to panel-dpi
>       drm/panel: simple: add panel-dpi support

All patches now pushed to drm-misc-next.
Dropped lvds666 when applying the patches.

	Sam

> 
>  .../bindings/display/panel/display-timing.txt      | 124 +----------
>  .../bindings/display/panel/display-timings.yaml    |  77 +++++++
>  .../bindings/display/panel/panel-common.yaml       |  15 +-
>  .../bindings/display/panel/panel-dpi.txt           |  50 -----
>  .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
>  .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
>  7 files changed, 470 insertions(+), 179 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
