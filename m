Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A750DA00
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED7C10E083;
	Mon, 25 Apr 2022 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EFD10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7SaFOtoTXBlSU5Okuk8eVXBPLIf9tasagGDliF3arKk=; b=wo+RdSaA3qp7CI1oC43QUVDlTM
 IB33nce8qWt+4ekydxFHU+q7y6em7umvjettg7qgVSqYXji5jckfSGolJ1OO6F4zgQILl1MAMPX5H
 4Whqe8lPkd10+f0gfOi997mdQExXA9E7CUsMBhn43VbM/ruazqo2e2SwOElhHmj1isZqdMCctQe7m
 bnB/Mc99y2pJW6QV4wLGV6A0nVbyg3X3qBZU4tG0KIMsHjIARk5kGKXNn8wBvWjJxZzgcblKhKrCN
 c0HMO2ewrYFzxnWCx9poP+QmXNiWcvx7a047p4OZ+ssLDkRcKq9RhEQ6ve80t2BiBX/9gB+/vGemM
 HZvUuwMQ==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1nit37-000209-FJ; Mon, 25 Apr 2022 10:22:21 +0300
MIME-Version: 1.0
Date: Mon, 25 Apr 2022 10:22:19 +0300
From: Jyri Sarha <jyri.sarha@iki.fi>
To: "brookxu.cn" <brookxu.cn@gmail.com>
Subject: Re: [PATCH] drm/tilcdc: fix typos in comment
In-Reply-To: <1650625751-32137-1-git-send-email-brookxu.cn@gmail.com>
References: <1650625751-32137-1-git-send-email-brookxu.cn@gmail.com>
Message-ID: <71759e467a129cf3f56a3892e476d36b@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tomba@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-22 14:09, brookxu.cn wrote:
> From: Chunguang Xu <brookxu@tencent.com>
> 
> Fix typos in comment.
> 
> Signed-off-by: Chunguang Xu <brookxu@tencent.com>

Pushed to drm-misc-next.

Thanks,
Jyri

> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 29890d7..b986946 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -996,7 +996,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
>  	if (stat & LCDC_FRAME_DONE) {
>  		tilcdc_crtc->frame_done = true;
>  		wake_up(&tilcdc_crtc->frame_done_wq);
> -		/* rev 1 lcdc appears to hang if irq is not disbaled here */
> +		/* rev 1 lcdc appears to hang if irq is not disabled here */
>  		if (priv->rev == 1)
>  			tilcdc_clear(dev, LCDC_RASTER_CTRL_REG,
>  				     LCDC_V1_FRAME_DONE_INT_ENA);
