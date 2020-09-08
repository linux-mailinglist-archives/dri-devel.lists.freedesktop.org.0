Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD32261AF7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CE76E8AF;
	Tue,  8 Sep 2020 18:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721236E8AF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:51:16 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29AA62067C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599591076;
 bh=rvDSCZvFRJ66ihgClWK76JHomlIvsS1g+T/SMib0umM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yWhrHS3OaHQKIXLtXl/3PqXpcHs1osUNt7jXkd8Xn2GhWTEoDbR1haU7D8WFUom9x
 Ohgi+U2+srPsDvjwhloOatHxq/YfBtA7jcTnL1T16ztSmpFsE/YpwjVRwnSeA9QgBS
 sVLvXC7AWIWKSDnvmIZixB75xvPYx7qL9Pq0Peu4=
Received: by mail-ot1-f44.google.com with SMTP id g10so88506otq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:51:16 -0700 (PDT)
X-Gm-Message-State: AOAM533XXAx4EsfhGMA1pEcKW6hgjgubiftdY6JR+eKmeYsKUcUqXE6n
 0JRJnJ5NYa624VcZvwEED1bjScyi3jWWySGB6A==
X-Google-Smtp-Source: ABdhPJzzsAvOaaljadNcHpgbxTqCs+adpWfZ02pFKHSsMEMcvlU/v9W9Zbxnn3nCzVOy+k0EXol3VOtmmA9i/wf9ekc=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr331886otp.129.1599591075501; 
 Tue, 08 Sep 2020 11:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
 <20200824230458.GA3489164@bogus>
 <20200901102714.GC5821@pendragon.ideasonboard.com>
In-Reply-To: <20200901102714.GC5821@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Sep 2020 12:51:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJtPMah6WskUc08JAhGskSM+cFJa4pRJKAyuqqBOKPhxQ@mail.gmail.com>
Message-ID: <CAL_JsqJtPMah6WskUc08JAhGskSM+cFJa4pRJKAyuqqBOKPhxQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec: Document
 vcc-supply property
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 4:27 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Mon, Aug 24, 2020 at 05:04:58PM -0600, Rob Herring wrote:
> > On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > > Document optional vcc-supply property that may be used as VCC source.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > > ---
> > >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > index 68951d56ebba..3248be31eceb 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -79,6 +79,9 @@ properties:
> > >        The GPIO used to control the power down line of this device.
> > >      maxItems: 1
> > >
> > > +  vcc-supply:
> > > +    maxItems: 1
> >
> > Probably should be 'power-supply' to align with the 'simple' panels.
> > That's also to signify there's only 1 supply. Using 'vcc' would
> > encourage adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll
> > NAK because at that point it's not a simple bridge with no configuration
> > (it's arguably already there).
>
> Fully agreed.
>
> Do I get your Ab or Rb line with s/vcc/power/ and the commit message
> updated to
>
>     dt-bindings: display: bridge: lvds-codec: Document power-supply property
>
>     Document optional power-supply property that may be used to specify the
>     regulator powering up the device.
>
> ?

Yes, if not too late.

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
