Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAE44E92C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7B189E0D;
	Fri, 12 Nov 2021 14:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C48E6E047
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:47:54 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso7030940otf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 06:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MqpVUsLYNqsJjO4ImeTejjx8SUZnfDjbhJPSiiUyJOQ=;
 b=Wiwjnds4Tey/cJdAo0Iy15WP1zLRYUAtnuaPzlHH4rH2W5SnQUGixJekqUPY4kjmy4
 C0pRemEGt+8dy61lu1CimbKIGU8OJ/MGV7rUPpMTWoa71y1RmjzAOtXpB7yPPacAkXIR
 IBnTflCKGaLqpYF84ubkF9j/X8E0QzvgmJJX4XmDijibml9xvJaDWj8sNqK6vTTnTJQ0
 3BgrHBFh2LvgD1oIY2yHoZAqLmUAG+U3HNb7bkSMaPSRbzj43bSi6jAwGt15i6xyW3GQ
 4VebnTjGo6ea18CiIw3SAcoh7xw6+4PMCwQAetHJut76i8ORev+Ej15pOZICpNJVS3Fl
 5oXg==
X-Gm-Message-State: AOAM53214g+GWsl/jGX+Wd5NTRKKHP0LyLUmu/7xjmpY58pz0XjxaNDI
 HuHjpyClj3xYw8yXLieH8w==
X-Google-Smtp-Source: ABdhPJzDQAhXlkjwRvi5urW+7d003gcUAFjnSG2AHX4B3iXy467gNUrRe93n1Idba1w8d58aLwaeMw==
X-Received: by 2002:a9d:326:: with SMTP id 35mr11139198otv.41.1636728473571;
 Fri, 12 Nov 2021 06:47:53 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g26sm1280650ots.25.2021.11.12.06.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 06:47:52 -0800 (PST)
Received: (nullmailer pid 2736205 invoked by uid 1000);
 Fri, 12 Nov 2021 14:47:46 -0000
Date: Fri, 12 Nov 2021 08:47:46 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
Message-ID: <YY5+kgNRlKHIGPlO@robh.at.kernel.org>
References: <cover.1636573413.git.hns@goldelico.com>
 <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
 <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 08:57:26AM -0600, Rob Herring wrote:
> On Wed, 10 Nov 2021 20:43:28 +0100, H. Nikolaus Schaller wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> > Based on .txt binding from Zubair Lutfullah Kakakhel
> > 
> > We also add add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
> >  .../bindings/display/ingenic-jz4780-hdmi.yaml | 76 +++++++++++++++++++

This goes in display/bridge/. And use compatible string for the file 
name: ingenic,jz4780-hdmi.yaml

> >  2 files changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'ddc-i2c-bus', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

I think you need to use 'unevaluatedPropertes' instead of 
'additionalProperties' if you are getting these properties from 
synopsys,dw-hdmi.yaml.

Rob
