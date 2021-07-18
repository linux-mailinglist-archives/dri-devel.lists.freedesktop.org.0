Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8D3CC703
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 02:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEBF6EAC9;
	Sun, 18 Jul 2021 00:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3B66EACC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 00:17:05 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h9so19690070ljm.5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 17:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1WDN9LkkfTLodn/7AZmvdlWK3elCwMaUY4+s15zcjs=;
 b=lr/rWTTelnW7nH05zdzy9FmUTLjtt9x/tUlCN50zyyz+UyWy1fPUrp4MBwEazKLI1X
 2tI09g2FvGKVdBNeR3iA0kePNjlxn4uF99kvRlbRpGmJBtM2bXfqPCvnMsV4fZEDXgOB
 cfwfCTZpRJpP8XCfwPBB5HLe6EFbcUx+r6SV3aYbkgX+R7j54g2UEufmNHwppKl+Dy60
 eOF4MHP2iIoOLUblsBzMt0mEgLB7yhdJNOCfiHkbgnmudCLvzyCDPAW4uBSYjhD/V0iB
 QzT5UmxJpzVt0uhk/TARoTkXEq7y4rI/1NwAj9vsXfO4oc8lvVdfu0NPKzeKeoGF+Sjn
 KtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1WDN9LkkfTLodn/7AZmvdlWK3elCwMaUY4+s15zcjs=;
 b=KX0RlBbx5LYZ3sKAQkKF3NUX6W+4MgjUPi10vCyAfbIlCY7IeFR6SSo7lKmDbbrWpU
 ISytPa9HAFOb8pS8A8Qe1v+YIAeYN4x2r0AVCMoAWME/+KvYUGIoZswl0bl5bfV3Om5Z
 SN/tylwDju0JCAVrhqiuwQfxDzGvflAL+eSuBQV2gM61JJvXmYwF/r98C1isVpcTWR/i
 e0pHq/owA2Rl0m67CkAklLfJwo027yjacT4P067Id3PsZocsiX2xHN6uDeeGodZsTvHM
 DT/SDYp1IU80o/WhpU/pOgfsgPReBq7EU1CVuYUqMPbrb64IPLk73E6FSX5n8tWuKAjq
 C4lQ==
X-Gm-Message-State: AOAM531lGUzuaRZrD0rvoX3/xrJKef9XiXUpd5GFT/5KhBJOpDBqUtyQ
 prRpGrDxDsOVP0olPzMH5QhPB0y7fkWx5zbKpbZh2Q==
X-Google-Smtp-Source: ABdhPJyH8Es5S0fiHP/hznaMowGfa4CiQ/5DqH3eELfDWrap1a8f9HW2gm8T83Kn6nYavVuv3RpCOGtt2aCb7jKivCo=
X-Received: by 2002:a05:651c:160e:: with SMTP id
 f14mr7064711ljq.273.1626567424296; 
 Sat, 17 Jul 2021 17:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <1626430843-23823-1-git-send-email-dillon.minfei@gmail.com>
 <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626430843-23823-2-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 18 Jul 2021 02:16:53 +0200
Message-ID: <CACRpkdbkOY08THPsPHfOOMeToHGXZvN2DBoKG9+WHeke9jypzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add ilitek ili9341 panel
 bindings
To: dillon min <dillon.minfei@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dave Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon,

thanks for your patch!

On Fri, Jul 16, 2021 at 12:20 PM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>

> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)

This is a DBI feature so mention in the description that this is a
DBI panel.

> +  spi-3wire: true
> +
> +  spi-max-frequency:
> +    const: 10000000
> +
> +  port: true
> +
> +additionalProperties: false

Please add regulator supplies for the power lines, it's fine
not to implement code handling them in the driver but they
should be in the bindings.

For the ili9341 it should be

  vci-supply:
    description: Analog voltage supply (2.5 .. 3.3V)

  vddi-supply:
    description: Voltage supply for interface logic (1.65 .. 3.3 V)

  vddi-led-supply:
    description: Voltage supply for the LED driver (1.65 .. 3.3 V)

Yours,
Linus Walleij
