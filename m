Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549022BCDD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 06:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112166E492;
	Fri, 24 Jul 2020 04:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16D6E492
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 04:22:33 +0000 (UTC)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B84F206F0;
 Fri, 24 Jul 2020 04:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595564553;
 bh=cubPT/pAlpqAYcMftnQz56cp+y/ntu/XUxPaomDOqk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0zOH4bAEfXjxYhLHkQ+UHZkxcK8wKB3MsQoIsJ/zEd/jZtZjPs9y/XcQ0Z6IO0r4n
 /9j4b+OuqJ21maZc1uDZdrc2Hgmqvr9TjCbBi+rDVvDAqPkwvDB8pAIE+2BQoGIQkI
 IVn9vjcLIegNTsfNHH4pd+aVzU41tvPE65FefKAw=
Date: Fri, 24 Jul 2020 09:52:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge/adv7511: set the bridge type properly
Message-ID: <20200724042228.GE12965@vkoul-mobl>
References: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
 <20200722121554.GD5833@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722121554.GD5833@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-07-20, 15:15, Laurent Pinchart wrote:
> Hi Laurentiu,
> 
> Thank you for the patch.
> 
> On Mon, Jul 20, 2020 at 03:42:27PM +0300, Laurentiu Palcu wrote:
> > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > 
> > After the drm_bridge_connector_init() helper function has been added, the ADV
> > driver has been changed accordingly. However, the 'type' field of the bridge
> > structure was left unset, which makes the helper function always return -EINVAL.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks Laurent for pointing me to this.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

I have tested this on DragonBoard 410c:

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
