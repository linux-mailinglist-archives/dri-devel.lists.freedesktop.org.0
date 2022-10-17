Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591B60146E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259210EDC8;
	Mon, 17 Oct 2022 17:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794D10EDC2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 17:13:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id u21so16994799edi.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oEAY6Cotgn/ZxpsoP6Gzuop0YADoHyQTniLvgQ1pizg=;
 b=KzuJXUFW/kdm7LIF+npMNkUkA6hN+cgMuuwzEHsZBApCtxwBczHry+ftQjywmLOXC3
 t32v7mZ8dNCOn+KPvYB6J59N4QZEUVkUO3eaqG66udEq/VYPdAP1HrUTHhwJx54dUBvu
 WMO0KkbcUOdqmVTutGEFYS4c2paOushJnq8uPk7Yk5/rgl8oalVeYjXIbFXWQsXJwCnB
 VJfYud4WkhbZHWrkQ7KRLygIcJXMSf5VpTzf38RoeL37golkSaJMAQ0uHXV4YWPS/iuU
 n7P3sxUmdXqYmE9vVjDxkkSrBqyksO8jQHeq76AkKUMWb2guMjIo67L2p9icimkeZViw
 Jt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oEAY6Cotgn/ZxpsoP6Gzuop0YADoHyQTniLvgQ1pizg=;
 b=BpyisUfkbqiTyFJBimzMbcZT5PVQSuZBpceCwIACL/estmxCqcIqJ+EOyXHpofVTNz
 G8JviVtgYqWeda87/agZ099IQzndymNrPzlPUP6n6pDvynrDNMR6yYfByzJ4CgppuwNu
 snZ5Qto1nuKuC8pC9BYAH3jD5+E2cSBUDSMug/roDdrt0XfJSOLe3kLH9MyohvHW0mDx
 S12ixCPXctuBnYv9BdoKB2MR6HjjaOqS39NldWBIyKLlupiVDD3pOXCu+aXzRhOEk+Gf
 S3U+qQ4PY2nfqcFyh3+DQkiyZcarHGtvb2OCJyl+SWt7lCDGxXBD3zc81h70C4CpoGvP
 bd2w==
X-Gm-Message-State: ACrzQf2DpLzYalZSkFC0Tj17XAnoL1KmeJm6tvt8Sts4gEtNIIvVylQK
 MFPcFFAxcNrUJ0ZxwiQRhPLfc37QIfyaN/Wi2kBdyw==
X-Google-Smtp-Source: AMsMyM4QGUc/+zi0I19dg8IHN7efVyCK8QCtt3xvbowENarcgt6RgIUhlT83cgJRdmEYy1qwKYIAjo+ZUQQi+mLPVjM=
X-Received: by 2002:a05:6402:22ef:b0:458:bfe5:31a3 with SMTP id
 dn15-20020a05640222ef00b00458bfe531a3mr11134713edb.6.1666026779615; Mon, 17
 Oct 2022 10:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
 <20221013-rpi-dpi-improvements-v1-4-8a7a96949cb0@cerno.tech>
 <Y0rt8FIkRniuv0l4@pendragon.ideasonboard.com>
In-Reply-To: <Y0rt8FIkRniuv0l4@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 17 Oct 2022 18:12:44 +0100
Message-ID: <CAPY8ntCVyC7xWtONA4T3x42GYt+t3v+PDbzy3PwE9TfJErUL+A@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/vc4: dpi: Support RGB565 format
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
Cc: Chris Morgan <macromorgan@hotmail.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Sat, 15 Oct 2022 at 18:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime and Chris,
>
> Thank you for the patch.
>
> On Thu, Oct 13, 2022 at 11:56:48AM +0200, Maxime Ripard wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > The RGB565 format with padding over 24 bits
> > (MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI
> > controller as "mode 3".  This is what the Geekworm MZP280 DPI display
>
> The code below uses DPI_FORMAT_16BIT_565_RGB_2. Is that mode 3, or
> should the commit message refer to mode 2 ?

It's a mis-mash of documentation from the firmware stack.
[1] lists the firmware modes, which start at 1 for the equivalent of
DPI_FORMAT_9BIT_666_RGB, so there padded RGB565 is mode 3.

I'd advocate dropping the reference to which mode it is:
The RGB565 format with padding over 24 bits
(MEDIA_BUS_FMT_RGB565_1X24_CPADHI) is supported by the vc4 DPI controller.

  Dave

[1] https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#parallel-display-interface-dpi

> With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > uses, so let's add support for it in the DPI controller driver.
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_dpi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> > index 1f8f44b7b5a5..7da3dd1db50e 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> > @@ -182,6 +182,10 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
> >                               dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_3,
> >                                                      DPI_FORMAT);
> >                               break;
> > +                     case MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> > +                             dpi_c |= VC4_SET_FIELD(DPI_FORMAT_16BIT_565_RGB_2,
> > +                                                    DPI_FORMAT);
> > +                             break;
> >                       default:
> >                               DRM_ERROR("Unknown media bus format %d\n",
> >                                         bus_format);
> >
>
> --
> Regards,
>
> Laurent Pinchart
