Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6D23159C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 00:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78666E215;
	Tue, 28 Jul 2020 22:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696776E215
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:35:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACCD7563;
 Wed, 29 Jul 2020 00:35:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595975752;
 bh=vliL54QKa1F6SxBCTfJKHAv2UhgWOg86DJA+2YvF06g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VomaKcFOR7zTGlu9YGdE96U6xDVq22P9SipsjOJ6FR3ZL5qtlPJWIPtnZ/Ad2Py46
 ixyoKDvr+4GHfrxKcW4o7qBC+0iH++lD62nV3QMu77ekXPhUBtyVv8q71j8JduFam+
 6pJ1q0I9Ire+wL4RJRtzqnIuVuUwlTg4I7QQVvqA=
Date: Wed, 29 Jul 2020 01:35:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: daniel@ffwll.ch
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200728223543.GU13753@pendragon.ideasonboard.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
 <20200728220205.GJ6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728220205.GJ6419@phenom.ffwll.local>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 12:02:05AM +0200, daniel@ffwll.ch wrote:
> Hi Hyun Kwon,
> 
> Are you all sorted with drm-misc commit rights so you can push the 3
> (maybe there's more) xlnx fixup patches to drm-misc-next-fixes?

Thanks Daniel for bringing this up.

Hyun, would that work for you ?

> On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> > Fix typo in parameter description.
> > 
> > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 821f7a71e182..3d53638ab15e 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
> >   */
> >  static uint zynqmp_dp_power_on_delay_ms = 4;
> >  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> > -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> > +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
> >  
> >  /* Link configuration registers */
> >  #define ZYNQMP_DP_LINK_BW_SET				0x0

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
