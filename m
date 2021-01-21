Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE12FE539
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF27E89F06;
	Thu, 21 Jan 2021 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4307089F06
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:40:41 +0000 (UTC)
Date: Thu, 21 Jan 2021 08:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611218438;
 bh=wHJYWN+L0FZFqOYsVnSp+JCGu0MbOW5LGyytW+iiiuA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ErM583F8If0z5tA5k9WpektF1OoS66+L1DvoU5vOjlstoDDht9XfYc6/6dKVhwXmI
 f6iMj8sYRdNJ9kJyiPsfrf3xiF2oC7LCDnPcI4VQphMmKnVAemZiz/M6PxIe5GRTwK
 VhmlTe4geSsF91v4hAmCTV/8KzrzIC9fdTw9P6t6cVsF0+OMy6a52ww+47I3IlX+yf
 vxdGDTcNRpUJvc6iO4e+GBQJmDcwMQgSsZMRJmgmEGgTpsN/A4jp6UCWq/Y5I1wR4p
 RC+gdnlc7MyJYX7oktIAE0R51hHuLmmUiHLKAe1iFX/RPweVzT0PmLq4KDVDsxDqdB
 QZxUol28KOAyQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
Message-ID: <3Z19WWZiwCROiC8aR0bsJrIP7KOEC6_tOAvAfniv5qhloBUFz2VWxGFFh-JFMw7g1id2AevBrYxSAzoZ3XAnXoUTsTLe-i1qgSBAY3bhhx4=@emersion.fr>
In-Reply-To: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
 <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
 <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 USB list <linux-usb@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tyler Hardin <th020394@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, January 21st, 2021 at 9:27 AM, Daniel Vetter <daniel@ffwll.ch> wrote:

> > I would not call it USB. I could imagine that at some point a generic
> > USB protocol could serve simple displays (i.e. in the sense of USB HID
> > or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB
> > should be reserved for this case.
>
> We end up calling those DisplayPort, since that's what's being
> transported over thunderbolt or usb-C. So the usb connector would be
> called usb-C. I think the reason we don't do fancy connector names is
> that adding them is a bit a pain. Plus drm/i915 specifically has some
> very quirky connector enumerating that doesn't match much with reality
> unfortunately anyway :-/

Maybe could add "USB-C" to the list of subconnector types and use that?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
