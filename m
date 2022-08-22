Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505159BE42
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 13:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55691113454;
	Mon, 22 Aug 2022 11:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6CF1133C5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:11:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id d21so1099785eje.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 04:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=OEroSL/F5loKrwxv3iK1vYMAkQUmUy4j2TLiaXHDnrU=;
 b=NYzO3zeux15mH53bA4W8Lmt95J/7acnjx58Vv9QUf4dQhkRC1u6gdBwdkl+giXe6U8
 hXYrhnGrnTdksCEVOI/2oNOb9ZDDA2nLsJR3j8M0UymYNCwGuc48CXJ4/XYbEqmC6AtU
 xA20+T6K4v3zDDp/XZXkhnSF6NiIugZMylI4R9vcQs7UMn0hnXk51rgEze+eVQ+nuSSN
 0QHs3lsLDzUsu72JU0jMFJ09F68nzj7F5utJXk402NqB5KuBZMPY383hfxKIhg7grDMK
 cjhnwMTKItM5jAPkM1LpAYQ0mCsrl1RmzundZqnv0utolwaG7sy9DwzDqGKTOmn/QbSI
 lMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OEroSL/F5loKrwxv3iK1vYMAkQUmUy4j2TLiaXHDnrU=;
 b=fGhTU7DNQAtRpPl8xmWF5B2eTwtsJiuTOUglVhCZQIKai8KtGMvAazBHge3YsILXRS
 dDae0nePHYZiOX9s2jbxEDyXNOTKEdwPeBuwpHKzH70hdRIv8je92aOTEChLKGpB/hCg
 yyEbeSY0Fd4sGIHQgRMwIS8G1AEOgXIpXdoS3BXK9Sqdw6e1EsG08Ct5BvBjvLX3C7X5
 RuMCIsYrfYy489YuQd/XJm/QrZu8THrhZHM6J4heIfMpb4G7GDw0TcHCg0bkF6IJbp4K
 mMwBW5Y5MqEg40Ll03gMA/YDV/WkEOe4Ujjz9Ko8k+Wc+ycKfFew2tpvELxyrPPHCNyP
 gBsA==
X-Gm-Message-State: ACgBeo1+PQpcbdjRnvXjprmy008IUx2XIi3YP6XWbP7aFmCy2Bugs0uP
 2F8mSOMAJyXhm7c4iuHBlz/NfAWLpq9IpNN0LWytWw==
X-Google-Smtp-Source: AA6agR7JaDwBOX8Gsy6aV2nQ6fQrHjocsPFww8INvgIfyuVL4tvn4G5kER/fuR+FhUDBdOrgjtS/FDLl67qHsuh6S1Y=
X-Received: by 2002:a17:906:478f:b0:73d:7919:b23 with SMTP id
 cw15-20020a170906478f00b0073d79190b23mr3684341ejc.690.1661166704094; Mon, 22
 Aug 2022 04:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220810160341.51995-1-robh@kernel.org>
In-Reply-To: <20220810160341.51995-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Aug 2022 13:11:32 +0200
Message-ID: <CACRpkdaiV53LUSAB4C0xJAZwmRL8vz5nsmPdZ5PtyiDoP-982g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Convert arm,versatile-sysreg to DT schema
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 6:03 PM Rob Herring <robh@kernel.org> wrote:

> This short series converts the arm,versatile-sysreg binding to DT schema.
> The binding is already in use in examples which unsurprisingly needs a
> fix with the schema added.

Excellent, thanks!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume you will apply this to the binding tree or similar, else tell me
what to do!

Yours,
Linus Walleij
