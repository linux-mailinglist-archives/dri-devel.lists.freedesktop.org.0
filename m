Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1C393A43
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 02:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F46F529;
	Fri, 28 May 2021 00:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04A6F529
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 00:30:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q1so2773529lfo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cAYxSZ2/LUsSsn8d06yEcKP0Gfca5oqTYVqfarEyY4Q=;
 b=CGtHb0yWAyWtrKrDJIeR8VvZXgsNXy84JWlXeb19e88ME4csylVRHl7Lcd0FSfDG0h
 ryKXiFr8u9YGB+o8gN9tyhxz+8cY1mpCam+L8sKlzDjb/42QPB8sNGoba6bPqd9anVEN
 kxYBVVuI2MpYL5detAHUgrZRAHMV3L25XISvh6/vovNXuIn3BTU2ZD5RJuDCVhmLP+LF
 aHdccEzIYbbY9D1GDhNCytmG45H5v/JQZyvRqjYzagGmAfhnPFrh4qIu6DsGUN8B55zh
 wxYwjrkV1MIPbk8KDhuf3kM6wY3c0iOY5tgMqzWgJrnM/Rhk3RniD0Lwb2pb7uCZJZXs
 UV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cAYxSZ2/LUsSsn8d06yEcKP0Gfca5oqTYVqfarEyY4Q=;
 b=Rexb345XBxpYRzoMImbrXtxlBowe/AG98x3KrQhMXmyctpC09jhOwRCuQpp+hHQHj9
 ej1IVvD36Uof1ihnOOdIi2BvyEzgSJsYUfHPzI68wQHTm08KbeQ+UK+Cc+V6o8Lk8XTS
 FpjG/lh42Rqw+q9WcjlnN2SlP2k/diILMD2R0rUZ9FdOIABz4yXcsq61NfiHlbea8vg0
 NA0ekmcMkSytokEN9qwt4+YvU/0T3xbmt28p4i30mQbw0ye6+o1TGbVBiqEVB9T8LI0i
 iCO82/KFnVaFqwKju/h8GIb0r0dSQim1W5ZPeRPEIe/8rQhqKHytFdEt9brZAyHGsEHd
 JWKw==
X-Gm-Message-State: AOAM531cCAgsa3VYnr2MIPNWHOVneTX4Y/NAyR4uK+rK4HSBaEcJv7Il
 19lti7jMez9puUL9jmbogYiQgY/t3gPAWroKuI7vmg==
X-Google-Smtp-Source: ABdhPJxjKWZl4nXKcEb8D++9zwhUGTk9lmQJdMjIN1Wc6enAt0Oqdih6wD8S0QT6XSpnKxPCjDnCZ7wSs6HcuOnh1dU=
X-Received: by 2002:a19:f616:: with SMTP id x22mr3924647lfe.291.1622161804749; 
 Thu, 27 May 2021 17:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
In-Reply-To: <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 02:29:53 +0200
Message-ID: <CACRpkdZQ_4OMfUPZj1hXzRzqcfbhnrOHZ42NdP+giKbcz3=2VQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Sandeep Panda <spanda@codeaurora.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:

> The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
> how using the DP AUX bus is better than learning how to slice
> bread. Let's add it to the ti-sn65dsi86 bindings.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
(...)
>      description: See ../../pwm/pwm.yaml for description of the cell formats.>

Just use the full path:
/schemas/pwm/pwm.yaml

> +  aux-bus:
> +    $ref: ../dp-aux-bus.yaml#

Use the full path. (Same method as above)

This removes the need for ../../... ....

You do it here:

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports

Other than that I think it looks all right!

Yours,
Linus Walleij
