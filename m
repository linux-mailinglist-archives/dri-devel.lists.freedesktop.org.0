Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA486D17AC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 08:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFAB10F0FB;
	Fri, 31 Mar 2023 06:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED2C10F100
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 06:43:44 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id o12so9347915iow.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680245023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJMiIBnIOha8INMf/aKt6n4a45jL1+cW2jXTn14ItTU=;
 b=NpfpugV6wKsgTbPpOaWm54+nfos2fguzyrvBG1BEwsGGsQPnuppnKYbIC4GWGdcZoW
 jZYwkukueXAmwAc/sXqgRgVX603AGnSpVaV/lkwM8NxqsweY8JQpf+/+LwoUFHBTr8BA
 VOCkuekSuf67GI8TQDNSd1Ei5xaOvqVOWwRmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680245023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJMiIBnIOha8INMf/aKt6n4a45jL1+cW2jXTn14ItTU=;
 b=VslpCKWTwmsgLUu489+9JhYyhVDUcXSzlav45dOaz4tfNrb74I7S6qcS/UaMj8oib0
 5qDavzChgs1QThZSW9zNE6E0Y89lszLvyH587jKJhKYBd6kQ5OAcGxcuRyPCAGMf33RW
 c17lPd9fJZFre6kZL0F071pXEqeIWpH86igxuoWrwpJLhUMuwmvke+xlRSIn23nhAo8u
 vTU7ipZyczdozh8eOAQ/srQoYwGZR9w0p3pJWi1poED2CsQMKco4gs767TJX4Ckp4FgR
 0o258aFzRCLrWpShVHWVsnGKYbOgrv4cpvLRSU9a7yvMzxKOvskhw4KM0kF7NWckxWsC
 ewcQ==
X-Gm-Message-State: AO0yUKUdTSAwerceeSLHOB4KX1Ae22UxvYMHYtkWyBsDH0009wpmUI+W
 SmmPU9eVHFpGqz87MeEo/Nkt0KTt5t4X56sz4pVw4A==
X-Google-Smtp-Source: AK7set+SXmn8wNLCLzHsExgu0fibwth1DHdBynRwGrcMxlN2IJdRta9xWzqdv5f7mEqipgjZ8W0DCENK8hCl2a3ZWj8=
X-Received: by 2002:a02:95a1:0:b0:3ec:dc1f:12dd with SMTP id
 b30-20020a0295a1000000b003ecdc1f12ddmr10175738jai.6.1680245023333; Thu, 30
 Mar 2023 23:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <ZBrgD61p/p17IOJL@smile.fi.intel.com>
 <CAEXTbpcLU6jr2MoDEhZCz3wWzXmJATwHU+Tird-3Q9bXrGeTnA@mail.gmail.com>
In-Reply-To: <CAEXTbpcLU6jr2MoDEhZCz3wWzXmJATwHU+Tird-3Q9bXrGeTnA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 31 Mar 2023 15:43:32 +0900
Message-ID: <CAEXTbpf8JXRYv-5nA_sNEM_D2jP6Hv_kp9o1vkrsEXjyKuOS6g@mail.gmail.com>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
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
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 11:36=E2=80=AFAM Pin-yen Lin <treapking@chromium.or=
g> wrote:
>
> Hi Andy,
>
> Thanks for the review.
>
> On Wed, Mar 22, 2023 at 8:01=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Mar 22, 2023 at 06:46:32PM +0800, Pin-yen Lin wrote:
> > > Add helpers to register and unregister Type-C "switches" for bridges
> > > capable of switching their output between two downstream devices.
> > >
> > > The helper registers USB Type-C mode switches when the "mode-switch"
> > > and the "reg" properties are available in Device Tree.
> >
> > ...
> >
> > > +config DRM_DISPLAY_DP_TYPEC_HELPER
> >
> > > +     bool
> > > +     default y
> >
> >         def_bool y
> >
> > > +     depends on DRM_DISPLAY_HELPER
> > > +     depends on DRM_DISPLAY_HELPER=3DTYPEC || TYPEC=3Dy
> > > +     help
> > > +       DRM display helpers for USB Type-C Displayport Alternate mode=
.
> >
> > Hmm... Dunno if this help is enough.
>
> Okay I'll add more detail in the next version.
> >
> > ...
> >
> > > +     snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
> >
> > Would it be possible to have a dup in name and would it be a problem if=
 so?
> >
> The port_num is included in the name, so the names should be unique.
> Also, the fwnode name actually contains the reg property, so this name
> looks like "endpoint@0-1" now... I'll change the name from fwnode name

This should be "endpoint@0-0", or "endpoint@1-1@. The `port_num` value
has the same number as the `reg` property

> to dev_name() per Dmitry's comment.
> > ...
> >
> > > +/**
> > > + * drm_dp_register_typec_switches() - register Type-C switches
> > > + * @dev: Device that registers Type-C switches
> > > + * @port: Device node for the switch
> > > + * @switch_desc: A Type-C switch descriptor
> > > + * @data: Private data for the switches
> > > + * @mux_set: Callback function for typec_mux_set
> > > + *
> > > + * This function registers USB Type-C switches for DP bridges that c=
an switch
> > > + * the output signal between their output pins. This function uses d=
evm_kcalloc
> > > + * to allocate memory, so it is expected to only call this in the dr=
iver probe
> > > + * functions.
> > > + *
> > > + * Currently only mode switches are implemented, and the function as=
sumes the
> > > + * given @port device node has endpoints with "mode-switch" property=
.
> > > + * The port number is determined by the "reg" property of the endpoi=
nt.
> >
> > `kernel-doc -v ...` should complain on absence of "Return" section.
> >
> > > + */
> >
> > ...
> >
> > > +     switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->num=
_typec_switches,
> > > +                                             sizeof(struct drm_dp_ty=
pec_port_data),
> >
> >                                                 sizeof(*switch_desc_typ=
ec_ports),
> >
> > ?
> >
> > > +                                             GFP_KERNEL);
> > > +     if (!switch_desc->typec_ports)
> > > +             return -ENOMEM;
> >
> > ...
> >
> > > +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
> >
> > Ah, maybe this should use IS_REACHABLE() ?
>
> CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER is a boolean. Is there any
> difference between IS_REACHABLE and ifdef when the given config is a
> boolean?
> >
> > > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_des=
c *switch_desc);
> > > +int drm_dp_register_typec_switches(struct device *dev, struct fwnode=
_handle *port,
> > > +                                struct drm_dp_typec_switch_desc *swi=
tch_desc,
> > > +                                void *data, typec_mux_set_fn_t mux_s=
et);
> > > +#else
> > > +static inline void drm_dp_unregister_typec_switches(struct drm_dp_ty=
pec_switch_desc *switch_desc)
> > > +{
> > > +}
> > > +static inline int drm_dp_register_typec_switches(
> > > +             struct device *dev, struct fwnode_handle *port,
> > > +             struct drm_dp_typec_switch_desc *switch_desc, void *dat=
a,
> > > +             typec_mux_set_fn_t mux_set)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > > +#endif
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
>
> Best regards,
> Pin-yen
> >
