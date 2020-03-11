Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F19182AD0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DD76EA98;
	Thu, 12 Mar 2020 08:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16FC6E990
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:21:40 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id o24so1425115vsp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=Gkc0L1z8chPU37ylfxfld8kL1758g6oY0Td7cWlPBhRSaljv0nEP9i+wF1FJLm0Drg
 7zQLQnQGtshFfkBxcXQOD8UJjfPEBJlxiQbOQQRDjlQyYcs4GHopCD3WQpPexAJCvhto
 8XN93qTBP25DLXymYoqMYfRDFiCDl00Tu7l7HwjPGS2KJhr2hl68CUYN42965CRUP9pQ
 ZDPNq0D/OlBZjkMIJz112kgpsvq2mG8Y0bHAG6O4T5kI9wyjM5tx9FQxhltw0y0ATKH4
 ttb7rdiO3me+gomGLr9dPZ6NNBAkBHLub4H4YSPSffAKhD/PJ/7fQfqhDsJtoj4Mb2vw
 xi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=JDOjpf5DS9O2E4A8UpaenwhLjtNg3KWUSmzPoYJmVEzpt+q7oWSX0XEEff9y4ycads
 DRkdiOQ9rr/mwvNS3N6bdqzWS7z07hNHF0kIXlmJhDOJ6UOWTQsZil4c9IuploJbewdV
 IrPsf5CwPZS8GBi5m4CmQl7YGp3mwKkSKNkpnCDFlQ0rxqonEWqPp47vw1b/C3oZV7Sq
 mb1RSemXDLnDaQdBLiW4rTD7gjfWTcatUX3tpKc8kgae3ooTaRStlUV/ul6rfAWjNQ5Q
 LOso+3inSfaDGLI+QICXZYM+0LAQR764FiK3OuGqE8Myhyy1VgEsgez9v+YCWIqpQvA4
 Og5A==
X-Gm-Message-State: ANhLgQ3bTqm3ReTNKawpEWUJkgt2aIByXVfNl0ldfu69hfPLEMoWm562
 bwoSqdixF7o4pYvPF1n7Dk0wgppttnTeYyuLNi7zBQ==
X-Google-Smtp-Source: ADFU+vvAwSiaVqdqSV80/n9skavFztB4aCTDjE1foC884CVvIqJg8m9aPx1YictIGAray0JPA7so3t3+znzsKWxY1WY=
X-Received: by 2002:a05:6102:2051:: with SMTP id
 q17mr2225224vsr.165.1583936495390; 
 Wed, 11 Mar 2020 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
In-Reply-To: <20200311084052.3ca3c331@xps13>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2020 15:20:59 +0100
Message-ID: <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
To: Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Mar 2020 at 08:40, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Joe,
>
> Joe Perches <joe@perches.com> wrote on Tue, 10 Mar 2020 21:51:27 -0700:
>
> > Convert the various uses of fallthrough comments to fallthrough;
> >
> > Done via script
> > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> >
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
> >  drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
> >  drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
> >  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
> >  sound/soc/codecs/jz4770.c                       | 2 +-
> >  6 files changed, 9 insertions(+), 11 deletions(-)
>
> I like very much the new way to advertise for fallthrough statements,
> but I am not willing to take any patch converting a single driver
> anymore. I had too many from Gustavo when these comments had to be
> inserted. I would really prefer a MTD-wide or a NAND-wide or at least a
> raw-NAND-wide single patch (anything inside drivers/mtd/nand/raw/).
>
> Hope you'll understand!

I fully agree (for mmc). One patch please.

Another option is to make a big fat tree wide patch and ask Linus if
he want to pick up immediately after an rc1. That should cause less
disturbance for everyone, no?

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
