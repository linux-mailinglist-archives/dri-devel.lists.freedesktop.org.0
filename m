Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488D3D1135
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6D86EC25;
	Wed, 21 Jul 2021 14:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E6B6EC25
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:22:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d17so3197149ljq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxH3J+Eoh7kaNaXSHILbrEKptNqW5XNSkT/LEfhorfw=;
 b=np3T/tKhWSs3xDEU7MtFijZp9knPrBJjhodCGPOhu6WamYYnmI0gWgLGwLiNBVO5Cv
 PY1SoZQb+Yd3SboBPYmHKlddwz0Qh7RS4ABDPEFwe+7cPUmCuN7+IY5A/hWgkSBr2lMX
 j5/t1emiw10+TGpDl8R9AGk0R6trQrmcKoEZ7ZcoQsKlqecQZu+WjhXR8he0+NqXegso
 4j8UZUofI2jkgKlTt5CnguAr5JSdq8A7kgzUkaQ1+2bwoj3MHdKoPFbJYCkI2+zkhmPO
 2AKw2+7SY6NIuFDUZ8U29hXdJ4BRQcYUrQLeC7Kzmo837X3mqcFFVJNz9cBQFO4GYJWV
 hfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxH3J+Eoh7kaNaXSHILbrEKptNqW5XNSkT/LEfhorfw=;
 b=Ydczd5YoFY/rz4Aq+DPOPMsIo8g4YW3WSl9d607HfNY5SR6gkpnvUWhkcrmlBlCtSr
 Ylre7ZDAJIG1Vj393zisJT1CG+DieVnAY1PxxEC0b1U3+tgfaAL9Hf8FFw7THqHXBgQL
 AkSuqbXBemTqkrQWlfB5n3hpMks7/C2bqlqct+mcMu6kGIq9s8EG1902ZL+hjl6X2Ifl
 c9+eQUzjogS7zyYXzb0lJBlApR2YOq9PjGwpRYZ5YAmRVWadcdb3xUjjV1xmV5WMW3zS
 WDznXB8s0R703TeMa+KqMqMwWi8u6V1lDBHWMDZPcO4/iIWimkE/Ur4hCTR9MNisP5aa
 /MBw==
X-Gm-Message-State: AOAM530P+NiMengoBDBdJ/wXXnunP278yglOeRkjJRUPRJ2Ls1gn1Bmb
 onD68NIzm1o2uTb6d7S5rskC6vyx5PQYXK+2j+AMDg==
X-Google-Smtp-Source: ABdhPJxRKXD+U0XQM/F7sLwpZwFlzVAYL4bWalqIvOAZRJl36XOz1b+yigg+oOm5a+edqTSoFlwCiEItIcz7ltih25o=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr31738197lji.200.1626877364224; 
 Wed, 21 Jul 2021 07:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
 <YPgsl5M6P86iJADt@ravnborg.org>
In-Reply-To: <YPgsl5M6P86iJADt@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:22:33 +0200
Message-ID: <CACRpkdb14g+cn1hKi+gF6oOLMSNLffvuuJbVqR95pmuCtgjHEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 4:18 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Linus,
> On Wed, Jul 21, 2021 at 04:00:35PM +0200, Linus Walleij wrote:
> > On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:
> >
> > > From: Dillon Min <dillon.minfei@gmail.com>
> > >
> > > Add documentation for "ilitek,ili9341" panel.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> will you take care to push the patches now you did the review?

Yes but uncertain about patch 2/3 which fixes a DTS file.

Normally that should go through the SoC tree. I'm fine with
applying 1 & 3 but don't want to cause excess errors in schema
validation so I'm a bit ambivalent.

I would prefer if patch 2 gets applied to the SoC tree and
propagate all the way to linux-next before applying patch 1 & 3
but I understand that will take some time.

Yours,
Linus Walleij
