Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493045E265
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 22:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D13C6E839;
	Thu, 25 Nov 2021 21:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B176E839
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 21:26:17 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id r26so14930424oiw.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 13:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ATQGc9kY+JyWouwzNMT+5eMUiqUTPfsc2py8BE07UUU=;
 b=6FbFQmRIY8OcDan8pPE4P3AcikwGbxQ+SZrlk0gAVRTszy2huYHC06KkSc4gqlGREU
 mB8iLpyBRNJJOILqrS7gt0v/0QDN8zHcPS1Fn1Jk7NQOK+9ERhgrY4bzhnDuVSBSLRU4
 Doq/tCRtd+8HtroyNy8UFhSfz5YFWtZUOGWBvDRf8HHGUrZav/Mp/HUidbYOUx5H7Hnq
 sAflTkvq5NTLhpcYkcOoxiuewdMTY4YYcrNxsnLjNdVu2Ra+OnU1yS4zg3EjHAH2qzgZ
 w6iHSE1oyodkdu6jEE01t9QVN6eiRFNJDs1bLnRobdLJhYYy0FfNCy65dWckiF0tdT/h
 TmNw==
X-Gm-Message-State: AOAM5332Szcd/f5ky+o5tFcATmlXnB0BnaK3VJNgVSvsxv4T2cHkVlck
 /XP5ZTNq+x0z35HLx/j6Xg==
X-Google-Smtp-Source: ABdhPJzoE1mjv1m+nj0OMQrJ0pG7JCaWF1N2WspnzxdZpkiI3QMzNDqnQA1Na6SgHhWlX8psmy9F2w==
X-Received: by 2002:a05:6808:f8e:: with SMTP id
 o14mr18906207oiw.33.1637875576978; 
 Thu, 25 Nov 2021 13:26:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id s26sm931393oiw.19.2021.11.25.13.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 13:26:15 -0800 (PST)
Received: (nullmailer pid 2858309 invoked by uid 1000);
 Thu, 25 Nov 2021 21:26:02 -0000
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com>
 <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
Subject: Re: [PATCH v9 3/8] dt-bindings: display: Add ingenic,
 jz4780-dw-hdmi DT Schema
Date: Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.255498.2858308.nullmailer@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Nov 2021 22:29:09 +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
>  .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml'
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/synopsys,dw-hdmi.yaml'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.example.dt.yaml] Error 255
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1559375

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

