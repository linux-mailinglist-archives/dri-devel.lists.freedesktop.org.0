Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2D5B9C6E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 15:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D8510EB31;
	Thu, 15 Sep 2022 13:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B32C10E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 13:56:07 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id o204so2306950oia.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 06:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=q66f43KsxyST/5BEurZYfdj2G2PKAITc7F9iCXzLPdk=;
 b=YTEOxK+gemhSW6b9wCaEmMXKyMTo6eKYZAct1jBJTCvXFkBAOqubThyf5wo0CFUxsn
 jc9uOABO9P54Dg65hrNuoErj3vygbekQ59hibRgiAE6ANCBID9vlo73ZzQNqTSwC1rBI
 m8hI7lCtLX3lLQfFB7VoHp1TgUD0ku6gnsU8FA9jqZJZFWDQGrqW/9QXOJCn9gPrcXsQ
 2zT6fO5nqJUquPwx4h6QjtmkgMxm7FCetVUka1VzZhAKx6aIif2pEakoaT+bulinCjwO
 mhTRpIkUsZOaDxrkQMOl1kRUKi2n/wPciQW2ty4jVwE50fe7iANQmflFjLXJY6EteLXe
 otHQ==
X-Gm-Message-State: ACgBeo1g1prWZLRzib+YsrVdGfgRd/Lx+sGzONrOSs2S39o0G96eMqF8
 jFBLvjwEvnevKkxGD9fmkQ==
X-Google-Smtp-Source: AA6agR4OqVR+8Sws/CQvxnWN++jg3/yUDEHTGwCJaIb2Vl0cXOP+vOI1TG5xv/TIrBp9LI7gXfjcXQ==
X-Received: by 2002:a05:6808:f8d:b0:345:6ee0:9a65 with SMTP id
 o13-20020a0568080f8d00b003456ee09a65mr4115637oiw.299.1663250166396; 
 Thu, 15 Sep 2022 06:56:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x7-20020a4a8d47000000b004728e64dc0fsm8043611ook.38.2022.09.15.06.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 06:56:05 -0700 (PDT)
Received: (nullmailer pid 1191178 invoked by uid 1000);
 Thu, 15 Sep 2022 13:56:04 -0000
Date: Thu, 15 Sep 2022 08:56:04 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220915135604.GA1180348-robh@kernel.org>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
 <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 12:15:28PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Sep 15, 2022 at 10:26 AM Krzysztof Kozlowski
> <k.kozlowski.k@gmail.com> wrote:
> > On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> > > Convert the NXP TDA998x HDMI transmitter Device Tree binding
> > > documentation to json-schema.
> > >
> > > Add missing "#sound-dai-cells" property.
> > > Add ports hierarchy, as an alternative to port.
> > > Drop pinctrl properties, as they do not belong here.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - Add maximum to video-ports,
> > >   - Drop unneeded maxItems for audio-ports,
> > >   - Complete port descriptions.
> > > ---
> > >  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
> > >  .../bindings/display/bridge/tda998x.txt       |  54 ---------
> > >  2 files changed, 109 insertions(+), 54 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/
> >
> >
> > tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb
> >
> > tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda19988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> >
> > tda9988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> 
> Please test this with the earlier patches in the same series applied ;-)

Just ignore if not useful. It's informational purposes.

The testing doesn't get series because it gets patches from PW which 
filters out just bindings. And it tests a patch at a time to get 
warnings for that patch. If folks want to stop sending binding patches 
for a couple of months, I can improve it.

Rob
