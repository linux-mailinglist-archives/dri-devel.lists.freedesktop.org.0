Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67630506CD4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F2410E2AE;
	Tue, 19 Apr 2022 12:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910C10E2AE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:54:14 +0000 (UTC)
X-UUID: 47195bd9807c48b6acb41f1243ee5b80-20220419
X-UUID: 47195bd9807c48b6acb41f1243ee5b80-20220419
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 523601457; Tue, 19 Apr 2022 20:54:07 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 20:54:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 20:54:06 +0800
Message-ID: <d79bc438016fd794e6f73dd2a27007edaff3b758.camel@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 19 Apr 2022 20:54:06 +0800
In-Reply-To: <1650370363.539386.1977865.nullmailer@robh.at.kernel.org>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <1650370363.539386.1977865.nullmailer@robh.at.kernel.org>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-04-19 at 20:12 +0800, Rob Herring wrote:
> On Tue, 19 Apr 2022 11:32:35 +0800, Rex-BC Chen wrote:
> > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > 
> > Add vdosys1 RDMA definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 86
> > +++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> rdma.yaml: $id: relative path/filename doesn't match actual path or
> filename
> 	expected: 
> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ZfBylOH4GptgXoItZHgYYVPitXIJ1TDhU0oAfMro55Y0xklQB9xVRfnEFl-a1OhDJck$
>  
> Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> rdma.example.dts:27:18: fatal error: dt-bindings/memory/mt8195-
> memory-port.h: No such file or directory
>    27 |         #include <dt-bindings/memory/mt8195-memory-port.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:364:
> Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> rdma.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1401: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See 
> https://urldefense.com/v3/__https://patchwork.ozlabs.org/patch/__;!!CTRNKA9wMg0ARbw!3ZfBylOH4GptgXoItZHgYYVPitXIJ1TDhU0oAfMro55Y0xklQB9xVRfnEFl-a3heEKEl$
>  
> 
> This check can fail if there are any dependencies. The base for a
> patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up
> to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
Hello Rob,

As mentioned in cover letter, this patch is basd on Yong's patch:
message id: 20220407075726.17771-2-yong.wu@mediatek.com
Without this patch, some patches of this series will build failed.

For Yong's series, I think it's just waiting for accepted by
maintainers.
Moreover, we really need your suggestion and even approvement for these
display binding patches.

Thanks for your big support!

BRs,
Rex



