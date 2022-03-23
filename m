Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA34E50E2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D310E699;
	Wed, 23 Mar 2022 11:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Wed, 23 Mar 2022 08:50:13 UTC
Received: from nx5.node01.servicehoster.ch (nx5.node01.servicehoster.ch
 [194.191.24.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE310E62E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:50:13 +0000 (UTC)
Received: from mailcluster2a.servicehoster.ch ([194.191.24.193])
 by node01.servicehoster.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <max.krummenacher@active.ch>)
 id 1nWwZO-00AssC-Ts; Wed, 23 Mar 2022 09:42:25 +0100
X-SecureMailgate-Identity: max.krummenacher@active.ch;
 mailcluster2a.servicehoster.ch
Received: from Saturn.fritz.box (unknown [194.191.225.82])
 (Authenticated sender: max.krummenacher@active.ch)
 by mailcluster2a.servicehoster.ch (Postfix) with ESMTPSA id CB5F1280B1E;
 Wed, 23 Mar 2022 09:42:11 +0100 (CET)
Message-ID: <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
From: Max Krummenacher <max.krummenacher@active.ch>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard
 <maxime@cerno.tech>
Date: Wed, 23 Mar 2022 09:42:11 +0100
In-Reply-To: <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
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
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: 194.191.24.193
X-SpamExperts-Domain: mailcluster2.servicehoster.ch
X-SpamExperts-Username: 194.191.24.193
Authentication-Results: servicehoster.ch; auth=pass
 smtp.auth=194.191.24.193@mailcluster2.servicehoster.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.08)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+mNrXjdnEdHzLTkSqGI4iIPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5yvUezdNljdXyX/cs+SFGk7LkTDNBh6jJJKm8FuXfRJZ2Jz
 p3lNakgf5J47FmsD1TbSPslv0jTgYtIvY8V0I5Br60K1dx2ySzgygIOFCiyffGdzVm+qrMxDYiwp
 dJqAx7DKgW6oETcVUil/rv4MdMWLi8TdX3d2lJKosXCBST5ZTSeEJVW0u0DmCen7lqF9/YgzsHYi
 pclr2BmVn3xAG779rtyy7k4695/fxkzEz8p7DGB07n5NqAnUcKzSfG77X4DDUaAEY27EoqWG+kRY
 CG+EHyxxk8Sjs3o9/k8nLBnptKosbLXBoa11WG2P6orhBuen1axO80gjKDZCw8vGagTsvjw3UMZ3
 mKyIj3bPgNKiKUm00qokcizqGXDlFhJUcxluTIxrk/DLBtkPx3Zw0hQIRnUZlKFSJrdU9cma+kqz
 ezz2IADHvOQ8sNe6K/SDpK477zoTHjmCBkxNiEW+p0MJblEa+IFtb/eqEHmttFfxKw3/6jQbn8ai
 MRn5UxSU9z6QfTinDpIWHKzxFJNvb4GiYMvn+MY8spvEANqgSG9q4Y2jaANDUzyZYtdgftxFqNOi
 /TvkFsMIdEy1NMPLedfEF4k4D7q+0m0dIbLYIPkWU9kZ1vqKv2kkpXyWtsWMH2a89gIZj2SS8FVq
 Owk3UuoEVdNAGwH0pjoKxnSMN4OjhBHyALeV2k6+lXA6hlWIisheBz6Mv0ZDO8nwRrNw9bg/srPU
 JQ8ngT7viZuexmI2viabsfRx4e7LLFIZzYf71k3vg38/N7wk0VJ5ENJeABDG9bq7Q7apcd56Fvex
 2jwzRh3TepsEfHe3s6WSdDs1rIKW4v2kTVOQz1TnBXE7Vu6mmpHY0PxxMEdwRyQinyMDMLJK5Eyb
 QcxaGdeTstr8Iq0SkKBVDuQczOmmTmE2PhQD7PXdVeylCRYE+XLO6afZYnzcuAP15er95HggPbIX
 t1mVIXEkspas1Qp+43w57d7mCVcV1pRwGFyEirfbRiMcgdezYqxGMqsKjARq8PBC4qgPRpLHXu5q
 zw5Ha1KwMUW9J/aULxz+zIh9/b7lFAi/tw640VD7l4Yggj+qBcHeC/YpOMQJvQ/Ck3iiU+4DQAj3
 Mh0rAdqV2vAZNNU5F2Ewrg7h/fw/bmJkjw2ET2AXTb3e2y+JM5gVKVDsXEqwXdgJWr3TYb+hme2C
 GQvJWs+gytD8VGI2PGyTJN54qIrxbK095Ri/7zKFoA7PoOGdoWEFHQ0M+fCAnF2jY27uRBa9YbzC
 XiZYIXP7uHBqCzR38IVuwgR8m2U7sFDwAM9lylRYVPIjw51VbrQxBwAU6B3t/lSt60m+YgnqP0gC
 Ov3dCcrWfF4r5sRpJwo2H6cJUtQ4+TypG/8aX3QFWuVBLYssBCG7X+t1TW39Ja77LGPpOwDuOZFQ
 ygKfVF1qJcMcfNTFBrEBToD/57/mc/uuT4HgzcC+RZbVccXAyirJ+G8YjRbDl4UujAgzopkKbLjv
 MM2mFL8nSJHBlAy1LZxoJoKpzEwZVUape5IgNZlRl5Qyn7QuJ7Z7bgUj/8mLhg1vFIZJIHzzeuJ1
 hF3evSWOg6WPI+WrjJM1z/XiXExD+4pm0h71RNnc/QBNNrDTLfP4HQ0+Id4Ul8evRvQH4CJHf3bt
 XQ==
X-Report-Abuse-To: spam@node01.servicehoster.ch
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Reply-To: max.krummenacher@gmx.de
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
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

Am Freitag, den 18.03.2022, 17:53 +0000 schrieb Dave Stevenson:
> On Fri, 18 Mar 2022 at 17:16, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Mar 18, 2022 at 05:05:11PM +0000, Dave Stevenson wrote:
> > > Hi Maxime
> > > 
> > > On Fri, 18 Mar 2022 at 16:35, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > On Mon, Mar 07, 2022 at 04:26:56PM +0100, Max Krummenacher wrote:
> > > > > On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
> > > > > > On 3/2/22 15:21, Maxime Ripard wrote:
> > > > > > > Hi,
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > > Please try to avoid top posting
> > > > > Sorry.
> > > > > 
> > > > > > > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> > > > > > > > The goal here is to set the element bus_format in the struct
> > > > > > > > panel_desc. This is an enum with the possible values defined in
> > > > > > > > include/uapi/linux/media-bus-format.h.
> > > > > > > > 
> > > > > > > > The enum values are not constructed in a way that you could calculate
> > > > > > > > the value from color channel width/shift/mapping/whatever. You rather
> > > > > > > > would have to check if the combination of color channel
> > > > > > > > width/shift/mapping/whatever maps to an existing value and otherwise
> > > > > > > > EINVAL out.
> > > > > > > > 
> > > > > > > > I don't see the value in having yet another way of how this
> > > > > > > > information can be specified and then having to write a more
> > > > > > > > complicated parser which maps the dt data to bus_format.
> > > > > > > 
> > > > > > > Generally speaking, sending an RFC without explicitly stating what you
> > > > > > > want a comment on isn't very efficient.
> > > > > > 
> > > > > > Isn't that what RFC stands for -- Request For Comment ?
> > > > > 
> > > > > I hoped that the link to the original discussion was enough.
> > > > > 
> > > > > panel-simple used to have a finite number of hardcoded panels selected
> > > > > by their compatible.
> > > > > The following patchsets added a compatible 'panel-dpi' which should
> > > > > allow to specify the panel in the device tree with timing etc.
> > > > >   
> > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
> > > > > In the same release cycle part of it got reverted:
> > > > >   
> > > > > https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
> > > > > With this it is no longer possible to set bus_format.
> > > > > 
> > > > > The explanation what makes the use of a property "data-mapping" not a
> > > > > suitable way in that revert
> > > > > is a bit vague.
> > > > 
> > > > Indeed, but I can only guess. BGR666 in itself doesn't mean much for
> > > > example. Chances are the DPI interface will use a 24 bit bus, so where
> > > > is the padding?
> > > > 
> > > > I think that's what Sam and Laurent were talking about: there wasn't
> > > > enough information encoded in that property to properly describe the
> > > > format, hence the revert.

I agree that the strings used to set "data-mapping" weren't self explaining.
However, as there was a
clear 1:1 relation to the bus_format value the meaning
wasn't ambiguous at all.

> > > 
> > > MEDIA_BUS_FMT_RGB666_1X18 defines an 18bit bus, therefore there is no
> > > padding. "bgr666" was selecting that media bus code (I won't ask about
> > > the rgb/bgr swap).
> > > 
> > > If there is padding on a 24 bit bus, then you'd use (for example)
> > > MEDIA_BUS_FMT_RGB666_1X24_CPADHI to denote that the top 2 bits of each
> > > colour are the padding. Define and use a PADLO variant if the padding
> > > is the low bits.
> > 
> > Yeah, that's kind of my point actually :)
> 
> Ah, OK :)
> 
> > Just having a rgb666 string won't allow to differentiate between
> > MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI: both are
> > RGB666 formats. Or we could say that it's MEDIA_BUS_FMT_RGB666_1X18 and
> > then when we'll need MEDIA_BUS_FMT_RGB666_1X24_CPADHI we'll add a new
> > string but that usually leads to inconsistent or weird names, so this
> > isn't ideal.

We're on the same page that the strings that were used aren't self
explaining and do not follow a pattern which would make it easy to
extend. However that is something I addressed in my RFC proposal, not?

> > 
> > > The string matching would need to be extended to have some string to
> > > select those codes ("lvds666" is a weird choice from the original
> > > patch).
> > > 
> > > Taking those media bus codes and handling them appropriately is
> > > already done in vc4_dpi [1], and the vendor tree has gained
> > > BGR666_1X18 and BGR666_1X24_CPADHI [2] as they aren't defined in
> > > mainline.
> > > 
> > > Now this does potentially balloon out the number of MEDIA_BUS_FMT_xxx
> > > defines needed, but that's the downside of having defines for all
> > > formats.
> > > 
> > > (I will admit to having a similar change in the Pi vendor tree that
> > > allows the media bus code to be selected explicitly by hex value).
> > 
> > I think having an integer value is indeed better: it doesn't change much
> > in the device tree if we're using a header, it makes the driver simpler
> > since we don't have to parse a string, and we can easily extend it or
> > rename the define, it won't change the ABI.

Fine with me.

> > 
> > I'm not sure using the raw media bus format value is ideal though, since
> > that value could then be used by any OS, and it would effectively force
> > the mbus stuff down their throat.

I disagree here, this forces us to use code to map the device tree enum
to the kernel enum for Linux, i.e. adds complexity and maintenance work
if additional bus_formats are needed.
Assuming there is another OS which uses the device tree it would not
make a difference, that OS would still need to map the device tree enum
to the corresponding representation in their kernel.
I would copy the definitions of media-bus-format.h into a header in
include/dt-bindings similarly as it is done for
include/dt-bindings/display/sdtv-standards.h for TV standards.

> 
> I'll agree that the media bus format isn't the nicest, but I was
> looking for a quick fix that could be configured from an overlay.
> 
> If using defines, then possibly go for a partial bitmask?
> 3 bits for RGB order can be defined across the board. An encoding of
> the bus width. And then the packing within that bus width would have
> to be a lookup table, with no padding, padhi, and padlo being defined
> as 0, 1, and 2 respectively. >=3 are extensions per bus width.
> MEDIA_BUS_FMT_RGB666_1X24_CPADHI might then be described as ORDER_RGB
> > BUS_24 | PAD_HI.
> And MEDIA_BUS_FMT_BGR666 as ORDER_BGR | BUS_18 | NO_PAD.
> 
> Hmm, a bit more thought needed for RGB565, as a bus width of 16
> wouldn't guarantee that.

I disagree here, I don't see value in that structuring. It won't
help us mapping it to the corresponding bus_format enum and it
might be incomplete for bus_formats added in the future. 
E.g. besides your RGB565 example consider a Tegra 30 which for RGB666
outputs them on [23:8] and for RGB888 the 6 most significant bits are
kept in [23:8], the 2 least significant ones in [7:0]. That wouldn't
fit in this structured enum you propose, however one could easily add
a new consecutive number to the enum.

Max

> 
>   Dave

