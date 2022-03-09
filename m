Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9CA4D2FDF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8010E976;
	Wed,  9 Mar 2022 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D53D10E988
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:24:34 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id v4so2319912pjh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rhjOIEJAil5r1VPDQV4Zr+iVbr3FvcR2IWBFJpwONYc=;
 b=E3bTouXTZ8bPZLFpQO5rMdE9CsBEmzmlnt6Fm4XQWZtgsVI35VabX4l6ZNJ08U/gfJ
 mrLy40R/DKvIgp/X01aYgoEFFuJ7e+8Jol+71WU/X00NRxnWSO0TduEuS/pzMnfBtizV
 Z6x0Rauw15BfK/yj/lgCWipsa+QVnn+KAp3x403N/YvBtMq2A72bhEXYTA4DJikWyP5K
 VZOHvo19GRbrxVBOhXFlhpLDzrYoYlwijUdWqdtBq6oKR4805hf8Lofmv2B8mocT+wKB
 E68UMbsA7HWXNPaynB6YzZI3rbNDBlMy52wJlieVVlbw2+HYf1Pu0z1wj5+eYFxJSPfh
 s8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rhjOIEJAil5r1VPDQV4Zr+iVbr3FvcR2IWBFJpwONYc=;
 b=4RGL962NN7KVdn/Ln+PUcxebHZtwz1MF7gBO/GTsC0+aJcjyl/cK2pGpc1i9STeG/O
 7wr8KUD9gbJHg/7JHBlUGEO7tlroi98Tk8FH64qrkxMgHxOCWOp4GFmnMkPeQqyaygVb
 j7QRHXSrJ6noT8He/kdKkFAl9z5Y9bUN4/0jRSTAzD35iJISaJkfosQuFElp9ZRTzBQN
 jz43C+45a8cVkSM9MCKOFeFS42Syuy4tJMqfUvykmUKADJiVMrwz5W8rXDvSn2lwjQVH
 hsgfRuhmgNaDy0BQkCoqNsZx3vNJbmRmL70it/psEKX8PulkgS4ft6b05VweyVrZv8WD
 3Hog==
X-Gm-Message-State: AOAM533vczIHafO9Jc8P7YiKeUw7Gw5BnxvtCLVPKzLhLXeEc6A7DrZh
 qxKhwsj5oLm3siLUPNYVW2dw2S4QTeUV2/KHllYhh9Vpwr4=
X-Google-Smtp-Source: ABdhPJxwv4E9xh8eX7Ke5zJtcF1Erlu1Pg7Es9C5GP40cqVoU6fXShAFkauux6pBu3y5QnnpUN8GICji++3FrRj8POs=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr10406788pjb.179.1646832274117; Wed, 09
 Mar 2022 05:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
 <20220308110615.3.I04f99fbcc14b8c09610b4b18f0696c992a44d2b7@changeid>
In-Reply-To: <20220308110615.3.I04f99fbcc14b8c09610b4b18f0696c992a44d2b7@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:24:22 +0100
Message-ID: <CAG3jFyuf2GLF8xQX+G_wOJ2hng0VWoBMYL9HZoU-NC-tL3m0Rw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add myself as a reviewer for the Parade
 PS8640 bridge chip
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 20:07, Douglas Anderson <dianders@chromium.org> wrote=
:
>
> Though the parade bridge chip is a little bit of a black box, I'm at
> least interested in hearing about changes to the driver since this
> bridge chip is used on some Chromebooks that I'm involved with.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d25d0b4dccc..db7fe53643c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6171,6 +6171,11 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/display/panel/olimex,lcd-olinux=
ino.yaml
>  F:     drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
>
> +DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
> +R:     Douglas Anderson <dianders@chromium.org>
> +F:     Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> +F:     drivers/gpu/drm/bridge/parade-ps8640.c
> +
>  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
>  M:     Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>  S:     Maintained
> --
> 2.35.1.616.g0bdcbb4464-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
