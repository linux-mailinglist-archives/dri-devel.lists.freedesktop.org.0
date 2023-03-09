Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D81556B2134
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 11:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179810E7DA;
	Thu,  9 Mar 2023 10:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D2E10E7DA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 10:20:55 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id bf15so495814iob.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 02:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678357255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIU3HMuVNTJJMDhnoEUvCOuAE75z3O7Qyl1/k3U1zyU=;
 b=BVW4T3AssvDhpzvR5OQ1nO3YwRaVAGkl6KA4fAJ7wye5I5nb4s/ipZO3wq7VlN/S6l
 aR82jJKHvaE12XBrcriVHD2/jAUxNDABHtALxwu0o95JAOJqZyzGJomUAh/iHfj7AZMj
 VVy8FM3OW+YzvBVfjTY9lglRcnfPOYKRuVtFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIU3HMuVNTJJMDhnoEUvCOuAE75z3O7Qyl1/k3U1zyU=;
 b=QuE2elkmCmiVX5+nS3Z9CH/cOOO1BdOMv0Bqg15kSuJ3g7waxqBWhtmN3Yt65yx87G
 DtqZBRq8d8IAtpS65l/HNJtz16MMEKWOUTwGmXFBmulAEvOiMJ4lKXbb5J46bny2ufN7
 mEbUu8/EXsrRlXSTrYNPdtEjGs7McYzUOYAH2utrLIA1aKHCf3UckotQANtVGBjiSAHC
 SrWh9j40F2+GO/Xn8bbj4klPjnkr1KeXLpsIqf72jrFmf6qcFtHcbJJUhlkbqS4fuKZq
 lM46xYgzY8lFRsEP5zFjIas/YqPbG+4yz2N2PTy4WgC8YBpFZo2H5X2sRSdfqVhzc2Qt
 gmtw==
X-Gm-Message-State: AO0yUKVixGKEUAqU0oM8VeiLKa3ji3X4fuLlin9k4oTahNynaCwhNPJD
 +Q6JGuG1NW65KYQ1L3FI0pOw4V3WFmDWoOthGtdu8A==
X-Google-Smtp-Source: AK7set8yQOFHurTiJsdWOlEy9y+Eh5psaAfvl621J543EP4BUiv7QH2QzIQMnElcHbQnb2xLNM/JQ9lkCoOlRDsgqQk=
X-Received: by 2002:a02:7310:0:b0:3ca:61cc:4bbc with SMTP id
 y16-20020a027310000000b003ca61cc4bbcmr10772903jab.2.1678357254876; Thu, 09
 Mar 2023 02:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-4-treapking@chromium.org>
 <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
 <CAEXTbpf4zM+70BCef6rdfz35TQnQ+ozaXAvOaEZVnqqe6MDOOg@mail.gmail.com>
 <ZAiptm03HzQila0M@smile.fi.intel.com>
In-Reply-To: <ZAiptm03HzQila0M@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Mar 2023 18:20:44 +0800
Message-ID: <CAEXTbpfQTGsZVy4m0MXQ0AK-N66F3OHwFmT_kNThMPxZFVP6ow@mail.gmail.com>
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

On Wed, Mar 8, 2023 at 11:29=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 06:20:14PM +0800, Pin-yen Lin wrote:
> > On Mon, Mar 6, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
> > > On Fri, Mar 03, 2023 at 10:33:43PM +0800, Pin-yen Lin wrote:
>
> ...
>
> > > > +     switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->n=
um_typec_switches,
> > > > +                                             sizeof(struct drm_dp_=
typec_port_data),
> > > > +                                             GFP_KERNEL);
> > > > +     if (!switch_desc->typec_ports)
> > > > +             return -ENOMEM;
> > >
> > > How often this function _can_ be called during the runtime?
> > > If it's _possible_ to call it infinite times, consider *not* using de=
vm.
> >
> > I would expect this function to be only called during driver probing,
> > and this is the case for the current users in this series. So I think
> > this is only called once if EPROBDE_DEFER doesn't count.
>
> No, deferred probe is not counted.
>
> Can you add a word somewhere in the comment(?) to make this clear?

Sure. I'll add some note in the comments about this.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Thanks and regards,
Pin-yen
