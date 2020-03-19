Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51918B91F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 15:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79D76EA0C;
	Thu, 19 Mar 2020 14:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85786EA0C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:14:39 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a28so1730391lfr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxjXVpGbkMkJ0WExSWqPpSaBQvMwnWJnTr1Wx+V8SG8=;
 b=AZOPCFBQYSqsz/AEYGuuPOzJTdJ/ZTsTX/5uwunSTWHVK4GeC09eczWB8hdsOqDQsH
 NE8V3RKBTTt/IsOKfyue6IUukFCUmj3uB93xzQ16sNd3pX1n2wcUou3DKPqS5PevTns+
 5LNt1lCgFE2eWtnlkTxMBQdN+pvFJKsgupqIqdXFoBTY7yLdtCl4MwY5foZ598hflKd0
 QT2gQX4or7spIgIPXs8+H8T97cA1BW9Up0Z2Vcurti7BHsL+aF7uRlooa5KRFECreWJz
 bd8L7aFaU+J0uvbvpWCM1DHhdsSBSToFgHhOJr52xfwt7vvwoFoygtLsq273UwCfnbVy
 J3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxjXVpGbkMkJ0WExSWqPpSaBQvMwnWJnTr1Wx+V8SG8=;
 b=kexR36FzOga8gH+4/wkNhHMLMdhtfpGgT/H6cYgctFFDpZM4xy6EX6akoU4NesKol0
 DEb6ZXsC8E8LTPGN7vVDk6q14eSglx5oVSLw1uKfQNy+C1n5/1GsbqHWy5ygrk5/VDaB
 +rvFpiN/mYwwWbLvFbOudQFj/R4R3F3R13b4buJWu4RZ9Q8jYbkvQS7mVmnuXQCihZGz
 Ifeku6A0yRI/NWR+fZCRbc4yC/hzgvNW2ZuCcKJC58MJh2aWp/cEL7gSbbUUJQAyi7UD
 +WzMzFhfzYA6cDewFZGXIDEKAUYjT+pWqZxd+WgXdtLOuDgwnXmy0wfylXUnfqfLV9hh
 3Tgg==
X-Gm-Message-State: ANhLgQ1twAeC4SFFA2J51EkwCjrEgpkeOFWsAmNkrJKa87D0CVYv8EjL
 eWhigbpPgFQv9Q91ljmY2Bqua3pcokQPvRv3fVOhoQ==
X-Google-Smtp-Source: ADFU+vt1yS1vI9ljM0gwVaf68ZRjuY1p2nfT2WzK32ag3cYSnzmKGhQi4YvVl/W8DZtvTQtWWxSu7seu9AnqnrT9Fjo=
X-Received: by 2002:a19:2353:: with SMTP id j80mr2188497lfj.4.1584627278167;
 Thu, 19 Mar 2020 07:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-3-icenowy@aosc.io>
In-Reply-To: <20200316133503.144650-3-icenowy@aosc.io>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Mar 2020 15:14:27 +0100
Message-ID: <CACRpkdaVrfd1p+WyACy-gq-3BPsXJ_CZwi2OZe+=csseBcvcaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: panel: add binding for Xingbangda
 XBD599 panel
To: Icenowy Zheng <icenowy@aosc.io>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy,

On Mon, Mar 16, 2020 at 2:37 PM Icenowy Zheng <icenowy@aosc.io> wrote:

> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel.
>
> Add its device tree binding.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
(...)

> +properties:
> +  compatible:
> +    const: xingbangda,xbd599

As noticed in the review of the driver, this display is very close to
himax,hx8363.

I think the best is to determin what actual display controller it is,
I think it is some kind of Ilitek controller since Ilitek ili9342 is
clearly very similar.

The best would be something like name the bindings
ilitek-ili9342.yaml and then:

properties:
  compatible:
    items:
      - const: xingbangda,xbd599
      - const: ilitek,ili9342

Possibly use oneOf and add support for the himax,hx8363
already while you're at it.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
