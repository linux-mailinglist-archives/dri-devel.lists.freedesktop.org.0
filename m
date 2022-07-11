Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B276557040E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 15:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DF210FAF5;
	Mon, 11 Jul 2022 13:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0B12BB3D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 13:17:46 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31c86fe1dddso48570597b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XwawR7vnKd7UkKrDwGQGs4p2XShfnA+f6bCP/Id3gGM=;
 b=Ge3IlBffpWeWq1wJ3M06BByewAKr262qUoy5vtnOh3Nu3cYgN4e/ePUqCHaf8eexS2
 U7deUaVJopWPke4YIWTlJbFXXQ6JNKfmD8aVXZV2d8my3h6mzl/M0XDt9W8lPL+/0i51
 /oYi0K14cBIQp7QohrJ6UCFp3KALbaKwEs3q1PdnawuQ0xXOLAyF1SqqQStpcuUOQgno
 1mpL3TpXlSn5/fkdszJ3xWgGUj7mqIfo9pYZKiJWDKX7lU1kCpQ4eP+JxxAHfBeNZzgA
 491ZCm00wjzabM//9o5Vy+nI5NKuTaZeHR276e46s6XDFCQHeW6KAzJVPBaHs54aAErX
 rbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XwawR7vnKd7UkKrDwGQGs4p2XShfnA+f6bCP/Id3gGM=;
 b=YuulPZcppTyogvvk6LhVAIqPqzJ4RCUDH98VU/KbEUiZWPFwFN+QXdsYv8fIn++WNt
 7etjvWXxms/Q42yQgpDp+K/BC9X6GXySAsX9EyDm8x2OLN9YkxgvoAogC0AQTA5RL/yJ
 3XdV1YA1IUvxpjA7kDnKBWPXhFaPwjAZEKvxyGBRlS7t7rNv7veP57EpvZ+rM6W5zFww
 iG2VmRGzX2gn5y2JnSc6M1dnhHa6tuvGEamy3O3SIdiFI2Kg+dCGS7kM6GPpXmI31hvk
 Vhpc3bjqLuwM9ydI+ySjrxym75WRsKy7I7OpvfFixJ3pNWGOnWSUdShIWV/rmTOFsMgp
 xoYQ==
X-Gm-Message-State: AJIora+9ZsG4uVP5bNLIHk8QU3mOedzIuwSxYSex+ZziUNkyNOjdnMFB
 kRzKB76seQPAB0ky5GIh7gzLcznnnljBauOodxdpRA==
X-Google-Smtp-Source: AGRyM1t0EgQcxq9nPFR3w/MN+QWQJL4ZKk1Ex6YdSFtHAgHKbwP1bIP45ww8O8aOr0vXvWLOnQbwmPmDoRn1zZ2ILuc=
X-Received: by 2002:a0d:f801:0:b0:31d:851:96b8 with SMTP id
 i1-20020a0df801000000b0031d085196b8mr19516358ywf.448.1657545465732; Mon, 11
 Jul 2022 06:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220710194437.289042-1-marex@denx.de>
In-Reply-To: <20220710194437.289042-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 15:17:34 +0200
Message-ID: <CACRpkdaQuvvgNNrTM6pcsoW=fKRwWRMGdSiOk2isFT6v-E-Ugw@mail.gmail.com>
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

All very nice patches
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if you need me to apply them to drm-misc as well.

Yours,
Linus Walleij
