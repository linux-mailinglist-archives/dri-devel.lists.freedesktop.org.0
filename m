Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235275A2732
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA6210E863;
	Fri, 26 Aug 2022 11:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AE210E863
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:55:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so2697554ejc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5yLmlM5a0lCWnrqWFlSAX5x1rjAV5Ted/ih8zQMe5Fo=;
 b=JAUs/5LD47E31LCcQ9Fh59tvVky8Tbf/lX0mQNsLKpTb7scp6fA4vv1lV9UimyQd5v
 L6WOsrYEjNJaTs67JdKJUJs0G9ee431Mw6mhyvFLZC62sW9P7O31VSIYaq70TzkpSAaN
 QQZNZWQSIbOo0E5xDk0bvJPjN3dH1JG+KHdDEd2YvMOvFD9mLSuT8S+297YBYNBh0vHQ
 9+mpGu2kgwcrcbsl+2UiYXuzIJyvdKNnSFFGbT1zkSLLbjingo1FcECNQqdGFP3NBcmS
 U96ErBe7fcYNoqSPF8Ku3rCsH1orkpVSsvGuUWmay9sLuwq3TeI2G8N2omgp+kFZ0vzO
 tYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5yLmlM5a0lCWnrqWFlSAX5x1rjAV5Ted/ih8zQMe5Fo=;
 b=dBkrxHeEzVbw46J7QOWALC/Mazr4lIcK4v07E3OGWRN9sMcwQX/rdov2G8BJf+CB68
 8tVYJ00cHnSDvvLRuVhQIiA3Hg6eSwXc7UhbvPySS73HHbs9HylD3+5NXt1fTl99R/mx
 n3jtxLjROWMghV2c/eyirO/EjFzM6BgsSuOvCt51VsJftXS/oxyJHGrGFIvXHCtUcEJV
 7t5621G1GDUITMYaa8xnv4OIC0e2rS6rKkEFK/XxcT/Cc/g5OTWl7k2aROA0XCxS8R2w
 z+L/j52FXuSME4/Oh3ldiau/0jYa1J96kwaggTfUdjm7F8NA3o/IdtVozYh64faPL+qK
 NiAg==
X-Gm-Message-State: ACgBeo02uWnm7swP9Ni7QjbzrW7NmJEjnRZ0xUU2UEughVghUw3598Jw
 wQaFuLJd29rIXAsm3Tw4PcX/K3IWCxggk8E7EwrxBV4eils=
X-Google-Smtp-Source: AA6agR5/2xj1A2GyA+S/8nuqSZRbDrzPs+kNA+Zo/LaGk8vUA6H1kefIJca+SmKHxq4rX68xo/BmsWLIoyRDe3t2X3w=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr5397024ejs.190.1661514919301; Fri, 26
 Aug 2022 04:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131747.183041-1-marex@denx.de>
In-Reply-To: <20220801131747.183041-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:55:08 +0200
Message-ID: <CACRpkdawb3faeFda17pDL+zEpbuPh0rmtXevenbO5EZgb4-V2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for external REFCLK
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 3:18 PM Marek Vasut <marex@denx.de> wrote:

> The ICN6211 is capable of deriving its internal PLL clock from either
> MIPI DSI HS clock, external REFCLK clock, or even internal oscillator.
> Currently supported is only the first option. Document support for
> external REFCLK clock input in addition to that.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org

Fixed up Rob's comment and applied both patches.

Yours,
Linus Walleij
