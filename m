Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42F5BCCC9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E7110E08E;
	Mon, 19 Sep 2022 13:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0D10E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:18:47 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id lh5so22635400ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gzjER0yDfgC7AM3XY5AmZTUcIYvTw+ZPBU8Ab6kCF1A=;
 b=oCvGpuKao+NdPHOlaIZDp2egAgLgEPw3IteIyQ/QvfEJdQUKlHPnCEr7GlPg6HpfMP
 dVIYPSycLDoCGucAf+dgMukqSqMyU3sljxWQZ1C5O5yfErbYxOR/x/hLQhMP1mEdw4ZP
 cjQShEMYMP250cAvjyqZ3M7U0yaSNoDJxB29kW3qQNCnN9wZ6HHS9CpdNaD1iAy1Amm6
 gVn2aO/yPFwPoa6zCOyAX5D7hY17WUsONgau+7fxInzn7dXZ/1MMZnIFhfYkr+cyrua5
 /goX39eWj/ydD63FYnlELFczwPrC7UW1fTB8T8fcSpjbmA2N/YhqWfH3jlgQhzHeyDdn
 kgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gzjER0yDfgC7AM3XY5AmZTUcIYvTw+ZPBU8Ab6kCF1A=;
 b=Uk+ErNYbqrhAlwNeVjV2po6WZpmMkZi7lLW7aRtWVv+V77+lQp5riFc7/2mEzpYMqR
 9AuYafn8RZKK2hx2XciQuDPmYMLxiNQJOm2JFd/0SMwLZGd9H3GT+ruO3lOFMnHDS9o0
 rtYLN0lOKz6mAkUY1XptGUVRKpexl6Sku3fMc5l5H/ONtaOYBkxgcW7ri0mbmzLVcoz8
 laKCbHH35O1mQUqEpEVXSU0vBLlSHX+h+tyDhsb/bXr7S8UgQj4OyxVrZORwPoDoY8KU
 r/e/MrGz7pYAsr2eFKDm+eQ+MARQjsESNjaqOZ8hrlkVPnyiiTQwBRVyUHvxotwJr6+x
 eClA==
X-Gm-Message-State: ACrzQf0H/TBTdkrj1e3jJOaceroRUYWn86KaRPw/nUYamsOg/ecKd6BZ
 xxsVm/F85/8pQm9Mhf7ckVWvzCmdqF8sgo43OCZidw==
X-Google-Smtp-Source: AMsMyM44eZwNFcm9nbCPeKjoB6bDjAqdr1WQR9kY74b4PjDUbuCLEI1O22R9NLQqBpz/Q33j8Sm+v+qscaBv2lxtl/o=
X-Received: by 2002:a17:906:9beb:b0:773:db0f:d53a with SMTP id
 de43-20020a1709069beb00b00773db0fd53amr13173696ejc.580.1663593525988; Mon, 19
 Sep 2022 06:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220919102009.150503-1-robert.foss@linaro.org>
 <20220919102009.150503-3-robert.foss@linaro.org>
 <YyhI0/aG97cCB8DB@pendragon.ideasonboard.com>
In-Reply-To: <YyhI0/aG97cCB8DB@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Sep 2022 15:18:35 +0200
Message-ID: <CAG3jFysr3VCgU_sjR-Dd0pn_VK0HpDb2=pQuH+Did9giCYGZLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "drm/bridge: chrontel-ch7033: Add byteswap
 order setting"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 airlied@linux.ie, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Sept 2022 at 12:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Mon, Sep 19, 2022 at 12:20:09PM +0200, Robert Foss wrote:
> > Revert this patch since it depends on devicetree functionality that
> > previously has been reverted in the below commit.
> >
> > commit e798ba3374a1 ("Revert "dt-bindings: Add byteswap order to chrontel ch7033"")
> >
> > This reverts commit ce9564cfc9aea65e68eb343c599317633bc2321a.
> >
> > Fixes: 8c9c40ec8344 ("Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP"")
>
> I'm not sure this Fixes tag is meaningful here. Apart from that,

Ack.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> > index c5719908ce2d..ba060277c3fd 100644
> > --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> > +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> > @@ -68,7 +68,6 @@ enum {
> >       BYTE_SWAP_GBR   = 3,
> >       BYTE_SWAP_BRG   = 4,
> >       BYTE_SWAP_BGR   = 5,
> > -     BYTE_SWAP_MAX   = 6,
> >  };
> >
> >  /* Page 0, Register 0x19 */
> > @@ -356,8 +355,6 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
> >       int hsynclen = mode->hsync_end - mode->hsync_start;
> >       int vbporch = mode->vsync_start - mode->vdisplay;
> >       int vsynclen = mode->vsync_end - mode->vsync_start;
> > -     u8 byte_swap;
> > -     int ret;
> >
> >       /*
> >        * Page 4
> > @@ -401,16 +398,8 @@ static void ch7033_bridge_mode_set(struct drm_bridge *bridge,
> >       regmap_write(priv->regmap, 0x15, vbporch);
> >       regmap_write(priv->regmap, 0x16, vsynclen);
> >
> > -     /* Input color swap. Byte order is optional and will default to
> > -      * BYTE_SWAP_BGR to preserve backwards compatibility with existing
> > -      * driver.
> > -      */
> > -     ret = of_property_read_u8(priv->bridge.of_node, "chrontel,byteswap",
> > -                               &byte_swap);
> > -     if (!ret && byte_swap < BYTE_SWAP_MAX)
> > -             regmap_update_bits(priv->regmap, 0x18, SWAP, byte_swap);
> > -     else
> > -             regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
> > +     /* Input color swap. */
> > +     regmap_update_bits(priv->regmap, 0x18, SWAP, BYTE_SWAP_BGR);
> >
> >       /* Input clock and sync polarity. */
> >       regmap_update_bits(priv->regmap, 0x19, 0x1, mode->clock >> 16);
>
> --
> Regards,
>
> Laurent Pinchart
