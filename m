Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4FC3FB34E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 11:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8ED89DB4;
	Mon, 30 Aug 2021 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48889D9B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:40:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h13so21538538wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ykkSIg5GS0OlKB1vwtvOHDhzHKZgwNDhw5nc4URWu8w=;
 b=bXHaS2mIdZ8JR3v960epeunGl6oB52C2n5KmMS/MGYCSKTTgt/8WxnNlwbrbFU+lS3
 EI+RLO1QMB957HtJu+/UxihROJBsSxAaPro+3pecmpfd3V9faHyGF6Y6ptG+NT7sIvIU
 3Uad8Sj6bWExEAK5M8fYMlCBm8uNpuyoI5T8Zya8++fEgrDpVlxpMpqtm1YgwAXsNJaI
 Omw1w0ZYj0bD/6cnJv8sgC00WUnTmhiM6h2J069g5Ww1JS9FG0HlNfNUJUZm6J3K8vah
 gn3XIYjdTxAHGHuWaOG9MDx3Ycdo5/m6qUsdUXt8nTudCBb2DiV/x/9upjFRJrM9OJnw
 cRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ykkSIg5GS0OlKB1vwtvOHDhzHKZgwNDhw5nc4URWu8w=;
 b=rN5jdWgVPsv1+uAkEvUCe1/sUsKXxFjVRETN6AHbAHkhXS3AjVY/EOi/E4HwVBmhdo
 PJWOhau85jLpRn+DsE9WdTxCnkc7N737lP24+D+WkeJCLIcrIv9uAoILAaTmU9IxKhMP
 4BHo/Dsb6zBpVXb6+7jXzUZVJt2uXOw0uBdECMuc9FYDlrA5u6DLEZ2mm6XT9XXi6KzH
 J7EJHaoEuGy3h6tC7GRJp8OosjVZ5UrbRdDWowE4jKh51AAE7vDcalJdRFcLx95xS/h0
 v8F52d1x5LHu8hghMgP9PNrKWj6t3PwibnVWne1SkEWDY0W2Wg7YcZf0fFZMl0aBUUdd
 lVnQ==
X-Gm-Message-State: AOAM5311y1l1se8MCMq3M7neQIDu+3zGRMWqvsBjGu30UHRIlZNAnxdF
 fNrSUwQuBTqn0Zo8iZtSST75+w==
X-Google-Smtp-Source: ABdhPJzwXkkqJAvx2bKP/MhkMWE4W4AhmHxD21eh0TYanKynHvRVJ9FvXZj4ft2euQEBYr633XPf1w==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr24937414wrk.407.1630316455968; 
 Mon, 30 Aug 2021 02:40:55 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2ecd:4eac:486d:7a1?
 ([2001:861:44c0:66c0:2ecd:4eac:486d:7a1])
 by smtp.gmail.com with ESMTPSA id s13sm19455046wmc.47.2021.08.30.02.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:40:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/bridge: it66121: Initialize {device,vendor}_ids
To: Paul Cercueil <paul@crapouillou.net>, Phong LE <ple@baylibre.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210827163956.27517-1-paul@crapouillou.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <27e68baf-5797-9c66-37b2-382cb8792467@baylibre.com>
Date: Mon, 30 Aug 2021 11:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827163956.27517-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 27/08/2021 18:39, Paul Cercueil wrote:
> These two arrays are populated with data read from the I2C device
> through regmap_read(), and the data is then compared with hardcoded
> vendor/product ID values of supported chips.
> 
> However, the return value of regmap_read() was never checked. This is
> fine, as long as the two arrays are zero-initialized, so that we don't
> compare the vendor/product IDs against whatever garbage is left on the
> stack.
> 
> Address this issue by zero-initializing these two arrays.
> 

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 2f2a09adb4bc..b130d01147c6 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -889,7 +889,7 @@ static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
>  static int it66121_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> -	u32 vendor_ids[2], device_ids[2], revision_id;
> +	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
>  	struct device_node *ep;
>  	int ret;
>  	struct it66121_ctx *ctx;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
