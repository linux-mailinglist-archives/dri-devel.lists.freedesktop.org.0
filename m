Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEE231595
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 00:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9086E0B9;
	Tue, 28 Jul 2020 22:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC97E6E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:34:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF879563;
 Wed, 29 Jul 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595975639;
 bh=EpxA9pvxLOGaUuww38LTx5fEDKuye+ZbkE8mxs2jw5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmktEMvejHNl9eVNAkAAW8NWjRvGid8iVR5HjYVTUjZRHrRE2aKWIhbCrveknp52R
 qpol8xjcyCWqEkCd2Sn/GTmuLRw+P/6JEOT/vLL/dtvBSNatHC3FoK2medB9+PzV6R
 1z97QRitYZ+e8oynpX4usQklcg5sOkhjE8fqdZTI=
Date: Wed, 29 Jul 2020 01:33:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-ID: <20200728223349.GT13753@pendragon.ideasonboard.com>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725063429.172139-1-weiyongjun1@huawei.com>
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

Hi Wei,

Thank you for the patch.

On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> Fix typo in parameter description.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 821f7a71e182..3d53638ab15e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
>   */
>  static uint zynqmp_dp_power_on_delay_ms = 4;
>  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
>  
>  /* Link configuration registers */
>  #define ZYNQMP_DP_LINK_BW_SET				0x0

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
