Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B86382EE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 04:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BAC10E28F;
	Fri, 25 Nov 2022 03:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CCA10E28F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:58:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fy37so7630509ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 19:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qQyWEHxXa79BofbvN9Ap5hUF4GqRCe2Xjm2cBntw/bE=;
 b=Lr8vVyUXtkK6UZYfzOdWDABeh/apxGg1mIEnt0ef3Zn+MAvK0NYu5eimOEDUW9uIDl
 RRSLerbb4aYtwun2wAN4H0WrvEwxRx3TOdJXE7pxvWzi0EFHIAp9WkGrEBhSGn1Fusyy
 CJPkalmbHREaFQ1Mso7r3R7Rn1JuwDbx00kcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQyWEHxXa79BofbvN9Ap5hUF4GqRCe2Xjm2cBntw/bE=;
 b=g+dRcye+zkOAaeK2ymGpB/Qm8BMwuxPhkXt7Kar1EvxGjO0em7UHaPgdfK5uptgnQr
 ZTDBJz9MevyG2X/RH9DjRTy/MaWg7Owl/zs0xmbWiG9EqzuMnIK4CjR5E96Fn0Z8SDXd
 SWM7EO6p2ri6cvrTkBRSDzCEkq0O6nXcDJSHq0lsDMD8602h1dCNT0pUfhHXLvJDU2yR
 NOGLbsU6vtjL2M10eHxP6xj977ORKYhCEeCG4P5c+Yd14d5kqActBWmmv9BC5vhJYgFk
 7q7HnqWJn9G9JDCw7y2g+pPztEPBJtL1qp4mfhaCLDQTQ8I8aDgKg4N7NdtfEznL3qBC
 rnpA==
X-Gm-Message-State: ANoB5pmqyHXRTfMfzf74P7tOT8FJTDlIx0z1PpboB2B0TBYp2tIKCx+z
 8lxMRq6NAo125TKe6S8CH5qyzhwtBck+T3EAubgEfQ==
X-Google-Smtp-Source: AA0mqf60DoiiSCvpqj+wbIXb7MO5zK4U2JjnitTifneLjLdAV07UDYzW6uQh0/y4Sqr6wogfXNwTwDBzX2w5ZETbiug=
X-Received: by 2002:a17:906:43c7:b0:7bb:c1e6:c4ac with SMTP id
 j7-20020a17090643c700b007bbc1e6c4acmr3635363ejn.757.1669348700297; Thu, 24
 Nov 2022 19:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-4-treapking@chromium.org>
 <166930150025.3946612.5757271936642172776.robh@kernel.org>
In-Reply-To: <166930150025.3946612.5757271936642172776.robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 11:58:09 +0800
Message-ID: <CAEXTbpcn+AkG0YF2xHce99dX7V=tt3i76tBQ8m=qLjx+u7YKHQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
To: Rob Herring <robh@kernel.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, ",
 Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for accidentally using the tab characters. Will fix this in v7.

On Fri, Nov 25, 2022 at 1:39 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Thu, 24 Nov 2022 18:20:52 +0800, Pin-yen Lin wrote:
> > Analogix 7625 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Also include the link to the product brief in the bindings.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
> >
> >  .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 2 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
>
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dts'
> Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: found character '\t' that cannot start any token
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: found character '\t' that cannot start any token
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml: ignoring, error parsing file
> make: *** [Makefile:1492: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124102056.393220-4-treapking@chromium.org
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command.
>
