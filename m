Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4154E4CE11D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 00:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0356210FA5A;
	Fri,  4 Mar 2022 23:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B94D10FA5A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:44:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76E7A61E2C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AAAC340F4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437439;
 bh=16b3mHxGo7CXPa/opMj9XBta1y9/zRDIU0OwsIYy1LM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lNE1FWE2VLO2AASJfC6duh+flMjHcAj1hpQGW1NHjm8rPyER1vCT/bMTz+9AcyR7i
 MpTwzcfAVei4VFMKtHZC7Ps9vRilwLDx1jNRvVhNhh1+ezFm7qN6AFK9xnsDB3CckR
 nq/xkhI1YvAHwckPcgt2NhE5m1yqtqCcNwjtSiqsfKWWZH/zaJNj8gN3aoHvgfiwG5
 LfHAo0OBP/45GsZB/4IQEvjjf+XAt0GaqfE4cneDTgx3Ed1NCEROCBOAfxfR3Tuc6Q
 xPSixbOi/gs5bGgO4hINtSbAOHIYppnlrcmpPXKWD0NxhN4Hng8NQkgpHZRx8zNgsO
 la4b07wrtmq8w==
Received: by mail-ej1-f52.google.com with SMTP id dr20so20471286ejc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 15:43:59 -0800 (PST)
X-Gm-Message-State: AOAM531rgCo/sXYF16AjNrm999o/4DBm/RkOwIR0eph8E/H/rB0uiD4c
 7LEB4FRrdJklVPqhNz5/nL/6VkwONbGynNPn1A==
X-Google-Smtp-Source: ABdhPJwnZliVE4KHmolx7T1uMZ0t0Ia2+Lso1v5G32G3bJxHN2JjX0zgzbElexB7kKBvJcmKTP8sZXJn0s/5C8B2wqE=
X-Received: by 2002:a17:907:3f8d:b0:6d5:bb03:c4c6 with SMTP id
 hr13-20020a1709073f8d00b006d5bb03c4c6mr953594ejc.680.1646437437567; Fri, 04
 Mar 2022 15:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:43:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek, mutex: Fix mediatek, 
 gce-events type
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 krzysztof.kozlowski@canonical.com, David Airlie <airlied@linux.ie>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B43=E6=9C=884=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:55=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The mediatek,gce-events property needs as value an array of uint32
> corresponding to the CMDQ events to listen to, and not any phandle.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each bl=
ock to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mu=
tex.yaml
> index 6eca525eced0..842ba7b07a34 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y=
aml
> @@ -58,7 +58,7 @@ properties:
>        The event id which is mapping to the specific hardware event signa=
l
>        to gce. The event id is defined in the gce header
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>
>  required:
>    - compatible
> --
> 2.35.1
>
