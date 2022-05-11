Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064C523331
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295810ED37;
	Wed, 11 May 2022 12:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103FF10ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:37:16 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id d132so1105984vke.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=v9Th8rxPiWf3ZnzxeLk5F4SGsw0EdAo79OtQwsPtPNc=;
 b=qZGqNwBdtTPSsXJ4TudOdVSft1cn0crk+rUA+BXcaAtlIIcDlbrBzGZl1G6ZvqtL0/
 52aPzGjkDjxenmbtmqIx6HbPYriuF0amTOjLWM4rtPHVTv/9qzizlClERaRHxX71D0ie
 /JuDIGifRPC2mJZsXUpCyTfdP6nLePIyl87T0VN3BU/AWzRxgidSFlfa9LPoAfc+5GxY
 LpL/W8t6FtVAAJclUgCOS+NJAgUpE/918VqAruLfHfgduNmM7bpqSwYcGW0lFDx6KmLh
 z/P+C9mYP3Rw8n+JWR2eJ+XXz039AdpnO9kvyDW1SbdY7w98B+1jppF+iMFrluk/aUcT
 y8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=v9Th8rxPiWf3ZnzxeLk5F4SGsw0EdAo79OtQwsPtPNc=;
 b=ET81IBdXOwsVl2wXYzwUlAXhCO50+761H84huZ46j/ERO2DtspN4D+7Y5A6rNElWGe
 Sce5dvLrznvw8mtftmkcSxUp5FBrnDEzS1UyHHk+z3bA/lHMbMLCLEzaYAWDFvRltpsT
 TAipx3CHzYuHpN4u07UVDZPRG+bA1d0jKnCLDqSzcRe/4DekIoPAS1KX146qUFwv7y6F
 W3wxYeKHeFB2p7M8ttim/uJwmRatzae8FrFndMWVaVkITA+erFo+8vGWrotyNKRse8DU
 oOJrt6jG2akLfyykIvbGbJGXP0AXWd/DtqgwxRW4BKapu7ZJ2kPQ97JwjSAUWm3U8UfC
 jhMA==
X-Gm-Message-State: AOAM530UlF3mw9lsp33X8Y+vTMhri8lmr0XxLxm+PHoWNlx8v8bbLAoU
 uBsJFFfZOjwJkbqWozho6f+0zUrrnDktIsV1Plm51w==
X-Google-Smtp-Source: ABdhPJxBn9ixvONga67IFvsidm0urKpQCjlwF7V0itqftu5rkpNVWoXNuJCCn1qTxzlSqdUM84jEJ4VrTbu4KEramCk=
X-Received: by 2002:a05:6122:511:b0:34e:e406:a66d with SMTP id
 x17-20020a056122051100b0034ee406a66dmr14033939vko.6.1652272634992; Wed, 11
 May 2022 05:37:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 05:37:13 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-2-granquet@baylibre.com>
 <20220422105712.bdpbwliificvon4j@houat>
In-Reply-To: <20220422105712.bdpbwliificvon4j@houat>
MIME-Version: 1.0
Date: Wed, 11 May 2022 05:37:13 -0700
Message-ID: <CABnWg9uwMN6yK-xfCPtRsLif5yC7AU5b+OKc0xaHjLKzQ__gJA@mail.gmail.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: mediatek,
 dpi: Add DP_INTF compatible
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, Markus Schneider-Pargmann <msp@baylibre.com>,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 12:57, Maxime Ripard <maxime@cerno.tech> wrote:
>Hi,
>
>On Mon, Mar 28, 2022 at 12:39:06AM +0200, Guillaume Ranquet wrote:
>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>
>> DP_INTF is similar to DPI but does not have the exact same feature set
>> or register layouts.
>>
>> DP_INTF is the sink of the display pipeline that is connected to the
>> DisplayPort controller and encoder unit. It takes the same clocks as
>> DPI.
>>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> index dd2896a40ff0..2dba80ad3b18 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>> @@ -4,16 +4,16 @@
>>  $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: mediatek DPI Controller Device Tree Bindings
>> +title: mediatek DPI/DP_INTF Controller
>>
>>  maintainers:
>>    - CK Hu <ck.hu@mediatek.com>
>>    - Jitao shi <jitao.shi@mediatek.com>
>>
>>  description: |
>> -  The Mediatek DPI function block is a sink of the display subsystem and
>> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
>> -  output bus.
>> +  The Mediatek DPI and DP_INTF function blocks are a sink of the display
>> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
>> +  parallel output bus.
>>
>>  properties:
>>    compatible:
>> @@ -23,6 +23,7 @@ properties:
>>        - mediatek,mt8173-dpi
>>        - mediatek,mt8183-dpi
>>        - mediatek,mt8192-dpi
>> +      - mediatek,mt8195-dpintf
>
>It seems a bit weird to have all instances of DP_INTF with a separator
>but the compatible doesn't have one?
>
>Is there a reason to not use dp-intf?

None that I know of, It was taken as is from the vendor tree.
I'll use dp-intf in v10 for the sake of consistency.

Thx,
Guillaume.

>
>Maxime
