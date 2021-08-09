Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C013E4F1F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 00:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72789DE1;
	Mon,  9 Aug 2021 22:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700589DDF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 22:20:57 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id y130so7551009qkb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Za9sG3xavNdXyC/5nel3LftkdoSVz3OXIotst/1d2UE=;
 b=mya59Hb2zQ0XRhqzkfHfC3tVam78Q1XZmhcb1qmWvSNp9iSBoZR9mpsmpXX05VjvY2
 3pTG8lDVTK22CyYEIUtEZ4Y/cJbBUTA7Yrq71gOAF3wzPmGUfEwL7GQTQao5TtZ16D20
 vXedsKNAiRkT8/ZNnGnE2ed4lR1IzuLIsCOns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Za9sG3xavNdXyC/5nel3LftkdoSVz3OXIotst/1d2UE=;
 b=ZKku8JYZVnKVk9/25kOeiU3US4LeomSxBZztTbp87Idso1ksPQIvUsrkE2EYy+2c7H
 UV3roTisROprfkoH7jtswAsU95fmm4/pmIYWwEd5RLDWXpzJd7ZPRf9toEJo1oIRbmF9
 TatOkSTna4f9QRVIvPGk+rEOrnhNrp4vSd/gjj3fgJiUyifc25AqSGOGPTSEUiT47dNg
 rMgC72wtEIF7XGYU6e/l40t5likyvXlDgSTc3YavfkeXi6/CGgsOyuQYclBS6z8HzJQW
 FuaHuLoNItTi+W0i5FkCcl/qGD+zs5KaFbz5X5BinfAnW77TftkBQl1b7jELUQiE1UTb
 wTXg==
X-Gm-Message-State: AOAM533W+AIJl/4KqaCMLV9a1nkN+g7dD20PxBnbZFuappNVwwuU7Wzc
 4BPtGyXGmQcwtBge4poe0YDAtypbiQ2tiw==
X-Google-Smtp-Source: ABdhPJyPgdFIL14Awn9szLDkiMQ/6E9pCqhDnifyFtwPhhIgd3KUyDeP5qVoud+ch+dgw6sZ1ak3og==
X-Received: by 2002:a37:6682:: with SMTP id a124mr9945887qkc.127.1628547656245; 
 Mon, 09 Aug 2021 15:20:56 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id u25sm7454720qtq.85.2021.08.09.15.20.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 15:20:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id l3so13605ybt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 15:20:54 -0700 (PDT)
X-Received: by 2002:a25:81ce:: with SMTP id n14mr36257135ybm.32.1628547654476; 
 Mon, 09 Aug 2021 15:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210730212625.3071831-1-dianders@chromium.org>
 <20210730142537.v2.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
 <1627911583.050984.918758.nullmailer@robh.at.kernel.org>
In-Reply-To: <1627911583.050984.918758.nullmailer@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Aug 2021 15:20:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U63qGf+RTOe=X+BYK06OuJM5N5Vy6zcA8+7ka1CFLwcg@mail.gmail.com>
Message-ID: <CAD=FV=U63qGf+RTOe=X+BYK06OuJM5N5Vy6zcA8+7ka1CFLwcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: drm/panel-simple: Introduce generic
 eDP panels
To: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Linus W <linus.walleij@linaro.org>, 
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Steev Klimaszewski <steev@kali.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 2, 2021 at 6:39 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 30 Jul 2021 14:26:20 -0700, Douglas Anderson wrote:
> > eDP panels generally contain almost everything needed to control them
> > in their EDID. This comes from their DP heritage were a computer needs
> > to be able to properly control pretty much any DP display that's
> > plugged into it.
> >
> > The one big issue with eDP panels and the reason that we need a panel
> > driver for them is that the power sequencing can be different per
> > panel.
> >
> > While it is true that eDP panel sequencing can be arbitrarily complex,
> > in practice it turns out that many eDP panels are compatible with just
> > some slightly different delays. See the contents of the bindings file
> > introduced in this patch for some details.
> >
> > The fact that eDP panels are 99% probable and that the power
> > sequencing (especially power up) can be compatible between many panels
> > means that there's a constant desire to plug multiple different panels
> > into the same board. This could be for second sourcing purposes or to
> > support multiple SKUs (maybe a 11" and a 13", for instance).
> >
> > As discussed [1], it should be OK to support this by adding two
> > properties to the device tree to specify the delays needed for
> > powering up the panel the first time. We'll create a new "edp-panel"
> > bindings file and define the two delays that might need to be
> > specified. NOTE: in the vast majority of the cases (HPD is hooked up
> > and isn't glitchy or is debounced) even these delays aren't needed.
> >
> > [1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - No longer allow fallback to panel-simple.
> > - Add "-ms" suffix to delays.
> >
> >  .../bindings/display/panel/panel-edp.yaml     | 188 ++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/panel-edp.example.dt.yaml: bridge@2d: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> \ndoc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1511822
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.

I think it's a dependency problem. No hits here:

git grep aux-bus v5.14-rc5 -- Documentation/devicetree/bindings/

...but I get hits against "linuxnext". Rob: I'm hoping that this can
still be in your queue for review even with the bot warning. Thanks!
:-)

-Doug
