Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9145A503D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FE510F386;
	Mon, 29 Aug 2022 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30EA10F386
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:32:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t5so10619283edc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ZArUof/tV8vEA7cUaNGmSfJdv26wC+8pM/ls3PBeVLg=;
 b=ICfBU60rq0WcgJembo6E+2XxO3lBPw0daTEH5pnddr85acZzEGaR3XOIyFLDGD2PRA
 UK/twfa5KWe0H+cjGy4RSdA4qzRUZOIZuUsAfHaCo/tr7+6WWXVGZNQxzpHN/YyLT1oD
 AFSFpaBPNDfLge7uFI6PsISYXXacqaLSDtS+uztKv684KBBAvjEVR+jfkqrrw/uKFVjx
 sOTMmQU09gKLz3q0xIPryf2nwSD34iHUspDy23qRDSs6CqxRH4ZvRCsmx3pJH7+QMrCQ
 JRTXlHyrfh78kcqFUOwUjUICNnVv6GTREPJcASwYLv8c0t4P4aejcVdzIZ7m9W3syn/z
 5OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ZArUof/tV8vEA7cUaNGmSfJdv26wC+8pM/ls3PBeVLg=;
 b=vgOw0e6pcQdLeAKpYxOo93VN+P8qgsarxlPBIF7BtrRK0XejSGTpVhaspkSlvLw3QS
 we7rVDTOqLtx8O+/watfxNFHLkBFCIENiBt3bqBBPjRy2jUcLx43FGfe62ZTMol0eoan
 PCNXTdgeM94EdsiLIoyKcIvTbbm3kDF/txDL5wsofFlMpzDdzLi00Qhxygg6MuJB0rlW
 AuT5H6Vc63eQpqYuBvfFBxWFoj/+SLZceNbZ3MAPjnXaS0CDhBXXOk62wOPESSTC3393
 zCfbTQuW7OZxXpjOj2VGxu03vJxVQyjLwiXEOLwlaGn4B/froCbZxC0NiZGW8bk9VtME
 GY2A==
X-Gm-Message-State: ACgBeo3ZZd+LLG6cfglYhd5lswjuvqTdKIBeZ1N4cbytulMYZT4p0YBA
 MFeFa4azRUSlLs4hk48nuxQuZXaYmjTp9g7QTg0lPQ==
X-Google-Smtp-Source: AA6agR6dLRYVA48vbAs2WI7NkpgEFqGhs/y5RA6OY1xAARoFSF8O+Rf9MomS1YM0T7xzb/zSAq62gqKqzzwPDMUHb1w=
X-Received: by 2002:a05:6402:290d:b0:448:32f5:1e7 with SMTP id
 ee13-20020a056402290d00b0044832f501e7mr8138333edb.50.1661787178100; Mon, 29
 Aug 2022 08:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220801125419.167562-1-marex@denx.de>
 <59e76231-9c67-eb53-a84c-4d4d3f4341e0@baylibre.com>
In-Reply-To: <59e76231-9c67-eb53-a84c-4d4d3f4341e0@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 17:32:47 +0200
Message-ID: <CAG3jFytavDJpXedjnO8WZOBXwXEu81EV-qZddXZCJnabpb96xA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lvds-codec: Fix error checking of
 drm_of_lvds_get_data_mapping()
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 at 11:27, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 01/08/2022 14:54, Marek Vasut wrote:
> > The drm_of_lvds_get_data_mapping() returns either negative value on
> > error or MEDIA_BUS_FMT_* otherwise. The check for 'ret' would also
> > catch the positive case of MEDIA_BUS_FMT_* and lead to probe failure
> > every time 'data-mapping' DT property is specified.
> >
> > Fixes: 7c4dd0a266527 ("drm: of: Add drm_of_lvds_get_data_mapping")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > To: dri-devel@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/bridge/lvds-codec.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > index 702ea803a743c..39e7004de7200 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -180,7 +180,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >               of_node_put(bus_node);
> >               if (ret == -ENODEV) {
> >                       dev_warn(dev, "missing 'data-mapping' DT property\n");
> > -             } else if (ret) {
> > +             } else if (ret < 0) {
> >                       dev_err(dev, "invalid 'data-mapping' DT property\n");
> >                       return ret;
> >               } else {
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to drm-misc-next.
