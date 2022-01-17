Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A118749050D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E7410E33E;
	Mon, 17 Jan 2022 09:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5129210E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:40:00 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso9259513pjh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIgYGrN4LwQTs17+VXthu1/mXIG34ztGcllpOGCYBUY=;
 b=xmwbCLYhEE9bYLZqv0I8ALMO0V7d/Xi97LrM068AbIRSOFBFz8JsLtB1mgWWNRGesf
 N0fUx0p0QfouvE3r0dGowIIBaKql09cSLdkOlENedU7pO9TTq6mb6XQIWY/d2V9Ibp54
 Wcd7sC9ZaSsMvkh2cPEcsaON2uKZeXtydaQi+g/ClzR+azMiZ/MtX74f+BTlsOkM0hfh
 SUsr2LcUVDEQzDMYEtPRt+ZXyQKXGqjdFDJyZRiJUok3HnC4JHUSO3t4MNSNMyJ3rVh1
 hdOOuhJ5NeumWzaHP39f+EMxIwoXU4BCws14SmywAt+3b2rfrdGYRfJkGU/9bP/JVUi1
 ElcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIgYGrN4LwQTs17+VXthu1/mXIG34ztGcllpOGCYBUY=;
 b=LeHDoHmNAdjssc0MuLowQfV7x2W++Fu0iiV5pF+dMA+Nv604kIkkAnjK+MKsw5ab5n
 m1+dsTnDMswIBczdPQ/uXekpvzpjjjJLhN+3HMEI06ZJsbz0UpfsKrJ9/wh3MDnLOcYY
 fTxlaVROvys6K9fwuWw3NrNVKRnGOaICMQXd+4A58Ijpz1JFsIOzWl2sMYfs2K4sK0sk
 Gx0LNz2KRsMsuRQq27pWQzwF2OHs7aHlv3CjltN+3TkB0qNTavUPHYXePs/n2Lne5jZM
 223PF8lCGXmoW8xtf28FKnOqYh4lxT9ZlgVWRCu8SkNM7vC4IL+cmUI63vugeJMeqp2w
 16yQ==
X-Gm-Message-State: AOAM530oh8WdbnxvZXizjDsMkW3XjsobOCdcj0bUbuWYDObIfZ7F7h7Q
 KqvIYaiXMXz4uWXGG7+xQG7gnW0pPtGlI0GnsSEzjA==
X-Google-Smtp-Source: ABdhPJzKo2IbXPNzAcrx2/AE8zdZh33V97DTVPFXqTRHcM78M5VmIK/iUSHi57i+F5m2mfCvXcDIC4am/FsNxlj2aHI=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr17892801pjb.179.1642412399902; 
 Mon, 17 Jan 2022 01:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20220113082918.2279347-1-hsinyi@chromium.org>
In-Reply-To: <20220113082918.2279347-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 10:39:48 +0100
Message-ID: <CAG3jFytu8VpopWYHvGiSYRW2bcX-wHSoYgQ42u84WBQKGrnfZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,


On Thu, 13 Jan 2022 at 09:29, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> handled by driver detach.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
> ---
> v2->v3: remove kfree() in anx7625_i2c_remove().
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 0b858c78abe8b6..d3661c78770a8f 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>                 return -ENODEV;
>         }
>
> -       platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> +       platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
>         if (!platform) {
>                 DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
>                 return -ENOMEM;
> @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         if (ret) {
>                 if (ret != -EPROBE_DEFER)
>                         DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -               goto free_platform;
> +               return ret;
>         }
>
>         platform->client = client;
> @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         if (!platform->hdcp_workqueue) {
>                 dev_err(dev, "fail to create work queue\n");
>                 ret = -ENOMEM;
> -               goto free_platform;
> +               return ret;
>         }
>
>         platform->pdata.intp_irq = client->irq;
> @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         if (platform->hdcp_workqueue)
>                 destroy_workqueue(platform->hdcp_workqueue);
>
> -free_platform:
> -       kfree(platform);
> -
>         return ret;
>  }
>
> @@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
>         if (platform->pdata.audio_en)
>                 anx7625_unregister_audio(platform);
>
> -       kfree(platform);
>         return 0;
>  }
>

I just had a look at applying this series, but it fails to apply on
drm-misc-next today.

Could you send a v4 that applies cleanly, and I'll try to be quick
about applying it.


Rob.
