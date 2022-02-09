Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2F4AFE90
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 21:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A497910E45F;
	Wed,  9 Feb 2022 20:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896310E45F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 20:37:08 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id m10so3796669oie.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 12:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zIhHhyih/7ZhXtvq9LuF0lqvT9O7H7X5U0jczH+YH4s=;
 b=Dl89gz5j4tXr5Sk/UdbULHUMGcpO6v84WkRPdOtC8V1EEmn+VFoBmkj7dq94SFpMPq
 7HBL9S9lO0MyBp0oQrUXhpr9HsR5nVaYro6AyfjK57Rxc8HMTGbUiHynz71Ruj3ukplq
 YI3+rsBwTt36rh84Usb3hwxCvrfJ0JdMuQ4O47Fu9j2f7b1p3VnOzbt2urOyqsWxI9mh
 drlvZYsahV4VlcS/TNTsPzufTPdIo9Q8tGXeZdpDeVTYWhoeGVusrKzndjaVOoigoE3E
 KOBj4k+9qyhlCr/meYThF4zDKIlZEat3f6xNro98tJ/1WcGOD9UCUfTwdF2qHr1Cr4mB
 eXXA==
X-Gm-Message-State: AOAM531yTTFic4QCxXx5jAADHvtaucqA+tgjWE9Npo+t6wceyBjj/M6i
 qByvkX15ZtM+CSMjjSz5fg==
X-Google-Smtp-Source: ABdhPJy4JKuU/2pyAT8/RT39URC0YEPefqUshCvwl80gipjwlzTCz6tyUtL+RPSK1CFrfBlAbwLDDQ==
X-Received: by 2002:a05:6808:211c:: with SMTP id
 r28mr1739810oiw.4.1644439027436; 
 Wed, 09 Feb 2022 12:37:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg34sm7485772oob.14.2022.02.09.12.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:37:06 -0800 (PST)
Received: (nullmailer pid 862149 invoked by uid 1000);
 Wed, 09 Feb 2022 20:37:04 -0000
Date: Wed, 9 Feb 2022 14:37:04 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
Message-ID: <YgQl8CtttQ99+8lB@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128035440.24533-2-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".

What's lat soc? How does this relate to what's already there in this 
binding.

The subject space is limited, avoid saying the same thing twice 
(dt-bindings).

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 6415c9f29130..a3c892338ac0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -189,6 +189,55 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +  '^vcodec-lat-soc@[0-9a-f]+$':
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mtk-vcodec-lat-soc
> +
> +      reg:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description: |
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      clocks:
> +        maxItems: 5
> +
> +      clock-names:
> +        items:
> +          - const: sel
> +          - const: soc-vdec
> +          - const: soc-lat
> +          - const: vdec
> +          - const: top
> +
> +      assigned-clocks:
> +        maxItems: 1
> +
> +      assigned-clock-parents:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - iommus
> +      - clocks
> +      - clock-names
> +      - assigned-clocks
> +      - assigned-clock-parents
> +      - power-domains
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 
