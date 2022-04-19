Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10B506B68
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 13:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11A10F10B;
	Tue, 19 Apr 2022 11:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDFD10F10B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 11:50:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z12so20916847edl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 04:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZEKocZ1WeeQPWz+0zcCJfqiWJmuXcX8RfCArfUXeTms=;
 b=iwIeMkdFBEK2WnhpEI6x0f3boqze0JRzG0JHYW3Vc2UuuExxRjA9kptcRAbb2hgV97
 ofTSh7eXug1YuVxKaG0+415bl9T08Pyx2l9T/1p03C+eq3h+iYlxxB2QFm+FYHSzAL7X
 6euQBWr+IZ0UPmFM2Ywq3PkU8OM/eLwlL73z19LUXpPN+g6c3BjH1dEbtZXXsVXX5HuL
 BeaXd7xil72eAkWK0IPx7Ko7VpoP2ayrp/zcsZhPyTCJu1cMjmBV26hkDSVsIUiTe/aS
 9+Q216ZFVaTeNhF5Ljuj0lcKM5wDpTmMPf6t8UR2ToeNlNViYRIMsLeiKlDW4gTgVW5h
 wdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZEKocZ1WeeQPWz+0zcCJfqiWJmuXcX8RfCArfUXeTms=;
 b=AOSThHVBn33jvUinyk69rbXe8nFCITbNb75NwHj0ss3/4dS3HoLxYM+V4rXN5nSz7p
 599yVeLBQMIcqWxiVeSO6rYz3iAn8DrjUa0cljnTULi46O887CLbrxqs0itOoalqLIiJ
 //dU7s1FwjUwIsCxsGBWNP6TG3WNLhR8OLR+6+wAC2PW3Q02blQvcRqjECBVwwYD4oxW
 h+VjrAeO7ebMM0FOBoijtTUb701bUo4dMmtJ3hex2neL1xG7IFcwMVUrjCcLJfjgiQlB
 TvXEcNUKiK+JXcrONNvbPFcWnaM+aNhcOQ8xfJ8VeJ+haRuBhH36M5X+dxBxpakaYSz8
 ZecA==
X-Gm-Message-State: AOAM533a2MHJZM+z9lD47afAWntRXAHSGer4aJT5Vrqs8s+UdZ+KBa3E
 iKP+uAoXhGAZcn7xvm4D/NU=
X-Google-Smtp-Source: ABdhPJwOEmiGA+G1S1+4YHQGaYmWW6VC0kWOg2T/KSgrWfZQL/qG7T0pYnQPaPhxWaB5a4FLqfpDPQ==
X-Received: by 2002:a05:6402:1ac4:b0:41d:83d1:9da7 with SMTP id
 ba4-20020a0564021ac400b0041d83d19da7mr16969195edb.272.1650369002904; 
 Tue, 19 Apr 2022 04:50:02 -0700 (PDT)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id
 jl28-20020a17090775dc00b006e05cdf3a95sm5618600ejc.163.2022.04.19.04.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:50:02 -0700 (PDT)
Message-ID: <71ef1b35301330d0bbb64844247b6c4c2237ad1c.camel@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
From: Max Krummenacher <max.oss.09@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>
Date: Tue, 19 Apr 2022 13:50:01 +0200
In-Reply-To: <YlB7tDZQqU8xjvmm@pendragon.ideasonboard.com>
References: <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
 <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
 <20220323155817.xcsqxothziot7ba3@houat>
 <ab2db55f6dedba76cd112e4bbc43cf8a7e4332a3.camel@gmail.com>
 <YlB7tDZQqU8xjvmm@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>, Maxime Ripard <maxime@cerno.tech>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, den 08.04.2022, 21:15 +0300 schrieb Laurent Pinchart:
> On Wed, Mar 23, 2022 at 09:06:18PM +0100, Max Krummenacher wrote:
> > Am Mittwoch, den 23.03.2022, 16:58 +0100 schrieb Maxime Ripard:
> > > On Wed, Mar 23, 2022 at 09:42:11AM +0100, Max Krummenacher wrote:
> > > > Am Freitag, den 18.03.2022, 17:53 +0000 schrieb Dave Stevenson:
> > > > > On Fri, 18 Mar 2022 at 17:16, Maxime Ripard wrote:
> > > > > > On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> > > > > > > On Fri, 18 Mar 2022 at 16:35, Maxime Ripard wrote:
> > > > > > > > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > > > > > > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut wrote:
> > > > > > > > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > > > > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > > > > > > > > > > The goal here is to set the element bus_format in the struct
> > > > > > > > > > > > panel_desc. This is an enum with the possible values defined in
> > > > > > > > > > > > include/uapi/linux/media-bus-format.h.
> > > > > > > > > > > > 
> > > > > > > > > > > > The enum values are not constructed in a way that you could calculate
> > > > > > > > > > > > the value from color channel width/shift/mapping/whatever. You rather
> > > > > > > > > > > > would have to check if the combination of color channel
> > > > > > > > > > > > width/shift/mapping/whatever maps to an existing value and otherwise
> > > > > > > > > > > > EINVAL out.
> > > > > > > > > > > > 
> > > > > > > > > > > > I don't see the value in having yet another way of how this
> > > > > > > > > > > > information can be specified and then having to write a more
> > > > > > > > > > > > complicated parser which maps the dt data to bus_format.
> > > > > > > > > > > 
> > > > > > > > > > > Generally speaking, sending an RFC without explicitly stating what you
> > > > > > > > > > > want a comment on isn't very efficient.
> > > > > > > > > > 
> > > > > > > > > > Isn't that what RFC stands for -- Request For Comment ?
> > > > > > > > > 
> > > > > > > > > I hoped that the link to the original discussion was enough.
> > > > > > > > > 
> > > > > > > > > panel-simple used to have a finite number of hardcoded panels selected
> > > > > > > > > by their compatible.
> > > > > > > > > The following patchsets added a compatible 'panel-dpi' which should
> > > > > > > > > allow to specify the panel in the device tree with timing etc.
> > > > > > > > >   
> > > > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
> > > > > > > > > In the same release cycle part of it got reverted:
> > > > > > > > >   
> > > > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
> > > > > > > > > With this it is no longer possible to set bus_format.
> > > > > > > > > 
> > > > > > > > > The explanation what makes the use of a property "data-mapping" not a
> > > > > > > > > suitable way in that revert
> > > > > > > > > is a bit vague.
> > > > > > > > 
> > > > > > > > Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> > > > > > > > example. Chances are the DPI interface will use a 24 bit bus, so where
> > > > > > > > is the padding?
> > > > > > > > 
> > > > > > > > I think that's what Sam and Laurent were talking about: there wasn't
> > > > > > > > enough information encoded in that property to properly describe the
> > > > > > > > format, hence the revert.
> > > > 
> > > > I agree that the strings used to set "data-mapping" weren't self explaining.
> > > > However, as there was a
> > > > clear 1:1 relation to the bus_format value the meaning
> > > > wasn't ambiguous at all.
> > > > 
> > > > > > > MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
> > > > > > > padding. "bgr666" was selecting that media bus code (I won't ask about
> > > > > > > the rgb/bgr swap).
> > > > > > > 
> > > > > > > If there is padding on a 24 bit bus, then you'd use (for example)
> > > > > > > MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
> > > > > > > colour are the padding. Define and use a PADLO variant if the padding
> > > > > > > is the low bits.
> > > > > > 
> > > > > > Yeah, that's kind of my point actually :)
> > > > > 
> > > > > Ah, OK :)
> > > > > 
> > > > > > Just having a rgb666 string won't allow to differentiate between
> > > > > > MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both are
> > > > > > RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 and
> > > > > > then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
> > > > > > string but that usually leads to inconsistent or weird names, so this
> > > > > > isn't ideal.
> > > > 
> > > > We're on the same page that the strings that were used aren't self
> > > > explaining and do not follow a pattern which would make it easy to
> > > > extend. However that is something I addressed in my RFC proposal, not?
> > > > 
> > > > > > > The string matching would need to be extended to have some string to
> > > > > > > select those codes ("lvds666" is a weird choice from the original
> > > > > > > patch).
> > > > > > > 
> > > > > > > Taking those media bus codes and handling them appropriately is
> > > > > > > already done in vc4_dpi [1], and the vendor tree has gained
> > > > > > > BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> > > > > > > mainline.
> > > > > > > 
> > > > > > > Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
> > > > > > > defines needed, but that's the downside of having defines for all
> > > > > > > formats.
> > > > > > > 
> > > > > > > (I will admit to having a similar change in the Pi vendor tree that
> > > > > > > allows the media bus code to be selected explicitly by hex value).
> > > > > > 
> > > > > > I think having an integer value is indeed better: it doesn't change much
> > > > > > in the device tree if we're using a header, it makes the driver simpler
> > > > > > since we don't have to parse a string, and we can easily extend it or
> > > > > > rename the define, it won't change the ABI.
> > > > 
> > > > Fine with me.
> 
> I'm fine with integers too. Strings give the false impression that new
> values can be added with a lower risk of a conflict, but that just a
> false impression.
> 
> > > > > > I'm not sure using the raw media bus format value is ideal though, since
> > > > > > that value could then be used by any OS, and it would effectively force
> > > > > > the mbus stuff down their throat.
> > > > 
> > > > I disagree here, this forces us to use code to map the device tree enum
> > > > to the kernel enum for Linux, i.e. adds complexity and maintenance work
> > > > if additional bus_formats are needed.
> > > > Assuming there is another OS which uses the device tree it would not
> > > > make a difference, that OS would still need to map the device tree enum
> > > > to the corresponding representation in their kernel.
> > > 
> > > So, you don't want to do something in Linux, but would expect someone
> > > else to be completely ok with that?
> > 
> > Yes, sort of.
> > Recycling the values as used currently in the Linux kernel rather than
> > inventing a new numbering will make the Linux code a little easier to
> > write, read and maintain without any negative effect on how that other
> > OSs would have to map the DT representation to their internal representation.
> > 
> > Would you rather have something like:
> > 
> > <the common dt-bindings header file>
> > DT_BUS_FMT_RGB666_1X18	1
> > DT_BUS_FMT_RGB888_1X24	2
> > ...
> > 
> > <panel-simple.c>
> > switch (bus-format) {
> > case DT_BUS_FMT_RGB666_1X18:
> >   bus_format = MEDIA_BUS_FMT_RGB666_1X18; break;
> > case DT_BUS_FMT_RGB888_1X24:
> >   bus_format = MEDIA_BUS_FMT_RGB888_1X24; break;
> > ...
> 
> I'm having a bit of trouble providing comments on this RFC, because I
> don't believe I have a good enough overview of the different cases we
> need to support (and in particular the corner cases). Max, you mentioned
> an interesting one on Tegra platforms, would you maybe have a short (or
> long, who knows) list of use cases you need to support now, or just know
> about ? I think it would be easier to discuss the problem and the best
> solution with concrete examples.
> 
> One particular thing that needs to be taken into account is that not all
> devices (I'm talking about both the panel side and the source side) use
> a data bus with contiguous bits. How to map a format to D[23:0] is one
> thing, but there are devices that document pins as R[7:0], G[7:0],
> B[7:0] (possibly with some permutations of the components). It's quite
> easy to map between those two representations, once a mapping is
> defined. I'd like these things to be considered explicitly instead of
> relying on an implicit shared knowledge, as in my experience implicit
> rules lead to one version per participant in the conversation :-)


Panels:

Our customers only report panels with either 18 bit or 24 bit color
depth. So those panels have pins for R[7:0], G[7:0], B[7:0] or pins
for R[5:0], G[5:0], B[5:0].
By not connectiong LSBs of each color they can of course also be
connected to a controller which provides not all colors, e.g. a 24 bit
color panel can be connected to a 18 or 16 bit controller. The
same with a 18 bit color panel which can be connected to a 24 bit
controller by not connecting the LSBs of the controller.

Note that in the current panel-simple.c the common panels use one of:
- MEDIA_BUS_FMT_RGB565_1X16
- MEDIA_BUS_FMT_RGB666_1X18
- MEDIA_BUS_FMT_RGB888_1X24
Only two panel use an exotic bus format, giantplus_gpm940b0 uses three
bus cycles each 8 bit wide, MEDIA_BUS_FMT_RGB888_3X8.
The ti_nspire_classic_lcd_panel uses a 8 bit wide black and white
format MEDIA_BUS_FMT_Y8_1X8.


Controllers:

The data source provides usually up to 24 data lines with a
configurable assignment of the color info to these lines.

The controller side (and their Linux drivers) allow generally for
the following mappings (checked i.MX6 IPU, i.MX7 LCDIF, RPi vc4) with
the HW sometimes being more flexible but not reflected in SW:

23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
MEDIA_BUS_FMT_RGB888_1X24
R7                   R0|G7                   G0|B7                   B0|
MEDIA_BUS_FMT_RGB666_1X18
N/A              |R5             R0|G5             G0|B5             B0|
MEDIA_BUS_FMT_RGB565_1X16
N/A                     |R4          R0|G5            G0|B4          B0|

They allow to swap the color from their default RGB to
RBG/GRB/GBR/BRG/BGR but the drivers usually only support RGB and maybe a
limited subset of the other combinations.

A stm32mp1 provides exclusively MEDIA_BUS_FMT_RGB888_1X24 without
any color swapping.

A Tegra30 provides additonally a format like this, i.e. a second RGB888
mapping, sort of like JEIDA vs. SPWG in 24bit LVDS:
R1 R0 G1 G0 B1 B0|R7             R2|G7             G2|B7             B2|

Unused lines can usually be used for something different through a
different pin configuration.

[1] documents the currently defined bus formats along with the mapping.


Connection:

The connection between the controller and the panel is usually done
with FFC flat cables or the likes. At best panels from one manufacturer
share a common pinout on that FFC cables if at all.
It's the HW designers job to create a pinout which fits the panel with
one of the available mappings the controller is able to provide.

The decision for which mapping to use depends for one on the panel
color depth of course.
For panels with less than 24 bits of color maybe the HW designer wants
alternate functions only available on certain pins being available.
Additionally using something other than the RGB order of the colors
(RBG, BGR ...) might ease the layout job.


(My) Conclusion:

It makes sense to describe the bus format as a enumeration. Whatever
fancy mapping a current or future controller might be able to provide
just add a sensible new enum element and use that in the controllers
driver. This is also what the Linux kernel today is using.

For the device tree, trying to break the possible mappings into
orthogonal structure elements (order RGB, BGR ...), color width
(888, 565 ...), alignment (Hi, Low ...) may not fit in some corner
case, the T30 one above a real world example.
Defining the full mapping (D0 -> B0, D1 -> B1, ...) seems to become
an unreadable data blob which in the Linux case will be additionally
a mess to translate into the Linux kernel bus format enum.

So my proposal still is to add a dts property which defines the used
bus format as an enum. Feedback already is to use a number together
with a header file giving a macro for each used bus format rather
than using strings.
I would use a new property name bus-format = <DT_MEDIA_BUS_FMT_RGB666_1X18>;
with a new binding header file with e.g.
```
#define DT_MEDIA_BUS_FMT_RGB565_1X16           0x1017
#define DT_MEDIA_BUS_FMT_RGB666_1X18           0x1009
#define DT_MEDIA_BUS_FMT_RBG888_1X24           0x100a
 ...
```
I have no strong opinion on using the Linux numbering for the enum
elements, so I would also be fine with starting from 0.

Max

[1] 
https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats

> 
> > > > I would copy the definitions of media-bus-format.h into a header in
> > > > include/dt-bindings similarly as it is done for
> > > > include/dt-bindings/display/sdtv-standards.h for TV standards.
> > > 
> > > That might not be an option: that header is licensed under the GPL,
> > > device trees are usually licensed under GPL+MIT, and we don't have any
> > > requirements on the license for other projects using a DT (hence the
> > > dual license).
> > 
> > That one I didn't consider. That would be solved by a newly invented
> > enum.

