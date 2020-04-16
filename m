Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8FF1ABF18
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 13:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF91A6E08A;
	Thu, 16 Apr 2020 11:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9356E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:26:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so7431796ljd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 04:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItMKLhoTTV7+wK6jse2c5OaBjQvnx9Iemy9x9CFhkc4=;
 b=JvISHrsRWazHdYXKKlYLrRFdELBOOow4Jw0w8jLB8I+kKrAW3K+XyJ4C0ZUCKrfDLB
 SXdvCSJ2taPL878hyP8+B9KlVKF7WXiA4YrRismX2hcWsERKIhSgw0H/wd5gy+h4hceg
 JedVIO+b2FRg3fiTm2xDGBYL8X/sPUpyDsRG3nNRLFAcVHgKwOkFXBJ+JVCrTgw0oYaz
 sP6F407pdOwux8LsVxgkg/oMNOZPkvA//c5J5ML5Dznp1eajfl0j1XxWAU3tLU2ais5U
 tt/Pe7BXE8G94vhYVpEgbMyPYwfIJaFiGxwu7T1UsxkUNuyvJ+yyO6XTb/ComqT0d7bQ
 nreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItMKLhoTTV7+wK6jse2c5OaBjQvnx9Iemy9x9CFhkc4=;
 b=C+g1k7IPo672yopxvKq2KegidvEeqf+roPM+Nz0Rz/tbB/Cn+VOpUdBizBgVueG7+P
 E4nsEhwEaX/6ISY60ahlA0J0cFqvj1AXI/jw8jAy/JonctWkMchqCZsemkzhsRxjsjyT
 eKRtBydAXcc+nzW6ttKU6RgAudBpDe64Jy7jLm7xKFWOUjxB4oeLjAsFY04escdpEkB4
 P+A2IeLk9ABNNqXBCrIPXkaLyzNEIu8sbanHf1URHbRj84B0e1laPdB8aoBn13IP/Il8
 wpn1QgzdYNF+TafqW0MZq7IVQjpWk1m6P+eA0ieSKSPj0cFlsaNju5lj43QrBz2Vv/Wv
 gt3g==
X-Gm-Message-State: AGi0PuZL3qayxwnHzwva6eq9+nrKBmB0kRhyarnVGfh4KQf04Z2pDJtc
 70qAKgP2/7ZYnMmb0KcdjZFOhkhkDYYw/q7zuZjGvg==
X-Google-Smtp-Source: APiQypLNKo+8PBIa8cWaqGfJbETe1Y+lXjOhLcXgDjTUKhJLS2kG20SytVqpK+1mdy1IOLnR0YF0xwYrUVk0CaPMNSU=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr5984508ljo.168.1587036404026; 
 Thu, 16 Apr 2020 04:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-3-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 13:26:32 +0200
Message-ID: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Rob wrote:
>
>     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
>     case found in dts files. We should fix that to dsi(@.*)?.
>
> See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
>
> Fix it.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>

I think I was instructed to use dsi-controller@ at some point but I
suppose it was a misunderstanding.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
