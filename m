Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709292315A1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 00:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE3F6E426;
	Tue, 28 Jul 2020 22:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A706E426
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:37:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B12A563;
 Wed, 29 Jul 2020 00:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595975868;
 bh=87O/ZO51dVt0In3u/HQSQIRpyT0KiserorvlrdcFFps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dg0KJ5bHUVbTFQ5Zs8EhtcLfr5rW0piy9rJ6XQKjki0ugcYH6HtXeewMl55T8V7xm
 yQd8CX18Lk+37Ammu1YtOy8nZN6WOZnOGRZA3Bx3cKMnaha+UOo4yU0N7h3QF9L/5H
 lC8/RB0vvaZOr/Cnb+M5naHmcBSm6v3yoHR2T+iY=
Date: Wed, 29 Jul 2020 01:37:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm: xln: fix spelling mistake "failes" -> "failed"
Message-ID: <20200728223739.GV13753@pendragon.ideasonboard.com>
References: <20200724111258.14762-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724111258.14762-1-colin.king@canonical.com>
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin,

Thank you for the patch.

On Fri, Jul 24, 2020 at 12:12:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg messages. Fix it.

There is a spelling mistake in the commit message, s/xln/xlnx/ ;-)

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 821f7a71e182..0e1c818746eb 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1308,7 +1308,7 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
>  		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
>  				       sizeof(dp->dpcd));
>  		if (ret < 0) {
> -			dev_dbg(dp->dev, "DPCD read failes");
> +			dev_dbg(dp->dev, "DPCD read failed");
>  			goto disconnected;
>  		}
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
