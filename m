Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BC712DEC
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 21:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5C10E050;
	Fri, 26 May 2023 19:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA0D10E050
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 19:51:41 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-33b158e6aceso778295ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685130697; x=1687722697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtYzXAXeeNKykjIC6M7yJXXgCuPRoWwM64ZY3vwKseo=;
 b=krrqjwzG0OD+yq/+F1IXnoT3w/i5wc3gnTF+joEnO72SMkKoReQHp+SZAyx0MVRFf/
 QBLWlyR8PUAVM5TAEZ0oE7MM/3O3lxX/JgNOnwaBU22kKS+skkUD3ZWkEcly9esiMLTI
 tCcupEPW+JUN+2aME/0mjDR5QqBxWso9OF/jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685130697; x=1687722697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtYzXAXeeNKykjIC6M7yJXXgCuPRoWwM64ZY3vwKseo=;
 b=E4BF1VaXZECFmd3YB/Fpuj6j9YdgDYAbIQxrTkjMkBkqdKJGfWzXkSAmCRspiLCIcq
 +MCvjuuT6mnf9DKocYeUKJFiKzuI2CIdlWHhrFRUPSaILcZOrY6B7nvR/oBSNjQ60H0K
 Rm/yKHYmIbVj48QyEIhymmq9rMR9D5IB2MlcQ5PURtuKrYXgH4a2T0q4KePBClSZCjGU
 eJJD1kYs4n7luRj4Q6+CQpKSvbbDC72d3YUdX8bBpYYDxCt08xbr6ABf8JeBLLzG5I5A
 PkLTFZQKUDqEU2GzPX1pLvdEj72BANVRHZAMuc0ugB0IznVrS/g0fR+/UpZYzV6efB9Y
 FaMA==
X-Gm-Message-State: AC+VfDw+jkq66M3gaFtM+4zeB8Y8nsQQta4auRYGX/JFBtaOFmfFmwrN
 TPyGc55uFIGBfMVGfO6D6X92020tsTtn51VUAYs=
X-Google-Smtp-Source: ACHHUZ66J4Nr64j1S8zm/zeGwzu1GUNOD8eAMuAt85SBxWCEtTJKITJ3XQ5rymK8sRvayh0PqmbnTQ==
X-Received: by 2002:a92:d44b:0:b0:33a:f0eb:1db4 with SMTP id
 r11-20020a92d44b000000b0033af0eb1db4mr293152ilm.23.1685130697217; 
 Fri, 26 May 2023 12:51:37 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 g16-20020a926b10000000b0033a4f125238sm149693ilc.41.2023.05.26.12.51.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 12:51:36 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33164ec77ccso26595ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:51:35 -0700 (PDT)
X-Received: by 2002:a92:ca0a:0:b0:331:2623:c5f4 with SMTP id
 j10-20020a92ca0a000000b003312623c5f4mr30715ils.1.1685130695437; Fri, 26 May
 2023 12:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230526100801.16310-1-uwu@icenowy.me>
 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
 <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
In-Reply-To: <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 12:51:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS5i4RYknEaOi+4448UASh9kNncU4mwnawqKPr7yGXRg@mail.gmail.com>
Message-ID: <CAD=FV=WS5i4RYknEaOi+4448UASh9kNncU4mwnawqKPr7yGXRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
To: Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 26, 2023 at 8:33=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2023-05-26=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 07:24 -0700=EF=
=BC=8CDoug Anderson=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> =
wrote:
> > >
> > > Currently a specific panel number is used in the Elm DTSI, which is
> > > corresponded to a 12" panel. However, according to the official
> > > Chrome
> > > OS devices document, Elm refers to Acer Chromebook R13, which, as
> > > the
> > > name specifies, uses a 13.3" panel, which comes with EDID
> > > information.
> > >
> > > As the kernel currently prioritizes the hardcoded timing parameters
> > > matched with the panel number compatible, a wrong timing will be
> > > applied
> > > to the 13.3" panel on Acer Chromebook R13, which leads to blank
> > > display.
> > >
> > > Because the Elm DTSI is shared with Hana board, and Hana
> > > corresponds to
> > > multiple devices from 11" to 14", a certain panel model number
> > > shouldn't
> > > be present, and driving the panel according to its EDID information
> > > is
> > > necessary.
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > We went through a bunch of back-and-forth here but in the end in the
> > ChromeOS tree we have "edp-panel" as the "compatible" here in the
> > ChromeOS 5.15 tree and this makes sense.
>
> I only have Elm, so I am curious that do all Hana's only rely on panel
> EDID to use different displays?
>
> BTW The Chrome OS document say that Elm and Hana are both board based
> on Oak baseboard, should the DTSI be renamed mt8173-oak.dtsi, and still
> let mt8173-elm.dts include it and then set model information?

I wasn't deeply involved in mt8173, so I'll let treapking@ comment. I
think he's done some research here recently.


> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...in theory one would wish for a "Fixes" tag, but I think in
> > previous
> > discussions it was decided that it was too complicated. Hardcoding
> > the
> > other compatible string has always been technically wrong, but I
> > guess
> > it worked at some point in time. The more correct way (as you're
> > doing
> > here) needs the DP AUX bus support and the generic eDP panels, both
> > of
> > which are significantly newer than the elm dts. So I guess leaving no
> > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
>
> Well I remembered when I was developing the support for Pine64
> Pinebook, which is also an ARM64 laptop with an eDP panel (via a DPI-
> eDP bridge, ANX6345). At first I didn't use any panel node in the DT,
> and the kernel maintainers argued to the bridge that seems to be
> connected to nothing (because DP is a discoverable port), and
> fortunately 2 Pinebook SKUs (11.6" and 14") is finally reduced to one,
> and it's then possible to hardcode a panel model in the Pinebook DT.
> According to my memory, the need to specify the panel is to properly
> handle eDP panel power up timing, because it's not a very standard
> thing. (Well, in my memory, when I was testing that code, on a
> (engineering sample) 14" Pinebook, the EDID timing overrided the
> hardcoded 11.6" timing and it properly works, the 14" panel is 1366x768
> but the 11.6" panel is 1920x1080.)
>
> (BTW when I checked the DT of Olimex TERES-I, which uses the same DPI-
> eDP bridge, it is still in the status of a dangling bridge, and of
> course it works ;-) )

Before the generic eDP panel support, several devices worked according
to the "little white lie" theory. They would pick some arbitrary panel
to put in the DT because they had to, but then that panel would just
be used for the power up / power down timing and everything else would
be overridden. This was obviously not a great situation to be in, and
so we had many discussions on the mailing list about how to do better.
The end result was the generic edp-panel support.

With eDP panel support, you still need to add the timings for your
specific panel, but it was realized that in _most_ cases we could
power up the panel enough to read the "panel ID" and then we could use
that to lookup the timings. In the few cases where we needed a little
extra help (if HPD is broken or not connected), the DP folks agreed to
allow a few properties to specify it. :-) Hopefully today all new code
uses the general panel-edp.

-Doug
