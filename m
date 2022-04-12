Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026D4FD4B0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 12:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D703F10E068;
	Tue, 12 Apr 2022 10:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892D10E068
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 10:06:10 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d39f741ba0so20207350fac.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:user-agent:references:in-reply-to:mime-version:date:message-id
 :subject:to:cc;
 bh=tZvbGpFjILGpekjAvGDF0y9dQ6Kd+gBt4gVMWfKJuAk=;
 b=Xo8+YSn3qT7Jhf9u4FuGYXY6Bov1PRuEhL0/Es2kDk9T156ExPENxfB+L80w1q/WN8
 AY7X2X8pBC+egX5EAP7hbmLqVYYquyMaM+9TMa0V8rrwt4eOMwpnKS1rXrmKnJYddRKl
 WXqMioKIAM/xFynvUhz/5U8QrlcdzmdQycq7DES/Sco99BT/85Gs/jV5R1n5nlmInzkN
 Xusklq+2enfKbeU1Z/uYCXgSMZElx/lRCPsCgmbehOhUkX+zIy72zJ9+1JEhZnnHiF0b
 7lrsXEthfoBv0c5BqbSXLUfcVprx8t79rP5dVaUdlBdoIR+brcAYyZc6c3+7XT7Jw7uM
 vcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:user-agent:references:in-reply-to
 :mime-version:date:message-id:subject:to:cc;
 bh=tZvbGpFjILGpekjAvGDF0y9dQ6Kd+gBt4gVMWfKJuAk=;
 b=H3mrxQuoW3jZbCfcrM9CHwhLq1AMt2DyIyRLzi2AYZaoA8Mo7KOPy3T1LjMv3FCjqp
 UACUfA1njoeQhXVhgzV9ba51CD0W9ZrvUC5iGlm9s3RCpZDOYPl6MtqfdYybT7WoifvG
 k+qLRkPvzWxTCR/wid1YhC3XH/HWVLG2TK30njihqGdWRg8Euy4UQY4DP77lezamH/Cd
 BMQwj6OSj18OvA4Wh8BgLeNzNjc0ldUcqB2QHRCf2OPXICAMbo56/Eavg3Nu1xItaUX/
 sqcWNnP9HGgDP1GCgnKa1e1a0fHEbCt99QGjMSBHwkMwkBKje60xQSW9OBI/5ZChd/S8
 KD2g==
X-Gm-Message-State: AOAM532lWSnWYb56se0WfeQcXm0MjiOl5CFdpHBhBL1b1FTe+bKWrWpd
 td517rC5O6dFXliVmMsEmYe7EJl6cluKh0fDnTg5Sw==
X-Google-Smtp-Source: ABdhPJw3WX7NFQkxU4ADRLrRdzB/pHuRSdo1xjaZj5zggo6wW/RSRVmkJtH7xxbo7eDcNYsrg++TE2K0RicigcNQMoo=
X-Received: by 2002:a05:6870:f21a:b0:dd:9bec:caf8 with SMTP id
 t26-20020a056870f21a00b000dd9beccaf8mr1670792oao.78.1649757969594; Tue, 12
 Apr 2022 03:06:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 03:06:08 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-4-granquet@baylibre.com>
 <YkOPB5W7uXkOc72/@robh.at.kernel.org>
In-Reply-To: <YkOPB5W7uXkOc72/@robh.at.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Apr 2022 03:06:08 -0700
Message-ID: <CABnWg9tvh31wibtTO2nETfJ9XtST0Ejjea0_2q1Hd5GRs9DN4Q@mail.gmail.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: mediatek,dp_phy: Add Display Port
 PHY binding
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, chunfeng.yun@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 00:58, Rob Herring <robh@kernel.org> wrote:
>On Mon, Mar 28, 2022 at 12:39:08AM +0200, Guillaume Ranquet wrote:
>> This phy controller is embedded in the Display Port Controller on mt8195 SoCs.
>
>Sorry, but I think you need to go back to what you had in v8. While yes,
>the phy and controller IP often do change independently, this h/w looks
>pretty interwined.

Understood, I'll revert back to v8.

>
>You could make the controller a phy provider to itself if you wanted.

Not sure I follow, could you point me to an example?

Thx,
Guillaume.
>
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>  .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>> new file mode 100644
>> index 000000000000..1f5ffca4e140
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) 2022 MediaTek
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Display Port PHY
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  Device tree bindings for the Mediatek (embedded) Display Port PHY
>> +  present on some Mediatek SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8195-dp-phy
>> +
>> +  mediatek,dp-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the Display Port node.
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - mediatek,dp-syscon
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    dp_phy: dp-phy {
>> +      compatible = "mediatek,mt8195-dp-phy";
>> +      mediatek,dp-syscon = <&dp_tx>;
>> +      #phy-cells = <0>;
>> +    };
>> --
>> 2.34.1
>>
>>
