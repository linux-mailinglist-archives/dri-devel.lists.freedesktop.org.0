Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0999A7EDD9E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2196610E255;
	Thu, 16 Nov 2023 09:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89AC10E255
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:30:46 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a7fb84f6ceso6120837b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700127046; x=1700731846; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cOalNhNWON0tzgJDSNBQ7PJyNiEFmyM6jXYqhmL2sw4=;
 b=VyUsk9MXamnxLyKolkC5AzAgsWOx0PDyJ1FDx0hZdv66ewJdxK0WSNhjPQJ34vGADu
 xmOugdNXHgszMRjxbAaylOkdVLIOjahgeG0rmENrkkUgA+q6GRdTBN6ReomR5ZlNX8xA
 /SHPivaQIgbwyFr5yyUYqm4JdVVWSbCZTB9FSOUS9J4US1whhfr2aryfmdxoSzlQYUgM
 dONnq0tXC3fftwPIbUfn02rwY9fx2jZnZhqJPrDX0S3ktI2U/SRZu2yRNvJwQLUarNg4
 TS2rOVwu0X7fRRx49RH4VSeMF0a+RmibfHPHrhGpadO1Ykpzj6fb4zZxoek05L1RXC+N
 FKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700127046; x=1700731846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cOalNhNWON0tzgJDSNBQ7PJyNiEFmyM6jXYqhmL2sw4=;
 b=D4kmtfJ/zWuXJQdIqgRC58xHrWG+wOlhFXHc4IVdGEZJWJPRZdLkuySZCGHsAMrkt/
 8H1oex6RzGoFuvXdHBYz1CQDO5NWZWBzZx8HLIli64UK7mLwEuV/VMp9uAiQ5PpLIjSr
 fcpDSL9gGp8ySglxwCHUJ5dCmonu+ysgVsEVK+CUyhNEfiDRpE6biYcNT8PX2EhbVar2
 R3zqtfVaNArJKKVamsu7xP/nBo3xXWqW1vrxb/yJh+zgBMynCowm4v5VJ9p/KdfYh1Ko
 cv7oHFNeIkyPwYG4lwabJO0KHRjk6ao0So/mDQ8kNlApEPvzhLbWwrCqFyIMx7uAhgCj
 kfcQ==
X-Gm-Message-State: AOJu0YyBOgUMfcY34Jb7hU4wVE34ZJMK00CdKlqUH1hPYoWyZwm89kkv
 IqYvSgH6FSe8c/XPGnpyJwQHCQj8oYPlrZsxtwUU7w==
X-Google-Smtp-Source: AGHT+IG/y2QkwE5jz6zn2wyoqRZJsRkb2SMpVkvXZlwMv12XeV3+EIY7Vc3LwWdJMLOl+P+/86tTF28+DWBpYWwsTB0=
X-Received: by 2002:a0d:ccc4:0:b0:5be:9d2f:2eaf with SMTP id
 o187-20020a0dccc4000000b005be9d2f2eafmr13881753ywd.0.1700127045878; Thu, 16
 Nov 2023 01:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
In-Reply-To: <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Nov 2023 11:30:34 +0200
Message-ID: <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 at 11:14, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
> Thanks a lot for reviewing!
>
>
> On 2023/11/15 00:30, Dmitry Baryshkov wrote:
> > On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >> The it66121_create_bridge() and it66121_destroy_bridge() are added to
> >> export the core functionalities. Create a connector manually by using
> >> bridge connector helpers when link as a lib.
> >>
> >> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >> ---
> >>   drivers/gpu/drm/bridge/ite-it66121.c | 134 +++++++++++++++++++--------
> >>   include/drm/bridge/ite-it66121.h     |  17 ++++
> >>   2 files changed, 113 insertions(+), 38 deletions(-)
> >>   create mode 100644 include/drm/bridge/ite-it66121.h
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> >> index 8971414a2a60..f5968b679c5d 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> >> @@ -22,6 +22,7 @@
> >>
> >>   #include <drm/drm_atomic_helper.h>
> >>   #include <drm/drm_bridge.h>
> >> +#include <drm/drm_bridge_connector.h>
> >>   #include <drm/drm_edid.h>
> >>   #include <drm/drm_modes.h>
> >>   #include <drm/drm_print.h>
> >> @@ -703,14 +704,32 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
> >>                                   enum drm_bridge_attach_flags flags)
> >>   {
> >>          struct it66121_ctx *ctx = bridge_to_it66121(bridge);
> >> +       struct drm_bridge *next_bridge = ctx->next_bridge;
> >> +       struct drm_encoder *encoder = bridge->encoder;
> >>          int ret;
> >>
> >> -       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> >> -               return -EINVAL;
> >> +       if (next_bridge) {
> >> +               if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> >> +                       WARN_ON(1);
> > Why? At least use WARN() instead
>
> Originally I want to
>
>
>
>
> >> +                       flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> >> +               }
> >> +               ret = drm_bridge_attach(encoder, next_bridge, bridge, flags);
> >> +               if (ret)
> >> +                       return ret;
> >> +       } else {
> >> +               struct drm_connector *connector;
> >>
> >> -       ret = drm_bridge_attach(bridge->encoder, ctx->next_bridge, bridge, flags);
> >> -       if (ret)
> >> -               return ret;
> >> +               if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> >> +                       WARN_ON(1);
> > No. It is perfectly fine to create attach a bridge with no next_bridge
> > and with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> >
>
> The document say when DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is set
> the bridge shall not create a drm_connector. So I think if a display
> bridge driver don't have a next bridge attached (Currently, this is
> told by the DT), it says that this is a non-DT environment. On such
> a case, this display bridge driver(it66121.ko) should behavior like
> a *agent*. Because the upstream port of it66121 is the DVO port of
> the display controller, the downstream port of it66121 is the HDMI
> connector. it66121 is on the middle. So I think the it66121.ko should
> handle all of troubles on behalf of the display controller drivers.

No. Don't make decisions for the other drivers. They might have different needs.

> Therefore (when in non-DT use case), the display controller drivers
> side should not set DRM_BRIDGE_ATTACH_NO_CONNECTOR flag anymore.
> Which is to hint that the it66121 should totally in charge of those
> tasks (either by using bridge connector helper or create a connector
> manually). I don't understand on such a case, why bother display
> controller drivers anymore.

This is the reason why we had introduced this flag. It allows the
driver to customise the connector. It even allows the driver to
implement a connector on its own, completely ignoring the
drm_bridge_connector.

>
>
> >> +
> >> +               connector = drm_bridge_connector_init(bridge->dev, encoder);
> >> +               if (IS_ERR(connector))
> >> +                       return PTR_ERR(connector);
> >> +
> >> +               drm_connector_attach_encoder(connector, encoder);
> > This goes into your device driver.
> >
> >> +
> >> +               ctx->connector = connector;
> >> +       }
> >>
> >>          if (ctx->info->id == ID_IT66121) {
> >>                  ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
> >> @@ -1632,16 +1651,13 @@ static const char * const it66121_supplies[] = {
> >>          "vcn33", "vcn18", "vrf12"
> >>   };
> >



-- 
With best wishes
Dmitry
