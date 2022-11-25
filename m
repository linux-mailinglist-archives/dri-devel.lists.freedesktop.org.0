Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90616383A7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 06:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94610E009;
	Fri, 25 Nov 2022 05:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC9310E009
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 05:52:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b8so4969352edf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 21:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RzN4h3qOAvIsS9Ytm8ViCV9LTXDRNYxBOrbT9kwa+z4=;
 b=oEaPYaoWVwjCvCRl0HhYzkfATCZulKO7O6FroIlJirLXfGB0mUMNQ1vzzo0lRHG88h
 cNaSmIx/Wju99aMFImQwYB8ffU35MFqJyO6o81ePWIivDyODyXWsv9bQogJMB23kCZrX
 ZuFBm7OSJUcNIYbcpI9E72DmIeVVa15mZVqnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RzN4h3qOAvIsS9Ytm8ViCV9LTXDRNYxBOrbT9kwa+z4=;
 b=wggZtM+5gk2PP4P0DR0GvmiyXcwxKUaYWlMPwbFWXnBVeXbKklUoSCEMVEDvwFjHsN
 jHIwDDQDucEH89QNiKw0SF5ytgY5/6TZF7EOFTTHG/yW9R3RPCgDhnJVmGMV6M0QogRJ
 w0gLebaXWGoDUyBb0LoYO/zUDRFJzpDQjMDjuCalN4ttCfE0ldK51ZfJfGiDo2q837gw
 czLaYhPofXAvOnkHuBn1iASZszM81lLPa/S6mq6bop12zfPeLblffcP3loAIiUpBs8rv
 yDH/ssRJwK2SZnXUlL/Dg5VLbydJPHhWQkLEuGN3ahPTUT4phVi/dxSb7xihmm8EVL86
 FCCQ==
X-Gm-Message-State: ANoB5pkkkd0FdjjkQnfpc3bapjlluagEBEiqwetCkYBGSAvWlia6wTRy
 V1CwwBStXIwF4rKfaKLyOp/sMe3xz7Sy/sIncT6Lhw==
X-Google-Smtp-Source: AA0mqf4swfPzjKVkl1scJTqiUbIDnuAEsouyb52592fG1trV+h5bVVpbQlj0dZBKZjpXqLgzGBJ89YmbylZKTLb1eqs=
X-Received: by 2002:a05:6402:1397:b0:467:78f2:d81f with SMTP id
 b23-20020a056402139700b0046778f2d81fmr16227783edv.88.1669355567575; Thu, 24
 Nov 2022 21:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org>
 <Y39ikbcqx5/pEc64@smile.fi.intel.com>
In-Reply-To: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 13:52:36 +0800
Message-ID: <CAEXTbpcbQEyYfuCssENiFQxwe3t11HtHnpJHgjq+=GziNfUk-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
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
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Thu, Nov 24, 2022 at 8:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:20:51PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> >
> > When using OF graph, the fw_devlink code will create links between the
> > individual port driver (cros-ec-typec here) and the parent device for
> > a Type-C switch (like mode-switch). Since the mode-switch will in turn
> > have the usb-c-connector (i.e the child of the port driver) as a
> > supplier, fw_devlink will not be able to resolve the cyclic dependency
> > correctly.
> >
> > As a result, the mode-switch driver probe() never runs, so mode-switches
> > are never registered. Because of that, the port driver probe constantly
> > fails with -EPROBE_DEFER, because the Type-C connector class requires all
> > switch devices to be registered prior to port registration.
> >
> > To break this deadlock and allow the mode-switch registration to occur,
> > purge all the usb-c-connector nodes' absent suppliers. This eliminates
> > the connector as a supplier for a switch and allows it to be probed.
>
> ...
>
> > +     /*
> > +      * OF graph may have set up some device links with switches, since connectors have their
> > +      * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> > +      * assumes the connector is a supplier).
> > +      */
>
> A bit too long lines...

I'll fix this in v7.

>
> > +     if (dev->of_node)
>
> Why do you need this check?

We use this check to make sure only platforms using OF have their
links purged. I'm not sure if this should also be done on x86
platforms.

Best regards,
Pin-yen

>
> > +             device_for_each_child_node(dev, fwnode)
> > +                     fw_devlink_purge_absent_suppliers(fwnode);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
