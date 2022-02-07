Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0304ACC16
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89D810E24E;
	Mon,  7 Feb 2022 22:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D0F10E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:34:49 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id f13so177563ilq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nI8I6k1huqpNpigUxEr6405hFZzG0kJQIV2x5bdsNIk=;
 b=M7XU1yexhZPFZKXK/01M7HzlfcwSauRdTQChVlxQfWxDbV+r0YwtYs1KzoXsEKjLg0
 n73GqGnoOVGCXUD0iD05axsECU423Dct+abiERXSuIM9dO03zQwxGO5HdEV5caUFzP8N
 h9Zsok3/URP7tzamHG7/fS1a9+9Ao0QJcip/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nI8I6k1huqpNpigUxEr6405hFZzG0kJQIV2x5bdsNIk=;
 b=qIvc7M9qrcQkau81fwfrQ/0dpt6FLiLlmKKyLkmZnkJm+XeEuObZj1Pvo/ePe9zHhI
 cpaJwt0XSimWVS5Txhe8Vb2VhiDnDsTgZ9St+sPY4REbifGQZpMg6UrIY4rS541DH1hq
 HZ/KusmroEK0izgBi1z130eGPmyEerXq5Ys3r0/bSGKOLN2DkhfnruqTiIQr+b5hlCN1
 z2dKt2X7JMGHN91srgyzYASG6Kri7jyCb/ZhtggpdTNztxWKuBpyS+9Z94iNZlR4Til4
 m+qMOnINz+O8kAcWSgtmHjC8GzQJ7wmQpfWsx5RW4PitePgmW9Kwet6Ysl/kah0IReq/
 lsDA==
X-Gm-Message-State: AOAM531EECq3YM0HnqVEqi70qym9x5pV3xEbdFLKtDJ4knafcJJPHuQn
 Flm7M4piYwxh0CZelbG43j7NZ/NE/R7NCA==
X-Google-Smtp-Source: ABdhPJzJIWJhyQROGeoRtQGTXHCMO1Ftg9kmSN6KqaHQQZcMc7y71CB690d+TEYqCoL2Gw8QsN/ZTw==
X-Received: by 2002:a05:6e02:1e04:: with SMTP id
 g4mr821355ila.188.1644273289094; 
 Mon, 07 Feb 2022 14:34:49 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id r9sm1409693ilt.82.2022.02.07.14.34.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:34:47 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id s18so18819273ioa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:34:47 -0800 (PST)
X-Received: by 2002:a05:6638:53a:: with SMTP id
 j26mr856318jar.136.1644273286730; 
 Mon, 07 Feb 2022 14:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-7-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-7-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:34:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
Message-ID: <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>
> v3:
>  - Rebased and dropped the ti_sn_bridge_get_bpp() patch
>    as this was solved in a different way (Sam)
>
> v2:
>  - Remove error return with NO_CONNECTOR flag (Rob)
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)

This is fine by me assuming we can fix the previous patches.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: to me, this isn't something to do _instead_ of my patch [1] but
_in addition_ to it. ${SUBJECT} patch transitions us to a more modern
approach of having the connector created elsewhere but doesn't remove
the old fallback code. Might as well clean the fallback code up unless
you think it's going to simply be deleted right away or something?

[1] https://lore.kernel.org/r/20220204161245.v2.1.I3ab26b7f197cc56c874246a43e57913e9c2c1028@changeid
