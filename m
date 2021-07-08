Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F417A3C1A47
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AF96E997;
	Thu,  8 Jul 2021 20:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E16E997
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:04:30 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id c9so1778519qte.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fCKQmPRqidSrEdK1oF2NTwicJdS0fQ73GVZ7z6e07fE=;
 b=NVdfCg/fngNZMBrRcVwI7V+y8yniNPNHjgSSpuZBgMwwM8pN5dLPVxFJenSSmc77DB
 OzR4Pzjv6ntdN+ik8+pmc8V8SH2T4PbL6ztjmr8xVZGjn2hs8Z74KUxHYe/j+dL42zQj
 l85uBYbzLHt/KDrLp2G6+pP2Vt9Di+FRDz0fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fCKQmPRqidSrEdK1oF2NTwicJdS0fQ73GVZ7z6e07fE=;
 b=rLprZojYZhjE5JPiGmdRmmwJ6CkzgcpU/RV7O/JNji724ivSQhhY9YK4DAiHCXGoHW
 DtNITawSuOYdgPpMLgTJXOcFvswhgmJs89b8AA5YmNlQJnPoJhpGNZ7Fof88BELTLFLZ
 5pEBdXHCLMbvPw2ABWEmVHGrQgC3dAaUXKQSoVlsbjk4EX+bJWz5GNwZFqHX4JF6X4bV
 6Nbx3F0xrILWmlUgtO0TGvHnK6rL0JzIt8qseWRop0DazXKqH12mhMG+oDaw632Jvf7S
 6MkPmcLoDYGLnt/FD1HKMLl43Lqu9cfX8QTL5kUg4Hisk083lSBmtbxSEZt5othyon1k
 V0Xg==
X-Gm-Message-State: AOAM533ka3fMqukY/vQsTcUfsLLBcR1jYrU6As/8sLurGoDl+zbsmOH2
 GOaXFGeoCOXrljC3vq9ZzfCY/yulrcabmQ==
X-Google-Smtp-Source: ABdhPJxV8u+hjg5pC9GjBj5pz6puduLPVh2XU4dx+vbvUMTOm+agUfycK9PJIo/HrpWEfCHyrCo7sw==
X-Received: by 2002:ac8:5ed4:: with SMTP id s20mr5617365qtx.199.1625774669616; 
 Thu, 08 Jul 2021 13:04:29 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id h13sm1474740qkg.13.2021.07.08.13.04.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:04:29 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p22so10914653yba.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:28 -0700 (PDT)
X-Received: by 2002:a25:cc52:: with SMTP id l79mr40125274ybf.476.1625774668579; 
 Thu, 08 Jul 2021 13:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210701213618.3818821-1-linus.walleij@linaro.org>
In-Reply-To: <20210701213618.3818821-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jul 2021 13:04:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwtO=KL-abv87HNZ3wHjDd2rRVF68j4JURj0MB7gw2sg@mail.gmail.com>
Message-ID: <CAD=FV=VwtO=KL-abv87HNZ3wHjDd2rRVF68j4JURj0MB7gw2sg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Fix up DT bindings for Samsung lms397kf04
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 1, 2021 at 2:38 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> Improve the bindings and make them more usable:
>
> - Pick in spi-cpha and spi-cpol from the SPI node parent,
>   this will specify that we are "type 3" in the device tree
>   rather than hardcoding it in the operating system.
> - Drop the u32 ref from the SPI frequency: comes in from
>   the SPI host bindings.
> - Make spi-cpha, spi-cpol and port compulsory.
> - Update the example with a real-world SPI controller,
>   spi-gpio.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../display/panel/samsung,lms397kf04.yaml      | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
