Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E34D02CB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D4F10E290;
	Mon,  7 Mar 2022 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4610E261
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:27:08 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id b190so2884634vsc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 07:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSGgokIJWLEon0vqrUjapMhnjKETs8L8vcxvQQ2n7HU=;
 b=NoiGGkKFmVvIY/FQGPRUj0AtExDWCYJhrcmRcKp0yY/ljN7OVNfirixpP3FQ8pPU9y
 4SDb80UpZ6OEA1Y7ar1M9+pPsfLjKP5dlJlDU3Rub5LWQWFcV28b6uZ9KE4nCxbe8uf5
 Pl0XjGVwwXocFIqSoYSyP29DfAH/Sfw3JVHjlhLhbyG0p0oOI0asO9hwZ2HydDQF6bfa
 HiE1qhldBZA7XKmroC7nd9rjytUbyIdd0rWqylWXqTrZubAgWulAVnk74pASfCjBBfVU
 CcPvbPV4HlCA2sB9H245uGk+aZ937qOrri1NQHliLIyaVaIRecVaAw5ilZL780t8xs6X
 a74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSGgokIJWLEon0vqrUjapMhnjKETs8L8vcxvQQ2n7HU=;
 b=n+IhNEg+3PasBIw+nsocTqCleZSocQLAPSYNlX39QkH4CFDDGUx5PStctgIv2/op2B
 T6H0AJiQ2lu3K/PpzXZP+O24Fq967MAuCpN8KbqFD55navClqriqG1OureavRNDPTGt3
 PB3QgpYex2axgaGkHeksUnq+XEh6q8TqGLs1t8vTjNFHzMX4nhnbEwdEwAwMK/9RbQra
 OcCTTwrmc7MttZTZ9D2k4yH8JXbEdw8vyucjXFm4bnKe6rHtMerYDTzkj676jVN8gnnA
 XXZ5H3bpJFgmk68a68PsYrNnT4HV3bpWWloGNYbP7shPoFRLF5P69EXKF3Q/qqp4qpy6
 ZHPg==
X-Gm-Message-State: AOAM530iTFyLgV1kJCwHlkOJsWcFMM5KzieeF5hDFjNmhwfnDKPmq0Tv
 QAx+if/rJaduu/MfCIIhTr05nIVTdm07V7yhmLk=
X-Google-Smtp-Source: ABdhPJx9K68iFnv772x/+a0oLYkcVBTVZ+gDeMdx1zxa31Pzz+ugn0HOfZriJMw5jkdDWYBHy5MKjYVYA7Xhg4aM/lk=
X-Received: by 2002:a05:6102:a4a:b0:320:7959:1e3a with SMTP id
 i10-20020a0561020a4a00b0032079591e3amr4533725vss.12.1646666827484; Mon, 07
 Mar 2022 07:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20220222084723.14310-1-max.krummenacher@toradex.com>
 <20220223134154.oo7xhf37bgtvm3ai@houat>
 <b5f471f4-0712-b798-efb8-b5b481cdb898@denx.de>
 <CAEHkU3Womyq09Lz62SJohix5JywfKvBRvuWedqF1D7gvb+T2tQ@mail.gmail.com>
 <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
In-Reply-To: <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 7 Mar 2022 16:26:56 +0100
Message-ID: <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
To: Marek Vasut <marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, DenysDrozdov <denys.drozdov@toradex.com>,
 Maxime Ripard <maxime@cerno.tech>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 2, 2022 at 5:22 PM Marek Vasut <marex@denx.de> wrote:
>
> On 3/2/22 15:21, Maxime Ripard wrote:
> > Hi,
>
> Hi,
>
> > Please try to avoid top posting
Sorry.

> >
> > On Wed, Feb 23, 2022 at 04:25:19PM +0100, Max Krummenacher wrote:
> >> The goal here is to set the element bus_format in the struct
> >> panel_desc. This is an enum with the possible values defined in
> >> include/uapi/linux/media-bus-format.h.
> >>
> >> The enum values are not constructed in a way that you could calculate
> >> the value from color channel width/shift/mapping/whatever. You rather
> >> would have to check if the combination of color channel
> >> width/shift/mapping/whatever maps to an existing value and otherwise
> >> EINVAL out.
> >>
> >> I don't see the value in having yet another way of how this
> >> information can be specified and then having to write a more
> >> complicated parser which maps the dt data to bus_format.
> >
> > Generally speaking, sending an RFC without explicitly stating what you
> > want a comment on isn't very efficient.
>
> Isn't that what RFC stands for -- Request For Comment ?

I hoped that the link to the original discussion was enough.

panel-simple used to have a finite number of hardcoded panels selected
by their compatible.
The following patchsets added a compatible 'panel-dpi' which should
allow to specify the panel in the device tree with timing etc.
  https://patchwork.kernel.org/project/dri-devel/patch/20200216181513.28109-6-sam@ravnborg.org/
In the same release cycle part of it got reverted:
  https://patchwork.kernel.org/project/dri-devel/patch/20200314153047.2486-3-sam@ravnborg.org/
With this it is no longer possible to set bus_format.

The explanation what makes the use of a property "data-mapping" not a
suitable way in that revert
is a bit vague.

The RFC revert of the revert
  https://patchwork.kernel.org/project/dri-devel/patch/20220201110717.3585-1-cniedermaier@dh-electronics.com/
tried to get feedback what would be a way forward. This RFC tries the
same by giving a possible solution should
the property name and/or the a bit short strings of the original be
the reason why it is not suitable.

So the requested comments would be about what was not good enough with
'data-mapping' and what would be a way forward.

Especially since in my limited view it is not clear why in panel-lvds
'data-mapping' is used to state how the bits representing colour are
mapped to the 21 or 28 possible bit position in the LVDS lanes vs.
here where we want to say how the bits representing colour are mapped
to the 16/18/24 lines of the parallel interface would need a different
binding pattern.

>
> > That being said, what I (and I can only assume Marek) don't like is the
> > string encoding. Especially when the similar bus-type property uses a
> > integer with the various available bus options we have.
>
> Right, the string encoding isn't good.
>
> > Having an integer, with a set of defines that you would map to the
> > proper MEDIA_BUS_* would be more efficient and more elegant.

I have a look at that.

> >
> > That being said, the first question that needs to be answered is why
> > does this have to be in the DT in the first place?

The way I understand the compatible panel-dp, iti should allow to fill
a 'struct panel_desc'
with data provided by the device tree rather than having the info
hardcoded in the C source.
The missing element is bus_format which currently is kept at 0.

>
> Because panel-simple panel-dpi , you may need to specify the bus format
> between the last bridge and the panel .

Exactly.

Max
