Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5998C972E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9510E21F;
	Sun, 19 May 2024 22:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ThDt8Pmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E010E1F2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:11:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so47107141fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716156671; x=1716761471; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O1yu0CLdWydH2A7Dq3K6QV2l9Q/wS/S04PP8RXlFT9Y=;
 b=ThDt8Pmnckj5wLDcjVaoMezNPY8dnvv9wDnXA5Qd0pG/0EWXrVLLvOhBfejN2OYNBV
 UG3v7Y4jDUqBXOheu+5kHjbIXbgmnVLEo8k3KrEM4fGgjHd/xp+xw/XLg6mg9FmyZLLa
 k5mWwDrV37bY6z9a03G4KtEONTA/Sd0get/Kq6gH6LvpqZNdq0tQ/zc67VPfNmcgav4u
 QjAYGx741TntqD25cZ+spxMqPPvKWqVOJxjmga60fnBE6acEdQZN/Bsau+I2VjeC3RKy
 1ER77zRWpCsYHNxLpmOhQy2zt7z6SEK9R/n8kWK60IVOXPf/T1iHk21KUynbI7wDn7mi
 RBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716156671; x=1716761471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1yu0CLdWydH2A7Dq3K6QV2l9Q/wS/S04PP8RXlFT9Y=;
 b=wSIvTgPMqhqLmc4Cg63o2Jz/z+aU82Z1b7c2ixDlaD833+1JPy5ky/ert0MUJc58CC
 osd2kH8ev02n+D5u5BnAwmvPBR9l5ckpZ9JYF1HW3lpzFClf83BSoG6bXbLhFlC5IazD
 N1iZ7wdhJfsmEgpOc8sy3t3UcHdhSRIRMaK4UP7l4cSXUkpjWU+grK8LXxcX7brqU6f5
 vKRvRd5PnZoBqiBaqj3nsnOVLJJcoT6qMu6VqwOyp4PB/zc1TS7MrpdjAhxnbzv148vv
 CWQXulZz7t8CEOGNP7yQG3eH9ZWN0y0vcfteAM3FAPtE651T4drbO9rsLTAj9NXiTx6n
 OMvw==
X-Gm-Message-State: AOJu0Yznp7Jn9oxv45Gzl3xUlvBJrABzs+XuBrc+UInWfHG4rs1kkZdi
 Kqq2s96lVM2KCv55akDvGp43HWxEZTRygNyhfY/pz7/ed5YRiVSEgyvd0NRi94o=
X-Google-Smtp-Source: AGHT+IEUbS+A8dZA0RYQkSPF3yyQr0Ufa6nb98ekU4D8rsUrV4xMgsFpoeSh1+2u1ldrRhMjT0c2+w==
X-Received: by 2002:a2e:9497:0:b0:2e5:59a:591b with SMTP id
 38308e7fff4ca-2e56ea3aeb1mr220998471fa.0.1716156670718; 
 Sun, 19 May 2024 15:11:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e6fdd1089csm11801621fa.110.2024.05.19.15.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:11:10 -0700 (PDT)
Date: Mon, 20 May 2024 01:11:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de, 
 aford173@gmail.com, jani.nikula@intel.com, bli@bang-olufsen.dk, 
 sui.jingfeng@linux.dev
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
Message-ID: <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
References: <20240516101006.2388767-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516101006.2388767-1-victor.liu@nxp.com>
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

On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> no interrupt requested at all.
> 
> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> a few times, but adv7511_irq_process() happens to refuse to handle
> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> 
> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> handling from adv7511_irq_process().
> 
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 6089b0bb9321..2074fa3c1b7b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>  		return ret;
>  
>  	/* If there is no IRQ to handle, exit indicating no IRQ data */
> -	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> +	if (adv7511->i2c_main->irq &&
> +	    !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>  	    !(irq1 & ADV7511_INT1_DDC_ERROR))
>  		return -ENODATA;

I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
instead. WDYT?

-- 
With best wishes
Dmitry
