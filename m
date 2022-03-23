Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F404E598F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004B110E0E7;
	Wed, 23 Mar 2022 20:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4896B10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 20:06:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z92so3155523ede.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0meBw1PFo/61ZIFhBS5OBWfvMeyRYDdihNqds4tJj2w=;
 b=pUfXYawsuww0SW3Jz284kck7niEROJjRyztknyIwcaOwxwhM4ORa7YBpE0t1f2Iyok
 ttVazoxjnaRqgJpa/8peW1uXYjg4mPHjasc5JvvbLalY4HrqoJSqYDXDHnkq1hyx8ffq
 12ZTEO6+iB89XfrB3dqWpg7eRTtklvaQb/5A1MDDVEeRgSoUAI5Pxu/KruIcGO+Ikkne
 RAj3t0hphxFyYXxX8DYP5hqsHmF3MZKHAn3XRdhgRMObLoUqkRYzKq04gLAjBgSjOnBs
 M5fM0Gg+pBR35312Snm3atUVELX6NAqMJXh6WNe0XWzICgjlDtOqm3PCnRgHLQGAorAe
 fwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0meBw1PFo/61ZIFhBS5OBWfvMeyRYDdihNqds4tJj2w=;
 b=tcSHNhpq2moAU3k45n9MNCvvQPxieNTz3MF1BSDQGRSNkx7s08blousqYmxbq86kvx
 e/1SNaOtjnDt2W9fGE/T0AxZBD+w10o3wQQcASdYpG2WnU74xx8NL+eL3Mz7DnppeqXs
 4swRvI2YWmELFitjS3qwYnbah0g9CYg6E2utsWaMGaF+ipCYMu4Ldp97/J+zBk3DIXqN
 yIAZCXqKq+4JN7ZOLkPHNTWbJdFuBHO+kFGcZztgf/4m9swVf2xQx4Q6CmMPdCmAtBGf
 NH9InhexpWd01wea+E7XZuVKRk/9cRStwfKutOvQvYHYUffrLKFjUXppTy84bwW8IIOL
 Qwiw==
X-Gm-Message-State: AOAM5311nFfhP9Ft5ntqN2hcs2qj8blNL9G/nkl+KruYNqNJUIaNWCU7
 WAzDKNpQa/pdoI35zfrDieM=
X-Google-Smtp-Source: ABdhPJx6yisZ2ZRH0No/tK+z6ABSrVeT+l5zyANSiInUuoI6R7qaz/WBqVNpRCc5lrA5STgC/zvFXw==
X-Received: by 2002:a05:6402:370b:b0:413:3bcd:3d0e with SMTP id
 ek11-20020a056402370b00b004133bcd3d0emr2358800edb.178.1648065981596; 
 Wed, 23 Mar 2022 13:06:21 -0700 (PDT)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id
 w22-20020a056402269600b004194f4eb3e7sm444683edd.19.2022.03.23.13.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 13:06:21 -0700 (PDT)
Message-ID: <ab2db55f6dedba76cd112e4bbc43cf8a7e4332a3.camel@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
From: Max Krummenacher <max.oss.09@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Mar 2022 21:06:18 +0100
In-Reply-To: <20220323155817.xcsqxothziot7ba3@houat>
References: <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
 <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
 <20220323155817.xcsqxothziot7ba3@houat>
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
 Max Krummenacher <max.krummenacher@toradex.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, den 23.03.2022, 16:58 +0100 schrieb Maxime Ripard:
> On Wed, Mar 23, 2022 at 09:42:11AM +0100, Max Krummenacher wrote:
> > Am Freitag, den 18.03.2022, 17:53 +0000 schrieb Dave Stevenson:
> > > On Fri, 18 Mar 2022 at 17:16, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> > > > > Hi Maxime
> > > > > 
> > > > > On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > > > > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> > > > > > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > > Please try to avoid top posting
> > > > > > > Sorry.
> > > > > > > 
> > > > > > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > > > > > > > > The goal here is to set the element bus_format in the struct
> > > > > > > > > > panel_desc. This is an enum with the possible values defined in
> > > > > > > > > > include/uapi/linux/media-bus-format.h.
> > > > > > > > > > 
> > > > > > > > > > The enum values are not constructed in a way that you could calculate
> > > > > > > > > > the value from color channel width/shift/mapping/whatever. You rather
> > > > > > > > > > would have to check if the combination of color channel
> > > > > > > > > > width/shift/mapping/whatever maps to an existing value and otherwise
> > > > > > > > > > EINVAL out.
> > > > > > > > > > 
> > > > > > > > > > I don't see the value in having yet another way of how this
> > > > > > > > > > information can be specified and then having to write a more
> > > > > > > > > > complicated parser which maps the dt data to bus_format.
> > > > > > > > > 
> > > > > > > > > Generally speaking, sending an RFC without explicitly stating what you
> > > > > > > > > want a comment on isn't very efficient.
> > > > > > > > 
> > > > > > > > Isn't that what RFC stands for -- Request For Comment ?
> > > > > > > 
> > > > > > > I hoped that the link to the original discussion was enough.
> > > > > > > 
> > > > > > > panel-simple used to have a finite number of hardcoded panels selected
> > > > > > > by their compatible.
> > > > > > > The following patchsets added a compatible 'panel-dpi' which should
> > > > > > > allow to specify the panel in the device tree with timing etc.
> > > > > > >   
> > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
> > > > > > > In the same release cycle part of it got reverted:
> > > > > > >   
> > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
> > > > > > > With this it is no longer possible to set bus_format.
> > > > > > > 
> > > > > > > The explanation what makes the use of a property "data-mapping" not a
> > > > > > > suitable way in that revert
> > > > > > > is a bit vague.
> > > > > > 
> > > > > > Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> > > > > > example. Chances are the DPI interface will use a 24 bit bus, so where
> > > > > > is the padding?
> > > > > > 
> > > > > > I think that's what Sam and Laurent were talking about: there wasn't
> > > > > > enough information encoded in that property to properly describe the
> > > > > > format, hence the revert.
> > 
> > I agree that the strings used to set "data-mapping" weren't self explaining.
> > However, as there was a
> > clear 1:1 relation to the bus_format value the meaning
> > wasn't ambiguous at all.
> > 
> > > > > MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
> > > > > padding. "bgr666" was selecting that media bus code (I won't ask about
> > > > > the rgb/bgr swap).
> > > > > 
> > > > > If there is padding on a 24 bit bus, then you'd use (for example)
> > > > > MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
> > > > > colour are the padding. Define and use a PADLO variant if the padding
> > > > > is the low bits.
> > > > 
> > > > Yeah, that's kind of my point actually :)
> > > 
> > > Ah, OK :)
> > > 
> > > > Just having a rgb666 string won't allow to differentiate between
> > > > MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both are
> > > > RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 and
> > > > then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
> > > > string but that usually leads to inconsistent or weird names, so this
> > > > isn't ideal.
> > 
> > We're on the same page that the strings that were used aren't self
> > explaining and do not follow a pattern which would make it easy to
> > extend. However that is something I addressed in my RFC proposal, not?
> > 
> > > > > The string matching would need to be extended to have some string to
> > > > > select those codes ("lvds666" is a weird choice from the original
> > > > > patch).
> > > > > 
> > > > > Taking those media bus codes and handling them appropriately is
> > > > > already done in vc4_dpi [1], and the vendor tree has gained
> > > > > BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> > > > > mainline.
> > > > > 
> > > > > Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
> > > > > defines needed, but that's the downside of having defines for all
> > > > > formats.
> > > > > 
> > > > > (I will admit to having a similar change in the Pi vendor tree that
> > > > > allows the media bus code to be selected explicitly by hex value).
> > > > 
> > > > I think having an integer value is indeed better: it doesn't change much
> > > > in the device tree if we're using a header, it makes the driver simpler
> > > > since we don't have to parse a string, and we can easily extend it or
> > > > rename the define, it won't change the ABI.
> > 
> > Fine with me.
> > 
> > > > I'm not sure using the raw media bus format value is ideal though, since
> > > > that value could then be used by any OS, and it would effectively force
> > > > the mbus stuff down their throat.
> > 
> > I disagree here, this forces us to use code to map the device tree enum
> > to the kernel enum for Linux, i.e. adds complexity and maintenance work
> > if additional bus_formats are needed.
> > Assuming there is another OS which uses the device tree it would not
> > make a difference, that OS would still need to map the device tree enum
> > to the corresponding representation in their kernel.
> 
> So, you don't want to do something in Linux, but would expect someone
> else to be completely ok with that?

Yes, sort of.
Recycling the values as used currently in the Linux kernel rather than
inventing a new numbering will make the Linux code a little easier to
write, read and maintain without any negative effect on how that other
OSs would have to map the DT representation to their internal representation.

Would you rather have something like:

<the common dt-bindings header file>
DT_BUS_FMT_RGB666_1X18	1
DT_BUS_FMT_RGB888_1X24	2
...

<panel-simple.c>
switch (bus-format) {
case DT_BUS_FMT_RGB666_1X18:
  bus_format = MEDIA_BUS_FMT_RGB666_1X18; break;
case DT_BUS_FMT_RGB888_1X24:
  bus_format = MEDIA_BUS_FMT_RGB888_1X24; break;
...

> 
> > I would copy the definitions of media-bus-format.h into a header in
> > include/dt-bindings similarly as it is done for
> > include/dt-bindings/display/sdtv-standards.h for TV standards.
> 
> That might not be an option: that header is licensed under the GPL,
> device trees are usually licensed under GPL+MIT, and we don't have any
> requirements on the license for other projects using a DT (hence the
> dual license).

That one I didn't consider. That would be solved by a newly invented
enum.

Max

> 
> Maxime

