Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A504CC825
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086F910EE02;
	Thu,  3 Mar 2022 21:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B00410EE02
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:35:49 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id v3so5789281qta.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1Q9sdnTqYlZlLU7twPdWgz9bcNxdvX07ZYQ1tXE7K4=;
 b=d4iSdfFLz79BntOhrp2p23HpQHlgolCX34pjwXD+Bt64bl6GqMOLNaU7D0XXuJYsI0
 +yY46c+Q+80iklOBa6DgVfWb+h2jyvOtLH4TaaK3dxZ1SEeoAtTj4zw2Ug4CQR1dN11F
 Ws8OWXekp6+7uJFhnPWiATWP6JI95i0+Tke3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1Q9sdnTqYlZlLU7twPdWgz9bcNxdvX07ZYQ1tXE7K4=;
 b=NSV5Bqzdj6FkNlpgFROSa2ZZDQIjCyMd2w38dZDHRd9VD46a2bxiT5s1yJ26Nd+O08
 Iar99/30qxbZYt1wwKhDAnXuaHC2tMVIcFjOUPE3/PElAa1gzsVYGtM/lsbd+6VAMmKF
 4qut82JZ2ekM4sOHf8gsGRnwosZMLhK+Ms6/bsvwFTF3fGNvPqYkP5wazcizqRkmKR0Z
 LsD0zMKoC9yTwabK4H0N6lHdwTD0I0YdoJY75rHOshbsXD7uahllmRcH3P0XtcRB6Nza
 altUQdx7tJ7qo34Q4hVcd1ELHBkFU7KkN2wWnSyyROwaJ9e17pZpfShfxrye3wKejuD9
 S5Dg==
X-Gm-Message-State: AOAM5309eDuPNPyNghkQfRnL3a//13/aNFtO4rfOBFR7wtOBc10bX8xH
 rMkQ09nFQ+LueKuHfWNvfAfar9QuUngI5WdZlvdVRteFuYRtMCFy
X-Google-Smtp-Source: ABdhPJx1dtBQ1EOQRQQ2DfFAxZ+hxlYYPAxznboh4jmMsmSM2GTXYrz2DJR6SYcMuO7VVOrl354ZqMz2TfqnaZuFIUs=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr29367893qta.58.1646343348365; Thu, 03
 Mar 2022 13:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20220302051056.678367-1-joel@jms.id.au>
 <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
 <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2022 21:35:36 +0000
Message-ID: <CACPK8XfYRHTPz50wgNp7Q0Pi4rKVag9-bLD7kHcyKrHwHdKW7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
To: Rob Herring <robh@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tommy Haung <tommy_huang@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 19:34, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 2, 2022 at 12:01 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> > > Convert the bindings to yaml and add the ast2600 compatible string.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> > >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> > >  2 files changed, 69 insertions(+), 41 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> >
> > Applied, thanks.
>
> Uggg, now dropped...
>
> What's Documentation/devicetree/bindings/mfd/aspeed-gfx.txt and also
> the example in Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml?
> Please sort those out.

I think the aspeed-gfx.txt can be deleted. And the example in the
pinctrl bindings needs to be updated with the required properties.

Andrew, can you clarify what's going on with those other files?
