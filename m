Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AFE3E10E0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E979F6E438;
	Thu,  5 Aug 2021 09:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449216E438
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 09:09:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g13so9669016lfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 02:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fY/oxeThB23V+9UG1Edzhasn4C+9ragDJgqZ7k9gIw=;
 b=H49voNK1g+G8urIyGYiAgsJPEAbkGA6DS0f+onn3MiQT2Su6rWS4gKB7NCYVSHsRsr
 dl1CGmKWiTmd9NPn8MdOp6Hfb4ghau3PWU4670rnDYv0GuqdtX91YasNnuxoQRdbNE+0
 O3FXuc8lVPWMvg00OyZkUCg7LFHpMW+eZvOL2Z0nzI/aXYslgWuJbXDtR+P76dcTxMF8
 rdRDG74oSWg/O05nwExHu4GoAoSgkcfIhx3pmDGh9L6aY364AaF1ROfpoU1KauKVULjf
 FmrxPhVj4L17We+I4zMT19/47onr4iF7btZGkwb54yYmD9y23RlPcxKp31vopw7oA8JC
 8JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fY/oxeThB23V+9UG1Edzhasn4C+9ragDJgqZ7k9gIw=;
 b=DyrUgOe4ckHpPUz+gVwTXMU2Q0bwN0v9El0FSPFEUdoH+Arf6ug1mzmokwnK5xCVwQ
 YpZJA4xYggCGYUuORrh6soTTiXpXRuk9aWDGM+BMzmZScYaXAsqmDH5UnLMGPRX6YQt1
 XGCZPv1gGR5iLkgpHhL501cyCK84Re6tR3LQ8c9JvvoeO+z1yLbr2nK/Ws7oz+Okqvab
 iMhr0cuYvfKP9BTrkL9vN0HEwH1SmZPjihdCeCubQawc0O6vwr8mt9FrytrCuoSWB0WG
 UE+PJcpaCBZQwNXGds/olq5I7dcWZGmESoXaWzxLCgeK/Ks1rmeeMFFI2LqBNCFWAlx4
 wWNw==
X-Gm-Message-State: AOAM530oWMZEDtc0d+ZDxfBfum1ubm2T06+1/kf2cIYOZWWY9PJbrt1h
 N//a5nc47O2+Xs/dxzvFB0HQ2UReXrSon43iLYEsLw==
X-Google-Smtp-Source: ABdhPJxqty0NGuXhYp4Sy3H2W5aZNxbWZCoi8hI7ymIGAcMh8xNGz6zqsExVUV5mnZ5ZSm+iwxpYBLFqDqCMYi8/beg=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr2991518lfg.586.1628154542193; 
 Thu, 05 Aug 2021 02:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-2-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 11:08:51 +0200
Message-ID: <CACRpkdYEWDKrcUGcnDLKrx7+cGH4BvKLC0du1wYpkXTiJwn8_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To: dillon min <dillon.minfei@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

On Sat, Jul 24, 2021 at 5:44 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/lkml/1626853288-31223-2-git-send-email-dillon.minfei@gmail.com/

Patch applied to drm-misc-next.

Thanks for working on this!

Yours,
Linus Walleij
