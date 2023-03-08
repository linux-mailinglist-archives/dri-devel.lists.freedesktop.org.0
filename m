Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC026B09DB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3E210E082;
	Wed,  8 Mar 2023 13:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE9710E5BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 13:51:30 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 76so6771586iou.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 05:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678283490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2ScB8i7PrG39DRTErC7kF+bBBVGcw9XNhNSA0VqouI=;
 b=imkqhCCosUh66ifIsRQPbANxZXdmJpEwCj2rF7iSVxboMb7R9EE2AFrdMjLL16Y/Kw
 ooGlAR2bIPsm2FI/6N4VeIN+MSDg7j79K5/3wNTcuCOl8Gx8dM0twquGzlpwCcPl1klq
 NicNIX+rKLK1R+g/ECbCTeA/17uvvBo5G2SJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678283490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2ScB8i7PrG39DRTErC7kF+bBBVGcw9XNhNSA0VqouI=;
 b=MJ7nxNI04+nXYWJEhI6NNuacInHCseyv+UlO1sMErKvfpm54PG1gHlqgzs1kexb4hp
 MWbzJ7/rOgoD2HArbSKfXDCWsblnrnJAkadDSob5jhpMEXNMObYAPfU1fiwTwt9tayKR
 B3SztYHlvczRsJKO3ha4BQ2ZrP9ZoRpAlAPj3yOrpi1qAsYxoDdAVDiXu80mBI4Pkbc7
 p2iu8iDMZhadlHK8ypr0u6Od9fFHfcryHJmyrgZZhM3t+7LthfWPNBtv6uJBYE65XeH2
 yBi27w2/aAfnMv0i6rL90Dm1bP4C03SQJaQx/m7FAs9IPbOathWVnzRCu/TbOERxsLw0
 lHTA==
X-Gm-Message-State: AO0yUKXdpY7VW/dl3tzGx+Bblo77V1VoPc1X/rUbQ1FVApm2dhp5IO+t
 RQym/smfqAwkMbqyuXO965eKTeQUL6EaMr+znc13dg==
X-Google-Smtp-Source: AK7set8VM1H7ES454XkYoww9M66+Aop3lkGBIArzYN2bvLHb4IHDHyckUz3PiQcAOs/tKbPekPyLMzsgcHMc8Vkk8wo=
X-Received: by 2002:a6b:dc0c:0:b0:743:5fb0:2ca8 with SMTP id
 s12-20020a6bdc0c000000b007435fb02ca8mr8414193ioc.4.1678283490142; Wed, 08 Mar
 2023 05:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-11-treapking@chromium.org>
 <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
In-Reply-To: <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 21:51:19 +0800
Message-ID: <CAEXTbpe=e1iA7cnzuTtcsyFxpG37YCWSK_SqZb2A8hxcyCnJBg@mail.gmail.com>
Subject: Re: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode
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

On Mon, Mar 6, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:50PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant port are available in Device Tree. Configure the "lane_swap"
> > state based on the entered alternate mode for a specific Type-C
> > connector, which ends up updating the lane swap registers of the it6505
> > chip.
>
> ...
>
> > +     it6505->port_data =3D devm_kcalloc(dev, switch_desc->num_typec_sw=
itches,
> > +                                      sizeof(struct it6505_typec_port_=
data),
> > +                                      GFP_KERNEL);
>
> > +
>
> Same, no need for a blank line here.
>
I'll fix this in the next version.
> > +     if (!it6505->port_data) {
> > +             ret =3D -ENOMEM;
> > +             goto unregister_mux;
> > +     }
>
> ...
>
> > +             it6505->port_data[i].lane_swap =3D (dp_lanes[0] / 2 =3D=
=3D 1);
>
> ' % 2 =3D=3D 0' ?
>
Per another patch, I'll update this into `< 2`
> ...
>
> Wouldn't be better to have
>
>         ret =3D PTR_ERR_OR_ZERO(extcon);
>
> here and amend the following accordingly?
>
> >       if (PTR_ERR(extcon) =3D=3D -EPROBE_DEFER)
> >               return -EPROBE_DEFER;
> >       if (IS_ERR(extcon)) {
> > -             dev_err(dev, "can not get extcon device!");
> > -             return PTR_ERR(extcon);
> > +             if (PTR_ERR(extcon) !=3D -ENODEV)
> > +                     dev_warn(dev, "Cannot get extcon device: %ld\n",
> > +                              PTR_ERR(extcon));
> > +             it6505->extcon =3D NULL;
> > +     } else {
> > +             it6505->extcon =3D extcon;
> >       }
> >
> > -     it6505->extcon =3D extcon;
> > +     init_completion(&it6505->mux_register);
> > +     ret =3D it6505_register_typec_switches(dev, it6505);
> > +     if (ret) {
> > +             if (ret !=3D -ENODEV)
> > +                     dev_warn(dev, "Didn't register Type-C switches, e=
rr: %d\n",
> > +                              ret);
> > +             if (!it6505->extcon) {
> > +                     dev_err(dev, "Both extcon and typec-switch are no=
t registered.\n");
> > +                     return -EINVAL;
> > +             }
> > +     }
>
>
> Perhaps
>
>         if (ret !=3D -ENODEV)
>                 dev_warn(dev, "Didn't register Type-C switches, err: %d\n=
", ret);
>
>         if (ret && !it6505->extcon) {
>                 dev_err(dev, "Both extcon and typec-switch are not regist=
ered.\n");
>                 return ret;
>         }
>
> ?


Thanks for the suggestion! I'll update this in v14.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
