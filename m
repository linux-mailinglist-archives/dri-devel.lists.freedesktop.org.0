Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1448B6D15AD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 04:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF89410E2D0;
	Fri, 31 Mar 2023 02:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD4D10E2D0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:36:51 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h187so7452139iof.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 19:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680230211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOKd8Q/yyL2Vxt/B7mCiLmN2+GLEWiOvEP6b0sT30PQ=;
 b=fLAVIymlVLtMTb1OjnAuBaj7urPwyZKEBOmwoAFmOw63GSs/eFd54mlEyiF8t/oxH5
 WNBjJbLZutvpZ73ltowGOCUqKIzcUWI2PZlW9vLvaYeQ7U2EWVXoKuxwH+fBk6O8T3fI
 b7Dvz7j9ez80eZY6vUDx3aJCc19D9uPXqpugg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680230211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOKd8Q/yyL2Vxt/B7mCiLmN2+GLEWiOvEP6b0sT30PQ=;
 b=1Kc/nmjePxwzLi4ynExl2rLFXDCEUyMuon5UVfmrJTRld/fvrShA6sj1bVTItZ5s8V
 6upDseye+gupXUxIAFRRKeZV+bzwnFwYtdNc6qSd40wdkwjUjTIMLeMO0AEdSsHEkNeh
 CeOM5Wg6Zc9SKm7u0qbhWgSHRaesFzEm4T8iINIRDw/pbSwfIqWkLPK0Dxvb+8QyTL+w
 MDAjMrRtLece3PL8Dkg4MBZqWrAPNwOQvzblN6vmlg2YiavR3fiKfHdsR7/oFhayUWAc
 zpZnDf2xDARNRLbgizfHI3pnWg3p5yuHySiug9VtGyEJu+UYR8FLguMxehzQbau09IzR
 drJg==
X-Gm-Message-State: AO0yUKUzqgSdfXMhMfmvxnLJ/GpyJ4jf4KAKqL7Bf3eIK05FMlXjT5NT
 IJNvnU0h8zsUUtnXrt+/M1t9DLtcCuJsF0zfF31QAQ==
X-Google-Smtp-Source: AK7set8iHyEfMscSQN6K+wU64uXRfznAJTa3p7iwGPfwmfjxtVwhD5T091Ndlb+dZQRGTYJqdf7/mi2dwLdlRru+94U=
X-Received: by 2002:a02:2304:0:b0:406:38ac:716e with SMTP id
 u4-20020a022304000000b0040638ac716emr9747717jau.6.1680230211040; Thu, 30 Mar
 2023 19:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <ZBrgD61p/p17IOJL@smile.fi.intel.com>
In-Reply-To: <ZBrgD61p/p17IOJL@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 31 Mar 2023 11:36:40 +0900
Message-ID: <CAEXTbpcLU6jr2MoDEhZCz3wWzXmJATwHU+Tird-3Q9bXrGeTnA@mail.gmail.com>
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
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Wed, Mar 22, 2023 at 8:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 22, 2023 at 06:46:32PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
>
> ...
>
> > +config DRM_DISPLAY_DP_TYPEC_HELPER
>
> > +     bool
> > +     default y
>
>         def_bool y
>
> > +     depends on DRM_DISPLAY_HELPER
> > +     depends on DRM_DISPLAY_HELPER=3DTYPEC || TYPEC=3Dy
> > +     help
> > +       DRM display helpers for USB Type-C Displayport Alternate mode.
>
> Hmm... Dunno if this help is enough.

Okay I'll add more detail in the next version.
>
> ...
>
> > +     snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
>
> Would it be possible to have a dup in name and would it be a problem if s=
o?
>
The port_num is included in the name, so the names should be unique.
Also, the fwnode name actually contains the reg property, so this name
looks like "endpoint@0-1" now... I'll change the name from fwnode name
to dev_name() per Dmitry's comment.
> ...
>
> > +/**
> > + * drm_dp_register_typec_switches() - register Type-C switches
> > + * @dev: Device that registers Type-C switches
> > + * @port: Device node for the switch
> > + * @switch_desc: A Type-C switch descriptor
> > + * @data: Private data for the switches
> > + * @mux_set: Callback function for typec_mux_set
> > + *
> > + * This function registers USB Type-C switches for DP bridges that can=
 switch
> > + * the output signal between their output pins. This function uses dev=
m_kcalloc
> > + * to allocate memory, so it is expected to only call this in the driv=
er probe
> > + * functions.
> > + *
> > + * Currently only mode switches are implemented, and the function assu=
mes the
> > + * given @port device node has endpoints with "mode-switch" property.
> > + * The port number is determined by the "reg" property of the endpoint=
.
>
> `kernel-doc -v ...` should complain on absence of "Return" section.
>
> > + */
>
> ...
>
> > +     switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->num_t=
ypec_switches,
> > +                                             sizeof(struct drm_dp_type=
c_port_data),
>
>                                                 sizeof(*switch_desc_typec=
_ports),
>
> ?
>
> > +                                             GFP_KERNEL);
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> ...
>
> > +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
>
> Ah, maybe this should use IS_REACHABLE() ?

CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER is a boolean. Is there any
difference between IS_REACHABLE and ifdef when the given config is a
boolean?
>
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc =
*switch_desc);
> > +int drm_dp_register_typec_switches(struct device *dev, struct fwnode_h=
andle *port,
> > +                                struct drm_dp_typec_switch_desc *switc=
h_desc,
> > +                                void *data, typec_mux_set_fn_t mux_set=
);
> > +#else
> > +static inline void drm_dp_unregister_typec_switches(struct drm_dp_type=
c_switch_desc *switch_desc)
> > +{
> > +}
> > +static inline int drm_dp_register_typec_switches(
> > +             struct device *dev, struct fwnode_handle *port,
> > +             struct drm_dp_typec_switch_desc *switch_desc, void *data,
> > +             typec_mux_set_fn_t mux_set)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +#endif
>
> --
> With Best Regards,
> Andy Shevchenko
>

Best regards,
Pin-yen
>
