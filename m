Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DE3A36D0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7B46EDFF;
	Thu, 10 Jun 2021 22:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD46EDFF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 22:04:35 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id r16so7052095ljc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bp+9CvXO7nhLgF1Mfng8HxDSK6Fsz+bIIY1TpNGF91Y=;
 b=jmL+JYEGZuJJ/fJbuJlfiSjK2CS9cHPmdfV17WMCN0kgsek5zUpRdsQL5q7Iu+9yDQ
 QYw5R0NQda1qWkkQG+QWI8GFPmwT7tREDnvqZ2DLhOS4zIF1h/YT8eZsabXQyKZLQFgI
 qlhGmyRay5NqiQaD14LcoW7XZNpzuNuG4OJEgOzP7RxY3CBNT+NmaZgtoNJtKDYJkoCW
 fJfr76crw1uinDuRv5eGUBeoEyts7wEGTpCju6E2OBQ/Rn0aeQ6unggAvj+36tSz+Ez3
 ASQzCI7v48otsBMX8p4FrVVqeMw/cd2+yCSpjBKESy33a8Tj7yj9UMx7B7neH0fIk0VI
 UMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bp+9CvXO7nhLgF1Mfng8HxDSK6Fsz+bIIY1TpNGF91Y=;
 b=BTJA7CRoM/xdtYEVMqU8m0tBXxT19bROVYyfehC940cDurJXdYFG2Niy0NrRb5VCMc
 YUnJF/PEioQj8gXZ/S2rNbS5XGrhShQo/SR7Q2xyqZT2dEDsHakTTR3yTlBoMsew0tgn
 8Og1elonGPC77etfKSbv2U/LLaoZdY/tKSuUB8RFZnlOgZr3749J1B3DjjoZgHSzJFrA
 4rjZb16HXtZwXE56ZBZCQr+La2V7EBlgXsdPEPVBWIPBnrdF6VAGGp7ps0VXPJgmr5kc
 lfSKKNYTUybPShP7bX3d0owECORKFCoHg8jpwx51GgTSu6r0BzlcWGp9xo1+dSw/sxaO
 j4ZA==
X-Gm-Message-State: AOAM530mhydS0XMh5CdKatnswTovCln4mke6Mfe3iMMdrejYtIQgOR0d
 eOeJxvJo6MNKZXnk7ql4rYKF8hhjtIfG01cX8bMQ2g==
X-Google-Smtp-Source: ABdhPJy9o4mR2r82ymQEr0xXNyESot0s5l+pGbHsObBJ9anV5WeIIsLAUMga5LI3oyQn4cWlpJ97glkqYu44DaVz+70=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr530122lji.326.1623362673846; 
 Thu, 10 Jun 2021 15:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210610132501.315086-1-linus.walleij@linaro.org>
 <61750bfe-74f4-b425-f312-4bf791ad18c6@tronnes.org>
In-Reply-To: <61750bfe-74f4-b425-f312-4bf791ad18c6@tronnes.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jun 2021 00:04:22 +0200
Message-ID: <CACRpkdZ0x+3a5bxXTSnTU=H81tG5dzRONwa+TE+_cetbi8srpA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panel: db7430: Add driver for Samsung DB7430
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

thanks for the review. Doug poked me with something sharp
until I finally complied and started to use the DBI library.
Now I have to convert the other 9bpw DBI type displays
I have.

On Thu, Jun 10, 2021 at 6:15 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:

> > +     /** @reset: reset GPIO line */
> > +     struct gpio_desc *reset;
>
> You can use dbi->reset.

I fixed all except this: it just feels weird to use the struct mipi_dbi for
storing the reset without the DBI core making any operations on it,
I think this and the regulator should possibly be moved over to
struct mipi_dbi_dev where the regulator is.

Yours,
Linus Walleij
