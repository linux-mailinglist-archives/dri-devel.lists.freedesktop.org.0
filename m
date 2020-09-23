Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30792276189
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37FC6E9F3;
	Wed, 23 Sep 2020 20:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFA06E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 20:00:47 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 113D923772
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600891247;
 bh=Gyf3GRHsx03XD50x8wGHYRJEPtnKV5W+HBAO5kv+8Xg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vNGDGr5XPyWyCpHPS7gQg69ywfpZ1T/fwXDA5/4zv7GEe8NnsdAK+VYGgH2N8YshC
 MJcJ6E8ce1DTvnQynGAyZ9ycsJbUfQciyBG+U6am2QFDdNAWamBwYT7t7ZBeogjoUJ
 35TeaR1EjU8PSpUq+voB1K+XbdwdBJ31Ni0rUC+s=
Received: by mail-oo1-f46.google.com with SMTP id m25so195266oou.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 13:00:47 -0700 (PDT)
X-Gm-Message-State: AOAM532Gm1K7e9gqvmxdNlFGhi6kUJRzhdL+xB+KLtXkNzEHpu99bt98
 x+YjOu2Fqk4Zah+w/Z4vfkaH7Y/jMf2AzcsKiQ==
X-Google-Smtp-Source: ABdhPJz9SgWJjDDrhxnQb5EvlE3t6H/djP9QM1c2osVQ51hJ9LPr6sCjPqg6G9Vkl3ibruZbiRxBqN/D6ltEDzJ/r38=
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr919233oos.81.1600891246185;
 Wed, 23 Sep 2020 13:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
 <20200923161712.GA836725@bogus>
 <04d93618-12b1-d8f5-ece5-0f87e644d52e@ti.com>
In-Reply-To: <04d93618-12b1-d8f5-ece5-0f87e644d52e@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Sep 2020 14:00:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+q4JVs=e2kueCATXLw00FWL=nx_eqCTj5ANHkESD8uTg@mail.gmail.com>
Message-ID: <CAL_Jsq+q4JVs=e2kueCATXLw00FWL=nx_eqCTj5ANHkESD8uTg@mail.gmail.com>
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 11:15 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi Rob,
>
> On 23/09/2020 19:17, Rob Herring wrote:
>
> >> * No eDP. There's really no "eDP connector", as it's always a custom
> >>    made connection between the DP and the DP panel. So possibly there is
> >>    no need for edp-connector binding, but even if there is, I don't want
> >>    to guess what it could look like, and could it be part of the
> >>    dp-connector binding.
> >
> > I don't think that's true. Do an image search for 'edp pinout'. AFAICT,
> > there's 2 lane 30 pin and 4 lane 40 pin. One image says 'Table 5-3 in
> > eDP v1.2'. Of course, I'm sure there's custom ones too. From a binding
> > perspective, we probably don't care about the differences, but just need
> > to be able to describe HPD, backlight power, enable, and pwm, and LCD
> > power.
>
> That's true. The eDP spec lists 4 different standard pinouts (how
> strictly those are followed, I have no idea). But it does not define a
> connector or a cable. And afaik eDP is defined to be not user-detachable.

Yes, but HPD is still used (or sometimes broken). We could just put
that all in panel nodes, but IIRC the last time this came up the issue
was handling devices with different panels stuffed by the
manufacturer. An eDP connector binding would be one way to handle that
as it is somewhat standardized while panel connections aren't at all.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
