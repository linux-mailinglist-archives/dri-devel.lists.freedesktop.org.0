Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90D2BA4F7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A759D6E88C;
	Fri, 20 Nov 2020 08:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23EE6E88C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:46:17 +0000 (UTC)
Date: Fri, 20 Nov 2020 08:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605861975;
 bh=RyQmhZrucUDvSL2oaCNyGY2R2mUyAUR4EF9c/VtXTaY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Hq7bjMMFO8YXnOEKUFXXpDnP2b0uHyyQNM5fybEgpafn1oCPyAu0qygLC5XrpHxhR
 e8d+/EkSfDsm8pDVAb3yGlDD7kYUEl4GPeCStvq3YukDZRAuxMlljzqrmdrp0AHY66
 QyZDTUMCDszpTB6bm5sL+XbzU2J4AQCBggMjQK0r0gG4RWazRaSVnFVSZORBGVrEcK
 o3AYqQpsqxDf0HcCJ5sOm97vssekF8BiqkXUcz5qf01jwKmJ1YcohAHYpfn6b7KHHq
 9y3pG3v3rBN+YJRnjHR8ct8zakgZE1EKXWBT4PtZBUltnvuz4aeSE9ElzRQuVtsiCu
 9TaVOD0hRS4rg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document drm_mode_get_connector
Message-ID: <u1OGSOQeSatIoIRKimxHe3TbFT9bM0J-Gz4xs8PT0wyBZZjSyzFYhTNlA7SHtCA8knSo8eVRIm70sLvLyKRhya7wm0X3Q4k2XVuoXhmcSx0=@emersion.fr>
In-Reply-To: <CAKMK7uHskOYggQBCuUeTY0neDCa2QvyrwUW2vsnqg_-=BtF8rw@mail.gmail.com>
References: <PwfAVfVzxSH9UbOc2njhv2b7Kislwt2Xq4HBGrGBSc@cp4-web-040.plabs.ch>
 <CAKMK7uHskOYggQBCuUeTY0neDCa2QvyrwUW2vsnqg_-=BtF8rw@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 19, 2020 4:06 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > +       /**
> > +        * @connection: Status of the connector.
> > +        *
> > +        * See enum drm_connector_status.
>
> Please add & so it becomes a link in the generated docs (and pls check
> the link goes to the right place).

Per [1], just prefixing the enum name with "enum" is enough to generate a link.
I prefer this style over the ampersand because it makes the raw text easier to
read. The result looks like this [2].

[1]: https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#cross-referencing-from-restructuredtext
[2]: https://l.sr.ht/o7Kb.png

> > +        */
> >         __u32 connection;
> > -       __u32 mm_width;  /**< width in millimeters */
> > -       __u32 mm_height; /**< height in millimeters */
> > +       /** @mm_width: Width of the connected sink in millimeters. */
> > +       __u32 mm_width;
> > +       /** @mm_height: Height of the connected sink in millimeters. */
> > +       __u32 mm_height;
> > +       /**
> > +        * @subpixel: Subpixel order of the connected sink.
> > +        *
> > +        * See enum subpixel_order.
>
> Same here.

This one doesn't generate a link, because enum subpixel_order is undocumented.
As soon as it's documented, the link will be created.

The enum is weird in the first place: it has CamelCase members and no drm_
prefix.

> With the nits addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll fix the other issues you've raised, thanks for the review!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
