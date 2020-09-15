Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591C269BBD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 04:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899EB6E82C;
	Tue, 15 Sep 2020 02:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E16E82C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 02:04:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77C83275;
 Tue, 15 Sep 2020 04:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600135468;
 bh=K9qHF5Wk7ANqUkBeUMCJNTKH0UsxajF0WAKE2r7QXBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IUKiybEJNNq5so80T2/vAFSS+InaBUJvCjvSqragH1+uUdc72kFUYFbOemfbBFztq
 CdMdLFH5dYoy+SWkUlpgJxtlbReyqflUSDm7MfwOcDZ1GqLQm9+fZhL1GSbdRYLZ+n
 ilFc+but4Dgk8wL650mO9i2NVyAeAZBvssvZMnM8=
Date: Tue, 15 Sep 2020 05:04:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/panel: samsung: make vint_table static
Message-ID: <20200915020400.GB15543@pendragon.ideasonboard.com>
References: <20200912033817.142849-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912033817.142849-1-yanaijie@huawei.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Thank you for the patch.

On Sat, Sep 12, 2020 at 11:38:17AM +0800, Jason Yan wrote:
> This eliminates the following sparse warning:
> 
> drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:217:15: warning: symbol
> 'vint_table' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 1d1c79a18613..b3f5797c23e0 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -214,7 +214,7 @@ static const u8 gamma_tbl[S6E3HA2_NUM_GAMMA_STEPS][S6E3HA2_GAMMA_CMD_CNT] = {
>  	  0x00, 0x00 }
>  };
>  
> -unsigned char vint_table[S6E3HA2_VINT_STATUS_MAX] = {
> +static unsigned char vint_table[S6E3HA2_VINT_STATUS_MAX] = {

Shouldn't it be const, while at it ?

>  	0x18, 0x19, 0x1a, 0x1b, 0x1c,
>  	0x1d, 0x1e, 0x1f, 0x20, 0x21
>  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
