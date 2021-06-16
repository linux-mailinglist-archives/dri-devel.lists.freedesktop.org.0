Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E63A99DE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 14:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427C89BA3;
	Wed, 16 Jun 2021 12:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF089BA3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 12:03:44 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g6so2055181pfq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8I4Y9wOWt0L9Wjhz/UCy2dwBA6LBFaECPMUl0PK0S+Y=;
 b=iOp03LxUSsUIVfOPyK6+qrON59uFFnI+lLpZQNmg4K7I4gv9z25zZiFLkHse5fxWi3
 gOQHyvMLemnvxyNSaqv/1j6jgvBTx8Bcn1+UcislZdN2rXbDI53R1R4r/8SbawsCWatn
 vtVAr0XYGAq2oMqIrPwY8TW+piDJvRIrDtXc8yC9MM1Q8lNqKBdol2Gxbs9N0OaqioLR
 5aeecQv4c9yxOi9lABNXJcmUavzPvw5mwmUxXQzARxk8KuU0yey9GzG11/6YCV2tNg2R
 DtQPtH0uCEsnWDDlVOMJ62BOnMhtNhZMMYyzfY0YJ1Y7GjSsUcSAplDsb9qlUrvo+7Dq
 vEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8I4Y9wOWt0L9Wjhz/UCy2dwBA6LBFaECPMUl0PK0S+Y=;
 b=aZH0zhzHbEjQ1EwVoARf4eS7BXp6NpzGERFFUu91krwEwS9PNC0UMWYx/SCn5aJNH8
 6ExZW+0zHSKjZoMlUkVEwyrUiR+iXYFtzuQMao1KxZ9p3ca/oMpWPjm4NYr2koRZAwz8
 5eFpLTUsWmKRfEqWDQQH4+ABWsJsT8NdxwG7Pex/5A6amMe2MCqYve0rlX5181cP8izH
 cxfkM/XzDVyDCvd4etGAyL5V8kSUVVtSHHkrhvlhdlJQYtcmWFY2/a/qYZnVxNkA0m1k
 r+5u2BuG+oOqcpFKSJa4nd9yjZ4viWHzF8qSAaHcSQUkXo6LcCt6lpcZWFt0Fja4k5Vp
 jpQg==
X-Gm-Message-State: AOAM53099G81zWJWrSvna3oMamMbvzg9Tzg0TALrylX/SPF9HpcOPL7c
 AIbuv4ACywre7bVz7kZj/Iq17Pu0glN698L3+I02TQ==
X-Google-Smtp-Source: ABdhPJzACOhUT8Swsb7rdD3D3OgQRthCK6TgJyy6RebksECPcC41qgjbK3tbJX6LYcSA6xiPPw77mA14Ipfdys8YUQ8=
X-Received: by 2002:a62:1b91:0:b029:2fd:2904:938a with SMTP id
 b139-20020a621b910000b02902fd2904938amr3131409pfb.18.1623845024015; Wed, 16
 Jun 2021 05:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210616034448.34919-1-yujiahua1@huawei.com>
In-Reply-To: <20210616034448.34919-1-yujiahua1@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 16 Jun 2021 14:03:32 +0200
Message-ID: <CAG3jFyuJBFM-2KbJM_3FOisD1B8fz=AkAykW5KZfnbROyn3FQQ@mail.gmail.com>
Subject: Re: [PATCH -next] drivers: gpu: add missing MODULE_DEVICE_TABLE in
 anx7625.c
To: Yu Jiahua <yujiahua1@huawei.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.co>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Yu,

Thank you for submitting this, it looks good to me and I pulled into
drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ad5fd900a69b1ae24e6b22506dea637b6bbbdb55

On Wed, 16 Jun 2021 at 05:44, Yu Jiahua <yujiahua1@huawei.com> wrote:
>
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
>
> Signed-off-by: Yu Jiahua <yujiahua1@huawei.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..beb01364af4d 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1830,6 +1830,7 @@ static const struct of_device_id anx_match_table[] = {
>         {.compatible = "analogix,anx7625",},
>         {},
>  };
> +MODULE_DEVICE_TABLE(of, anx_match_table);
>
>  static struct i2c_driver anx7625_driver = {
>         .driver = {
> --
> 2.17.1
>
