Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA24BF414
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9239110EAFA;
	Tue, 22 Feb 2022 08:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421010EAFA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:52:02 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p14so40561191ejf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=dmXlZZ8v6mHmnza4ol0Pe1QBT+YSdSv70k2gEytW1AA=;
 b=SQ0NEcl/lKLUbRKlDsxPqnqJachcxqX3XtJo5QiLSiJ3KpDuvykG2RsrzSnCoVj/qp
 sgMtC+q/XLoyGmG+8jqyGo07sN/IQ/cB9eIHjXPIVABwj9xXXYIl1OMvjPi/1Z7IZz5D
 oF4GZef1U4ehSEELuitHXP4zCGXpwkR1hzAVSE6MTdjg6ik5pqUjTTURIOGd+v45jVPH
 uGs/ePkiR9yfpZddQ0eBve9IiUNuV4qhrf6HxxyfJf9p9y9hTkMzDIy3Npd8Lmy/su1c
 ArgBE+Hw3llCb+7wMchkNnMpuvmIZsRVzAY6QR9OGgN3jVTTBD+4EOT17wIEknS1D+re
 GnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=dmXlZZ8v6mHmnza4ol0Pe1QBT+YSdSv70k2gEytW1AA=;
 b=2j+PdbnGO/WA8HJFvGOLv43WjP2720nrfqNSU9MfaRrKE4RCkDDM+trvbTg189+It3
 BaY9j5wFvxLlLk3fxaxGRKud5vZnBbC6W4lQ/azM+X4HZ7hqWh9fq8veX3Y3zzwUvmNG
 vD68oXRadvu5J+rm65X/tS913F23yIQfkGOs80eFwC6YGHSSVZpdjyz5o+bHD6dEezqu
 5NP86/0b7dP7i4A/pm4zeTHIIVAGn4oLoZCP2B4HwiUUUNpfkKVmqIBiG/5wGv7R4AiC
 qWWuiKTLPvfCt7Je5JMpEmDagKvODwI2GbBMNBI+k8wVEzNLhxcWaBchq9leYz77J2vn
 2FLQ==
X-Gm-Message-State: AOAM531Mmb6wt2jFgZcMmezt/fDvpqIP3acHWCVjrbhg2Stowm8J1rUW
 DMqzMwl6okP0pJGh252vYuw=
X-Google-Smtp-Source: ABdhPJzvI+wai9zfXW6iPref0yOnIQ7ELskzV5WeZkkJKBRg9vMNubD1hsEjVpogWxAm4vMjlrzU2g==
X-Received: by 2002:a17:907:216f:b0:6ce:d85f:35cf with SMTP id
 rl15-20020a170907216f00b006ced85f35cfmr18478318ejb.517.1645519920908; 
 Tue, 22 Feb 2022 00:52:00 -0800 (PST)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id g3sm6022818ejz.180.2022.02.22.00.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 00:52:00 -0800 (PST)
Message-ID: <afc776eb49db815d108598ce985b0aa5c4a732f8.camel@gmail.com>
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
From: Max <max.oss.09@gmail.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 22 Feb 2022 09:51:59 +0100
In-Reply-To: <b0f07052a12844b5a18da76cf591eadd@dh-electronics.com>
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
 <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
 <4a2f4707c03d4509aa5f3a388cbfbe04@dh-electronics.com>
 <bef41ee6-d070-109f-33c2-95103e7ef6a3@denx.de>
 <78357e75dede2a7bff95126ff35784929335e918.camel@gmail.com>
 <b0f07052a12844b5a18da76cf591eadd@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "Marek MV. Vasut" <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Samstag, den 19.02.2022, 09:37 +0000 schrieb Christoph Niedermaier:
> From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> Sent: Wednesday, February 9, 2022 2:14 PM
> > Hi
> > 
> > Am Mittwoch, den 09.02.2022, 00:52 +0100 schrieb Marek Vasut:
> > > On 2/8/22 22:27, Christoph Niedermaier wrote:
> > > > From: Laurent Pinchart [mailto:laurent.pinchart@ideasonboard.com]
> > > > Sent: Thursday, February 3, 2022 12:46 AM
> > > > > Hi Christoph,
> > > > > 
> > > > 
> > > > Hi Laurent,
> > > > 
> > > > > On Tue, Feb 01, 2022 at 12:07:17PM +0100, Christoph Niedermaier wrote:
> > > > > > Without the data-mapping devicetree property my display won't
> > > > > > work properly. It is flickering, because the bus flags won't
> > > > > > be assigned without a defined bus format by the imx parallel
> > > > > > display driver. There was a discussion about the removal [1]
> > > > > > and an agreement that a better solution is needed, but it is
> > > > > > missing so far. So what would be the better approach?
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
> > > > > > 
> > > > > > This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
> > > > > > 
> > > > > > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > > > > > Cc: Marek Vasut <marex@denx.de>
> > > > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > > To: dri-devel@lists.freedesktop.org
> > > > > > ---
> > > > > >   drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
> > > > > >   1 file changed, 11 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > index 3c08f9827acf..2c683d94a3f3 100644
> > > > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > > > @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
> > > > > >        struct panel_desc *desc;
> > > > > >        unsigned int bus_flags;
> > > > > >        struct videomode vm;
> > > > > > +     const char *mapping;
> > > > > >        int ret;
> > > > > > 
> > > > > >        np = dev->of_node;
> > > > > > @@ -477,6 +478,16 @@ static int panel_dpi_probe(struct device *dev,
> > > > > >        of_property_read_u32(np, "width-mm", &desc->size.width);
> > > > > >        of_property_read_u32(np, "height-mm", &desc->size.height);
> > > > > > 
> > > > > > +     of_property_read_string(np, "data-mapping", &mapping);
> > > > > > +     if (!strcmp(mapping, "rgb24"))
> > > > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > > > > > +     else if (!strcmp(mapping, "rgb565"))
> > > > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> > > > > > +     else if (!strcmp(mapping, "bgr666"))
> > > > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> > > > > > +     else if (!strcmp(mapping, "lvds666"))
> > > > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> > > > > 
> > > > > You're right that there's an issue, but a revert isn't the right option.
> > > > > The commit you're reverting never made it in a stable release, because
> > > > > it was deemed to not be a good enough option.
> > > > > 
> > > > > First of all, any attempt to fix this should include an update to the DT
> > > > > binding. Second, as this is about DPI panels, the LVDS option should be
> > > > > dropped. Finally, I've shared some initial thoughts in [1], maybe you
> > > > > can reply to that e-mail to continue the discussion there ?
> > > > 
> > > > According to your thoughts in [1] you mean that the bus format should be
> > > > build out of the devicetree properties bus-width and data-shift. It would
> > > > be possible for evenly structured busses like RGB888_1X24 and RGB666_1X18,
> > > > but what about a bus like RGB565_1X16, where each color has different
> > > > bus width. Also the order of the colors should be defined to differ
> > > > between busses like RGB888_1X24 and GBR888_1X24.
> > > > Are there any ideas how can this be covered?
> > > 
> > > Maybe with props like these ?
> > > 
> > > channel-width -- width of each color channel
> > > channel-shift -- shift of each color channel
> > > channel-map -- mapping of each color channel
> > > 
> > > So for RGB888
> > > channel-width = <8 8 8>;
> > > channel-shift = <0 0 0>;
> > > channel-map = "RGB"; // or something ?
> > > 
> > > For BGR565 panel connected to RGB24 scanout
> > > channel-width = <5 6 5>;
> > > channel-shift = <3 2 3>;
> > > channel-map = "BGR"; // or something ?
> > > 
> > > For BGR565 panel connected to RGB565 scanout
> > > channel-width = <5 6 5>;
> > > channel-shift = <0 0 0>;
> > > channel-map = "BGR"; // or something ?
> > > 
> > 
> > To me this looks like it goes into the wrong direction.
> > The goal is to set bus_format to one of the
> > possible enum values.
> > Using such a generic approach it would be possible to request bus
> > formats for which no enum value is currently defined, i.e. the
> > BGR565 example does not have a matching bus_format in
> > media-bus-format.h.
> > 
> > What about keeping the solution which the revert would give.
> > Optionally with a changed property name s/data-mapping/bus-format/
> > and a changed list of allowed strings to better match between the
> > dt string and the enum name, i.e. s/"rgb24"/"RGB888_1X24"/.
> > This would allow to extend DT binding and
> > code to possible newly
> > required values like e.g. MEDIA_BUS_FMT_BGR888_1X24.
> > 
> > Alternatively one could use the bus-width and data-shift
> > properties and allow for (bus-width + data-shift) to be one
> > of 16, 18, 24 and assume RGB. I.e. one could only specify
> > MEDIA_BUS_FMT_RGB565_1X16, MEDIA_BUS_FMT_RGB666_1X18,
> > MEDIA_BUS_FMT_RGB888_1X24 respectively.
> > 
> > Max
> > 
> 
> Hi Laurent,
> 
> In which direction should it go to find an acceptable solution?

Hi

I sent a proposal as RFC to show how this could look in the implementation.
https://lore.kernel.org/all/20220222084723.14310-1-max.krummenacher@toradex.com/

Max
> 
> Regards
> Christoph

