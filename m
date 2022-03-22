Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEE4E3AEB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 09:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861B889C1A;
	Tue, 22 Mar 2022 08:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0C189C1A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:43:48 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id i63so13791629vsi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kSE12avE5FpxzB4ihxmwpNNroKbegiLE8Kcfh7pXhI0=;
 b=CAMeB2ST43DRf4It75FcHrj3pWVjgoU+rJAtfYkUjxAvWDIpFOdbszM+63cPIONVn3
 adssPgQVp/yN3XlQlAQ2bDLMCVTyMwrCaRwgu4TQ7YM2nKLW7GIdBB0zb2Yz3eLDBXwX
 /DRW1X7gPkDqfs7/iFO6K4ODSuOzUc58+C/g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSE12avE5FpxzB4ihxmwpNNroKbegiLE8Kcfh7pXhI0=;
 b=i9xRdaifD7+0crXB/1CqRv6sPv1yaXuWnW3yIM5bHXqMLqfwNxfPLih92tJZ+ZNCCj
 0wkqQsMbN9aR7PeFa2TuZdOLU9DEuh/Y+G58Jb/mDobH8oiciAiG0U7j7/gOs73ZGDxW
 evp8+hsZK0q5ZEmQsCQ50gYX9RLtS/DtcPmcZQHxOIccV21ysQAU4b60JubdSeebL2zT
 XHK4iSEfo8YfpkCc75rkinDEgMdPeEeq8lcoNy3Q4ziDcTcu+hFvTsyJaUgZdKYonFUF
 ROnAecLRf5y+fNaxt9bPwL7cnzub4WI1rtAnsX13CW7GA1Kk+LOfg3QrKCVDSswGN3k0
 5iOw==
X-Gm-Message-State: AOAM530xdIrl1V51DCJE6KzARwwBay3r8uPzJeyzNkXnE4dz4zrNKjCh
 gSW6bQgBSBohIkKN+3bpnMIsI7FOBqXrwvjGH+eVRQ==
X-Google-Smtp-Source: ABdhPJziRzdD1GSZYrFkru+e7JN1ZBA/uGtcNDTkNfmw6kEHpfJ/FNnidKcb4lh8jEoGs4LHjs05R3ewSo7m2vfRzSw=
X-Received: by 2002:a05:6102:ed5:b0:322:ba55:d279 with SMTP id
 m21-20020a0561020ed500b00322ba55d279mr8412347vst.77.1647938627194; Tue, 22
 Mar 2022 01:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080213.1487134-1-xji@analogixsemi.com>
In-Reply-To: <20220322080213.1487134-1-xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 22 Mar 2022 16:43:20 +0800
Message-ID: <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
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
 treapking@chromium.org, pihsun@chromium.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, tzungbi@google.com,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 4:02 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> As downstream sink was set into standby mode while bridge disabled,
> this patch used for setting downstream sink into normal status
> while enable bridge.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
>
> ---
> V1 -> V2: use dev_dbg replace of dev_info
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 9a2a19ad4202..dcf3275a00fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
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
> +       dev_dbg(dev, "set downstream sink into normal\n");
> +       /* Downstream sink enter into normal mode */
> +       data = 1;
> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> +       if (ret < 0)
> +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> +

The driver uses DRM_DEV_* for logs. Can we use this?

>         /* Disable HDCP */
>         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
>
> --
> 2.25.1
>
