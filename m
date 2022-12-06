Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3139644528
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 14:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E82710E0F3;
	Tue,  6 Dec 2022 13:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF78F89907
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:58:54 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3cbdd6c00adso152335777b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 05:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk7KJe+l4C4JmAt+wWsokFYlio8NUCGKV94MLBWYbDA=;
 b=BHgXv+BEt7kIAmkQh1TjjerUmDy2oEHCy0dumNs2RidUeA+YNC+vzLM/pxDKRnBxaO
 TPvRG8q20sNeo2XDfhuDUzbKTbXBTo7kER1LZXXtEL6ZK/4p2OGRH8herAgEgZetzi7z
 XZiypgzdegBGx4F3NTQmBEkJtzwv8OTluzZzVrhJQUQJc77V0t2jwBmyvaPrRmi+u749
 W260RaolAzGjs+F/5agcLPSDtSAP0wq+kO650SiGVfjtxIvubOQZqPWAfnSqFf2MfC/0
 upCUsxHh3eQ+EnSJFD/FdIXu7Nl96z9SmILaUDb5S4+CRxG93l7YQyGYoNt/T2Vm1nme
 RNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk7KJe+l4C4JmAt+wWsokFYlio8NUCGKV94MLBWYbDA=;
 b=sQbuaj8unBCVcREyz8UUz0uWL8uhkOKvUUnlqepZVla+t1WFRyNyn2jwfdf4Ae7Wig
 eL94kWDj0Niiq7/EYdoe56E2BFvJ0glyA/Sa8FShSUSL4tYCirInrO9BP0QsFPZ1J77o
 tOF4ka54bD985PwetJFPjeZQ63Aa18ce4gQh+ewyTiIwpY4NpL7D40QLF9mnWWjIKpD7
 b6C20AEtSnIAhZuK60f/chDaOds5sis4yL+8xMH4LPYNc/+XEB/dDb1FezCZ7p7ygRQ+
 peQUG4/c2edRdoyTypeE8RBcabZbBJOa4sFsZ1su4i6Goe/UY1YrPGTTPuMCCdUrkQBq
 LVZw==
X-Gm-Message-State: ANoB5pl5G0tlb0MnU2XFRvna7RfeLYEryTY0NQPtQxFgd3ShXoQXaE+l
 NylJ5waeV1yKpo+KmrlGzoFotZyLkgPMqDCeyGYasQ==
X-Google-Smtp-Source: AA0mqf7O/Bc2E8iMh0Jxk7krElAwDPuh3wCtAqmS2Th8NLmQlok4cFXrsdTrgPCeLONDwHr9Q6d5fwz9rwnpoVdCpYY=
X-Received: by 2002:a81:b8b:0:b0:3d4:532a:753d with SMTP id
 133-20020a810b8b000000b003d4532a753dmr27136303ywl.343.1670335134121; Tue, 06
 Dec 2022 05:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20221129172912.9576-1-macroalpha82@gmail.com>
 <20221129172912.9576-3-macroalpha82@gmail.com>
 <CACRpkdZK9=Z1i3Uv=fwS=t=NXHJkucg9FYOCfog_qhomf9GV=w@mail.gmail.com>
 <7746700.MhkbZ0Pkbq@diego>
In-Reply-To: <7746700.MhkbZ0Pkbq@diego>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Dec 2022 14:58:41 +0100
Message-ID: <CACRpkdZ1XX9Od4eUnQRYwcfLjs8Ct-reXNQvv1zaxmj85-4jdg@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD
 panel
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 3, 2022 at 11:18 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:

> Though in past projects I've seen the same display-controller used with
> different panels (and different dsi-init-sequences). In one project the
> display manufacturer even EOL'ed the first panel and provided a replaceme=
nt
> with said same display controller (and a different init) - but the
> datasheets for the display-controller were for the same chip still.
>
> So while in my experience the actual display name from the manufacturer
> identifies the display + controller combo, I don't really think you can
> go the other way with the controller name identifying the display+control=
ler
> combination.

I don't mean we should do that.

What I mean is:

- Name the driver after the controller, if we know which one it is,
  such as panel-novatek-nt35510.c

- Provide identifications of the controller+panel combo in e.g.
  DT compatible strings, provide init data as arrays in the per-variant
  match data (or similar for ACPI).

Yours,
Linus Walleij
