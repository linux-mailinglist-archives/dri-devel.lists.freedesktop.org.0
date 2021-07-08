Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C82643C1A4A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 22:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1FF6E998;
	Thu,  8 Jul 2021 20:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05E6E998
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 20:04:38 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id g4so6973654qkl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2tis/C0UqjD1liYeV/9bMo7ufMIoxp5d9o+L0SuTnWs=;
 b=RHXdaBuqa3OJyiICnd7gf3m1qaVIoxCbA/3OKJw9OC1afjnH5B3IzyVjEKjd9obVC4
 oCZSj3wz9V+Eh8wQobsRIY5Nj8sCBeOHniUIJ/FKMQBGMWtzbnf6uMNppMjPGgKc0HDf
 6TtbAOulin63zapccYSnuPM8QlByvJcQNHjms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2tis/C0UqjD1liYeV/9bMo7ufMIoxp5d9o+L0SuTnWs=;
 b=oNxR00yvMX7/bYNUMWE+zFQGFAPqsGhenhuNCZDVDDZdcXLt/kTXdOoKImsXnF9FTQ
 iJs9Gx5FFTwxh1lFHg54qpWInbGiB02k1mJkVbIbvfQDDNMzBlVuhH6KtZyZW1+HFLtg
 rwFyC1iIethZcz9BD2rzpscn+FR2gQE6yQu/rKtHFtDEVRMhvFozVYAxmkusKj5CL0rq
 Y3uHdce8/5hj9W/+DobbRb+dm+SrKi5wHvZ7vAmD0eaS4kJkY5QJpB+EtMY+UwH7XwTB
 gcDTKYQzkY7+8vwJzmUg6cAZh8kr1+4vQl1tV/aPRpYcUlMB4MnW7Iw2D0rIZEPHiYqJ
 XZ+Q==
X-Gm-Message-State: AOAM532kjod0XvMzFiWAWkxlbz81l+9YbJoDK9nkOXTl95Nezk5C8co7
 TwMhfK3Iigu7AX3Ognrh+mUhoRwNhylVaw==
X-Google-Smtp-Source: ABdhPJyFTjJnofAzjg74ur0q37nJAL6UjGKgHkisgQSRXQrHy3paWE/gt+Wlt+kiE0S5s08k8cwD6A==
X-Received: by 2002:a37:c05:: with SMTP id 5mr10048215qkm.415.1625774677281;
 Thu, 08 Jul 2021 13:04:37 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id d24sm1453511qkk.61.2021.07.08.13.04.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id y38so10944190ybi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr41020230ybm.345.1625774676301; 
 Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
In-Reply-To: <20210707234315.242663-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jul 2021 13:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9tOrwu_vFyYy_uyA+BM2sPPx+erS9Atdw72-m9v68ig@mail.gmail.com>
Message-ID: <CAD=FV=X9tOrwu_vFyYy_uyA+BM2sPPx+erS9Atdw72-m9v68ig@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] drm/panel: Add DT bindings for Samsung LMS380KF01
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
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 7, 2021 at 4:45 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> This adds device tree bindings for the Samsung Mobile Displays
> LMS380KF01 RGB DPI display panel.
>
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes just resending with the series.
> ChangeLog v1->v2:
> - Expect SPI bindings to be pulled in for the client and state
>   spi-cpha: true etc.
> - Make port a required node.
> - Update the example to use a proper SPI controller (spi-gpio)
>   so we get full validation of the example.
> ---
>  .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
