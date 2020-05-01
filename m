Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08F1C1F16
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 23:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F7B6ED4A;
	Fri,  1 May 2020 21:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378CB6ED4A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 21:00:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E48FE2002A;
 Fri,  1 May 2020 23:00:39 +0200 (CEST)
Date: Fri, 1 May 2020 23:00:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 0/2] Add support for TM5P5 NT35596 video mode panel
Message-ID: <20200501210038.GB26726@ravnborg.org>
References: <20200501204825.146424-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501204825.146424-1-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=bAtGagR5AAAA:20 a=7LVGNgU6USOl37Ea4AYA:9
 a=CjuIK1q_8ugA:10 a=443qOekVpzXbzkAZ2tlV:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad.

On Fri, May 01, 2020 at 10:48:21PM +0200, Konrad Dybcio wrote:
> I am aware of the fact that this is probably not the correct
> naming of this panel, yet I am unable to retrieve any additional
> information about it, as it is used in a smartphone to which no
> schematics are released.
> 
> The driver has been generated with the help of 
> linux-mdss-dsi-panel-driver-generator [1] and works perfectly
> on a Asus Zenfone 2 Laser Z00T smartphone, including brighness
> control and switching on/off.
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Panle driver looks good.
Will take a closer look tomorrow.

Any chance you can work on the TODO in the driver so we can have that
resolved before we apply it?

Also for a v2 it would be perfect if you could work on top of
drm-misc-next.
There is at least one small fix needed to build that I spotted.

But wait until I get back on the driver patch before submitting a v2.

	Sam

> 
> Konrad Dybcio (2):
>   drivers: drm: panel: Add TM5P5 NT35596 panel driver
>   dt-bindings: display: Document TM5P5 NT35596 panel compatible
> 
>  .../bindings/display/panel/tm5p5,nt35596.txt  |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-tm5p5-nt35596.c   | 366 ++++++++++++++++++
>  4 files changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tm5p5,nt35596.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-tm5p5-nt35596.c
> 
> -- 
> 2.26.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
