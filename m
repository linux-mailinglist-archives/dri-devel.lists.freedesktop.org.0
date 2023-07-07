Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189474B56A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 18:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3FB10E5BA;
	Fri,  7 Jul 2023 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB53A10E5BA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 16:53:28 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-262e839647eso1594693a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688748808; x=1691340808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ganOcRrGX9gVkXMthOtdXTKyr3DXfFEecMxDKDYPHpQ=;
 b=J8Wr9p6qLani+dIxIJoalPJzoHhWv6PxfhP1BbAYAxKziU/IrMQWCVvaFDv92GEGaq
 pSkaoPtc3SY90nN8qv+dNCn6Zcj7KfohQoKKSW6JAUn31F9tG8GEfOXIW3U3uNBVbuDV
 WVZ8i/WlYex/Yz5F5I9fozzKO7sd36Iogex03SkJw/wWV+025xFGK9y6V5+6Bv+eIAbj
 t/0k7pSgVZX9SOYj0+EL6Ht8pMAKb6vWIim6Exw3tiZgfLv36fE3OS7FRKmw1Scm+MQd
 VP2BW6t0hWSSjjwrGrW4aK4PFcrH5SN0o2+9PsPCpbigXe4Pj3BPbUVb7MWCmNmdU0CQ
 WiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688748808; x=1691340808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ganOcRrGX9gVkXMthOtdXTKyr3DXfFEecMxDKDYPHpQ=;
 b=i2ykr0YCRez+5pr5Z7yDut5iUj4ZBuJD41xjz56FaNctI+jaP+CmFinWngoJWo4RLc
 /WUEETqfdgSkYP0FOvhyMuXB/d4lgEUzt6nldMDWdxQ95mGMK89AkgQHEBmsxLKq/jJ2
 YHW21pW93O06M6CukNV/cRC+fs6kV4h8GdQkdggBdWfchlpwvh22o4gm1IfijsczspNt
 c0+nsEzqFowLdg5hOI3lnU3x1qi2SpXAbfLq/6TcwNOObX4wsOhc1TrfZeodboLweEsA
 v7MSPZdczWKT85QVz8ZZF0d7hSUnp9MGeVJncb9yKoMlmpGH2pVKS++r+1plqquMCrx0
 Yc9w==
X-Gm-Message-State: ABy/qLZCbagf/Kn2dIrray5IIoSi2KAc8wasFKRgAHL0bNO47W9kqYA8
 dbnq5rHbWfqnLd3AWWXzjuOLygpWK+MPH3T1GkM=
X-Google-Smtp-Source: APBJJlGum+21E74xOHmurd3BznTUzbDzbh02qxja4NdlWrkKY0qPGktO+vX87VjpJ0ZpPOz2kKqw5zlIBr+4nwsHTJE=
X-Received: by 2002:a17:90a:d484:b0:256:2efc:270e with SMTP id
 s4-20020a17090ad48400b002562efc270emr4702991pju.5.1688748807659; Fri, 07 Jul
 2023 09:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230319125524.58803-1-aford173@gmail.com>
 <CAMSo37Whxvp82i9hr-L-O4Qo9Pxkh5L+hFXqw9hNQ+asrD6oyA@mail.gmail.com>
In-Reply-To: <CAMSo37Whxvp82i9hr-L-O4Qo9Pxkh5L+hFXqw9hNQ+asrD6oyA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 7 Jul 2023 11:53:15 -0500
Message-ID: <CAHCN7xK+AQmzwc+_o7Y=vNX7CKamQMrfGnrmZ4TsHR8ifSprcw@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: adv7533: Fix adv7533_mode_valid for
 adv7533 and adv7535
To: Yongqin Liu <yongqin.liu@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, John Stultz <jstultz@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dmitry.baryshkov@linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 11:05=E2=80=AFAM Yongqin Liu <yongqin.liu@linaro.org=
> wrote:
>
> Hi, Adam, All
>
> On Sun, 19 Mar 2023 at 20:55, Adam Ford <aford173@gmail.com> wrote:
> >
> > When dynamically switching lanes was removed, the intent of the code
> > was to check to make sure that higher speed items used 4 lanes, but
> > it had the unintended consequence of removing the slower speeds for
> > 4-lane users.
> >
> > This attempts to remedy this by doing a check to see that the
> > max frequency doesn't exceed the chip limit, and a second
> > check to make sure that the max bit-rate doesn't exceed the
> > number of lanes * max bit rate / lane.
> >
> > Fixes: 9a0cdcd6649b ("drm/bridge: adv7533: remove dynamic lane switchin=
g from adv7533 bridge")
> > Reviewed-by: Robert Foss <rfoss@kernel.org>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >
> > V2:  Fix whitespace in comment
> >      Remove TODO comment
> >      Add R-B from Robert.
>
> With this change, the ACK android-mainline based hikey960 build failed
> to show UI on the HDMI
> monitor connected, but it works if I revert this change.
> Here is the serial console output: http://ix.io/4zK8
>
> Not sure if you have any idea what the problem is there,
> and how to have it fixed.
>
> Please let me know if you need any other information.

I'd be curious to know the desired clock rate and the number of lanes
you're trying to use.

adam
>
> Thanks,
> Yongqin Liu
>
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm=
/bridge/adv7511/adv7533.c
> > index fdfeadcefe80..7e3e56441aed 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -103,22 +103,19 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
> >  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
> >                                         const struct drm_display_mode *=
mode)
> >  {
> > -       int lanes;
> > +       unsigned long max_lane_freq;
> >         struct mipi_dsi_device *dsi =3D adv->dsi;
> > +       u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> >
> > -       if (mode->clock > 80000)
> > -               lanes =3D 4;
> > -       else
> > -               lanes =3D 3;
> > -
> > -       /*
> > -        * TODO: add support for dynamic switching of lanes
> > -        * by using the bridge pre_enable() op . Till then filter
> > -        * out the modes which shall need different number of lanes
> > -        * than what was configured in the device tree.
> > -        */
> > -       if (lanes !=3D dsi->lanes)
> > -               return MODE_BAD;
> > +       /* Check max clock for either 7533 or 7535 */
> > +       if (mode->clock > (adv->type =3D=3D ADV7533 ? 80000 : 148500))
> > +               return MODE_CLOCK_HIGH;
> > +
> > +       /* Check max clock for each lane */
> > +       max_lane_freq =3D (adv->type =3D=3D ADV7533 ? 800000 : 891000);
> > +
> > +       if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> > +               return MODE_CLOCK_HIGH;
> >
> >         return MODE_OK;
> >  }
> > --
> > 2.34.1
> >
>
>
> --
> Best Regards,
> Yongqin Liu
> ---------------------------------------------------------------
> #mailing list
> linaro-android@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-android
