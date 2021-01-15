Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 211FB2F8CFC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1986E5BE;
	Sat, 16 Jan 2021 10:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B356E450
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:59:10 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id x5so8749695otp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BgP0/6eUZBd02FT4Yca7Ri+xdr/2QbRxZxHfgskufLU=;
 b=RIbhpeGpWe759rgFYc+tr07bnXRAiFhqtWEfQ0U9aKt+UKqZdiiP5V0I0c4wySr6+n
 d2R6rcawvn2giKZxoRnFhURFvXZfwN9xtfgm1WBhQxc8Bezx11/UmnckQwmPYUiqhY8d
 AJu2c+sXoeQGbcLtBNMINVrWN6fiF/m7tWpYrIodNCd44CnSb1aXARbJOjpjiJKnrTdG
 OA70uX3y0ak73kkz3LXBiRYEKY2Nim3ONjGlrLs+RUrrpnuS2nOm87BXpcgE/oHmTWCA
 1mH/bBhPfNy5c9cojup9ln5wKQIvNsasAbDUee7EKH/e6dOZFixvYzFzhMnuIHu3JArg
 Aa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BgP0/6eUZBd02FT4Yca7Ri+xdr/2QbRxZxHfgskufLU=;
 b=IurbguAUYiGRnNU4iYY9xPQAs0mTkuXE/5YT/R1c/tHkp+12pYOuDri3SJrEdXLaJ/
 IKsztg3sjsP/FAZL0tUZ11omA79Ov6SWZYFQCUZMNoM1qpqlxshl7Zo0rEhAspp/s+jm
 PwEYagNrhKW+IOCEytWUP4Z9dEbFjSfhr54P0XJLHkJM6C1c+833d1FXILg+bHlvJNB8
 j+RuKVBHxQF9PDULivOB2LeqvF7lRE0sYfP7ZWzXNFTZZvMmE9ezDM+M1hdYjAxbhHc7
 xh4tYCCjREZZIub/dpqUUREzQPJMM+PZ1CQsc954UsdCUzWLLWIXbKmB/zJvANpZToHm
 7qtw==
X-Gm-Message-State: AOAM531KfPyNRSPBD20vqdZa3ZTXv0jahnOfGpyVa/cVpLeahg+FeP8s
 r3anDSM3rRtPn17Sm5F5RXB7XA==
X-Google-Smtp-Source: ABdhPJyGMhf/hePzRXY2gpEmcb/cM8zoxN5bkOxhQgTyF6SZyoif8C/0rHizikN2InILdX/QDDLx1A==
X-Received: by 2002:a05:6830:10a:: with SMTP id
 i10mr1753711otp.5.1610722750197; 
 Fri, 15 Jan 2021 06:59:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z38sm1808320ooi.34.2021.01.15.06.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:59:09 -0800 (PST)
Date: Fri, 15 Jan 2021 08:59:07 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return
 code
Message-ID: <YAGtu9GYuphys1GF@builder.lan>
References: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
 <20210115110225.127075-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115110225.127075-3-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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

On Fri 15 Jan 05:02 CST 2021, Dmitry Baryshkov wrote:

> Return NULL pointer from get_edid() callback rather than ERR_PTR()
> pointer, as DRM code does NULL checks rather than IS_ERR(). Also while
> we are at it, return NULL if getting EDID timed out.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index a59e811f1705..b708700e182d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -505,7 +505,10 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
>  	ret = lt9611uxc_wait_for_edid(lt9611uxc);
>  	if (ret < 0) {
>  		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
> -		return ERR_PTR(ret);
> +		return NULL;
> +	} else if (ret == 0) {
> +		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
> +		return NULL;
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
