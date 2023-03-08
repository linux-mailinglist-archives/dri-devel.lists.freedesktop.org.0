Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131196B0419
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202810E0D4;
	Wed,  8 Mar 2023 10:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A06110E0D4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:25:12 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v10so6582056iox.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 02:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678271111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vk4eRG0LrzbHDKK00dsD4iBuyY/4ZAQyp3TpAqYJX3Q=;
 b=EftcY01/oCV/raNvODG0Gy7CAtfgmEemBydzNyAQ/5Z8JDAjqoXLq8pFoIQpGEcWYn
 nu75sxupN/sQVT1eTmTNkYDC4NGXFqPitKQCL4odiDhzr0iZEhGrzCytxWkP57LBugz1
 ovgS6RvevaA0mF6dPaeC7GeF5zW7+oi9/DjqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678271111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vk4eRG0LrzbHDKK00dsD4iBuyY/4ZAQyp3TpAqYJX3Q=;
 b=rf11hI4AhmCMlKTNsGej3mQFTsQKKgoLNLrObkEaCk78SqP5L5CXCR+wdYQZ9vMB8B
 4877HNwxcX9PNUn7gnWKziWhPTY2KT1WhEllab5IBCElLwQ9NS7dbczJPRP0mxHDh6Oa
 Yt3AGoZmbuBlBNxPM0hufE9ZZb9L3aqtefZIXCJ2K6UsQshAG/dUn9cMjONIM3agF3Wk
 FAe0j/47TUu+rp+4yH0jEaJd0NV4b0ToRPIPFDSkSk3aHtBOMs+/L0pmRHdKRol2+7bz
 /EZtLym3awb2MMxHqKmBKX0tugvP00JV7Ot9BRwiNHe4Se9s6KrgXT0unJbWT52D8rUz
 TNxA==
X-Gm-Message-State: AO0yUKVSCTxXOBFLpQZlzsCUKPd7y1iMFebFz8isHiCgB/ihKUCZCSJp
 2TXaIRIOIAeMI3ZUiel8rsKfdqQ275hE4RnycKy+NA==
X-Google-Smtp-Source: AK7set+QhdrKShMQqdGse4Hq6359ifcnSCbtiqiWfe6LuBFF3HsmSOEUtWdcF89t709UweFPbwi9ZG1akiBqjkVk2co=
X-Received: by 2002:a05:6602:154:b0:74c:8243:9290 with SMTP id
 v20-20020a056602015400b0074c82439290mr8204213iot.4.1678271111488; Wed, 08 Mar
 2023 02:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-6-treapking@chromium.org>
 <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
In-Reply-To: <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 18:25:00 +0800
Message-ID: <CAEXTbpecGhEDrffDobb4NgLw8+vMK2_yVmJw8JGUDruTALm4-w@mail.gmail.com>
Subject: Re: [PATCH v13 05/10] drm/bridge: anx7625: Check for Type-C during
 panel registration
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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

HI Andy,

On Mon, Mar 6, 2023 at 7:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:45PM +0800, Pin-yen Lin wrote:
> > The output port endpoints can be connected to USB-C connectors.
> > Running drm_of_find_panel_or_bridge() with such endpoints leads to
> > a continuous return value of -EPROBE_DEFER, even though there is
> > no panel present.
> >
> > To avoid this, check for the existence of a "mode-switch" property in
> > the port endpoint, and skip panel registration completely if so.
>
> ...
>
> > +     port_node =3D of_graph_get_port_by_id(np, 1);
> > +     count =3D typec_mode_switch_node_count(&port_node->fwnode);
>
> Do you need to drop reference count here?
> (I don't know myself, so, please check this)
>
> If no, patch LGTM.

The helper completes the for-loop of fwnode_for_each_child_node, which
drops the reference count whenever the next node is get. So we don't
need drop the reference count here.
>
> > +     if (count)
> > +             return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
