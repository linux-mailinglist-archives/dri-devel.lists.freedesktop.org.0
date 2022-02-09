Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A414B07D2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11410E754;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CAF89364
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:14:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id d10so7140070eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 05:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=MvIis3EoHhsjYRK616ll8LrYGwz8h4ztaz98uu56seM=;
 b=kTl87A1TJNcgGG2yBnhVoDFTrKwfU57Z7c8LYPq5FqFVQWrO1b159uzhQyCPN/gL9B
 pACxyZw3e1diVJdifCudk1+5al9GcTCsaamBOVPYLgDa+2pLJ/NwF2VcM63Fc0ucCH5S
 mSziLxPioGzVqZdvwgZ/CF+7irkEorLlDB6aaR2QWhug6lmES1OFpxjgbgBV+ivzzBHB
 /kCIr3teZS1rLbtQhsM3Gqtir230z5/Qr4B30CWPc7+MR1wDdZ3WOY7AUcmD9zW/2Z7N
 RX3vlPliqvLAjuzzPbXyBT1zJK/13jOLDDOXvkhlrJ7wBAd1Od2BUXdr2nRa+WBge+75
 yDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=MvIis3EoHhsjYRK616ll8LrYGwz8h4ztaz98uu56seM=;
 b=iuIIoP3MbCjREaZ14qAdweGw/OewPLxoBpD4uU/yWT4q6sKsjJIyiDdrLWq0HvrrGZ
 rOJqbFb/yu28DEVOdOYVdK9fK9/6ijp3+IVPOhCM9QUxBvvFkQQDrDNXiuCHPAYYlCHP
 rmY9rpEo8jPimuctSs/Ut+KjQ8nyb+cvR7MgTk9UfZJAEJW2glN8D3y9XMhC8rtRzZAK
 luM8G3T8rwYf7J1YGTMaD9uZGBg9QhOiNqYc+azbkNXmpB6KOw7/ltnpGFrInZN6bOLJ
 jUC2oTZubXt/VeOW3EXmMSFpmBcgDa23nZqcozSkyMQhiwWxvgw4hi4octoVTnV/SOjP
 a5aQ==
X-Gm-Message-State: AOAM531FaNKIOMOclvyLWIHePNtEQ4vMvNEZ6whNcUYKjF4pidj/ja4O
 Ge58sk+OkfwyYiC0LI4ALaI=
X-Google-Smtp-Source: ABdhPJzZVYKr7CaTzRFu8MIO+8Plg7oF3R3Wu/W58TC3ZginUEqjnEqHX8SJlEoLHlqMsPy2LxSvaQ==
X-Received: by 2002:a17:906:7487:: with SMTP id
 e7mr1916894ejl.58.1644412442827; 
 Wed, 09 Feb 2022 05:14:02 -0800 (PST)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id
 cf15sm4361418ejb.121.2022.02.09.05.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 05:14:02 -0800 (PST)
Message-ID: <78357e75dede2a7bff95126ff35784929335e918.camel@gmail.com>
Subject: Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of data-mapping
 property"
From: Max Krummenacher <max.oss.09@gmail.com>
To: Marek Vasut <marex@denx.de>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Date: Wed, 09 Feb 2022 14:14:01 +0100
In-Reply-To: <bef41ee6-d070-109f-33c2-95103e7ef6a3@denx.de>
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
 <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
 <4a2f4707c03d4509aa5f3a388cbfbe04@dh-electronics.com>
 <bef41ee6-d070-109f-33c2-95103e7ef6a3@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

Am Mittwoch, den 09.02.2022, 00:52 +0100 schrieb Marek Vasut:
> On 2/8/22 22:27, Christoph Niedermaier wrote:
> > From: Laurent Pinchart [mailto:laurent.pinchart@ideasonboard.com]
> > Sent: Thursday, February 3, 2022 12:46 AM
> > > Hi Christoph,
> > > 
> > 
> > Hi Laurent,
> > 
> > > On Tue, Feb 01, 2022 at 12:07:17PM +0100, Christoph Niedermaier wrote:
> > > > Without the data-mapping devicetree property my display won't
> > > > work properly. It is flickering, because the bus flags won't
> > > > be assigned without a defined bus format by the imx parallel
> > > > display driver. There was a discussion about the removal [1]
> > > > and an agreement that a better solution is needed, but it is
> > > > missing so far. So what would be the better approach?
> > > > 
> > > > [1] https://patchwork.freedesktop.org/patch/357659/?series=74705&rev=1
> > > > 
> > > > This reverts commit d021d751c14752a0266865700f6f212fab40a18c.
> > > > 
> > > > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > To: dri-devel@lists.freedesktop.org
> > > > ---
> > > >   drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++++
> > > >   1 file changed, 11 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 3c08f9827acf..2c683d94a3f3 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -453,6 +453,7 @@ static int panel_dpi_probe(struct device *dev,
> > > >        struct panel_desc *desc;
> > > >        unsigned int bus_flags;
> > > >        struct videomode vm;
> > > > +     const char *mapping;
> > > >        int ret;
> > > > 
> > > >        np = dev->of_node;
> > > > @@ -477,6 +478,16 @@ static int panel_dpi_probe(struct device *dev,
> > > >        of_property_read_u32(np, "width-mm", &desc->size.width);
> > > >        of_property_read_u32(np, "height-mm", &desc->size.height);
> > > > 
> > > > +     of_property_read_string(np, "data-mapping", &mapping);
> > > > +     if (!strcmp(mapping, "rgb24"))
> > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > > > +     else if (!strcmp(mapping, "rgb565"))
> > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> > > > +     else if (!strcmp(mapping, "bgr666"))
> > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> > > > +     else if (!strcmp(mapping, "lvds666"))
> > > > +             desc->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> > > 
> > > You're right that there's an issue, but a revert isn't the right option.
> > > The commit you're reverting never made it in a stable release, because
> > > it was deemed to not be a good enough option.
> > > 
> > > First of all, any attempt to fix this should include an update to the DT
> > > binding. Second, as this is about DPI panels, the LVDS option should be
> > > dropped. Finally, I've shared some initial thoughts in [1], maybe you
> > > can reply to that e-mail to continue the discussion there ?
> > 
> > According to your thoughts in [1] you mean that the bus format should be
> > build out of the devicetree properties bus-width and data-shift. It would
> > be possible for evenly structured busses like RGB888_1X24 and RGB666_1X18,
> > but what about a bus like RGB565_1X16, where each color has different
> > bus width. Also the order of the colors should be defined to differ
> > between busses like RGB888_1X24 and GBR888_1X24.
> > Are there any ideas how can this be covered?
> 
> Maybe with props like these ?
> 
> channel-width -- width of each color channel
> channel-shift -- shift of each color channel
> channel-map -- mapping of each color channel
> 
> So for RGB888
> channel-width = <8 8 8>;
> channel-shift = <0 0 0>;
> channel-map = "RGB"; // or something ?
> 
> For BGR565 panel connected to RGB24 scanout
> channel-width = <5 6 5>;
> channel-shift = <3 2 3>;
> channel-map = "BGR"; // or something ?
> 
> For BGR565 panel connected to RGB565 scanout
> channel-width = <5 6 5>;
> channel-shift = <0 0 0>;
> channel-map = "BGR"; // or something ?
> 

To me this looks like it goes into the wrong direction.
The goal is to set bus_format to one of the
possible enum values.
Using such a generic approach it would be possible to request bus
formats for which no enum value is currently defined, i.e. the
BGR565 example does not have a matching bus_format in
media-bus-format.h.

What about keeping the solution which the revert would give.
Optionally with a changed property name s/data-mapping/bus-format/
and a changed list of allowed strings to better match between the
dt string and the enum name, i.e. s/"rgb24"/"RGB888_1X24"/.
This would allow to extend DT binding and
code to possible newly
required values like e.g. MEDIA_BUS_FMT_BGR888_1X24.

Alternatively one could use the bus-width and data-shift
properties and allow for (bus-width + data-shift) to be one
of 16, 18, 24 and assume RGB. I.e. one could only specify
MEDIA_BUS_FMT_RGB565_1X16, MEDIA_BUS_FMT_RGB666_1X18,
MEDIA_BUS_FMT_RGB888_1X24 respectively.

Max

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

