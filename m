Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53338660D1D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 09:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B3B10E0CC;
	Sat,  7 Jan 2023 08:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C810E0CC
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 08:57:48 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id 3so1859503iou.12
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 00:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UaNgvexmJZouLumz2Hx1He28hMYgrYY+xTAVH7s69FM=;
 b=USC/6TTWY3c9bq0vKbvX+VWUwpXRkXdBVEauttbI7B/ZQ1oIkIZNu1Yo09lwc7bODo
 QCeJkFoz0u3wjOvokRLMOJCuh0pQLovmrLZaJqZUkoGcDAXJjZuRBlsC/ypwOPYM3Np1
 JVnfVqUGM7cQv7XazXT4n7qSdn+bJ6ijtwrAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UaNgvexmJZouLumz2Hx1He28hMYgrYY+xTAVH7s69FM=;
 b=o0hlGnoRu7Rl+QS1mH+jhqgN0pQJkKczM1YV0p3XyhdhvA0h/y5kRY7uKPlqiH1f+A
 mAG7JGXdFlxAz1i7DNL8eNaeHylWZTJ0OZUxDPUd9KHmXKIyST9jaX1wjly8NEfucYau
 nWuv/Ha1EplLxtgswViFoDSV9MAkrvxWuj4lYmWb3cRwlrPf6MU0J6gbo5FizlruvXiR
 OQnZ1hC/lsQHcsm3GB32SLYtOznhVtPYlS0EI1Jcf2lqR1Bf1ZgXNI+I+Qu4mtrKej7j
 n0s/vwbA0yR5qEZsSiaCFZGi4Pb2NM11uzRp6sIXiR8K9QpV0yoWEbPkF1v3dAlDh/g9
 WZ8Q==
X-Gm-Message-State: AFqh2koZhOes35am+2RwTR1icYTfARbW0VhuYEmFEqF9vYY8fLaOOGz1
 5MQdRW9Ad8+ofrc/8XtiOe0V1ON3tie03ttN2e+F+g==
X-Google-Smtp-Source: AMrXdXvTC4JQ09AhshynrLdlXh3M+Z6nMNmW5qrLRJOovdkW8noIBriyLLrx6Nomzovk/IWfzQDu/aOoojNHuYEKlrY=
X-Received: by 2002:a05:6638:58:b0:38a:9192:2ba6 with SMTP id
 a24-20020a056638005800b0038a91922ba6mr5151511jap.76.1673081867592; Sat, 07
 Jan 2023 00:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-3-treapking@chromium.org>
 <Y7btq4kLxrE4v3TL@smile.fi.intel.com>
In-Reply-To: <Y7btq4kLxrE4v3TL@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Sat, 7 Jan 2023 16:57:36 +0800
Message-ID: <CAEXTbpcwKnMQ1=D940bf2GUNdK3K+-bhnOs2r5fwuTW+ozQajA@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] platform/chrome: cros_ec_typec: Purge blocking
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

Thanks for the review.

On Thu, Jan 5, 2023 at 11:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 05, 2023 at 09:24:50PM +0800, Pin-yen Lin wrote:
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
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> Tag block mustn't have the blank line(s).
>
> ...
>
> > +     /*
> > +      * OF graph may have set up some device links with switches, since
> > +      * connectors have their own compatible. Purge these to avoid a deadlock
> > +      * in switch probe (the switch mistakenly assumes the connector is a
> > +      * supplier).
> > +      */
>
> Perhaps even
>
>         /*
>          * OF graph may have set up some device links with switches,
>          * since connectors have their own compatible. Purge these
>          * to avoid a deadlock in switch probe (the switch mistakenly
>          * assumes the connector is a supplier).
>          */
>
> ?
I can update this in v8, though I wonder why shorter comments are
preferred as they haven't exceeded the 80-character length
requirement.
>
> > +     if (dev->of_node)
>
> I would use if (dev_of_node(dev)), but it's up to you and maintainers.

dev_of_node looks a bit better as it checks the enabled config for us.
I'll update this in v8.

>
> > +             device_for_each_child_node(dev, fwnode)
> > +                     fw_devlink_purge_absent_suppliers(fwnode);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best regards,
Pin-yen
