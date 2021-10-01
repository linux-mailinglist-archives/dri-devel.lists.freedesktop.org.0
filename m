Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3841F664
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 22:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0AF6F3F6;
	Fri,  1 Oct 2021 20:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8827E6F3F6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 20:37:27 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id d207so10490504qkg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zkZRE1eEAZyryz39bCaestf9STy5sTzg/yvpAeBoKL4=;
 b=CCfbyOwfd0P5t+5ZRImMnUUskPj72rArktg6RNaaUNyqXUeSgwpM0rbAcBAkglWGIq
 Ay6J1tK3tzZyS4rNAL4Ie+5m+CxzGQLqODv44oIGUpXsXPPErFtsUvyi1Ih5aIRK06jS
 keLPV3t/hH5HZ09dSBgthqijzUkoR9Z9U2xEZYGbrxp8yxMiltt7cYgV8CRb3z1N13is
 X/V1h6W7+jmpVATxfjdn5QbUBJ4FZV+O5R7shhJJj3Yc4pi04JGiICRUcPpMDr24Yv6U
 JQmu27ksNY9r75HUGveFA/TQIniku8vM8xLV89+TRl3DdYOt7mYt5pmsStjLkbN2Fgcd
 fbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zkZRE1eEAZyryz39bCaestf9STy5sTzg/yvpAeBoKL4=;
 b=IUqYvH6C/gB3UY8KWwW2S1KGblLI1lvnMN0VCDMKTCIxC6jDI4R6TEV/etKd4cQ846
 vySoigdZEjGn3Hd2uHcyT19Z48DlkfzmwXIbS9E6e/CwC7Wfp0LIH7llLBUgSF5k0e/W
 D2yl35xVzJXpUTBUEImbxXsPVQIeI+cmFzyDV51Qj6XoChCcpvZMk229TcNiQzdJOOJC
 Ply0uMdlh89wI+JhVlY9lw3zfzfTmzplzPfEGIqLhpK392GMkIB0egw6qTInzwIRF4ac
 sR52hGRZbe0ZWgoa9UAcV/9jaujg0bBs9N+2bcaN+kryz7tF6ZOB0P0blVWE4SmYy2S5
 lrrg==
X-Gm-Message-State: AOAM5305vIENid0IA8aiommk44mEVSXIl713sUCcS+eex81x5sn6Bp+z
 6EForPGTdZU3uQ3lXGOTATfYQtTAuMGa4g==
X-Google-Smtp-Source: ABdhPJyanMpqt2duCpwpvAmH2PwIWFc4RUPjx+nuDVdS38gdaqmbFEoZOY+04aefRITy3t9qRTOsoA==
X-Received: by 2002:ae9:e895:: with SMTP id a143mr55119qkg.113.1633120646890; 
 Fri, 01 Oct 2021 13:37:26 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id i8sm3957487qtp.55.2021.10.01.13.37.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 13:37:26 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:37:22 -0400
From: Sean Paul <sean@poorly.run>
To: Brian Norris <briannorris@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, stable@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] drm/brdige: analogix_dp: Grab runtime PM reference for
 DP-AUX
Message-ID: <20211001203722.GZ2515@art_vandelay>
References: <20210929144010.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929144010.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 29, 2021 at 02:41:03PM -0700, Brian Norris wrote:
> If the display is not enable()d, then we aren't holding a runtime PM
> reference here. Thus, it's easy to accidentally cause a hang, if user
> space is poking around at /dev/drm_dp_aux0 at the "wrong" time.
> 
> Let's get the panel and PM state right before trying to talk AUX.
> 
> Fixes: 0d97ad03f422 ("drm/bridge: analogix_dp: Remove duplicated code")
> Cc: <stable@vger.kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b7d2e4449cfa..a1b553904b85 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1632,8 +1632,23 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>  				       struct drm_dp_aux_msg *msg)
>  {
>  	struct analogix_dp_device *dp = to_dp(aux);
> +	int ret, ret2;
>  
> -	return analogix_dp_transfer(dp, msg);
> +	ret = analogix_dp_prepare_panel(dp, true, false);
> +	if (ret) {
> +		DRM_DEV_ERROR(dp->dev, "Failed to prepare panel (%d)\n", ret);

s/DRM_DEV_ERROR/drm_err/

> +		return ret;
> +	}
> +
> +	pm_runtime_get_sync(dp->dev);
> +	ret = analogix_dp_transfer(dp, msg);
> +	pm_runtime_put(dp->dev);
> +
> +	ret2 = analogix_dp_prepare_panel(dp, false, false);
> +	if (ret2)
> +		DRM_DEV_ERROR(dp->dev, "Failed to unprepare panel (%d)\n", ret2);

What's the reasoning for not propagating unprepare failures? I feel like that
should be fair game.

> +
> +	return ret;
>  }
>  
>  struct analogix_dp_device *
> -- 
> 2.33.0.685.g46640cef36-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
