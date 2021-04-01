Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABA3514CF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 14:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAF56E0CC;
	Thu,  1 Apr 2021 12:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4736E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 12:33:59 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id v186so1418876pgv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsqA9Xv1llCUvLw8edrdaV5ZoeKuJnc13OOMvfzSgxY=;
 b=HvEMU+9tQn1GkFvgVgNpDGEMAtzN3iWIIpIqpjHnH3PuIQx/41BH4FPhlsrxmzJ7B8
 L2ALnq3tSypyjY5/I2dj+e7l2fmL2+pioKtbUoAHVuat+G7R/l0ATYHxFN3e0HYVKZ3N
 X1KRmPPuu+zjjTXiovmOa6heMHJcGPRPsUrrU/c+ic0Tew8Dk/4lDGWHd8bcswuBcB9K
 fG85AyStYAbSqXDb5FHrCg6IrLsMpA92c/Cj927Tkg/YZ3ETIp4iRUIQGTj1yiEllcW+
 fepykwK5q6/UsV9VB3RqNAxZZxkkNuKoyG9wmDf/2PiEeesDmmNmV4qw0GUKKYmnzISi
 168g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsqA9Xv1llCUvLw8edrdaV5ZoeKuJnc13OOMvfzSgxY=;
 b=dKdN+Q2GR7mYvdbc4wd8x+58+I/xVMsqin3JialsI6Mlxgs1jl8Bcbyp1/BgoTciRG
 3KtEiiF4RLVrYOfbTueBb24dVYpHljOCzNXGmqdqZCU70BXM/PP83ohLNjlXHxeTzBtL
 8LYeVIScuBzSweuwpX+mgCLBQNDiUIbN3JYp3zliYX++KFx/a0UZh5P61SprdXwAJaWN
 EGeNUMZjZwX6Jd/bv4hqme3rrIKf3wnIpkGTKG6zslGeckQ1hU0xwCjfmm8M/ji4yo1b
 n33r5awY9yRoukVGXt+EAQ09a3DTeclZ9fiw+wjK9njW2J2Z9JIRUM0lm0UVMppqQGPc
 P55w==
X-Gm-Message-State: AOAM532MQ1hsMuXP27VikATZcYiPlZ5Jah+kXhY3kFbmbMJ5LtpVV7X6
 KESDyl29OoCmq2vZTtPsxeHkniN4SIoQOCqJxpL3hQ==
X-Google-Smtp-Source: ABdhPJyaGyv5cIOFak7z5jWf50xKVPz9OGnuR20y6+iAsqhPnXNOISrhs8/7nH+WsYv0DxswgJgz0ro4GehSANLiKgw=
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id
 j198-20020a6280cf0000b02901f319592e42mr7324814pfd.39.1617280439001; Thu, 01
 Apr 2021 05:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616135353.git.xji@analogixsemi.com>
 <4b09b40ce53c5b5fe7d2ba65a3c7a1b23f6eec04.1616135353.git.xji@analogixsemi.com>
 <YFc1ZlmSiNJOAoOl@pendragon.ideasonboard.com>
 <20210324075108.GA1466804@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20210324075108.GA1466804@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 1 Apr 2021 14:33:47 +0200
Message-ID: <CAG3jFyt8EigCBkZHXgy1E-XcfpfdC5FEWW4Gb8bZqMT1tFW3ow@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

This series no longer applies to drm-misc/drm-misc-next, please rebase it.

On Wed, 24 Mar 2021 at 08:52, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Sun, Mar 21, 2021 at 02:00:38PM +0200, Laurent Pinchart wrote:
> > Hi Xin,
> >
> > Thank you for the patch.
> >
> > On Fri, Mar 19, 2021 at 02:32:39PM +0800, Xin Ji wrote:
> > > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > > lane1 swing register array define, and audio enable flag.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  .../display/bridge/analogix,anx7625.yaml      | 58 ++++++++++++++++++-
> > >  1 file changed, 57 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > index c789784efe30..3f54d5876982 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > @@ -34,6 +34,26 @@ properties:
> > >      description: used for reset chip control, RESET_N pin B7.
> > >      maxItems: 1
> > >
> > > +  analogix,lane0-swing:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 20
> > > +    description:
> > > +      an array of swing register setting for DP tx lane0 PHY, please don't
> > > +      add this property, or contact vendor.
> >
> > DT properties need to be documented. Contacting the vendor doesn't count
> > as documentation I'm afraid.
>
> Hi Laurent Pinchart, thanks for your comment. For the DP phy swing
> setting, it is hard to describe in here, needs to refer the anx7625
> datasheet and programming guide. Basically, no need to change the DP phy
> swing setting.
>

Laurent is right. But if the value practically is a constant, you can
move the swing register into the driver. It should still be documented
as well as possible, but we can be a little bit more flexible.

> > > @@ -73,6 +123,10 @@ examples:
> > >              enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
> > >              reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
> > >
> > > +            analogix,audio-enable;
> > > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > > +
> > >              ports {
> > >                  #address-cells = <1>;
> > >                  #size-cells = <0>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
