Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FE50919D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6D10E2D4;
	Wed, 20 Apr 2022 20:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4809E10E2D4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 20:49:04 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id h8so5056486ybj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpRJb08UNsAeD/BGStPXY1JWld5Gs95lH64pYZ6orgE=;
 b=PeI41Cw+3CrJgCF7NF0DdwSj7RBlF44kughU3RlOvBrzMjU1Uq/7E9/Bf42CLQ2U5z
 1IwvhHEmCScfEAq2kRy+7SWZchlZzvzzXl5PGAcCLORbwijG3U+0/KriZKxPMSruHm8P
 gCfU5qVgw+XaLOjTys/QlVH/L5dA9uNQzp5PaH6zE8Ek42JWEBnXxI5vfqAdvcX60A1R
 QVFWD2qMdauzF+7hbiNQkVzclCfx5V3IxK6OqDJr7RNGDZEf5dE8lMM/oj/RQ4ihC8xX
 4aVRxdLbPv0Lu6dzR5il3WJawpwXOXm7eFcoMOiRfTUZyYbhfPjAEhREIwGa3G3FU93O
 tdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpRJb08UNsAeD/BGStPXY1JWld5Gs95lH64pYZ6orgE=;
 b=WoYwcmxXRVKGNgyXKzA8uUUQKGUBms4TeUQdx5Fth8U7+7VPmTl//cf2g5xBgmqRrc
 dTCloYfZ9ljfu9z2Tjl+zJQJ49tB5yZsLfZN3jVwZIxos0RD5t5fC9JUF3S8FY6gpzZy
 JfcnvrrG4QCfpNKuva5ViZl3KvvbvZe9NG0ALKb7cbNurzkVlXAPQgX/TvsK8ZqDO7/b
 op78oAkyv2Cg1KHr5JwEv8wMFe6MbtqLdjkNojwUpQN4KcaR/C2028wKe+be2fYs1m7a
 RHO16x0ZhLoniB4VU8p0/Vp830bxFxOrMM8PNvlGl3BynLzvXongKgP8MrNxe+JTUGT/
 eGfQ==
X-Gm-Message-State: AOAM532JMI68PPYc4RCT74coc92eTRQr+Bj6jy92FWQxVFym/Q+GonBt
 f1eDftjydjKEE9uVTfwCemrtEEbn3/pTMM8+WX23tg==
X-Google-Smtp-Source: ABdhPJzkRs3dHVJIbaNrCahjZbRnpps/qnUhYxpcB/UsWZPjZ6hfdX7hgHxrmzA5Dt6HYz1lYiN1b76YPMPL00KHXuk=
X-Received: by 2002:a25:73cc:0:b0:644:f4a3:6f4f with SMTP id
 o195-20020a2573cc000000b00644f4a36f4fmr17566471ybc.369.1650487743526; Wed, 20
 Apr 2022 13:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220414081916.11766-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20220414081916.11766-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20220414081916.11766-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Apr 2022 22:48:52 +0200
Message-ID: <CACRpkdZ--RCgM65nnEd=ebFQpQAPqZDvrBotynYTf+sdisAbsQ@mail.gmail.com>
Subject: Re: [RESEND v2 2/2] dt-bindings: display: Add STARRY
 2081101QFH032011-53G
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 10:19 AM xiazhengqiao
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:

> Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
> QFH032011-53G.
>
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

(...)

> +  enable-gpios:
> +    description: a GPIO spec for the enable pin

The way this is used in the code makes me suspect this should
be named reset-gpios. What is the name of the pin on the
panel?

It also appears you should tag this as active low so in that case
write that in the description "always tag with GPIO_ACTIVE_LOW"
(and alter the code in the driver to match the inversion)

> +  pp1800-supply:
> +    description: core voltage supply

Hm the name of this supply makes me think the display controller is
actually named pp1800. Is this correct?

> +            enable-gpios = <&pio 45 0>;

Don't use ordinal flags in examples.

examples:
  - |
    #include <dt-bindings/gpio/gpio.h>
(...)
    reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;

Yours,
Linus Walleij
