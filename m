Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D766A5552DC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7F10E158;
	Wed, 22 Jun 2022 17:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E4F10E158
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:52:38 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id n144so27397078ybf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fUSmK7RJ4lRM7Yk3nFFgboloKX+Bx0NQLAzjfaTQ4dE=;
 b=STXFwg1mfBWfKxKHCbKBpyd0eW/G6gEkq9668fjCDL/iGMPvKtfKvYJyqyEhEwixak
 kYRwtypdaZYxHUnduLk9aIAL9Vj0jJPwUTAiMBtvHQx0rp9UpqU5/dHF6qyaQByehRIV
 PdtFoiFiWq32cVeHJ4A7EO6VsPgKncenjRIII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fUSmK7RJ4lRM7Yk3nFFgboloKX+Bx0NQLAzjfaTQ4dE=;
 b=y9WhfGj54ZMhMQWyIF6Vsz7XOZjzSYVbRjNy9XiYhbky/GNfaBrwogl274AiCG0gEF
 xYWD73jLiuwsZsJv6BoAa6Eo7H34Pf+ThwCn0/zbaMYix5+EKPrkBP/3XnaLA2pnGYFu
 Y02BwmB85pe68y/dkED9fbViZvl5TzBtWr8J5yrvEBmwiMu5nomvZ/Bj4s6oiGycSsgu
 Q2icS5lSTCxF8VFD7bPEY8zA2TRXKJ06qs584UMJuTfwHgzoFultgP/t4WuhrnzoIG2o
 rtkgSsCl8jrYhAlTCo8hMGNTO03+qBuE74dYsbwyWNMCgEY8aGy1pRJkVLLnC+z0id23
 KJJw==
X-Gm-Message-State: AJIora+MBNYoyjq0oEhAu9RHJPLlc7Eqi4A+arS8fv+w+EJZNBHPG/vK
 ITqwxvthh7IlS5KQSUzioB7Bm2MmtqYSlGdZTWSO+Q==
X-Google-Smtp-Source: AGRyM1uyljzuoQBj9S63poZWW7UCRBrOVn0dHy9ufWgOBUKqN0s1gOhcOj48rq/eqEA/zMp2QRFHFs2auD5Rhi+jzn4=
X-Received: by 2002:a5b:8d1:0:b0:668:c6ca:7571 with SMTP id
 w17-20020a5b08d1000000b00668c6ca7571mr4869130ybq.445.1655920358190; Wed, 22
 Jun 2022 10:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <CACeCKaetgayTS+yX0cuNiK7j6Yqd4o2ziX6nCoGTt64A3jFT=g@mail.gmail.com>
 <YrHE9KrF0HG9rVi/@kroah.com> <8f0501c5-84f2-10f1-ae06-4b3936c50b12@linaro.org>
 <YrMxFeMc0tk/K1qL@kroah.com>
In-Reply-To: <YrMxFeMc0tk/K1qL@kroah.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 22 Jun 2022 10:52:27 -0700
Message-ID: <CACeCKac0missZ84EzgHK0QJpmYUSqRaOtEJLdRs+dejybrp0cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 8:11 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 22, 2022 at 04:53:40PM +0200, Krzysztof Kozlowski wrote:
> > On 21/06/2022 15:17, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 15, 2022 at 11:13:33AM -0700, Prashant Malani wrote:
> > >> I should add:
> > >>
> > >> Series submission suggestions (of course, open to better suggestions too):
> > >> - Patches 1-3 can go through the USB repo.
> > >
> > > I will take patches 1 and 2 now.
> > >
> > > seems the others need reworks or acks from the DT people.
> >
> > I just gave for patch 3 and before for 4, so you can grab these as well.
>
> They are gone from my queue, a resend with that ack would be good so
> that I can pick it up easier.

Thanks Greg. I've sent out v5 [1] which has the Reviewed-by tags from
Krzysztof.

[1] https://lore.kernel.org/linux-usb/20220622173605.1168416-1-pmalani@chromium.org/

Best regards,

-Prashant
