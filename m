Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1B3D11C5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DEC89F01;
	Wed, 21 Jul 2021 15:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E5289F01
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:00:43 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d9so2694090ioo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iknMDrhct0ZkRYz3sqrxjrU836dktL9pH5wh23AxUt4=;
 b=TsfXQ3/0ZMrx26poBBp3lYWPWdgkda1Yy/2M9fGsTyD6nz2gXnkV/0rlkMZkdh3VuO
 lxWucouuXWidWOx80Rt/5GLLUwaRwHNMZBXzpzK2ykJQQm5sDNO7yKD7LBr16eERrIw8
 0hXLp8/G6t1F4jksSPenOU86bK411zWs/siZ/GQfMnARygpvoAXOXUdj8+u6HPtNpnu8
 w/VoNZi4Fgbm4df0H0DuMHSRQt7tHqiR2mI17s1tTjQiazoIs/qa0+bmfomBKJRbJjPv
 Ir4w10M3wILiDK26fTI6QXCfT/U1FALXNTkhDMgE5QAoFAuD2r78gIdZqUOACcypH17z
 29og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iknMDrhct0ZkRYz3sqrxjrU836dktL9pH5wh23AxUt4=;
 b=p7kIy0ns6GOt07ISMPJvs3h06403aylr2nRaTQ6m7q9kdBTSV5JcW6L0Y6VzcefBSV
 U5O4+nJQDbL8lvIU9XKTES0LazPKKD/eYZXdQ6WH1iDQ1l+Cdih4TsKlb5WUslPnS1+s
 HuDEDyCr4gq0nb+MJ3Z0ynsqFsBh9TUj2KDFYlxj4x+LnvMwbPRNAjCDp26oLgZNEwWx
 lAPNcTVv7+s5wbDSCP1GwGb3bXE1thpV91TBv/yLkgjLxNs9KxBeF9UFINRssTzMywil
 KLFf5yZwmZJNFMoXUsnadcJFO5aqtZb6pzAVCd04nsP9NL+iLNnyIld8+lkshR/1l9Xq
 xU7A==
X-Gm-Message-State: AOAM532+udjkJH3Y16JH9gDs1NB+1VCt0IAbhtWRVUj3k0dBzNCYUDgH
 xfij+8VSS2oVAyBK4iMlLP+o9QOp5XKoqi1ZeYg=
X-Google-Smtp-Source: ABdhPJxkQLhypIjPoF3QHU2C29uQ6Xc/RLwToaslriF9WqJvR6ei9u4Cqs8YpRADZn5nCrA45yTZ6KJyTXddAZYaiEs=
X-Received: by 2002:a05:6638:33a6:: with SMTP id
 h38mr31612757jav.130.1626879642718; 
 Wed, 21 Jul 2021 08:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
In-Reply-To: <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 23:00:06 +0800
Message-ID: <CAL9mu0KnzLk+jmUFFJvgZCvM=jwg1c_T6OpsC1Hb_u5Otkw-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: Add ilitek ili9341 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
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
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jul 2021 at 22:02, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > This driver combine tiny/ili9341.c mipi_dbi_interface driver
> > with mipi_dpi_interface driver, can support ili9341 with serial
> > mode or parallel rgb interface mode by register configuration.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > changes in v2:
> > - replace vcc regulator to three bulk regulators(vci, vddi, vddi-led)
> >   according to linus suggestion, thanks.
>
> This is a really nice driver.

Thanks, all the code here is inspired by your recent patches.
Really appreciate your time to help me.

Thanks & Regards
Dillon

>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
