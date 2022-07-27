Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4025820F5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62610E901;
	Wed, 27 Jul 2022 07:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387B62B02D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:20:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id f15so11838922edc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B/3cwhkrY8tQUxDVkHJfLpRrQkQ3c6JStKlEhPbpXlQ=;
 b=x9H/KCvxdJ3kObn/7BSsQE2qoNllZH8xzlRFwHYYzkYb3z4HYZ/5++haePJ1pb6RRE
 E3bIFjVYh2sfF9WBMgfTkZ2ANiE2R1RL5Bsge9/xKFlf3wEt42OItYicN1+lwUzj4LVY
 nHc9mjC5s+LUeK72Dz51hvMbAL9NEbdQtKD8YWSrCwQMwCiD7tZpLwc0lRwTG3oTasuo
 mpjQPm0s7NpgJJSkqm3FpbneDbwkoJcc/mqqsBhrAheYoPdh1t5Ummsce6HrfOASsLoY
 G+pQXS9sD3NVWF+zX6582lbCqLKzZ52DK4hTJBTaGsSnjl3iLNklzn3Q5J5YA6gosF8X
 6/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B/3cwhkrY8tQUxDVkHJfLpRrQkQ3c6JStKlEhPbpXlQ=;
 b=IR28lR3A5RTR2Jj4x/130g7/AaL74pJoTpbJqo0h7/FAfVJRViprQPSXwtU9QGx1fF
 LTj80YiAj+rrrpgBH2K+RaEeSXBCNoASjoDp8xjh+mqYML9fIDwgpBf6Lu/XMhGmk6rZ
 SyHvk/3Vne9JU42w+GimIkdO1wH7z6PcXc6Sf/+dQ4Exsm1GrlrGNGSvFdsCtMCsMY+O
 MA5wN3hojUcgdpEurPK5St9xVkMFUbabyrmdYjb3N6wS8+WF4sqdhsuT4zV8tulwpvwx
 cc1llJInbix/JhKcE8R8ueE8GA5gk5BBVIZj2bwinYSKl3HCXQK08joP8ZYCd9tq4ZV0
 hbuw==
X-Gm-Message-State: AJIora9ZChUIaQexyo08OiULZjffc4iN2DKzPHxSJf4f2D2o9Cj8i+qM
 82MjqJvijVDOqAcQnd3cfvVjL4/yBE6rmcZ4i4PRys/toogNGQ==
X-Google-Smtp-Source: AGRyM1uBVF7miPhsnFCu5Pn4C3OdzCgB5q7YaQg4Yn5UCnA8KzBYJa5NRIcW4OdO/CavM2YUzALCe9FNOZa2Ytd0EPQ=
X-Received: by 2002:a05:6402:26cd:b0:43b:e3eb:241b with SMTP id
 x13-20020a05640226cd00b0043be3eb241bmr18635775edd.133.1658906433770; Wed, 27
 Jul 2022 00:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220725151703.319939-1-marex@denx.de>
In-Reply-To: <20220725151703.319939-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Jul 2022 09:20:22 +0200
Message-ID: <CACRpkdZKt_z7sFEiPjUY7chFz1OTyL0bO3fW-rx-TuK-5L=Kow@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: sitronix,st7701: Add
 Densitron DMT028VGHMCMI-1A TFT
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 5:17 PM Marek Vasut <marex@denx.de> wrote:

> Add compatible string for Densitron DMT028VGHMCMI-1A TFT matrix.
> This is a DSI-attached 480x640 2.83 inch panel.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org

Patch applied to drm-next!

Yours,
Linus Walleij
