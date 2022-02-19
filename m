Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1E4BC49E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 02:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD3310E194;
	Sat, 19 Feb 2022 01:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67F10E194
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 01:40:45 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so29194947b3.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HNB1fxmHLPunXBler7gdQQxqlDvsWG6x7wVUlyJCyck=;
 b=SKY3wZ1mAlqxHaSafVHQylF/oez+6bLGHhBxuRmfg7yRXhY77qWDq4vK8vwidXu45Y
 gKaEjokjOC1XVHykOunHTLZgkl/9xZeIa4ZqD9nLcPkrFREd9gUupriIlKlrvP19fSWS
 4p7vshjEgJDO7ylyPZt/BXpYG13ukAB1JdQZIaSFWxxktsKlohydtqEw/oufR8K79bjE
 8FsvTK44CYlTCktJNzQscKaW4Tjj+He0Ts9vH7v4wjQzh2f+Se40Iy2Ge8txbz4m56dE
 vwcKCgyuT2NALZJ1y6MgwKHfv8wjLzv19o0uMlkDCdMuWnnjaafgmnb8mRpZwaX5spHp
 SXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HNB1fxmHLPunXBler7gdQQxqlDvsWG6x7wVUlyJCyck=;
 b=Mpqqtg9riuDnwtbUsXtG6Ek5A15touITPeYiVxObRzR3cHAx/p4zFw9xDMLmz1W1X4
 a7FF8lMKYh2Q5TQH8c8yzRR+Dtt+s7X7lH0js6yP8kMtmqFsHHOY8U67apYsgJ9HFSfi
 IG9U7S1jEWQuIueUUMFhlEbflDfXMFhm2O0AxaH9IGu1dKt+kn+znpG2nNT2ITpnRP39
 tIAGUqxde1dQunURR0LAZx56GGeDMS7eVf3PmK+liQPgA0f+APWMmg2RCrLVdtyDm8GF
 b7z1SN0l1OsKYfRDy7pO5qddhDqPFWGltmhVVVx+L0+t1Hq7qHIs1DIaQp3PPmb9buOc
 Ypjw==
X-Gm-Message-State: AOAM5337aXlCtpRt0bNlAM6fSdnvk/4VXBLZPn1C+CuDYN3dmicAB74a
 UC3xwX6CKe/RksCykyjrJqdB8Mbg2y3hNEF8ZsFyNQ==
X-Google-Smtp-Source: ABdhPJzgHi5UUSlSPOD18psEegszrQtFpsn24TuPAADf7grEP/lQBvUKH1txkpJWdVWfrdn/cWm5G6eyKLhaj5mGCAU=
X-Received: by 2002:a81:9d7:0:b0:2d6:34d1:e917 with SMTP id
 206-20020a8109d7000000b002d634d1e917mr10207987ywj.126.1645234844865; Fri, 18
 Feb 2022 17:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20220103113822.654592-1-linus.walleij@linaro.org>
 <CACRpkdZSz9gCHyHz7=ZKSGBH9GuozmfiZ_a-MHmoJ_5h8ED8cw@mail.gmail.com>
In-Reply-To: <CACRpkdZSz9gCHyHz7=ZKSGBH9GuozmfiZ_a-MHmoJ_5h8ED8cw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Feb 2022 02:40:33 +0100
Message-ID: <CACRpkdZ2tUKuGP4SZdar=9tMVO__xn0fUV+DQGU5PRwcPo9ERA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: Rename Sony ACX424 to Novatek NT35560
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 29, 2022 at 2:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jan 3, 2022 at 12:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > A code drop from Sony Mobile reveals that the ACX424 panels are
> > built around the Novatek NT35560 panel controllers so just bite
> > the bullet and rename the driver and all basic symbols so that
> > we can modify this driver to cover any other panels also using
> > the Novatek NT35560 display controller.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could someone take mercy in reviewing this patch set?
>
> I can offer some patch review back!

I can also offer coffee in person in Sweden, some Star
Wars memorabilia or used mobile phones.

The patches aren't really big, just moving and renaming.

Yours,
Linus Walleij
