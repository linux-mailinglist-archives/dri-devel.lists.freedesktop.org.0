Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5575D534EA7
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1160F10E078;
	Thu, 26 May 2022 11:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36EF10E078
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:54:45 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso1559686pjg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zOlRt/PLq35j8SMajNj0FDTDNh91sVVa3M4KgwiWbqQ=;
 b=zd0au4Lgdoz2aRLN2jvLLKLH9zvMXKC7gGXmcI9icnPAhk34CDEwXC8fLcybWuHboJ
 7rxHeACAiCPZERtaxnmLpdCNfTBxHfRZMzj9To+gvTpMb6NSjOLAmOQV5q6LFzMi01Sl
 IpdLjTrN7CsSEH+4AD+iKLFYyQu/qcJTgFtm6ePYxPAtGWN+sXU+ML1m6voHOI2hhltd
 botwytBAtuuMlPyQoK142BG3F7FnhdtcqUXkXD2MGAIWtrV2nunx+b3TrzoqDse6q40T
 gy03PePXDweEsulO9ouGVDtRizGwyp7uEUKeBpU2dx0PinI4+kvHfjYyjoZL/NSYXykw
 owrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zOlRt/PLq35j8SMajNj0FDTDNh91sVVa3M4KgwiWbqQ=;
 b=2XB2YsxYFn66jsr3LxUKZCkBNeisajYGNXVd5whaRFq+CQqKVpo2r95FPQc1KaWXZJ
 JfJ+jQJpyI91UbtezUtcWkKSnRdy6z9FPGxRUQYPn7iAD7ZOgaHX73WIgracxJ+hZDPV
 TN/VT0aaxP7paz0No9YN0cbIe6d0iPKq5b0gqLaTSspwfhvXohfU3Bb1Tnfxn2orDN+h
 xlg8RdNKy+l524V7BDunDXXS5PZhVSSYl2HM6hOrGSlykTFG1RKy8HRWTq5AbodZXrOe
 SaScEmAQz2s4vRpynyOvNjSy8w0wtKI/esfrFdSQ+VXe5j1RKCsVWwsC52b9KysGg3rY
 ec5A==
X-Gm-Message-State: AOAM533KQko9MHtq9Ay6xqbgq+sXgX/2KK+BfCPqkD1v7L/ez1Cjk3JI
 R/pXUEhe5Ll8hfjndcxrMOEG/8HDbLzoQvvdPoJMf+u6ls0=
X-Google-Smtp-Source: ABdhPJxS0YxvZlwlwDFVDpQC1dH6jaFKCDD2PL5VdUmx6nXiGO6oYQ37GLmA/TgYfkq07HVyNLKHBrlzHP18ryVswg4=
X-Received: by 2002:a17:902:8f81:b0:161:f4a7:f2fc with SMTP id
 z1-20020a1709028f8100b00161f4a7f2fcmr30616697plo.117.1653566085361; Thu, 26
 May 2022 04:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220525205626.2482584-1-robh@kernel.org>
 <Yo6u6jcVSsTQvRiU@pendragon.ideasonboard.com>
In-Reply-To: <Yo6u6jcVSsTQvRiU@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 26 May 2022 13:54:34 +0200
Message-ID: <CAG3jFyvynnMfkHFcfLUE=g9pswy1OYiAYi4KVy+aZjGd=NmtGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: ingenic,jz4780-hdmi: Drop
 undocumented 'ddc-i2c-bus'
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 May 2022 at 00:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, May 25, 2022 at 03:56:26PM -0500, Rob Herring wrote:
> > While 'ddc-i2c-bus' is a common property, it should be in a connector
> > node rather than the HDMI bridge node as the I2C bus goes to a
> > connector and not the HDMI block. Drop it from the example.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml  | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> > index b8219eab4475..89490fdffeb0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
> > @@ -55,7 +55,6 @@ examples:
> >          compatible = "ingenic,jz4780-dw-hdmi";
> >          reg = <0x10180000 0x8000>;
> >          reg-io-width = <4>;
> > -        ddc-i2c-bus = <&i2c4>;
> >          interrupt-parent = <&intc>;
> >          interrupts = <3>;
> >          clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
>
> --
> Regards,
>
> Laurent Pinchart

Applied to drm-misc-next
