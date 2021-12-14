Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CED47461F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 16:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFF710E55F;
	Tue, 14 Dec 2021 15:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA310E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 15:13:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bi37so37437353lfb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+bLnAgO3b5siLg+4Vc0pITri5Pyuz0KEVByfdnYDUc=;
 b=kCE7rz4ty8OGXocOaIZ3U4M6gf6ZOKVj3wNbZYF0cgfawnSE7lraEFy4XZSw/fLgSF
 +znofuf+MuVMaaLS3TEXk10vJMTERr9+PeavbiQTq8Tls0YR5gjguTMLcRzSVqJt99K/
 0je4UkVDApqGfFNiKg32fiTXAGdspkepqWSlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+bLnAgO3b5siLg+4Vc0pITri5Pyuz0KEVByfdnYDUc=;
 b=GM9aFMcgYTxtJ1oFcW4rMczNpl6SD7IE55bo/YzNR59bADF3Fc98BWVg0IGAHOgE1x
 ZM0XkDpmq9OtrQnlL8osBTYw1iZ3gb1CXQYhLRbdf3EIqZ6faMjwsXCTA2LC6gxOow8h
 KG19Svi9RLf7Myr0OuT8j6nsbw5cb1DfXORD45R73yJTLpl8gXV0f82OOBhm0oUZd+it
 uOY+WD2s3bBXp/PdUp2sv5l55J3YIpOQTpr84uOkbtu12GtLy5s1t/dSCTi2YQcHCsjb
 LIBBXdm7FDc673Zjgvt4n2+Y8kxDGKICaq3KJBmgl/vVqwzntF051Civ/SuO2IdG/dps
 b1ew==
X-Gm-Message-State: AOAM532cgVL1DyIAWtQtL5IsPckOOR9Ehk1EW9i9iQ9UHxBKBZIeS/4U
 LbWQuzWA31cbiv5nGDqAcWRSI3D7WROrVcfvkoVlsg==
X-Google-Smtp-Source: ABdhPJyJT7xqBLUyVs9umwlaLSNF7gCLRF7yhoSNNTuBadwQHuxuZn1gHe8yhGYuShqyro78Lu0JCvDSqBPxCAMGnYs=
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr4926777lfb.628.1639494791345; 
 Tue, 14 Dec 2021 07:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
In-Reply-To: <20211026011318.GF2515@art_vandelay>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 14 Dec 2021 10:13:00 -0500
Message-ID: <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Sean Paul <sean@poorly.run>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey CK, can we have this merged?
Thank you!

On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
>
> On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@chromium.org>
> >
> > [Why]
> > Creating the prop uses UNKNOWN as the initial value, which is not a
> > supported value if the props is to be supported.
> >
> > [How]
> > Set the panel orientation default value to NORMAL right after creating
> > the prop.
>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
>
> >
> > Tested on Jacuzzi(MTK)
> > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 0ad7157660afa..b7c2528a8f41c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >               DRM_ERROR("Unable to init panel orientation\n");
> >               goto err_cleanup_encoder;
> >       }
> > +     drm_connector_set_panel_orientation(dsi->connector,
> > +                                         DRM_MODE_PANEL_ORIENTATION_NORMAL);
> >
> >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> > --
> > 2.33.0.1079.g6e70778dc9-goog
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
