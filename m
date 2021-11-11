Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B644D8B0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 15:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411AA6E19A;
	Thu, 11 Nov 2021 14:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF276E19A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 14:57:29 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id q124so12058472oig.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 06:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=qNEjXj/HNgs612CxAaN/7ARospzmOAVl901gKnKjQak=;
 b=WxE2x5Ja6+p3hKwOgKTeWclqvQ/RWbhbWrHWtcWKE5YQlkRTk68LEv56mTGGD0uFMx
 7upDztINyZ8J7h2AX6ged0YngYtBHJBbUzz9Fn6FqvNLpIRylnvQN7HE1sqLOeWxNefJ
 M/aM0dWDvTM/Wg1vvEFUQ8Aa7EFOBDaZg5Rt467DMn7b0xdof3nwZ1O/No36KtCei7w+
 kiGN/4lUFLv1oevaO3vEunQ9RJidYtznDQVXcFZ2Bf3iadokhcQtQ1qh6rDa/vm49tGR
 vUNId41jvrjfEU/Q4X+gp6y4x+AbOnF/KSda0a2QKD3pklWVLua/mMOK65q46OBhtaR1
 sj8w==
X-Gm-Message-State: AOAM530jWYf+1i5pk+slHc+AaMFsxKpGytvLslm5Li3qkAiTmPcAIBDo
 Yev9ZHPd77sSzOhNCskj1g==
X-Google-Smtp-Source: ABdhPJwLcneflSvlTMqVQa7wx8N++jT4UqWGoLvdDyD7I/PEJOPtmHneR0Q6RSCyi4LFQ9/yRsBRiw==
X-Received: by 2002:a54:4616:: with SMTP id p22mr19795772oip.96.1636642649070; 
 Thu, 11 Nov 2021 06:57:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 187sm680123oig.19.2021.11.11.06.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 06:57:28 -0800 (PST)
Received: (nullmailer pid 3774080 invoked by uid 1000);
 Thu, 11 Nov 2021 14:57:26 -0000
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
 <70f2abb5277369721cb352eb50daa407bee3fd04.1636573413.git.hns@goldelico.com>
Subject: Re: [PATCH v6 3/8] dt-bindings: display: Add ingenic,
 jz4780-dw-hdmi DT Schema
Date: Thu, 11 Nov 2021 08:57:26 -0600
Message-Id: <1636642646.871896.3774079.nullmailer@robh.at.kernel.org>
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
 Rob Herring <robh+dt@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 20:43:28 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 76 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:36:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'ddc-i2c-bus', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553577

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

