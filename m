Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22F2FCD06
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 09:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9EB6E141;
	Wed, 20 Jan 2021 08:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581346E141
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 08:58:09 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id k22so4006066ual.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 00:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rhz4mNYz5KLhtoaEd5l0S79rWDm6JyG4VqiZ266BH0w=;
 b=gYyWKKHcQf6taYDLLjDiZjpiKcvQhNiJ6ts6cqUkK9mZyhDUMcS2m7qFjPkF75c6Ia
 ieMbDS6uHTH6f0nmuBCamq4iqRKCoBGOXLtrRJz1PnBt2kIAwVjQh4MseIPg+xXC4AeH
 Oi1QWvnAIS0up25R73pmdZkmKRwR+zBp8v/r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rhz4mNYz5KLhtoaEd5l0S79rWDm6JyG4VqiZ266BH0w=;
 b=ckf6O3+ZlpQtL6CVmWA6QntWwpT0CJqEYMMWaE734Tbz43f13TcAaigtSsgXhs8K8h
 Imq6rIhO1DI8GZowk3pz7mOufus7IRYJuPRQWAJ8EFFiqFvXBG9CCh1niBfZTJn/+TLJ
 4zy4OpLLjxH0rCta8tRwt2iGnwwNe0AfbThAw+X3DnW9JzbhS/rwz3EgcA+aI1qf8N9g
 HlWzLNkgck4gqgIBlUf0YzdsIyauFXnrrdoKHKGHaX61PrCijJhr9IhRgeIYVzH20MLv
 U5d2h4T1+914dX18huiDSoABCx6r/ZrmDQpO6xqyRI9dFeILwcvaqu03RhAcgEphne0j
 vUVQ==
X-Gm-Message-State: AOAM533wEAwnVv8k9QiEKHJjp9GMhjcR5xWaxiROn0SGCxWz8Rn92CII
 xXrmxT5CGgIoZQJVv+Au76602V/CV280tW/DmWOy6w==
X-Google-Smtp-Source: ABdhPJwcDzM1BT+vF0cCZCS5U93rwWVeR7NcrXN5SCCHPtBsMJ5m+3Ha0pvpoXs9OMtPlnuj6kmHglQQVFoNMkTeqeU=
X-Received: by 2002:ab0:1866:: with SMTP id j38mr5167495uag.27.1611133088434; 
 Wed, 20 Jan 2021 00:58:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609380663.git.xji@analogixsemi.com>
 <d13442f84fefccc992d6c5e48ac1e6129882af31.1609380663.git.xji@analogixsemi.com>
 <20210111221435.GA3138373@robh.at.kernel.org> <20210112085737.GC5827@pc-user>
In-Reply-To: <20210112085737.GC5827@pc-user>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 20 Jan 2021 16:57:56 +0800
Message-ID: <CANMq1KDRL3xmjvjMUWCr+maLJ2YY4hQr05dMC7sE4+baWOUesw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: add DPI flag and
 swing setting
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Nicolas Boichat <drinkcat@google.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 4:59 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> Hi Rob Herring, thanks for the comments.
>
> On Mon, Jan 11, 2021 at 04:14:35PM -0600, Rob Herring wrote:
> > On Thu, Dec 31, 2020 at 10:21:12AM +0800, Xin Ji wrote:
> > > Add DPI flag for distinguish MIPI input signal type, DSI or DPI. Add
> > > swing setting for adjusting DP tx PHY swing
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../bindings/display/bridge/analogix,anx7625.yaml  | 25 ++++++++++++++++++++--
> > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index 60585a4..4eb0ea3 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -34,6 +34,16 @@ properties:
> > >      description: used for reset chip control, RESET_N pin B7.
> > >      maxItems: 1
> > >
> > > +  analogix,swing-setting:
> > > +    type: uint8-array
> >
> > Humm, this should have be rejected by the meta-schema.
> We needs define an array to adjust DP tx PHY swing, the developer hopes these
> settings are changeable, so I moved the register data to DT. Can you
> give me some suggestion if it is rejected by the meta-schema?
> >
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > This is how types are defined other than boolean or nodes (object).
> >
> > > +    description: an array of swing register setting for DP tx PHY
> > > +
> > > +  analogix,mipi-dpi-in:
> > > +    type: int
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: indicate the MIPI rx signal type is DPI or DSI
> >
> > Why does this need to be in DT, you should be able to determine this
> > based on what you are connected to.
> As the anx7625 can receive MIPI DSI and DPI data (depends on hardware
> implement, we have a project which have two anx7625, one is DSI input,
> the other is DPI input), we needs to let driver know what kind of MIPI
> rx signal input. And there is no other way to tell driver the MIPI rx
> signal type, we needs define this flag.
> >
> > > +
> > >    ports:
> > >      type: object
> > >
> > > @@ -49,8 +59,8 @@ properties:
> > >            Video port for panel or connector.
> > >
> > >      required:
> > > -        - port@0
> > > -        - port@1
> > > +      - port@0
> > > +      - port@1
> > >
> > >  required:
> > >    - compatible
> > > @@ -72,6 +82,17 @@ examples:
> > >              reg = <0x58>;
> > >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > > +            analogix,swing-setting = <0x00 0x14>, <0x01 0x54>,
> > > +                <0x02 0x64>, <0x03 0x74>, <0x04 0x29>,
> > > +                <0x05 0x7b>, <0x06 0x77>, <0x07 0x5b>,
> > > +                <0x08 0x7f>, <0x0c 0x20>, <0x0d 0x60>,
> > > +                <0x10 0x60>, <0x12 0x40>, <0x13 0x60>,
> > > +                <0x14 0x14>, <0x15 0x54>, <0x16 0x64>,
> > > +                <0x17 0x74>, <0x18 0x29>, <0x19 0x7b>,
> > > +                <0x1a 0x77>, <0x1b 0x5b>, <0x1c 0x7f>,
> > > +                <0x20 0x20>, <0x21 0x60>, <0x24 0x60>,
> > > +                <0x26 0x40>, <0x27 0x60>;
> >
> > This is a matrix, which is different from an array type.
> OK, I'll change to array if this vendor define has been accepted.

I also wonder if we want to split the parameters per lane, and simply
have a flat array (instead of reg/value pairs like you have now).

Registers 0x00 to 0x13 have to do with Lane 0 (and 0x14 to 0x27 with
Lane 1): you can almost tell from the example values, they repeat. I'm
not sure if there's any value splitting those further (I don't think
anybody will be able to tune those without ANX's help).

So, maybe something like:
anx,swing-setting = <<[reg values for lane 0]>, <[reg values for lane 1]>>
where <[reg values for lane 0]> would be something like <0x14, 0x54,
0x64, ...> (that is, all the values between 0x00 and 0x13).

> >
> > > +            analogix,mipi-dpi-in = <0>;
> > >
> > >              ports {
> > >                  #address-cells = <1>;
> > > --
> > > 2.7.4
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
