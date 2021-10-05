Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5D4233C4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 00:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EBE6E46B;
	Tue,  5 Oct 2021 22:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3921A6E46B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 22:46:02 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso762224otj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=7Yvv1Am41pkLFWVRRxtVFFpmmIZ/+MuvB5/QTODKe0c=;
 b=P2oDRf1HeizMRc0LDqCvytJ3P+tPRSh1aRFdJ7n9WcKZvfpHcI2qAzn3zXcvfMe3w4
 qiD/DKg2N6or181RTor6QE5rlY8xdKTYNc5+EyJP2MqfBm3NgJCxYmhpcP+q/KLWNQI5
 M44LOZ9GOximBFOmw+rqWNUUMKkSeesohvAbT/DNy5Nb7d1DrfJBk5Zgx7lgABZT3YRe
 vfkPfRksAcMTjwT09rNsiP3EqeEHaL+4KHLzRqTJE6iYpd7n1AgWjhvUCJYByL6rSwrr
 n0owysj5xcSsSTjZmWOpFvQUG7HrLteBj5A0JjizCFvI6j+3hiRl2bawD9c5tX61IsbJ
 rnwA==
X-Gm-Message-State: AOAM532mztf8orD4S6GHPv21kv6XRNyBEDqlJ7UmT4EP2CsD/p/yjfN2
 wZMW2NOgIq5yW/KpYU+VLA==
X-Google-Smtp-Source: ABdhPJz8rCGrSwA5JycAr4jjywMT6Q9vFnZJCvKui4nCAMdxcCRG96o4SGy+jI6iNtZhTv01VbbH+Q==
X-Received: by 2002:a9d:6d14:: with SMTP id o20mr17177311otp.57.1633473961337; 
 Tue, 05 Oct 2021 15:46:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v25sm3684003oov.14.2021.10.05.15.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 15:46:00 -0700 (PDT)
Received: (nullmailer pid 106764 invoked by uid 1000);
 Tue, 05 Oct 2021 22:45:59 -0000
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mark Brown <broonie@kernel.org>, 
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-mips@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Airlie <airlied@linux.ie>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, letux-kernel@openphoenux.org, 
 Rob Herring <robh+dt@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <keescook@chromium.org>, 
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org, 
 Paul Boddie <paul@boddie.org.uk>
In-Reply-To: <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: Add ingenic,
 jz4780-dw-hdmi DT Schema
Date: Tue, 05 Oct 2021 17:45:59 -0500
Message-Id: <1633473959.306315.106759.nullmailer@robh.at.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Oct 2021 14:29:15 +0200, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml:39:5: [warning] wrong indentation: expected 2 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.example.dt.yaml: hdmi@10180000: 'clock-names', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1536624

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

