Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD154B03B7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 04:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7CE10E251;
	Thu, 10 Feb 2022 03:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2BD10E251
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 03:06:11 +0000 (UTC)
X-UUID: 61480397f04c4a228c946c16b270b18b-20220210
X-UUID: 61480397f04c4a228c946c16b270b18b-20220210
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 734615389; Thu, 10 Feb 2022 11:06:09 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 11:06:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 11:06:06 +0800
Message-ID: <aa72bec2064e25990e1a3641b920cb5528cfccd4.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 10 Feb 2022 11:06:06 +0800
In-Reply-To: <YgQl8CtttQ99+8lB@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-2-yunfei.dong@mediatek.com>
 <YgQl8CtttQ99+8lB@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

Hi Rob,

Thanks for your suggestion.
On Wed, 2022-02-09 at 14:37 -0600, Rob Herring wrote:
> On Fri, Jan 28, 2022 at 11:54:34AM +0800, Yunfei Dong wrote:
> > Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-
> > soc".
> 
> What's lat soc? How does this relate to what's already there in this 
> binding.
> 
lat soc is another hardware, is related with some vdec larb ports.
Won't be used to decode, but must to write it in dtsi, or hardware
can't work well.

Need to enable clock/power/iommus, no interrupt.
> The subject space is limited, avoid saying the same thing twice 
> (dt-bindings).
> 

Best Regards,
Yunfei Dong
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 49
> > +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > decoder.yaml
> > index 6415c9f29130..a3c892338ac0 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > subdev-decoder.yaml
> > @@ -189,6 +189,55 @@ patternProperties:
> >  
> >      additionalProperties: false
> >  
> > +  '^vcodec-lat-soc@[0-9a-f]+$':
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mtk-vcodec-lat-soc
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      iommus:
> > +        minItems: 1
> > +        maxItems: 32
> > +        description: |
> > +          List of the hardware port in respective IOMMU block for
> > current Socs.
> > +          Refer to bindings/iommu/mediatek,iommu.yaml.
> > +
> > +      clocks:
> > +        maxItems: 5
> > +
> > +      clock-names:
> > +        items:
> > +          - const: sel
> > +          - const: soc-vdec
> > +          - const: soc-lat
> > +          - const: vdec
> > +          - const: top
> > +
> > +      assigned-clocks:
> > +        maxItems: 1
> > +
> > +      assigned-clock-parents:
> > +        maxItems: 1
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - iommus
> > +      - clocks
> > +      - clock-names
> > +      - assigned-clocks
> > +      - assigned-clock-parents
> > +      - power-domains
> > +
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.25.1
> > 
> > 

