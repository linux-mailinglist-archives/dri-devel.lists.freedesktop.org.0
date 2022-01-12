Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0CB48C1F9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 11:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0624B113908;
	Wed, 12 Jan 2022 10:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE97A113905
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 10:09:17 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so10964553pja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weNjN/xzHEHSDO334pDbfVWSs4mNM/PupPi9g1KN1hE=;
 b=jiCM+hPrEi1OJLok7KC6lTf2sSpMxRXrphLjSEuFeYVPjqJR6MEuMKGdMkRiXmxFE6
 risuvb9XncZd6rbufWNOjgZ3MpyEJu+C6u9FPQUX+wEfo8z1h7LhxwcXJs5yrgY0ORmk
 hmzNpIXEP0HdMeZYxolP7W9PBLw7wpM34+VG2NIcPYSwqZjmfSnOvQ9NNSzcQztpxr8Y
 TH9FGhTefEQ9rosu/FYuujV2qfcfH5hG4j2/E61TeORyjtODPMGM6MdQRm2iScSUUJG6
 E+Kyj0qJiPi3wZ5l9rizfWxT12xfne7cj4FPqb5I8IiYsIcIDLdyEXrLwCWf7Sh4u1om
 kLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weNjN/xzHEHSDO334pDbfVWSs4mNM/PupPi9g1KN1hE=;
 b=qe32iPOQfoIZAX3EYP0LzZDfl4AF0MA3MSSCPaZ+ycotFcPWATDly88u5RbS4Oj2es
 waXlegzL1YSazlgkHLEAclWL8Sb7id/yxundSOuvy69En6Jfq97bWeV6idtoLFqR7W/c
 LQ+F5RzpnvAaD+YOpn3J5QpAesYaAqfS+NwcXwYuoGSsVp159d3BxrtvED219b4l2UsQ
 8zcVfhUiTAPCKmfviv0UNVJoYqx2/Db6ALgdZTgsn9VLWJ2fKzoOnBGkyFWvR7YWnbbn
 dpDJPJAAghdcjlOLlyWHyAIjepgCXfBA4ShrS7ipjPgbt3sIYdOSi/JHUsv5X2DlEnQ8
 UNhg==
X-Gm-Message-State: AOAM530d1hWDgHVdnGC7UJvOyeMvbzgpoSIlAPjp/xQ8CdmDTexaaRgK
 w1KPWjY7G2862dURAONB0xsYUi/S+BZB7YPO+sY1XQ==
X-Google-Smtp-Source: ABdhPJwcbK22Ix9fd+ET1Pl7Cn1AzTSRRfd6vqqM6VwNy0agpUuC3dmSCsO7/PAKrF1qM5/LOorWQz4QQmZrUnz07oI=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr8488385plr.21.1641982157326; Wed, 12 Jan
 2022 02:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20220109204105.51878-1-colin.i.king@gmail.com>
 <Ydtoib+OCyaPhrOH@pendragon.ideasonboard.com>
In-Reply-To: <Ydtoib+OCyaPhrOH@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 12 Jan 2022 11:09:06 +0100
Message-ID: <CAG3jFyu3aB0QnQfa-fu6_Zy_=R=9dnVLmW3RBXLv3bD=gUzQEA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7533: make array clock_div_by_lanes static
 const
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 9 Jan 2022 at 23:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Colin,
>
> Thank you for the patch.
>
> On Sun, Jan 09, 2022 at 08:41:05PM +0000, Colin Ian King wrote:
> > Don't populate the read-only array clock_div_by_lanes on the stack but
> > instead it static const. Also makes the object code a little smaller.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > index eb7579dec40a..ef6270806d1d 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -29,7 +29,7 @@ static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
> >       struct mipi_dsi_device *dsi = adv->dsi;
> >       struct drm_display_mode *mode = &adv->curr_mode;
> >       unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
> > -     u8 clock_div_by_lanes[] = { 6, 4, 3 };  /* 2, 3, 4 lanes */
> > +     static const u8 clock_div_by_lanes[] = { 6, 4, 3 };     /* 2, 3, 4 lanes */
>
> It's not mandatory, but I have a tendency to declare static const
> variable first before all mutable variables.
>
> >
> >       hsw = mode->hsync_end - mode->hsync_start;
> >       hfp = mode->hsync_start - mode->hdisplay;
>
> I wonder if
>
>         /* set pixel clock divider mode */
>         regmap_write(adv->regmap_cec, 0x16, (12 / dsi->lanes) << 3);
>
> would be even better, or if it would be too much black magic. Either
> way,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to drm-misc-next.
