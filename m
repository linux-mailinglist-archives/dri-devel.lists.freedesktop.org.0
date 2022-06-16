Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FF54E1F8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 15:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AADC112350;
	Thu, 16 Jun 2022 13:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B781112350
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 13:29:51 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30c2f288f13so13810807b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S4Rth2T8dY5O32h9DT2ztkebr91/U2eF/Sf0RxQK/FQ=;
 b=G10a5zdkOQdNTP0AbXjEj6kRfJFY2b6IvG1bgL75n9mc+TJdfZwMmtveVAjC4++975
 OubqAvI2DCGbh7pZMPqAZfSJWj7JS+XCC0bdm99zn4hhVYqWBd2whUKxDP78IxVcDnDH
 sFoPUQ2r6Z7o4+2ke3bBYqW8ozlObTsMAVqB2O2U8q+v6gh+gJrwnJU8XRbmJ7WImqLP
 PDagWx2QfGCMizzni9CLLSXiAxdFcEbuaK6U/IQoRqFkObWPu4rec0K1jiyYjHA/co4l
 KH5N0AuDpn8k+baLVP/79rQxke959qyd7KqnFulN5I8lVwgOrsfPcJsIZPTaKoRuvVA3
 TqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S4Rth2T8dY5O32h9DT2ztkebr91/U2eF/Sf0RxQK/FQ=;
 b=iz3n7jxYxALgY8mcUsyrS7ki4JvK2m2nHVyOZLwhLA/coaC5DP18JBPc0jy030/3XD
 xpAAa2y0tWFUS9R9BbgxmGUKEPvpqOwR9g5VtJh39QZJJ5CLwOpyNhLG+AZCYb1c28ra
 4eR2RLBT0HVKJiBYwEcEpdxC4kORf6rDvcXcdzoy8FzYMiJvhG9seLiuOpuWTncdt00O
 5mkrMxzQBobNaZQsBXSsdpQZcUOaBkSe4W4SgC76O4MmZGZNGSkkc7/dB7czac14HOQ4
 7Zey4SL8a/a1XYF3ugwG7Q7WpgHWH4NI5s7wiX0VJPAVI7gB+sfn68BuWQ8ptophAAPu
 vfeg==
X-Gm-Message-State: AJIora/OQ5p75w2EFfi0MlA8jiofivKyJhru+2r/BXy+S59o4hXdZ7AR
 dnuchRvlfTCeBzdDOtokpvzt+uDmB2fkCgfgRFW5LQ==
X-Google-Smtp-Source: AGRyM1uXkiUuSLdEs1ASKLxAXK6AYMSIEjGeNtbA1b/G6Effm6lpPwlZAq6cTbaG9DSHKdJ0ukrhCskqThLfiMIs5P0=
X-Received: by 2002:a81:1154:0:b0:2fe:d5a4:f26b with SMTP id
 81-20020a811154000000b002fed5a4f26bmr5792489ywr.140.1655386190157; Thu, 16
 Jun 2022 06:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220613145709.3729053-1-robh@kernel.org>
In-Reply-To: <20220613145709.3729053-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:29:39 +0200
Message-ID: <CACRpkdb6KCRfqOMEqm+9SfQORNwWPyWa7-XL1+n2BLr3MfDpRg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Add Arm virtual platforms display
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Andre Przywara <andre.przywara@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> 'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
> The binding has been in use for a long time, but was never documented.
>
> Some users and an example have a 'panel-dpi' compatible, but that's not
> needed without a 'panel-timing' node which none of the users have since
> commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
> example does have a 'panel-timing' node, but it should not for the
> same reasons the node was removed in the dts files. So update the
> example in arm,pl11x.yaml to match the schema.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Make arm,rtsm-display its own schema file instead of using
>    panel-simple.

Thanks for fixing this Rob!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
