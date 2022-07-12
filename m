Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F264571414
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CAC93352;
	Tue, 12 Jul 2022 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337749335A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:12:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fd6so9088120edb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=owNGXTG6trvHPmdErnbDiIfwqp/UAMQF528p+GbC9XU=;
 b=U+hnbQfWIDaw1K825D2TgYJS1lfVHB59AiGRORo//U6OpdXRqxyLW5Rw95DiruSuZo
 6bZKjdQHk8ceVGjQt0KM+0ZfqGLo6lst+Vw8g1pLKiPasESmqAhwd2AoH2aXSamOV4HE
 vtTYYXDydZGgphpwzJ3WsRSx/lOopLf8s39CTdFdIZBk2WTZ9Iq+25m7/n8a3+qls8fx
 OTc6pk57nEQmyB96mD00jWPq06fIv61cUfWVlCUHqUEOEbcxn7unugdeShPeVCf0h8h9
 +FuLetynE0KBn67nmMw60xEY0iW9bHd08AZhMXff39fLnk+4y4vv++8RRFvNR8D3C5Nc
 yTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=owNGXTG6trvHPmdErnbDiIfwqp/UAMQF528p+GbC9XU=;
 b=NnPaGYrPAkkH+0WEantAxYqIG/Hn+f5K8h8abCGbHnauxB3UQ94lNfQrlNklT4d77i
 oZOmmsYJCh9XhFF53zmGvXtwaqJ8+L3MRPWhjkgeGdzrl9Fv3DGuKnVbLMwxOco5rKuQ
 S5dmF2bBan0c4dwQEY4BXukNwK/XOKJs6ev9qfpvA3j8wYcCfAq0GPhfDreornO1LKzh
 7piVEL397HVJwAWWHG4L9O3xg2LdT+WI9a9qqqJgX2+Zhrt7nP1iC9Mc6qZ//Rd7uyZf
 Ixk4+i/DChWKJZe2QG0vmXM11dWy02ZR6tMJa0EVam58enV+X+tfvsiHFZUrcVqci21K
 dx2Q==
X-Gm-Message-State: AJIora/EFYNF01LivqaT0q2pK6tdZgK+z8Xz51vlU79sZUqdkdW882iA
 pEPwhIXezD+1pd8oeSsnh/Y76cZitHDXY4+4tW3BaA==
X-Google-Smtp-Source: AGRyM1vqyL53pvPNDSVY/fjYfQk+M6LcnvEXWRndS70v9DT/ZldD8MPoIla+vkJA0XBR8teURKSoxNhXBZo4qymOEHY=
X-Received: by 2002:aa7:cdc2:0:b0:43a:7255:5274 with SMTP id
 h2-20020aa7cdc2000000b0043a72555274mr30566286edw.159.1657613525708; Tue, 12
 Jul 2022 01:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
 <20220707080600.49041-4-allen.chen@ite.com.tw>
In-Reply-To: <20220707080600.49041-4-allen.chen@ite.com.tw>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 12 Jul 2022 10:11:54 +0200
Message-ID: <CAG3jFytTh3gso+B8+O+UXB0u+F3-o0qVdYVF3sn8O6XxfTShzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: it6505: Modified video clock calculation
 and video debug message
To: allen <allen.chen@ite.com.tw>
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Jul 2022 at 10:06, allen <allen.chen@ite.com.tw> wrote:
>
> From: allen chen <allen.chen@ite.com.tw>
>
> Speed up video clock calculation and remove redundant video debug message.
>
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index cfd2c3275dc5..11a34ddb60a1 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -703,7 +703,7 @@ static void it6505_calc_video_info(struct it6505 *it6505)
>         DRM_DEV_DEBUG_DRIVER(dev, "hactive_start:%d, vactive_start:%d",
>                              hdes, vdes);
>
> -       for (i = 0; i < 10; i++) {
> +       for (i = 0; i < 3; i++) {
>                 it6505_set_bits(it6505, REG_DATA_CTRL0, ENABLE_PCLK_COUNTER,
>                                 ENABLE_PCLK_COUNTER);
>                 usleep_range(10000, 15000);
> @@ -720,7 +720,7 @@ static void it6505_calc_video_info(struct it6505 *it6505)
>                 return;
>         }
>
> -       sum /= 10;
> +       sum /= 3;
>         pclk = 13500 * 2048 / sum;
>         it6505->video_info.clock = pclk;
>         it6505->video_info.hdisplay = hdew;
> @@ -2344,8 +2344,6 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>
>                 if (!it6505_get_video_status(it6505))
>                         it6505_video_reset(it6505);
> -
> -               it6505_calc_video_info(it6505);
>         } else {
>                 memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
>
> --
> 2.25.1
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>
