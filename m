Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578594DDF93
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A110E042;
	Fri, 18 Mar 2022 17:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CD310E042
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:05:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id c15so12067165ljr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WxMCTjgIXGUv5phWRdS5q6OXffoTEiCZt2VV0vGsabU=;
 b=WbaTcxzDss0ZDDMseogZKFSLf3MqUS87AlyLU/c8h0AzwGcyhjaQn3gq40/oKtb3Ee
 vskhPokgWbhGUdgsmx74dwGeb0LQvRS55pBv97h5rOm+KHoTpsuyk380fnUv2gS0VKIV
 D/De0gjRtWT//SvjPXFevmKJiRzW/gEYpHw0IjzwGmDQVX0uTBF6FOxz2N92Fz8QI/Fj
 +w9xdjdirlk3g5WvPWQtxHKpgBnMe5bIBCiB7TfGucLGYt0C4yn1ezwy0Hlghu6EVDUL
 T3wPKd0OCmhiCBCFE8ozVflhVFcDgn8CwBnF3cKBh5T2I3e30x+SWvf0HRCO0mg7qXtg
 bZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WxMCTjgIXGUv5phWRdS5q6OXffoTEiCZt2VV0vGsabU=;
 b=FBhdcLxrznqiu7ltGw7Uwxq84T3LkEkzNvAWJVcagF4SDuUuxAAwE4e39iiEkyJzjh
 CuRmKxV65IM4HnxYCnQwQKEHOBdKWiGvGaVk5R/4FY8jp9wC16CVt4WgYQ9UH5s6rj6G
 RsSzjPBU53lUJWBU3NvXbioMh4MSuFHUBWmrJGgDCNmMvk2zol+UVPwOxwr73jp5+Ju0
 3nytO2huUPBDC8VDJdAcgaGFRJHIqztMzaLI6qiywjaid54bUWERn13Ix7QhMpYz2LMG
 fbX58jKLSmratlRwNrUtv7HoLNy/W4UUYWnIpsQagrVZYCyQCqUX66doTeRzLepXV2mW
 xCmg==
X-Gm-Message-State: AOAM5325ArWP6HU4Y5oI8JG3eVOr8yEz5IJdm2h41hddNDvQ4jVMl1bh
 XGzNy6BeGgAf3hxAc6QL3LRYZRnNoy7wrzia/jOb4A==
X-Google-Smtp-Source: ABdhPJwob0K/t2D7Zb02OMXIrF3msXKRyVOHxgL0f9cx14tdo2jD0Gp2tse6CqID/StDmuh0VLCTx6h9XnEcr47dsRI=
X-Received: by 2002:a05:651c:200c:b0:23b:8267:9ed1 with SMTP id
 s12-20020a05651c200c00b0023b82679ed1mr6663624ljo.368.1647623127402; Fri, 18
 Mar 2022 10:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
In-Reply-To: <20220318163549.5a5v3lex4btnnvgb@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Mar 2022 17:05:11 +0000
Message-ID: <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> > >
> > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > Hi,
> > >
> > > Hi,
> > >
> > > > Please try to avoid top posting
> > Sorry.
> >
> > > >
> > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > >> The goal here is to set the element bus_format in the struct
> > > >> panel_desc. This is an enum with the possible values defined in
> > > >> include/uapi/linux/media-bus-format.h.
> > > >>
> > > >> The enum values are not constructed in a way that you could calculate
> > > >> the value from color channel width/shift/mapping/whatever. You rather
> > > >> would have to check if the combination of color channel
> > > >> width/shift/mapping/whatever maps to an existing value and otherwise
> > > >> EINVAL out.
> > > >>
> > > >> I don't see the value in having yet another way of how this
> > > >> information can be specified and then having to write a more
> > > >> complicated parser which maps the dt data to bus_format.
> > > >
> > > > Generally speaking, sending an RFC without explicitly stating what you
> > > > want a comment on isn't very efficient.
> > >
> > > Isn't that what RFC stands for -- Request For Comment ?
> >
> > I hoped that the link to the original discussion was enough.
> >
> > panel-simple used to have a finite number of hardcoded panels selected
> > by their compatible.
> > The following patchsets added a compatible 'panel-dpi' which should
> > allow to specify the panel in the device tree with timing etc.
> >   https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
> > In the same release cycle part of it got reverted:
> >   https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
> > With this it is no longer possible to set bus_format.
> >
> > The explanation what makes the use of a property "data-mapping" not a
> > suitable way in that revert
> > is a bit vague.
>
> Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> example. Chances are the DPI interface will use a 24 bit bus, so where
> is the padding?
>
> I think that's what Sam and Laurent were talking about: there wasn't
> enough information encoded in that property to properly describe the
> format, hence the revert.

MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
padding. "bgr666" was selecting that media bus code (I won't ask about
the rgb/bgr swap).

If there is padding on a 24 bit bus, then you'd use (for example)
MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
colour are the padding. Define and use a PADLO variant if the padding
is the low bits.
The string matching would need to be extended to have some string to
select those codes ("lvds666" is a weird choice from the original
patch).

Taking those media bus codes and handling them appropriately is
already done in vc4_dpi [1], and the vendor tree has gained
BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
mainline.

Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
defines needed, but that's the downside of having defines for all
formats.

(I will admit to having a similar change in the Pi vendor tree that
allows the media bus code to be selected explicitly by hex value).

  Dave

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_dpi.c#L154
[2] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/include/uapi/linux/media-bus-format.h#L49

> > The RFC revert of the revert
> >   https://patchwork.kernel.org/project/dri-devel/patch/20220201110717.3585-1-cniedermaier@dh-electronics.com/
> > tried to get feedback what would be a way forward. This RFC tries the
> > same by giving a possible solution should
> > the property name and/or the a bit short strings of the original be
> > the reason why it is not suitable.
> >
> > So the requested comments would be about what was not good enough with
> > 'data-mapping' and what would be a way forward.
> >
> > Especially since in my limited view it is not clear why in panel-lvds
> > 'data-mapping' is used to state how the bits representing colour are
> > mapped to the 21 or 28 possible bit position in the LVDS lanes vs.
> > here where we want to say how the bits representing colour are mapped
> > to the 16/18/24 lines of the parallel interface would need a different
> > binding pattern.
>
> There's only a few data format in LVDS, so it's ok. A DPI interface is
> much more free-form, so you need to be a bit more accurate than what is
> done for LVDS.
>
> Maxime
