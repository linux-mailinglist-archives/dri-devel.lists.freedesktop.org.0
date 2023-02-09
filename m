Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B30868FEBB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0B10E8FF;
	Thu,  9 Feb 2023 04:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D04510E8FF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 04:28:45 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id b9so388272ilh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 20:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bescMjn7FtyPXif9z42K5Kti4WQibJgEOUCofteOlbU=;
 b=efbpqpZ8ruVdXCPyxPr8jDefM3U8oaOj3EXWBJQevNTETQvcO2dE/qtmWax943hsRR
 hXvF9OSBw1p+PC27CXPrMC2rOofIy441d7jZSKzpR3sOkGqwzMVORaVIxNJkydQm7TzH
 8ViDfzFimT4EAz6hz5X1Yn6/9z/6vbonm+MDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bescMjn7FtyPXif9z42K5Kti4WQibJgEOUCofteOlbU=;
 b=rcga0A1IBUFsX/2Y37bjFAqDlr4aeHNdIL6p7/1tYBpCChmaFpBJ21kEkNqqZPAGuK
 LXqEOfxSrZyOGp7NwIDbwgWiEH20K7kXDy7xAsA6kEFBBUJP2PHEdgeleLGANC+dnQ1g
 4avcIH8FXCjoccv9OUGgSIu6xDzXL9MbTncbQc7PlSvfaeTfoOdqMXdF9h71Sw/Q7tFW
 en39hUMO8xw+EWxLP4EB9jjXVrhof78rD2Kl1ilOpTtJnl0t1GlnaOhUdLuusZHYC/kY
 ZFVG6OH21oVgQAb7o/c6dt947ULoMw1tS4PrLibuLJOqMIMNoCmj14r5Kq+Fg/eknAKS
 Uojw==
X-Gm-Message-State: AO0yUKUx7x6of33K59gYkJ0koQ2E8mV8mW9nr4I0Q/8MLl4IHGuyPTMu
 ROz0YLprbkOxdKTabkxIKAWVu35rsQKYN1WMgrwc1w==
X-Google-Smtp-Source: AK7set+YCKJbelSZgHy/neopyqons0VAhG7SjB9chuOXUmdoUIbOQBP9AdNx/HVfzI+OikZm7IrbjJahfEHqdtFqiQw=
X-Received: by 2002:a92:4412:0:b0:310:fd95:6d81 with SMTP id
 r18-20020a924412000000b00310fd956d81mr5201921ila.42.1675916924769; Wed, 08
 Feb 2023 20:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-2-treapking@chromium.org>
 <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
In-Reply-To: <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Feb 2023 12:28:33 +0800
Message-ID: <CAEXTbpf-s8NQKwSxhe=cO-KO=TTSXFznm=1J-ikhc558M6brdQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/9] device property: Add remote endpoint to devcon
 matcher
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sakari,

Thanks for the review.

On Mon, Feb 6, 2023 at 5:11 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pin-yen,
>
> On Sat, Feb 04, 2023 at 09:30:32PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> >
> > When searching the device graph for device matches, check the
> > remote-endpoint itself for a match.
> >
> > Some drivers register devices for individual endpoints. This allows
> > the matcher code to evaluate those for a match too, instead
> > of only looking at the remote parent devices. This is required when a
> > device supports two mode switches in its endpoints, so we can't simply
> > register the mode switch with the parent node.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for the update.
>
> I intended to give my Reviewed-by: but there's something still needs to be
> addressed. See below.
>
> >
> > ---
> >
> > Changes in v11:
> > - Added missing fwnode_handle_put in drivers/base/property.c
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> >
> > Changes in v6:
> > - New in v6
> >
> >  drivers/base/property.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 2a5a37fcd998..e6f915b72eb7 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -1223,6 +1223,22 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
> >                       break;
> >               }
> >
> > +             /*
> > +              * Some drivers may register devices for endpoints. Check
> > +              * the remote-endpoints for matches in addition to the remote
> > +              * port parent.
> > +              */
> > +             node = fwnode_graph_get_remote_endpoint(ep);
>
> Here fwnode_graph_get_remote_endpoint() returns an endpoint...
>
> > +             if (fwnode_device_is_available(node)) {
>
> and you're calling fwnode_device_is_available() on the endpoint node, which
> always returns true.
>
> Shouldn't you call this on the device node instead? What about match()
> below?

Yes we should have checked the availability on the device node itself
instead of the endpoint node. But regarding the match() call, we need
to call it with the endpoint node because that's where we put the
"mode-switch" properties and register the mode switches on. We can't
use the device node because we want to register two mode switches for
the same device node.

Regards,
Pin-yen
>
> > +                     ret = match(node, con_id, data);
> > +                     if (ret) {
> > +                             if (matches)
> > +                                     matches[count] = ret;
> > +                             count++;
> > +                     }
> > +             }
> > +             fwnode_handle_put(node);
> > +
> >               node = fwnode_graph_get_remote_port_parent(ep);
> >               if (!fwnode_device_is_available(node)) {
> >                       fwnode_handle_put(node);
>
> --
> Kind regards,
>
> Sakari Ailus
