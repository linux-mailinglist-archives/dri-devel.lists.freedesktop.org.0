Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBB70E2C2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FDC10E484;
	Tue, 23 May 2023 17:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008410E485
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:30:57 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-56187339d6eso97748007b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684863056; x=1687455056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCJa6a9Ra0P6pgbG0lhDXLRP41OI9WKqV43rqziMdQ8=;
 b=ve1uZ4uzbxpWqFdZAeBe4akBPIsstn7rc643BsI62tzmJXzN0UOAQSh5WDvBcvmdnr
 4pV3C7ImiPfdiT5O8+w4pLLfV7EhcM4tQRCmcnsmHEDN9yPvXiH92r0sJS0HOtJORZDc
 kCN1qKjbRje3eM2FnszyLZoJjdx/8dXklM6BY9pO/hFXprIpQLpMayP7eE5dEd0p0xlq
 lLNWO/y+pbHTNIfNsUWJKOjQM0fcJafjd0pXCAio2y+poeMOyVoD7i+9POdcOKaH1bhK
 KsWqH76g8SZBwXRRDvw8Rt/ohdLjozmCKIJp5KKJAjXAHPN7ladD5eZs2KQqPCj8i8NJ
 Javg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684863056; x=1687455056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCJa6a9Ra0P6pgbG0lhDXLRP41OI9WKqV43rqziMdQ8=;
 b=HTOiHe44uJRu69gAvbhL5sD7J0hnFWfIcaFfly+fX656SCnCS9TtNFNlW5KU/wMRiL
 3PTJlI/ugaPZVJgHQ8QTRVHXGtpv5XirjDaoWl3K/hpuWScEWXGCSdWsQh5L8K+YqHf9
 ZPksDrGZyuXxsNk4wQeSSIO2mCfvnkTfteebEWM0vLzdG89sAUIWneK6vGFWvY1SzvTU
 AqEDEhOcLgF3ZrHF7pfEw85gRxApqhKDIe8aCxIoEmDcttwbh32mbBirqIPZ1RB7x+nK
 pQUia72ZUPdhtqeuIGPndxL02YK7Q45NfwvonAXx9Ve8ufl7k12lrOaxJUrSjp1oMCNT
 5nBw==
X-Gm-Message-State: AC+VfDwnBFZlkqpvl8xibKoWy4j7+HlrCmYMqCtaXO2StwFLtfNr2BGz
 9/UCpdy5ir5ElwOuG1hvcig1DHjW9ENP/OUU8o7LSNyA3dk1Ij5XWuI=
X-Google-Smtp-Source: ACHHUZ6IWi/mxhp9wdD5jINZn8HH6CcwIeGxgs86a21+3mAKzVveQ6aQ30xRzyYLqcPze9lXJiK6c1Rghx2XzcBAopw=
X-Received: by 2002:a0d:eb0e:0:b0:55a:72f6:a451 with SMTP id
 u14-20020a0deb0e000000b0055a72f6a451mr12125650ywe.41.1684863056089; Tue, 23
 May 2023 10:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com>
In-Reply-To: <CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 19:30:44 +0200
Message-ID: <CACRpkdYwcFk0k18hxWPyPHukE87eiXSJm0_0+fjSJ=ktD_MEoA@mail.gmail.com>
Subject: Re: drm/panel: Add panel-mipi-dsi-bringup
To: =?UTF-8?B?UGF1bG8gUGF2YcSNacSH?= <pavacic.p@gmail.com>
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 9:52=E2=80=AFAM Paulo Pava=C4=8Di=C4=87 <pavacic.p@=
gmail.com> wrote:

> From 118419935002e076b44292c832e9b26106f93c89 Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Paulo=3D20Pava=3DC4=3D8Di=3DC4=3D87?=3D <pavacic.p@gmai=
l.com>
> Date: Fri, 12 May 2023 17:38:29 +0200
> Subject: [PATCH] drm/panel: add panel-mipi-dsi-bringup driver
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit

This header is really mangled. I wonder what happened?

> +//macro for writing to DSI
> +#define WRITE_DSI(dsi, seq...)
>            \
> +    {                                                                   =
     \
> +        const u8 d[] =3D { seq };                                       =
   \
> +        int ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));      =
   \
> +        if (ret < 0) {                                                  =
 \
> +            dev_err(&dsi->dev,                                       \
> +                "Error (%d) occurred while trying to"            \
> +                " write MIPI DSI command: %s (decimal value)\n", \
> +                ret, d);                                         \
> +        }                                                               =
 \
> +    }

This is reinventing
mipi_dsi_generic_write_seq() from <drm/drm_mipi_dsi.h>
so use that instead.

> +static void brup_panel_fannal_c3004_enable_function(struct
> mipi_dsi_device *dsi)

Doesn't look like a good name for a generic function?

> +    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);

Use
mipi_dsi_generic_write_seq()

I suppose these review comments go fo rthe c3004 driver too.

Yours,
Linus Walleij
