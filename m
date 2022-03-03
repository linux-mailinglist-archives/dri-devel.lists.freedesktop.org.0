Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3344CB824
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 08:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A06110EE84;
	Thu,  3 Mar 2022 07:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A01910EE84
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 07:52:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 bg16-20020a05600c3c9000b00380f6f473b0so4789058wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 23:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyyop4fY63SKx0bReSAkYJg24Sci71v5/4dsnKctGuU=;
 b=XHbZG0piUEw6QNedgoGvA9J+v55a67OEe562j+/wlvdX0APSIpixPRFrsy7MEXvgS9
 IWhRjGRBWszmK0FB2DpzQYShjzN/ZhyPjY/UXf5NGR3sKaXQh65/C1x0JUQfSacicejo
 jnVyYdjh2LaLI2XWRVDtnZyM/DBeH1xaqmsU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyyop4fY63SKx0bReSAkYJg24Sci71v5/4dsnKctGuU=;
 b=bM2+2fqJydBlygH4rf0d5GUTzaWC2yT7XqFXK8SmizRBKaNy+mlJmMsqqMBArgjQna
 mhCReDX9JApoVXK2yJU0afultrnqUF3fF/3bjOlW1dkCcBe6ZHSGwNgJGg+3om21TQjz
 Q7UI8k03wh0fqbk+9MXF5EEolB3TubHpI053CwM2DVH/11YDt9N0DKjEARnAyOzdGNXM
 rMzYodt9KUA33ikcbOA0u8gR/lGl0Sg987MCs+zW2UCEN/ASiG56C6a+klC1l+SsgHff
 wBH5IzHLDzJzBuMpVY/tKB0E6xIh7Tri+BefP8oKDLI8Jh4aX2sfLjl7vFQgaTxXbyyp
 u+DA==
X-Gm-Message-State: AOAM533bRdCedAcZA8jHfF62fTLVnQAPp8mn3ZqyOxgTEI2Gavh2IqZA
 wDwsmtEDnqlr22G5uxgBeaiBMLNGXqZIYvsp/xtlUw==
X-Google-Smtp-Source: ABdhPJynAaTgSvmlIlgeV2ate07OIXbKHLw4YgBBR19SgdjD1iKMkNzeFIJkfKqIWt9zuajilhf07mhwfOLkmrLiu5A=
X-Received: by 2002:a7b:c3d5:0:b0:381:2ed5:aee1 with SMTP id
 t21-20020a7bc3d5000000b003812ed5aee1mr2714140wmj.113.1646293941617; Wed, 02
 Mar 2022 23:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20220302120925.4153592-1-xji@analogixsemi.com>
In-Reply-To: <20220302120925.4153592-1-xji@analogixsemi.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 3 Mar 2022 15:52:10 +0800
Message-ID: <CAEXTbpeUTdfA31gpiJAzvyCScjWLUqCxjpF6-YCFCe5JmiyDZw@mail.gmail.com>
Subject: Re: drm/bridge: anx7625: Set downstream sink into normal status
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com, treapking@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Pin-Yen Lin <treapking@chromium.org>


On Wed, Mar 2, 2022 at 8:09 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> As downstream sink was set into standby mode while bridge disabled,
> this patch used for setting downstream sink into normal status
> while enable bridge.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 9aab879a8851..963eaf73ecab 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -919,12 +919,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>  {
>         int ret;
>         struct device *dev = &ctx->client->dev;
> +       u8 data;
>
>         if (!ctx->display_timing_valid) {
>                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
>                 return;
>         }
>
> +       dev_info(dev, "set downstream sink into normal\n");
> +       /* Downstream sink enter into normal mode */
> +       data = 1;
> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> +       if (ret < 0)
> +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> +
>         /* Disable HDCP */
>         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
>
