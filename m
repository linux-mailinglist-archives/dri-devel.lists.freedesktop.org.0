Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C848E886
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E4610ECBF;
	Fri, 14 Jan 2022 10:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1FD10ECBF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:48:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id c2so190831wml.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qlz+QenUSGnrbdMSn9LpS6HovcDV3W2NPLhMAnwduME=;
 b=yA2QgHtHWFRB5HEMdX9dVKlR62iq8F7Iheb3RsP0e0SfuJgDUV+sKYaMwULSA982T9
 aUxkXMkx1soxmYPPhTBGFesF1oR9YehEDKBe86ssoOf+1K+o5TTqel4fXWPPtJ6Z8cB1
 4UVzGED5Ewp/5/2d3MuSKJ+ePv2XGDMqZKqbmhICre9J+NprJbbsAMRwP5pmgy3YT03q
 mddBt6PamzOOnN6iO6yHzgdFrgOzpDwhsNobEaNPvHP1ouKnMwr44B2RbQdtEYkmNCbw
 mj1H1kA1UvDuAqVsK0RgnTyxgqj+hrC12xlfzzMtAMYg2/xiIgWL0/mRRyM1Gb4Yk4RP
 rumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qlz+QenUSGnrbdMSn9LpS6HovcDV3W2NPLhMAnwduME=;
 b=uabkcD/KCCU/7nuFYVOe65NVFGqZu72zO75oi7EDy0bRSWhrwFxAPB4bUJGyYVqDL9
 pV0L9ez2VwV82+qfjJ34yHPIgsGDvLWcMG7ewvPgHdS2keRi9pn2ZYsleXWpUMjTwvVR
 Lemppjm5q90IGwxh9kfowv0Qsvf3tFJeKHDbiTyLDPYNOb+K07c/NtAMW2jRTiydPdkN
 kUr70BuMbO8x1p678GQfsZ0U1lxwAa5Hl6NTpY/J4dr5EeB8kRl/DMHvqUVaQ6aFtjsI
 FZqK/RXcGaLFf8Q8i4WLnXgfR1FnDP6877cYkFYZLuxfYbe98p0c1agwAyLKng2FCdMR
 35sg==
X-Gm-Message-State: AOAM531Ppc6ptS3d+9TOamYxxQqm7HnPfnVqtf1w2Wl3RgS4AaM+yOTl
 HJJkLoC9j5Wa25NHQOHNqewRZg==
X-Google-Smtp-Source: ABdhPJyA9IFvDW+jppi+5LN7HU1pBJhslP+IyomZomx39JMhU94/e9y+T2N1wYW3zeUVjUVXl1CdWQ==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr7640215wme.139.1642157334091; 
 Fri, 14 Jan 2022 02:48:54 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id c8sm6018436wmq.34.2022.01.14.02.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:48:53 -0800 (PST)
Subject: Re: [PATCH] drm: bridge: it66121: Remove redundant check
To: Drew Davenport <ddavenport@chromium.org>, ple@baylibre.com
References: <20220114064012.1670612-1-ddavenport@chromium.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <44f2e610-ab69-2c32-8c1d-a9f40aa607f0@baylibre.com>
Date: Fri, 14 Jan 2022 11:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220114064012.1670612-1-ddavenport@chromium.org>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/01/2022 07:40, Drew Davenport wrote:
> ctx->next_bridge is checked for NULL twice in a row. The second
> conditional is redundant, so remove it.
> 
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 06b59b422c69..69288cf894b9 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -936,9 +936,6 @@ static int it66121_probe(struct i2c_client *client,
>  		return -EPROBE_DEFER;
>  	}
>  
> -	if (!ctx->next_bridge)
> -		return -EPROBE_DEFER;
> -
>  	i2c_set_clientdata(client, ctx);
>  	mutex_init(&ctx->lock);
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
