Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770EF4D923A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 02:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775610E2EF;
	Tue, 15 Mar 2022 01:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650010E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 01:21:27 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id h126so34400938ybc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACQBTbiJyudTuHLv2P7/SRrqHrvj49C/1S4/j95gw9Y=;
 b=yHIrZlxonQRoX8uaFietSxxyEhLRBDVLG+J0g+eRDJoLgbBAO/rlYgyf58UGQxIWhN
 JKRKTgpFScPu1ApC6aqZqs/qT3Pu4Niy+vUUVZBLQzJb9qVFhX5ZFTbdlQO2KeoIOP1m
 Li90CxtlVH6WtfMqNPjFPeMU7vgvZAv6UQqEm1aYMxb16sOP/FHFd0GuhEkbGCrqPgwX
 j8YRPk6cbpSZooquF5gIvlISBTYEU6UmH8pGWWOJtAjHw7Eeq2R6usUOD7gTnd0prB57
 F46FBO+LWFqYYQ9vf/qIVtASdqO2Gj9oZPZmh4D1/sVasaeoMF3pmN89d0GH8tjJ8goy
 E+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACQBTbiJyudTuHLv2P7/SRrqHrvj49C/1S4/j95gw9Y=;
 b=4SVz3mBq/7GatYDS5zMlgx/IWNt1jo2eHDFDvAup4Bri2f18/iPmFUoIlmN6O2EdrF
 c17TCiZzfqv451TELJBvfCNSOQVJVM5WSxFA7Ti+uNLqzEem4JOqIRG+JK/DZboJmhXc
 NZiDvqqtWfmPPWi9u4H7U2cSzEBoK240owvBEXEvLHA9NycUnBeVAkocSxBlEkwCDENC
 s2U4d/JbX7/LPYhZ3j2HwbAiPC0wpgAkGfyDgumlrqq5JR2yd5u7Hm7D4WzqD9frSUtN
 Dp6lM9i4nKX9gSQmSRIladrgb5cL3KccsLPMgaK6uWSblaDhhu7c4eC0nXm7x37mJzNr
 ugkg==
X-Gm-Message-State: AOAM530qIWUCFSnYlT/5To7cSTMz53HtgZebBszlzVx5x0Gmf0ei2Xa4
 zsKwA+mDOFij3WP9P8qJoFR7v/kRf61Wsr6Tx7ww7g==
X-Google-Smtp-Source: ABdhPJx99c5U8udn983xmnwpOxBzvhzCMlxyP3HiN2d4p2Paf/encCvO/7WsowIdPYmJkzjxqH4ytz4twNe+Ml9NHBI=
X-Received: by 2002:a25:2308:0:b0:628:9a66:7327 with SMTP id
 j8-20020a252308000000b006289a667327mr20426355ybj.626.1647307286726; Mon, 14
 Mar 2022 18:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
In-Reply-To: <20220304000311.970267-2-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 02:21:15 +0100
Message-ID: <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
To: Joel Stanley <joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 1:03 AM Joel Stanley <joel@jms.id.au> wrote:

> The example needs updating to match the to be added yaml bindings for
> the gfx node.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess you will merge this elsewhere or shall I apply it to the pinctrl tree?

Yours,
Linus Walleij
