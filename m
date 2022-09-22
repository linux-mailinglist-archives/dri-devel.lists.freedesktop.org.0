Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBC5E62B2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9310E348;
	Thu, 22 Sep 2022 12:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E3910E34A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:45:45 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id s206so9028682pgs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=EUOZb2990E/2sm9nyDml2aFGYKW9boLOMIoTqqkufhU=;
 b=1Bcs1Ny8mbZraxYiQuvMnq/zbwtwWWnCOQVPvj/I/46jXmekqMhqko99SpjSu5QdiH
 qDtYVNR2ZNk39h53rapFnDcnYFZ76S5k9IjhP77Z/A926FXiga6R/i+yzuz/uwMq7U+q
 158wYH7FmsKqdZnAfPcR9wKuFTG1R3WTDSMv8CnX5s0cBDpMEQWONja1/aeaRxVMngbG
 5/PZTCoPStAAc2kI0cJ15KfyVhEZDDWAZbwSaCIgTFrIIprM9upFdYel/xF2bl4uHrfh
 CoQDh04eCu7eXYrD0k0Vr3Cwaeoklvq+lh92xk96wzyyldhrj3cNlmUt4hmtc86UUzin
 0PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=EUOZb2990E/2sm9nyDml2aFGYKW9boLOMIoTqqkufhU=;
 b=M9VAnHU2HNekTEjPd+SiQKxSz+33CQ6hy9ZL0Row8/tzdsOsOgDZNFJFqSzqstoXk2
 qlpwzIic+ZT4t/9npD75dgpPpEJdB1m43cJK6Hbo6dqXmn1vmdK1N4i6XvxypLFfwTLc
 LJCYlTIbYU0SLWQJQ/Nf4ediNJPNZPXybSE0d1m6nCUDhNQpaYsSHlKw13n/X5Yp3jPW
 4u2+w5s5oGooTbYfPg8HCc/qcQ9z4nwhLESJPD3LtjthpAQe3k9qfG+vox/qowk5QHrM
 Qr2x9Uri3TFIvEcF+NWV2xpbD4i1WIqz2ScTtJhBrd/jH9XYWLSYsVkLSCpArRSqMd0A
 xWXQ==
X-Gm-Message-State: ACrzQf1rxfvUun47iSy5JF+OHm5+mq5i7n6g0X7+g7KXMLt0KJEX9KAC
 NFaJJqhGn6JGd7jzobyQJdq/h923tuZKyjZ3iJ8+QA==
X-Google-Smtp-Source: AMsMyM4O/N/zVs9zWHo8VZ8pdUXoohAewcmlUdHeafYOGuDWYY8oL47N7HPDeTurxd6fZSfsLroIY0k3HWCl8XmZlms=
X-Received: by 2002:a65:57c2:0:b0:438:ac40:1460 with SMTP id
 q2-20020a6557c2000000b00438ac401460mr2997875pgr.216.1663850745089; Thu, 22
 Sep 2022 05:45:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Sep 2022 05:45:44 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
In-Reply-To: <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 05:45:43 -0700
Message-ID: <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Bo-Chen Chen <rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sep 2022 09:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:55, Guillaume Ranquet wrote:
>> From: Pablo Sun <pablo.sun@mediatek.com>
>>
>> Expand dt-bindings slot for VDOSYS1 of MT8195.
>> This clock is required by the DPI1 hardware
>> and is a downstream of the HDMI pixel clock.
>>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>
>
>Looks like broken patch.
>
>Best regards,
>Krzysztof
>

Hi Bo-Chen and Krzysztof,
I've sent the patches using the rather new b4 prep/send commands.

Though it produces valid patches, it's using `git show --format=email`
to produce the patches, which lacks a diffstat.

My understanding is that the diffstat is considered to be comments and thus
are not necessary to produce a valid patch.

I've reported the issue on the tools mailing list [1], I'm looking at providing
a fix.

I'll be extra careful at the patch format for V2.

Sorry for the inconveniance,
Guillaume.

[1] https://lore.kernel.org/tools/CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com/T/#u
