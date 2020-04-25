Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F81B871D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 16:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAB06E1B9;
	Sat, 25 Apr 2020 14:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695516E1B9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 14:40:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 67C242007C;
 Sat, 25 Apr 2020 16:40:08 +0200 (CEST)
Date: Sat, 25 Apr 2020 16:40:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 0/3] Add multiple AUO panels
Message-ID: <20200425144006.GB32235@ravnborg.org>
References: <20200415172725.84257-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415172725.84257-1-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=KIFCHchCShzuCEW-doMA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian.

On Wed, Apr 15, 2020 at 07:27:22PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> Patches are more or less independent of each other. There
> was a previous version for the 12" and 15" panels, which
> was missing the DT binding update. The 19" patch is new,
> for the previous 10" panel a different patch has been merged
> in the meantime.
> 
> -- Sebastian
> 
> Sebastian Reichel (3):
>   drm/panel: simple: Add support for AUO G190EAN01 panel
>   drm/panel: simple: Add support for AUO G156XTN01.0 panel
>   drm/panel: simple: Add support for AUO G121EAN01.4 panel

Applied to drm-misc-next.

	Sam


> 
>  .../bindings/display/panel/panel-simple.yaml  |  6 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 89 +++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
