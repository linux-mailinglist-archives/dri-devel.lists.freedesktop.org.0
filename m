Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D91463DA7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 19:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F006E194;
	Tue, 30 Nov 2021 18:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C436E154
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:20:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6AB11CE1AF9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB0BC53FD5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638296395;
 bh=Rg3X5WgEx/fu1vO7MTLJTKOCZa6PxvqcsrwTHphDJDI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i9FRLvgj2xYrkiwZdLPpY85Fjd6ZvT5+FmwmpPxuUtFK4QNsRJhQU8B+M80/mMbEJ
 eVLQQqRbZgJBtxNq5289CGCrLodfzfGEXyrOUGSgyiLPJJuoVUsEkqNkH3JwAFgRvm
 GGV6Z7P5+HN77l28Bpsk1fIQQNyumFBWcvDubcX8gxv7Fyq6mZYv7qsguxqC2kFozs
 htzdXGmYz1azXmkFiMYJ+M00zXnJyTOT47NERz3vDatUbikeS0R8tiilXVV06eXOGp
 93/ftkaxSSgw7FlwZjxF+gj/UTRQtTNl6ANpL36vjQ1G1oiKviDRmYoNj6V30VMIl6
 TrMILntbTqsVw==
Received: by mail-ed1-f44.google.com with SMTP id v1so90405156edx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:19:55 -0800 (PST)
X-Gm-Message-State: AOAM533VAYaudhugV2NK5EWEidX9wQccvFdKaKT7Fk3j+UqXOStKYluW
 l9KVDgLdnAM2fg56Ai8VTv5mdBf9PTGSuZEyuQ==
X-Google-Smtp-Source: ABdhPJzlzmKd9f1PSVWhZws80WIcbDQrGSGIeTyLxWwF+f3fDK1WoMt3xMdzMHMCPFI2ghaCJdwDEwf+RBBhN7lbrhs=
X-Received: by 2002:a17:907:a411:: with SMTP id
 sg17mr867105ejc.84.1638296393423; 
 Tue, 30 Nov 2021 10:19:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637789354.git.hns@goldelico.com>
 <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
 <1637875562.255498.2858308.nullmailer@robh.at.kernel.org>
 <A72D034E-EDBC-44F5-82DF-9EEBC5EC7E0B@goldelico.com>
In-Reply-To: <A72D034E-EDBC-44F5-82DF-9EEBC5EC7E0B@goldelico.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Nov 2021 12:19:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ_E_USDuK3kEDKm9TsNsRdpcGNEjz==sKFS-Tv5KYCkA@mail.gmail.com>
Message-ID: <CAL_JsqJ_E_USDuK3kEDKm9TsNsRdpcGNEjz==sKFS-Tv5KYCkA@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 11:03 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Rob,
>
> > Am 25.11.2021 um 22:26 schrieb Rob Herring <robh@kernel.org>:
> >
> > On Wed, 24 Nov 2021 22:29:09 +0100, H. Nikolaus Schaller wrote:
> >> From: Sam Ravnborg <sam@ravnborg.org>
> >>
> >> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> >> Based on .txt binding from Zubair Lutfullah Kakakhel
> >>
> >> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> >>
> >> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> ---
> >> .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
> >> .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
> >> 2 files changed, 79 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> >>
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
>
> I wasn't able to fix that.
>
> If I change
>
>  allOf:
> -  - $ref: bridge/synopsys,dw-hdmi.yaml#
> +  - $ref: synopsys,dw-hdmi.yaml#

That is correct.

>
> then make dt_binding_check still reports:
>
> Unknown file referenced: [Errno 2] No such file or directory: '/Users/hns/Library/Python/3.7/lib/python/site-packages/dtschema/schemas/bridge/synopsys,dw-hdmi.yaml'

The $id is wrong:

$id: http://devicetree.org/schemas/bridge/ingenic,jz4780-hdmi.yaml#

The path should be:
http://devicetree.org/schemas/display/bridge/ingenic,jz4780-hdmi.yaml#

Rob
