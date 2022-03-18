Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C64DE090
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3B10E02F;
	Fri, 18 Mar 2022 17:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6FA10E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:54:03 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w4so11118323edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UT8PNCzA3IItBoYnttpNx5idM0QeCX4IpB+/K2rBDO0=;
 b=KKmC4lEFDfhYC3imlGFoNNxJoclbkT+mVaqH8eitHCCzI1uIHjlrSBZpzq+BQm7hlJ
 Eb0viOGMtrShIUfsJeX1ZWRLOr0OD3CNXwugt6nXYa4CRM8ry7Y+pwsPVW8nBJym0XzJ
 r30exQSNS503BsYHXzVXJcpUhuMrxxw3e7pa+hwAB8tXPvH1AlQlXuOoKQ9EFx+Cf1Iv
 dh5u4Xk6wwR8PoGrgMR93Gp+NMxLXMPPNNAKJYxbr/xK7SPHYrM7LDdltZt3QC3uPlpj
 bvs/S67YkpROUjvRfgmgWwXOv4IvNZsRLEMxeSYTfjetz0cnmnfhl2cPeUt41SEuklZk
 Hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UT8PNCzA3IItBoYnttpNx5idM0QeCX4IpB+/K2rBDO0=;
 b=ypGt+zuihH7kcrdJrE4XJS+xeDfBVV1Fr5Ln6355G4rpFKKcc48AGipP+0zZsQsfWj
 kIEdqmoidz3XMxQWqdhFT8ocier+cjrlABlQBnZ58nUy2IG3aIuA19hlsD46vm/sn5+k
 iBAK89tLN65ACVuEhs9qI7bK8MjKwSfTHF5f857z2Otkpiqe50ZXMg+PorkdUhypWg7x
 c2LLJEU9TBSwAvYqjkd3QLl7qltmzr4Sa2lRb/+WvkKiltTInia1DbSPxCX9KAzTVlRw
 VMV+u2WXKbNQnFNHhhBDzgyVVRpEWR6lcsfkskYKAw8mXDxsWsA0MAa0Nl+pFE4u9XXp
 mKrg==
X-Gm-Message-State: AOAM5319nFE6vMmvXoaIg6H8rbHxEpePq2XbzL4MysCHhFfpI9ykHGz3
 +pRpTbMzHOLimLZdhq80Sfib04mN4KQbzPSj8QNAXg==
X-Google-Smtp-Source: ABdhPJzzfuMMmNYAIvLsb2PtA86IccICE/l9TE1VcseaMAO0nRXeiDcSTFMkAxWQEfNWGMlmk5CppHt3p/eKDUv88kA=
X-Received: by 2002:aa7:c683:0:b0:418:f5f3:9684 with SMTP id
 n3-20020aa7c683000000b00418f5f39684mr10371293edq.184.1647626041528; Fri, 18
 Mar 2022 10:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
In-Reply-To: <20220318171642.y72eqf5qbmuu2ln2@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Mar 2022 17:53:45 +0000
Message-ID: <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
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

On Fri, 18 Mar 2022 at 17:16, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> > > > >
> > > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > > Hi,
> > > > >
> > > > > Hi,
> > > > >
> > > > > > Please try to avoid top posting
> > > > Sorry.
> > > >
> > > > > >
> > > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > > > >> The goal here is to set the element bus_format in the struct
> > > > > >> panel_desc. This is an enum with the possible values defined in
> > > > > >> include/uapi/linux/media-bus-format.h.
> > > > > >>
> > > > > >> The enum values are not constructed in a way that you could calculate
> > > > > >> the value from color channel width/shift/mapping/whatever. You rather
> > > > > >> would have to check if the combination of color channel
> > > > > >> width/shift/mapping/whatever maps to an existing value and otherwise
> > > > > >> EINVAL out.
> > > > > >>
> > > > > >> I don't see the value in having yet another way of how this
> > > > > >> information can be specified and then having to write a more
> > > > > >> complicated parser which maps the dt data to bus_format.
> > > > > >
> > > > > > Generally speaking, sending an RFC without explicitly stating what you
> > > > > > want a comment on isn't very efficient.
> > > > >
> > > > > Isn't that what RFC stands for -- Request For Comment ?
> > > >
> > > > I hoped that the link to the original discussion was enough.
> > > >
> > > > panel-simple used to have a finite number of hardcoded panels selected
> > > > by their compatible.
> > > > The following patchsets added a compatible 'panel-dpi' which should
> > > > allow to specify the panel in the device tree with timing etc.
> > > >   https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
> > > > In the same release cycle part of it got reverted:
> > > >   https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
> > > > With this it is no longer possible to set bus_format.
> > > >
> > > > The explanation what makes the use of a property "data-mapping" not a
> > > > suitable way in that revert
> > > > is a bit vague.
> > >
> > > Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> > > example. Chances are the DPI interface will use a 24 bit bus, so where
> > > is the padding?
> > >
> > > I think that's what Sam and Laurent were talking about: there wasn't
> > > enough information encoded in that property to properly describe the
> > > format, hence the revert.
> >
> > MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
> > padding. "bgr666" was selecting that media bus code (I won't ask about
> > the rgb/bgr swap).
> >
> > If there is padding on a 24 bit bus, then you'd use (for example)
> > MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
> > colour are the padding. Define and use a PADLO variant if the padding
> > is the low bits.
>
> Yeah, that's kind of my point actually :)

Ah, OK :)

> Just having a rgb666 string won't allow to differentiate between
> MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both are
> RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 and
> then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
> string but that usually leads to inconsistent or weird names, so this
> isn't ideal.
>
> > The string matching would need to be extended to have some string to
> > select those codes ("lvds666" is a weird choice from the original
> > patch).
> >
> > Taking those media bus codes and handling them appropriately is
> > already done in vc4_dpi [1], and the vendor tree has gained
> > BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> > mainline.
> >
> > Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
> > defines needed, but that's the downside of having defines for all
> > formats.
> >
> > (I will admit to having a similar change in the Pi vendor tree that
> > allows the media bus code to be selected explicitly by hex value).
>
> I think having an integer value is indeed better: it doesn't change much
> in the device tree if we're using a header, it makes the driver simpler
> since we don't have to parse a string, and we can easily extend it or
> rename the define, it won't change the ABI.
>
> I'm not sure using the raw media bus format value is ideal though, since
> that value could then be used by any OS, and it would effectively force
> the mbus stuff down their throat.

I'll agree that the media bus format isn't the nicest, but I was
looking for a quick fix that could be configured from an overlay.

If using defines, then possibly go for a partial bitmask?
3 bits for RGB order can be defined across the board. An encoding of
the bus width. And then the packing within that bus width would have
to be a lookup table, with no padding, padhi, and padlo being defined
as 0, 1, and 2 respectively. >=3 are extensions per bus width.
MEDIA_BUS_FMT_RGB666_1X24_CPADHI might then be described as ORDER_RGB
| BUS_24 | PAD_HI.
And MEDIA_BUS_FMT_BGR666 as ORDER_BGR | BUS_18 | NO_PAD.

Hmm, a bit more thought needed for RGB565, as a bus width of 16
wouldn't guarantee that.

  Dave
