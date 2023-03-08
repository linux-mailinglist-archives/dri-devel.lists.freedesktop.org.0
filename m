Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EEB6B03E9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C410E106;
	Wed,  8 Mar 2023 10:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845610E106
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:20:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id b16so6569964iof.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678270825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdSzeNIXMw8vmjUPC/E7bBOx6FxLxfwio06gT5xhe28=;
 b=jQ4jJaOiICqMicJiBXhI5oM9sUTb8IINUcqEvhN/8M+cKUK0JFV9UtHbA/p27b+rQz
 /rJs32ad1N0HnlpzPknEpjE1d5e2iz8ebGsaveUiDxGpSxFhqvr6hNTJNPjUQk1q6YJ6
 uH61wIlAh1Qh/0ONQp43Gl1w4PoJCcm7aTtKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678270825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdSzeNIXMw8vmjUPC/E7bBOx6FxLxfwio06gT5xhe28=;
 b=s98AKJbblxozSZhAswBcB18nJz9o4lFAECfH9pXdKHn+TTlatTzie4T2w73hauwo3s
 WN0D8QJ7V82qUISaD5UxZU6LTWQXNCARZpMeYajFl0XPIP7B1/pMN87NpXoa0anz7taX
 Nrmri7eb0EeeOpDF5Ijq/0Hh2UYL86eCSK3qWToi2b6Q0DRx/HTliQD3AuxuHI2zRbHf
 lb4jjIQojY8kmGj83L9MkhZYwAkIANbASancqzLLRXLthGL/zBRyUwqEghBBiw65qwDn
 +ontzdO96z8rjA43HbJpG2z0niqa5ZV0gwnEulDVaAxe2KVJYjPJVgmAyfDPoCmxeUiU
 YZew==
X-Gm-Message-State: AO0yUKV0PEz2cTswvY6hb/TmrD+zRvvz41U4o0+zMVcCwG3vPAYeimtG
 fepdO7AFcJXkUObjlVcHYHnR6USjvxPU2Jvy4D19Cg==
X-Google-Smtp-Source: AK7set+wtPxm/KF3XOtr2thou1wVTrVhlmiYRK/vO3RW2gqzmVrHuxLZsTxaCjvY+jvT/MTnCMZjjYobOos9Nu3v0YM=
X-Received: by 2002:a02:7310:0:b0:3ca:61cc:4bbc with SMTP id
 y16-20020a027310000000b003ca61cc4bbcmr8866771jab.2.1678270824932; Wed, 08 Mar
 2023 02:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-4-treapking@chromium.org>
 <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
In-Reply-To: <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 18:20:14 +0800
Message-ID: <CAEXTbpf4zM+70BCef6rdfz35TQnQ+ozaXAvOaEZVnqqe6MDOOg@mail.gmail.com>
Subject: Re: [PATCH v13 03/10] drm/display: Add Type-C switch helpers
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the review.

On Mon, Mar 6, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:43PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
>
> ...
>
> > +     port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret =3D PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d=
\n",
> > +                     port_num, ret);
>
> > +             return ret;
> > +     }
> > +
> > +     return 0;
>
> Can be simply
>
>         port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
>         ret =3D PTR_ERR_OR_ZERO(port_data->typec_mux);
>         if (ret)
>                 dev_err(dev, "Mode switch register for port %d failed: %d=
\n",
>                         port_num, ret);
>
>         return ret;
>
This was suggested by Angelo in [1], but you are not the first
reviewer that finds this weird... I'll update this in the next
version.

[1]: https://lore.kernel.org/all/023519eb-0adb-3b08-71b9-afb92a6cceaf@colla=
bora.com/

> ...
>
> > +     switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->num_t=
ypec_switches,
> > +                                             sizeof(struct drm_dp_type=
c_port_data),
> > +                                             GFP_KERNEL);
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> How often this function _can_ be called during the runtime?
> If it's _possible_ to call it infinite times, consider *not* using devm.

I would expect this function to be only called during driver probing,
and this is the case for the current users in this series. So I think
this is only called once if EPROBDE_DEFER doesn't count.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
