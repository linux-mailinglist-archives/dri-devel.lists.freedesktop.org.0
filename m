Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC95E5EA9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F7F10E091;
	Thu, 22 Sep 2022 09:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC54310E091
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 09:34:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so14584799wrm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=zP3HTuNsbUwZjniN4PiqE90iqzlaqIfqubrWsszKuPw=;
 b=Mj291PKDhuOodPsmekypQWw82MwYbfp9/55bxdN/V/WMcHt6est6fbWfDBnAn/38nB
 0RXQeNlFmww1fTZacwOhBhsDtB7godgfU6nAGF60JTxaAFIA+FIcPbn7/HvuvtSnpGdm
 abuYEHM1d8sZS8xb+ZOvfhxiv8duUJi18f/w/qoz9opT8IB1McfJ9NrMQ2pTj50v6c18
 uC6rMTo5nwzptO6KqZhkORsGDfJ/8XFjPk/Ikngnp32Lu+dfGSHTfGKUlgUX9iL5u/Nf
 1spUX2zhCB2m5WZIWgZkE714vr+6AvRKq/L1l5nEnnAFme649+bLRD9M7Be34h0+wSHY
 GKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=zP3HTuNsbUwZjniN4PiqE90iqzlaqIfqubrWsszKuPw=;
 b=kia9f8jKx5KKycy/SEgXkTSQQm+YrXVlTxNBGW1vBmvTMizz/cOxSJqEA8JKz79pGj
 tmHm8Ke+t0PS+JTLHKhn33t9T2m8qCrIMimBN2Vkr1qabIFs5AowsBJdIdF0+zLmI35x
 ozn+4oZ2JzaJguNCt5EW4Zeu4jtu9bq3F8r5v0kNPWPSNEj1iDqrJZ3nZwCXBqXgUuhF
 cYrhG6SvXc7GcmKH3679s388rZ977sRt5E1ZLLID9yRljdWx5pZQBlDCXoDm30aWeGD2
 NxakUhmZhfhrFjgRXEsNdwLNH+nQfAfP5TYJUjHcEoCbEH8b4Znz+5++DhN+eOIY0niY
 CpLw==
X-Gm-Message-State: ACrzQf3R1OiqkJP5H1Mu9D5eFjDmBW0CtuiKZhQjYWXY3Lc2m95E1EvF
 xRicwtyqJl6akgs6DXzblj82Hg==
X-Google-Smtp-Source: AMsMyM6Dvfz+MR03UNtgYlWi+PxGKpF4DjNBRcuVKwO9zY/oJyegFT5uMq7dcseodlayxqSSBfPobg==
X-Received: by 2002:a5d:5c06:0:b0:22a:7b52:cda6 with SMTP id
 cc6-20020a5d5c06000000b0022a7b52cda6mr1351425wrb.485.1663839262967; 
 Thu, 22 Sep 2022 02:34:22 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n185-20020a1ca4c2000000b003a682354f63sm5288711wme.11.2022.09.22.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 02:34:21 -0700 (PDT)
Date: Thu, 22 Sep 2022 10:34:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Li Zhong <floridsleeves@gmail.com>
Subject: Re: [PATCH v1] drivers:adp8870_bl: check the return value of
 adp8870_write
Message-ID: <YywsG6b/h+Mcs88y@maple.lan>
References: <20220921215049.1658796-1-floridsleeves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921215049.1658796-1-floridsleeves@gmail.com>
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee@kernel.org,
 deller@gmx.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 02:50:49PM -0700, Li Zhong wrote:
> Subject: [PATCH v1] drivers:adp8870_bl: check the return value of
> adp8870_write
                     ^^^^^^^^^^^^^^^^^^^^

Should be backlight: adp8870_bl.

> Check and propagate the return value of adp8870_write() when it fails,
> which is possible when SMBus writing byte fails.

This looks like a sensible change, however...

When writing patches like this please review the whole file for similar
concerns and fix all instances of the same issue. In this case there is another
unchecked call to adp8870_write() in
adp8870_bl_ambient_light_zone_store() (this function also contains
other unchecked calls).

Note that the unchecked use in adp8870_led_work() because there is no
way to propogate the error from this function (and adp8870_write()
already logged the error).

It would also be good to review and fix adp8860_bl.c at the same time
since these drivers are very similar (ideally the identical code in
these drivers should be factored out).


> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/video/backlight/adp8870_bl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
> index 8b5213a39527..0eb4ae2ff592 100644
> --- a/drivers/video/backlight/adp8870_bl.c
> +++ b/drivers/video/backlight/adp8870_bl.c
> @@ -567,9 +567,13 @@ static ssize_t adp8870_store(struct device *dev, const char *buf,
>  		return ret;
>
>  	mutex_lock(&data->lock);
> -	adp8870_write(data->client, reg, val);
> +	ret = adp8870_write(data->client, reg, val);
>  	mutex_unlock(&data->lock);
>
> +	if (ret) {
> +		return ret;
> +	}

No need for braces here.

> +
>  	return count;
>  }
>

Thanks


Daniel.
