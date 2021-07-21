Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD83D1073
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F70D6E886;
	Wed, 21 Jul 2021 14:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D806E886
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:02:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id v6so3323721lfp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7Qp3N8i2ZqaUKiDMln9kfRvQQx8iZ4aXJx31dGT4ps=;
 b=k+zdBVlIlSQR1P9SUQm4rWxiuVKGt+Rdrj1zn8ykerQwuV2c1ohdgP/tbToleYU5pK
 k6tkA3Mffh6O0IrtAKFfYHwFBINE6YXJlCMzAycKnlMV7qsU8JoUvPTK5RHN4JsRuMWN
 nx9VIsMrsX8K39QuvUjj/Kf2qwdLWVwkPiBtrLkhsmIVin8FOcccA7I4rp3fRqeqOadM
 crhsm3N2Fj9J1rz1Pn0Yzid3rVP0rk8uousrwvM5nCE4hVwHDql8jShpAWYHQ3qPoYd3
 deHr+L3O/Ay9z5Hl+PQ9IMMgY0dpBiyHYDwVn6AyxH2f2nROXplKiAaKTpHL3jzElEg9
 jtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7Qp3N8i2ZqaUKiDMln9kfRvQQx8iZ4aXJx31dGT4ps=;
 b=ISxIws0q6MlvA+2Fjtsct3Lk1v7barhcQughmEQqwd7FzUVHAFc6HxEymN2oLkeEdm
 RXdHsH4H4F8/NdyMHxVQ8GHq2EIQVTgnUKDlpjYll90TReISGmHdbYzB05WzKVIgydcY
 9An4QiYaVPaFWZrxQ3Yu3W182i+fn94k5c7jmHZdrz70bChkURLPrh9Zx4J0CI4BQjBA
 bulJsjA5z00+1LA8nSAb7uaev3xRqTI+LH0OiJutcoRIBH93+2yxpTMN/RcW+LMPxKvt
 bmQ5Br8Jr9J1fQy40amPKUGmexo7LxyaatziKmQAETJ5VZq9hRocOC/sblRa1s7Z2B4p
 hKpw==
X-Gm-Message-State: AOAM533XYKexPP36OmFBIjCZr+vGfQCy13cmPK8uxcDm/3RMuBAZNNsA
 pswgHXywWqtte5eQUIyXWFzSbEIDYN70jCTaCPC/Yg==
X-Google-Smtp-Source: ABdhPJzixaew0F1GayfkVMS5XfHQR639oq4+GHeo0cd4p/TY/QddiF+whNLR6zx166zTDGONuB6zet+F22BbijBYcxs=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr25038632lfr.465.1626876169985; 
 Wed, 21 Jul 2021 07:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:02:39 +0200
Message-ID: <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: Add ilitek ili9341 panel driver
To: dillon min <dillon.minfei@gmail.com>
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

On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> This driver combine tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode or parallel rgb interface mode by register configuration.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> changes in v2:
> - replace vcc regulator to three bulk regulators(vci, vddi, vddi-led)
>   according to linus suggestion, thanks.

This is a really nice driver.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
