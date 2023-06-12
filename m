Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C9E72CD9F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FFC10E2D5;
	Mon, 12 Jun 2023 18:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A5510E2C6;
 Mon, 12 Jun 2023 18:15:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 694E96152F;
 Mon, 12 Jun 2023 18:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0904C4339C;
 Mon, 12 Jun 2023 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686593714;
 bh=5VVyxM283nZurXcrJu3NkFtut1FZ/yTQ9dxSE9OavyA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DKOZ6Kp1scSEhJ5dYFZKi0n5vUjPdNQ4iRD119WiyOBSPKlZLFFGPAFGFrY9mzFTX
 SCUzL9XyZT53mky/qSIW6wDoc9LrJEj1ahMve48G5Gs1cGYtbveKcYkQ2K/p8Jh80l
 40BlVVwBktZi67sc/C38GltyfbyZWS6sUCwxRIBVm3riEhzW4iIW0pt5fxMUxvbjZS
 hLnX2EPIHeTfBveLh9G5Tk2EzjdAkyXO3AFJtf0teTmEoIWdzTeIkRV6iWUzhqlmRC
 kKtgRAyM4ngRIqDiIqX5/z1r0TRWPuXlHEc0BXSRjZ1xCRzAdLhPzYPqANr8LAJ/yV
 Xn5SBiS6nxVMA==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f61d79b0f2so5733549e87.3; 
 Mon, 12 Jun 2023 11:15:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDwF+JDroh52uFNZQyXKljVTZoJj/HGB5wJ7g/CaF+IMJZeH4amK
 /eJhHLsAoQqy04GPp20yM2jWkqyP44V+JFXM6A==
X-Google-Smtp-Source: ACHHUZ6ovfpFOeZlPP4eF2X3MviCSbc9D8V33vQx/IVpA2iO/zgsRMO0jJiIqkYTV1Duqk7AccRU4D6T3M8xYOLaZqc=
X-Received: by 2002:a2e:9ad1:0:b0:2a7:974d:a461 with SMTP id
 p17-20020a2e9ad1000000b002a7974da461mr3688248ljj.34.1686593712740; Mon, 12
 Jun 2023 11:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230410232647.1561308-1-robh@kernel.org>
 <CAL_JsqLeAvEVa8h3qywqESkqGG1O+9QWqA7fc1EJeDGkmAV7Fw@mail.gmail.com>
 <0ce32e34-d53b-4038-ef39-3b0f3e2f8a7f@loongson.cn>
In-Reply-To: <0ce32e34-d53b-4038-ef39-3b0f3e2f8a7f@loongson.cn>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jun 2023 12:15:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKsa9KQxk6r=ZxtY30Mk5nk9ST5ejJ+8VXZ5vPJAGHMBg@mail.gmail.com>
Message-ID: <CAL_JsqKsa9KQxk6r=ZxtY30Mk5nk9ST5ejJ+8VXZ5vPJAGHMBg@mail.gmail.com>
Subject: Re: [PATCH] drm: etnaviv: Replace of_platform.h with explicit includes
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 11, 2023 at 12:49=E2=80=AFAM Sui Jingfeng <suijingfeng@loongson=
.cn> wrote:
>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
>
> On 2023/6/10 04:17, Rob Herring wrote:
> > On Mon, Apr 10, 2023 at 5:26=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> >> Etnaviv doesn't use anything from of_platform.h, but depends on
> >> of.h, of_device.h, and platform_device.h which are all implicitly
> >> included, but that is going to be removed soon.
> >>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> > Ping!
>
>
> of_device.h already has 'linux/of.h' and 'linux/platform_device.h' includ=
ed,
>
> Would it be sufficient by simply including linux/of_device.h ?

That's part of what I'm trying to remove. Standard practice is to not
rely on implicit includes.

Rob
