Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C07558878
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 21:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8110E740;
	Thu, 23 Jun 2022 19:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE610E740
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 19:15:54 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 23so693428ybe.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icBv02YthTFvrtUFWz0nh/9bhPVkmRsemm78ezrfeog=;
 b=O+7rr+XqABJcGtIev7QuTB6drGNOp0FepFlPL9QPhSNPXGIt3f7U4DTmMg9xIEHhKZ
 uTsyrzAeqt3Tu0JjNpXw1NwLXmH8BI895ef+JPO5kn8Lr2RsyoARbK33Ko1ZYta+uF3e
 VkUFUxb84/ecefpxjKQWFURfIRjRbjiFwBW6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icBv02YthTFvrtUFWz0nh/9bhPVkmRsemm78ezrfeog=;
 b=2HxM5u2k3TnKCwPHJ2JiE2bty7R8pd/BV6AYucriW19fZtenBial2GeOnjjzT9w/Ls
 ISZlT2KjcWWTzZiL8kYYUo2iQEUQOuXIjAOPQ3AJ0veLkcnM7HRCspmIuGTbYqAwm7nn
 k5dUX+YA9jRV3rQW+70UP2/v3zCWYHZdT9cXETV1ePruEVezwh2mxNVYWmsHGiFlZP4A
 qUXitWQxvG7Fp9nqzrIhBs/2p9I04ae28ZOI2bDQA0DLJp/H8jn/dOU35nCu4WwshV9W
 g39ueD8PrIb1+yYu0oWgqL+SHB8dP2nNVQtLAe02eXCtzefr3f4Oj1DVKLcCMem9FCX0
 7oLQ==
X-Gm-Message-State: AJIora9g+fga2dBDYJKUErKobOTAzloigq9WlvaA9VMbk6aCmAklaI+9
 HGQnedigu9AEh+m+SyT2q8a/j91qhE2u8bu5xx7W5Q==
X-Google-Smtp-Source: AGRyM1vo9eclvYKWlnI8Z1IzhZDtiALcpS4DTk5sKAvdnhcBIHH5/5ayi+8XWmysWgoIxmF1Fz9B2bQ3stMqDTeW3yQ=
X-Received: by 2002:a25:540a:0:b0:669:b4cb:41d7 with SMTP id
 i10-20020a25540a000000b00669b4cb41d7mr3084875ybb.196.1656011753251; Thu, 23
 Jun 2022 12:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-7-pmalani@chromium.org>
 <CAE-0n51d4S3T+_f+YXsu3es7AMxuyFORSXFQe2LTSkZB4C56Ng@mail.gmail.com>
 <CACeCKaduttgNfxyzE2_7eD1N4NLNp_8J1EaWTnn+eqp+_P-i1A@mail.gmail.com>
 <CAE-0n53Y4pe3TvNQVKZsqLU4cA-Vs4zH3HHV5U97W_6qCNsEow@mail.gmail.com>
In-Reply-To: <CAE-0n53Y4pe3TvNQVKZsqLU4cA-Vs4zH3HHV5U97W_6qCNsEow@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 23 Jun 2022 12:15:42 -0700
Message-ID: <CACeCKaem-b5ePtkeR2njS9ZgX3Ez1GViArPxS92fk7eF0=NmFA@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 12:08 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-23 11:37:08)
> > On Thu, Jun 23, 2022 at 11:24 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Prashant Malani (2022-06-22 10:34:35)
> > > > From: Pin-Yen Lin <treapking@chromium.org>
> > > >
> > > > ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
> > > > alternate mode lane traffic between 2 Type-C ports.
> > >
> > > How does it work? From what I can tell from the information I find when
> > > googling this part[1] and looking at the existing binding doc is that
> > > this device is a DPI to DP bridge, and it outputs DP (probably 4 lanes
> > > of it?). Does the 2 type-c port design work by transmitting DP on two
> > > lanes of DP for one type-c port and another two lanes of DP for the
> > > other type-c port?
> > >
> > > DP could be one lane, so if this device is able to output one lane on
> > > any output differential pair then I suspect it could support 4 type-c
> > > ports if the hardware engineer connected it that way. Can you confirm my
> > > suspicion?
> >
> > I will let Pin-Yen comment re: this hardware, but 1-lane DP is not a
> > supported Type-C Pin assignment
> > (as per VESA DP Alternate Mode Spec version 2.0 [2]), so the H/W
>
> Some missing link?

My bad. I tried to find a publicly accessible link to the DP altmode
spec, but it
seems like one needs to be a VESA member to access it :/

>
> > configuration you are suggesting shouldn't be possible.
> >
>
> Alright, cool. But it is possible in the DP spec. So it seems like if
> this is connected to 4 DP connectors it could be used to mux between DP
> on 4 DP ports.

Ack. In that case, no "typec-switches" should be added to the DT.
