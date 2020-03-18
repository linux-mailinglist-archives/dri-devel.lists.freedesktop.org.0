Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BED18AE06
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B066E9B1;
	Thu, 19 Mar 2020 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 149786E92C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:55:21 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 0F27580B6;
 Wed, 18 Mar 2020 16:56:06 +0000 (UTC)
Date: Wed, 18 Mar 2020 09:55:17 -0700
From: Tony Lindgren <tony@atomide.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the omap tree
Message-ID: <20200318165517.GO37466@atomide.com>
References: <20200318135034.242d9edf@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318135034.242d9edf@canb.auug.org.au>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Stephen Rothwell <sfr@canb.auug.org.au> [200318 02:51]:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   arch/arm/configs/omap2plus_defconfig
> 
> between commit:
> 
>   98c2cc359f8f ("ARM: omap2plus_defconfig: Update for moved and dropped options")
> 
> from the omap tree and commit:
> 
>   e7e67d9a2f1d ("drm/omap: Switch the HDMI and VENC outputs to drm_bridge")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

OK thanks!

Tony


> diff --cc arch/arm/configs/omap2plus_defconfig
> index eedb26ff93f9,54f1a21de7e0..000000000000
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@@ -360,10 -353,10 +360,9 @@@ CONFIG_OMAP2_DSS_DSI=
>   CONFIG_DRM_OMAP_PANEL_DSI_CM=m
>   CONFIG_DRM_TILCDC=m
>   CONFIG_DRM_PANEL_SIMPLE=m
> + CONFIG_DRM_DISPLAY_CONNECTOR=m
> + CONFIG_DRM_SIMPLE_BRIDGE=m
>  -CONFIG_DRM_TI_TFP410=m
> + CONFIG_DRM_TI_TPD12S015=m
>   CONFIG_DRM_PANEL_LG_LB035Q02=m
>   CONFIG_DRM_PANEL_NEC_NL8048HL11=m
>   CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
