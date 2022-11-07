Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834161F657
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B1E10E340;
	Mon,  7 Nov 2022 14:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830F910E340
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:41:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id l8so16564938ljh.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kmZJjcyK8nxBYdkGyjF9BBYtQhsKTKXX/XHgXHfVxFQ=;
 b=U1adVyNOAbOtB7LzITQqX+3NVUCD7hjijSzI/YHO7Rr5osXA9MHZaq6HCqJm+6HOsd
 fJ0ys8uvAM/DHnbHHSTIk7+IrHs0ykceAZnbCNalyMPTjX5V0QSFVrfDnqsHiyZXVh7v
 xS76OH44LE4SOvIqhvtz4JcIew6uCLD+fjCy8iCwwo3tsgl5PIuVNZofJHC1aYnEYJXE
 0XMka9P59kkmELC5diVPEBztOC7sT7XY8SbiwvhDewSyIpJ9Lj95VhVT+42KmMiEjuT6
 Wgj/v227ic5IahOtxJlSZVfx5uKNgE3Pdar4ogOMdGAQtsAHGlHZnhJZLBYIO31EZPz5
 3FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmZJjcyK8nxBYdkGyjF9BBYtQhsKTKXX/XHgXHfVxFQ=;
 b=t79AzAh3BsqTJ3UegnOnSYEHEUQo+T8f/uExa1rXAF3ApcZtU/i+8SNrYZtjMySMTg
 MGeEXti4lH2oFgh3O2ATuh+o/1Dw1WHjMLLfIG7fr/+OS5hQS//X8VWJPZ02NHZ5S/PR
 7Mmtd4CrYnO8GVPcDTxRvGvgytHM9IpAUMi85zOJSm02eLOQ0Q/AH/NQog3UlCXkfO67
 DHdrgg2EozJ/At9LpvlG9G3Yawys+yyh48hDjLQ0fbXkFNnkZww1kPRauY6kh7WNAXtG
 UDzqMDUXhmLP8JQwEzeqIm5vpLB6v/75fYE1cM0ARERRy/V6BQmEcdWV8V0v7PYlpbdq
 NXCQ==
X-Gm-Message-State: ACrzQf30nQloEmRnHdhXi634Btk2FNniCw3zukH6+C1321uXP+tE4JZz
 B+mpCl7JQRrU0zmxhOAUMBCblDEoC0ysaAKOYIZ5Hg==
X-Google-Smtp-Source: AMsMyM4ifBzOc5epJWnolpwJB7I8Uu7REkrSM32h9Wi0RNR6YarRrxj3LMKdHch3+Mq/MvaFZCjO8+SeHm/lb2cNC1M=
X-Received: by 2002:a2e:a58e:0:b0:277:774a:92f5 with SMTP id
 m14-20020a2ea58e000000b00277774a92f5mr9046538ljp.224.1667832090776; Mon, 07
 Nov 2022 06:41:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:41:30 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-1-a803f2660127@baylibre.com>
 <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
In-Reply-To: <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:41:29 +0000
Message-ID: <CABnWg9uwqyMpknrnR0nNuNLNtO81XQP=kJ8quLEaC2WzawFgzQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
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
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Nov 2022 12:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
>> Add a compatible for the HDMI PHY on MT8195
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
>Ack and R-b tags go after your S-o-b.
>
>Apart from that:
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>
>
>

Hi Angelo,

Thx for your review.
I'm not exactly sure what to do here as I'm using b4 trailers to
collect Acked-by and Reviewed-by

And there's an ongoing discussion about that topic on the tools
mailing list [1], it seems there's
no agreement on what to do with trailers ordering.
I'll keep using b4 trailers for now as for me this is the sane thing to do.
I'll update the ordering if I see concensus on that discussion.

Thx,
Guillaume.

---

[1] https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat.local
