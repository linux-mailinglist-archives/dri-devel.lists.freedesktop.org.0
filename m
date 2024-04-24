Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6CF8B0B01
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400F610ECBA;
	Wed, 24 Apr 2024 13:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eQaSJakM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454A10ECBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 13:34:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de54c2a4145so2289873276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713965691; x=1714570491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5uts0F+G005dBPvbk0jOnlqwhvA4TASHvWq3ETeWdw=;
 b=eQaSJakMj1miQY1ElKzcYZ6WAnqvP5Cs+f3CaAkEuNXjMHGiX2WPtn9WIl8SmRhnzG
 Rpim0fP2uc+OXSF/MHhy82Dfpfe6jhIvk/1i0l3XQOL67NpqpLm+YfuDgWw4YJtr03ai
 /puPCExsx8r4qCbkOa2EeUeIe472DjKypvTtAkW4V6jfWgW4Z1RLrtCjvynuS+nmxgG4
 mei03e4XJIUQC+uNGCrvsr/IcBUSb5qsLQ31M+UiTLtYdxHaexw1HyrpuA+EXmmrb4gs
 I+zfEz1jXWmy13fxowwMqcvLtyLj9Ggs4C37DVcYTWkHWLjDqeFerDf0UPKJVMXYa0B7
 /EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713965691; x=1714570491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5uts0F+G005dBPvbk0jOnlqwhvA4TASHvWq3ETeWdw=;
 b=EehnCux9jctd3Zg2FSWNCY5zr+Qrrs0bAbivHaBvpjuuEV7g9eLWuv3Cnot8kJQGBF
 WHXj8ciUsQDV1MIB8SEgUqVe507Sv2I5U/8+H/KiIstO8f1OYqXVwczct0lNYxfz8s7G
 1XMah1AFcPe5r4dJUmNaTe7SGl2G/gULlpHM2CdFhdopSeMKdjgJfDAw41mLNbdKi9w7
 8i5WOOa8F6NQIrZ2VxE5GPbGVz4EkBbtIr8yrBkGeFZtdUjmFCg6a5OYd6hFycp8oPof
 JHpxPTPnbpHMiixKySUugBmH14JNyw44PSBM9muU+/te6QEV/AAFv/O9tjRbbVZEPuey
 cqDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPxV4KIUQG7ZVtWRsXaBFhgexeOODXLs3Bk2J0xFjOv4ng50ZT5idibaYNr5qejyp7fffqJPKuTa5pjoxtdada7T3lGy922WNU0+76h5XY
X-Gm-Message-State: AOJu0YwAovnwyFwShvvo9NOY7oWnepqiYE0Aa4KgfiyEpZTAUXwxIsnz
 MoDLQtLVOFgd7Tgb9p53en5CySPppwlHR9POjbNL7+Vzq5fAIPmcHbUH1ZsJD5CEtcbEInD58d1
 nb2d6BEmbRW9MYm81piZIbPO9cwbSLavZNmf53Q==
X-Google-Smtp-Source: AGHT+IHyyl3VXRzVgrpc497VuwR/tGfdtBR3F2BBQ+lp1bkMbMbay8ctwKEQp7xRENbiJ8Hez152lECflDB33HFqk9M=
X-Received: by 2002:a25:a1a7:0:b0:de5:53a6:24ed with SMTP id
 a36-20020a25a1a7000000b00de553a624edmr2514259ybi.50.1713965690752; Wed, 24
 Apr 2024 06:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
 <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
 <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
In-Reply-To: <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 16:34:39 +0300
Message-ID: <CAA8EJpr1FSjizAh6Dp5Bmux3NrGYh=BfHFL4D1fa87Og4ymY0w@mail.gmail.com>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Apr 2024 at 16:11, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 24, 2024 at 12:37:16AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
> > > On 2024/4/23 21:28, Andy Shevchenko wrote:
> > > > On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:
>
> ...
>
> > But let me throw an argument why this patch (or something similar) look=
s
> > to be necessary.
> >
> > Both on DT and non-DT systems the kernel allows using the non-OF based
> > matching. For the platform devices there is platform_device_id-based
> > matching.
> >
> > Currently handling the data coming from such device_ids requires using
> > special bits of code, e.g. platform_get_device_id(pdev)->driver_data to
> > get the data from the platform_device_id. Having such codepaths goes
> > against the goal of unifying DT and non-DT paths via generic property /
> > fwnode code.
> >
> > As such, I support Sui's idea of being able to use device_get_match_dat=
a
> > for non-DT, non-ACPI platform devices.
>
> I'm not sure I buy this. We have a special helpers based on the bus type =
to
> combine device_get_match_data() with the respective ID table crawling, se=
e
> the SPI and I=C2=B2C cases as the examples.

I was thinking that we might be able to deprecate these helpers and
always use device_get_match_data().

--=20
With best wishes
Dmitry
