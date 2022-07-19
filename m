Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474557955B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B9114A40F;
	Tue, 19 Jul 2022 08:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375D814A425
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:39:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x91so18634176ede.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K0OAbKerRqgyFjt7G7NUv6wQqaETTVMhms061EthEbg=;
 b=RV1NBT+Rdgn9TM3jYga9F4pG/9t+9xf+/NZ9WpzQ5XRqoA9+bJCcwPV1Z5wQ3tuP3e
 WQZb1VT1hsTDDMDVIo6Y/N8muMJwlLokxWIiIC6tTkCLmgmIMaY7fyQN9RRiPSqZ3kve
 tmgiOjHOqVrjOObN4klln1gN24SGvnF7SDG4NeoCfhj+KV3KhBquMv2hjeLF1+PdZmIq
 MNbHVv0usaSuQpNS1+2rGHaLA3EqU892EHTHQ3544pWAGIohFvp8TZVQguskqSSM3uko
 r1O2GU3paiPbIKtn6i39mcjgtrQVJdDe30w6DHqVWV86MVUL/omBAkYK6M+Z7xQdZynT
 alyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K0OAbKerRqgyFjt7G7NUv6wQqaETTVMhms061EthEbg=;
 b=wTQCGRlwfLiusQDcQHEVavbRN7I4GHHxmZnoLBOXvTOyrDtFCATgtTQev0mbVQcx++
 8FCpyqyvYV8SJf+04Y3trCo0ztbKdax5jqYsbG3DXpSRnIV5s8D5lNHTVY7avN0Audwk
 nFrsiLwr1ElOpazXSofsNh7Shog6zejhU1BQbi10hSKvIVts/wi6VorptGiK0byVY2l+
 +4YOsl48olVMZ/w8VQrR+ua4kO/y+gt6f5lmpX9iQty17I+jDdeRwMxAZ/ADGeveCJNN
 XH3Sm1J4dYz33ytbaaP3b2bGwg27wdpTkqjbsA3V1BLFrQmMkerCdL0vIi2R3L+iIC8M
 kJYQ==
X-Gm-Message-State: AJIora8Q8xxyg7Yt2gQpSCiNsV2NVN3b9UY4RzNA6P3vELN+PcAXOu+N
 5U6f5ZPb632xmWyUXLpbXPea8WgNusX7mcrgOCoSww==
X-Google-Smtp-Source: AGRyM1s8ciK9bfGNqx9miZK6LJkKg+khEsHxfyjlPKq25NSXeSeJ7o62oB0bvAnEYF4XPVKSudsKEiG9cjSxu37YNQs=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr41000793edb.46.1658219993771; Tue, 19
 Jul 2022 01:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220710194437.289042-1-marex@denx.de>
In-Reply-To: <20220710194437.289042-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Jul 2022 10:39:42 +0200
Message-ID: <CACRpkdYSh21KbT+egW-0ePP7v8x2tOG6rH2ayCJx1SXNpA46DA@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/panel/panel-sitronix-st7701: Make DSI mode flags
 common to ST7701
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, robert.foss@linaro.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 10, 2022 at 9:44 PM Marek Vasut <marex@denx.de> wrote:

> The ST7701 and ST7701S are TFT matrix drivers with integrated multi
> protocol decoder capable of DSI/DPI/SPI input and 480x360...864 line
> TFT matrix output. Currently the only supported input is DSI.
>
> The protocol decoder is separate from the TFT matrix driver and is
> always capable of handling all of DSI non-burst mode with sync pulses
> or sync events as well as DSI burst mode.
>
> Move the DSI mode configuration from TFT matrix driver properties to
> common ST7701 code, because this is common to all TFT matrices.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>

All 9 patches applied and pushed for drm-misc-next.

Yours,
Linus Walleij
