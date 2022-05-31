Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC6538DC5
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 11:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A9710F055;
	Tue, 31 May 2022 09:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0601F10EF6B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 09:34:07 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-30c2f288f13so58181527b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0w2fXNQOc3DHaB4s+oXCyoZJeWAMalBiF5eAVeXufrU=;
 b=C4QZ6FMJ5aJLAtnQWNLvLEEDUXO25F0COEmJPF87NnQKZhExYvB92mpAWJf0lPVPBJ
 kdQWE6xMBXjrvcyyAKQfM+XTMO/lH6jlZEDbL+Dxws2W4zPIN+3iU2OspGRfkEIW/a5n
 h/afEYh/M76OJ8kCjZxWQmN9b4LfbKJ2OCpfcwvz7IQpmIpz+6OXqKvEiwLxbC/l15Lo
 7JjFtVLeg7L7vlHGka6YWCxIyM0sgJZiQPKzaDm6gysxAzjNX01+/WYYYfAvHsAYSLRX
 mjK6sRg4Xk4SNfc8B88YvU1SqAgFxaKvuHageZtrKwTYR4orYwo7OIa1ybFJ5IUL2nrj
 95lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0w2fXNQOc3DHaB4s+oXCyoZJeWAMalBiF5eAVeXufrU=;
 b=hZp6ImIoQXV+Nk4u1uWdnNQ+yFwLlz+xZFKPdDqnfG/9PytvhBES4u/7FdkpVw06GC
 a8bZJERtVt7ytcR11Bw2Y4kEHLGNTB0dvu1EBUNSs2SwUy0o9xd/0nGafpBdPcpX8wyu
 4cL0lcb0skcIKlY1hyvIP34kPP1xNOs5NK5qOQhHCiPBos90BE1RLiN+dA5C9M+j7iyQ
 L2g3rTx1x6YAHg6+JmGVL7gxBmKHg/iAk67f4aZ9ZotjbdEyXZg+jnRcrZdNF60u70NA
 gTY1iQMTWVuI1cL04tVJVY76JbY6B7A/5KS5PEaZnxUxnQZxO5EKKK4FvDhcEnzRQl0M
 Rcmg==
X-Gm-Message-State: AOAM533U1iUCxzbZO+qdtUl043VepaMALDbPCr1e/xny/iyexfeg3QlG
 /ahvEnyvmeYLUHzLStMoXH7xsMGk/7F9Pl2MlbPM3w==
X-Google-Smtp-Source: ABdhPJzVOfXBYTQoebXOcYGJ+lnLw7+x/Gvfz81biEV7PK3vYDQcPKJgisfe5ZodDgBmCw5OrHus2mbPSAh2SSEqRbY=
X-Received: by 2002:a81:fe0b:0:b0:30c:7e9c:701 with SMTP id
 j11-20020a81fe0b000000b0030c7e9c0701mr6503392ywn.118.1653989647207; Tue, 31
 May 2022 02:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220530160753.100892-1-jo@jsfamily.in>
 <BY5PR02MB70092E9495F2A52F473DD31AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70092E9495F2A52F473DD31AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 May 2022 11:33:55 +0200
Message-ID: <CACRpkdZyVTWu=j5rVMmi1PuHBDYfEXhAiH1f0hskBnkS4a+FZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
To: Joel Selvaraj <jo@jsfamily.in>
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 6:08 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add a prefix for EBBG. They manufacture displays which are used in some
> Xiaomi phones, but I could not find much details about the company.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
