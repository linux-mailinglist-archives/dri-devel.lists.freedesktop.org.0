Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1732E585
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6B6EB51;
	Fri,  5 Mar 2021 10:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A3E6EB51
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:00:49 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n10so1018705pgl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zM4DqE6Hrw5wtZ/qa2MXCbk3VS7NdIe2/69MXBddOcg=;
 b=UhHPWUALnp8w+UTOGVhHTQwOsIWoeo15caVdd2UFWdLE2oX5j3HRrNF5GAGfDL4t6c
 rtJ61SrO+ion4b0P2sixkQXxQno9yV21nd8TTwFSs2TYmHQq0o2toi+GWo9xqJYAlGeG
 AABaGomoC9TpXIN7T/EnQshVgqlXYQ4j2+VKn4u8gC7QOYsbWJJ26KlgK2DcNUxBbUBP
 pFAyEV1WaedenkUuj6P0mwXn8IPfo/157McmFzSrSOFfDbEtGYNba2Y6UQO0F3Uy1U88
 dG7Vutif6Sf1+W7gb98ABw9bAyYo1H5Mw2ciPtesZ3sKC94CNgWczqHg5oKtOzTxG/mm
 gLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zM4DqE6Hrw5wtZ/qa2MXCbk3VS7NdIe2/69MXBddOcg=;
 b=ilWWt/Mj1UtG14fTFItBDObOM7q5TbqnuZ0aNtpsdcBenVpFs3IulYw/MHRueDNHms
 d3I2iS4/uMYxlRE0YPD/Vz58K7f2qOhviiqRDJ9i5UppErqApnmQlgC6je4jObQz4VaI
 udJleRkXsm10oG9/VTS4oU0FqaFFZKCPFucHgri86bmb1ATJo4tSiAshEvjLIf2OwOz4
 HAwihMy1s7h1vbdW1xLIl5lNf2cOviouvHgSxJHc6y74oltLmmIL63IbKh6p2zyfUDsG
 9QXNgsyhRPnvtaYNpENpug0JGimMVKnBqDuz37QoJ89H7IFIC+47+GOo8Xysxt10AN07
 gdOw==
X-Gm-Message-State: AOAM533Z5+FeRq8cpsTSRyIXAC5EbBjYgNy2+hmdSPz+dD1Ee/4GRNjp
 DxTtHxZjnllrAcFEUWw0fQHIuZUfpScWSfWtr26lwA==
X-Google-Smtp-Source: ABdhPJz2v5+iIAYVbS0AzdQGii15Z+uI7HWIYl2J0SS9mRh5uPZo3XJVQ5ZGk7+ApYyS4Hnz+Pga/d9jVXFd4i319Do=
X-Received: by 2002:aa7:9843:0:b029:1ed:cc86:fa0 with SMTP id
 n3-20020aa798430000b02901edcc860fa0mr8030981pfq.39.1614938448859; Fri, 05 Mar
 2021 02:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 5 Mar 2021 11:00:38 +0100
Message-ID: <CAG3jFyuUodAKJJ2nkQ=JNRgxDPj99jMkJNrCetfbyb_35CWxYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Douglas,

Thanks for submitting this cleanup, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Fri, 5 Mar 2021 at 00:53, Douglas Anderson <dianders@chromium.org> wrote:
>
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
>
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?

I think this is fine. Since the refclk != NULL check in
ti_sn_bridge_set_refclk_freq is in order to determine other behaviour,
the asymmetry is required.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..942019842ff4 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>
> -       pdata->refclk = devm_clk_get(pdata->dev, "refclk");
> -       if (IS_ERR(pdata->refclk)) {
> -               ret = PTR_ERR(pdata->refclk);
> -               if (ret == -EPROBE_DEFER)
> -                       return ret;
> -               DRM_DEBUG_KMS("refclk not found\n");
> -               pdata->refclk = NULL;
> -       }
> +       pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
> +       if (IS_ERR(pdata->refclk))
> +               return PTR_ERR(pdata->refclk);
>
>         ret = ti_sn_bridge_parse_dsi_host(pdata);
>         if (ret)
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
