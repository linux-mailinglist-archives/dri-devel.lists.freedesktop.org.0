Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC12F74AF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5146E6E2DE;
	Fri, 15 Jan 2021 08:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEFE89C6B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 03:49:05 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id x13so7339301oto.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 19:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BWxsOOk11ALTjpUo3gLg8gd+IkymuxCP/NKNZLVJFbA=;
 b=ewezM9RxdGM/uSiiRAmWujXTI9dtfQm5Dmu9UdJcEiy8HT9tl8JJeuU5m67GTdKBJL
 Ff9VlozGfXlzOC3F1CtcxO7+6chjpke5sgbirzJtr/eDnv0X3ehy2d2exQlI9V93xdGP
 l4rCRcW7QV8UI2Z901kzIeqNObCbHDm55Beum1Y71lNJ+Mo80pUe52nOrvhTwdSZnnFp
 ofNKEEh1z/Do75c4V8wyZojW1ktPPCLkIpp1bpEOhNhHbssWHheLTiTOhci0XbrbxUMf
 Rrqlm9jNZ36dnoolclqOhgLhu2557Q6o8fA6Fp9YfhZl7DxZfKxKXnuQ9R4ttaCMnEXP
 Xm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWxsOOk11ALTjpUo3gLg8gd+IkymuxCP/NKNZLVJFbA=;
 b=OyN5LZ3yyQPikLE6W1xkUPbiu+GCD2kbV7XyETMIO4x+X3HJSnOrjhVtwC6JrY9QCG
 4PH5/XEdiTOhzRvnsKwvGPIQg9BGe7WSyIQtZHMERhsUm17Cg+YIMRAIoQEx5yddOAIf
 UOGtOdPaOKxCbeCcHdm5AjZdK3oW3orTnSs04HlMWzB2rR8wvTYY2V0+pfWuI4m+iPxE
 FhVmXDdhffVS6sEYxbz5UVGzpVoCQJKryhDgXphb5+3D+0Tsic2PsxnJvnqC5e54Hi5S
 aBVn28mSA99T01MQUWXdFrXO7cnwfpyUQew5dzUUt0ieMOPEAthvPn0gd5cvGo6e2nwp
 lOJA==
X-Gm-Message-State: AOAM533PWDC83jctJtg5vmcxrq09FeodJweE3ZbX92Z9Mtw4mHjIyXW0
 QR0pmvoGfBML4jB8blZBjHW2vQ==
X-Google-Smtp-Source: ABdhPJzwnCONBKp/lWmJdpN0ixlFfOCGdbrjs3S8aglD1bPkpwcVl3PyK0rfxg+yKpN6SYy8wBzmgw==
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr6909580otd.208.1610682545010; 
 Thu, 14 Jan 2021 19:49:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h26sm1577280ots.9.2021.01.14.19.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:49:04 -0800 (PST)
Date: Thu, 14 Jan 2021 21:49:02 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/bridge/lontium-lt9611uxc: fix waiting for EDID
 to become available
Message-ID: <YAEQrnlHA+Z8YTij@builder.lan>
References: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127092316.122246-1-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 27 Nov 03:23 CST 2020, Dmitry Baryshkov wrote:

> - Call wake_up() when EDID ready event is received to wake
>   wait_event_interruptible_timeout()
> 
> - Increase waiting timeout, reading EDID can take longer than 100ms, so
>   let's be on a safe side.
> 
> - Return NULL pointer from get_edid() callback rather than ERR_PTR()
>   pointer, as DRM code does NULL checks rather than IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 0c98d27f84ac..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -145,8 +145,10 @@ static irqreturn_t lt9611uxc_irq_thread_handler(int irq, void *dev_id)
>  
>  	lt9611uxc_unlock(lt9611uxc);
>  
> -	if (irq_status & BIT(0))
> +	if (irq_status & BIT(0)) {
>  		lt9611uxc->edid_read = !!(hpd_status & BIT(0));
> +		wake_up_all(&lt9611uxc->wq);

This seems like a really good idea :)

> +	}
>  
>  	if (irq_status & BIT(1)) {
>  		if (lt9611uxc->connector.dev)
> @@ -465,7 +467,7 @@ static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *brid
>  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  {
>  	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -			msecs_to_jiffies(100));
> +			msecs_to_jiffies(500));
>  }
>  
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> @@ -503,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>  	ret = lt9611uxc_wait_for_edid(lt9611uxc);
>  	if (ret < 0) {
>  		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -		return ERR_PTR(ret);
> +		return NULL;
> +	} else if (ret == 0) {
> +		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +		return NULL;

This looks like it should be a separate patch.

Regards,
Bjorn

>  	}
>  
>  	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
