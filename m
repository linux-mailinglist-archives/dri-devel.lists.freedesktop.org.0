Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56166B09A0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FE510E045;
	Wed,  8 Mar 2023 13:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEAD10E045
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 13:45:10 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e11so6781656ioe.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678283110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Gz/Fal0kRuGQs4te+QLHZr2SvmaC9a9yoIN2O4rmEs=;
 b=FzOehmgGzILhkooEFO0biilFd7kiTA0NZcKrhcfEw83BGlvb/DRX3HApX0gd0asQu+
 zXYldxA3v4VRudBB014jDadWTIgo79RaVquXI8m+ip2DXj5WS98GeAQOpgEvrX+7tpbU
 SWqY8TrecDN3LvK2tWghCzQbSw+b/IEJKg1ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678283110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Gz/Fal0kRuGQs4te+QLHZr2SvmaC9a9yoIN2O4rmEs=;
 b=IxsXVZrmuk8/tV9NeFB9NH3cNyNd+2QEsrnPnkxmlWVD+3mu+DmnH1gA+aoOcsu6pP
 ETF9T/EwDZpU4vX2cuQdVPt0yoO6IUJQ3cpExaByH33/i/xFYB+Ftlu2jVs6lo9iiahb
 HEP/rusfpxhY0UBv4Qk56QxOwL43kit7SamBhzXm6MI+0mnS+Eq/1a/Isv+w666hhwNq
 KEq6lBKYI2H/9CvG5WbLuIMImharEdMHaLilCycqlcRBR+wKn/PKBXIAlw5efXPR0A4U
 NVpKr0eBUd7fjfD/PrQDVR0qAXkqc19janWDucp6lDzPsR/FYLbBgBxpQCY2FACNJ3AK
 CmQg==
X-Gm-Message-State: AO0yUKXF++W0CTRVAqwJpd7zpu1G9rCrZSOYDKszElQRigsnEDXOD2Xn
 4NlSsc4qBjyA/P1Ya5AfZgUvjApqhQwv8SP7WqgSMQ==
X-Google-Smtp-Source: AK7set9vEwKu1Idu63ibGwE2iFEiZ7o1hncWOqoEWkYY6ycvzgr26jaWtmtsgD0Zy8mBVQpsXMl2fE6U84RedlItoHs=
X-Received: by 2002:a05:6602:4287:b0:745:50e5:c861 with SMTP id
 cd7-20020a056602428700b0074550e5c861mr8454903iob.4.1678283109499; Wed, 08 Mar
 2023 05:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-8-treapking@chromium.org>
 <ZAXUrJDtHmm7+50H@smile.fi.intel.com>
In-Reply-To: <ZAXUrJDtHmm7+50H@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 21:44:58 +0800
Message-ID: <CAEXTbpftCVFBQK0bNiWvF0NnbNoMoF=dFStHy1HXOq8LvWYjsA@mail.gmail.com>
Subject: Re: [PATCH v13 07/10] drm/bridge: anx7625: Register Type C mode
 switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Mon, Mar 6, 2023 at 7:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:47PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant ports are available in Device Tree. Configure the crosspoint
> > switch based on the entered alternate mode for a specific Type-C
> > connector.
> >
> > Crosspoint switch can also be used for switching the output signal for
> > different orientations of a single USB Type-C connector, but the
> > orientation switch is not implemented yet. A TODO is added for this.
>
> ...
>
> > +     ctx->port_data =3D devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
> > +             sizeof(struct anx7625_typec_port_data), GFP_KERNEL);
>
> I believe I have commented on this (indentation)...
>
> > +
>
> ...and this (blank line).

Sorry for missing this one. I'll fix this in v14.
>
> > +     if (!ctx->port_data) {
> > +             ret =3D -ENOMEM;
> > +             goto unregister_mux;
> > +     }
>
> ...
>
> > +             ctx->port_data[i].orientation =3D (dp_lanes[0] / 2 =3D=3D=
 0) ?
> > +                     TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NOR=
MAL;
>
> I believe that this is an error prone check, you should rather do the opp=
osite,
> i.e.  ' % 2  =3D=3D 0'.
>
The orientation should be TYPEC_ORIENTATION_REVERSE when the
data-lanes value is 0/1, so ` / 2` is what I meant here.

Though, after second thought, I think it would be clearer if I use
`dp_lanes[0] < 2`. I'll update this in v14 as well.
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
