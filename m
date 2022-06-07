Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8941540226
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1730F10E059;
	Tue,  7 Jun 2022 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA8810E156
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 15:11:23 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h7so6840850ila.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yZvply317AePPx+C+0gJXDyN0OP2009ot+8UwJNT7lc=;
 b=itKbA9DROVuNwtmf7+QkSWoIycJ/ygPuPJLPDFs97eyO9Cgh9FBwppXZI+9CtXYLl1
 c8TPZsURFIA5cv78u6xiqDVUslqiCVquSSzThLxijgjsG4EGa8nQwXezgyQIvkumxn88
 2Ppkr8ST5knYZyyTy9u4R7gRfQwwgtrMzxw04TA/l4SwW1RziTufrW6F9wCV/WQCIn4O
 HVIwK77Voj6ToBGlRb1FFoKtPCJUfpz7ed7CGT/BpOzYt+Jap7g5he7tuneaGpJ8qyNp
 W6HVH2D11H8dx8yq/4DujakCqrwkV0wiTxUD3FGYUFBXQq9lbDvYDECJwEPfu9xiJLjt
 S8Tg==
X-Gm-Message-State: AOAM530uqt2zUF+6HuYkjvRgDadExUAMSi6EAvIRQSjn51+Bbk1gQ8hH
 O2So7rpml+aiHT0IoWd+6w==
X-Google-Smtp-Source: ABdhPJx/aj8OkTZ5sZWk9M29SQS/0eDgBTSzLYMt1Sjvv9q41ldddqHu8JdQx/N4vjM5hJPYMOdyQg==
X-Received: by 2002:a05:6e02:164b:b0:2d3:ccea:ff38 with SMTP id
 v11-20020a056e02164b00b002d3cceaff38mr16702955ilu.37.1654614682299; 
 Tue, 07 Jun 2022 08:11:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05663805ae00b00331d98c9a7fsm409601jar.40.2022.06.07.08.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:11:21 -0700 (PDT)
Received: (nullmailer pid 3258163 invoked by uid 1000);
 Tue, 07 Jun 2022 15:11:19 -0000
Date: Tue, 7 Jun 2022 09:11:19 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v4 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
Message-ID: <20220607151119.GA3254370-robh@kernel.org>
References: <20220606051131.14182-1-rex-bc.chen@mediatek.com>
 <20220606051131.14182-2-rex-bc.chen@mediatek.com>
 <1654520033.524963.534472.nullmailer@robh.at.kernel.org>
 <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8598b46381861bd36008cc87599c73863cb4b98e.camel@mediatek.com>
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
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 09:30:42PM +0800, Rex-BC Chen wrote:
> On Mon, 2022-06-06 at 20:53 +0800, Rob Herring wrote:
> > On Mon, 06 Jun 2022 13:11:29 +0800, Bo-Chen Chen wrote:
> > > From: "Nancy.Lin" <nancy.lin@mediatek.com>
> > > 
> > > Add vdosys1 RDMA definition.
> > > 
> > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Tested-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88
> > > +++++++++++++++++++
> > >  1 file changed, 88 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > > rdma.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m
> > dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/display/mediatek/mediatek,md
> > p-rdma.yaml: properties:compatible: [{'const': 'mediatek,mt8195-vdo1-
> > rdma'}] is not of type 'object', 'boolean'
> > 	from schema $id: 
> > https://urldefense.com/v3/__http://json-schema.org/draft-07/schema*__;Iw!!CTRNKA9wMg0ARbw!3hhZrSKSWnCN5Bha9laiHlB5JCx9_p-ksaYDZmoCLQRi1tI4KJCcTJQva2vds3j3bwKF$
> >  
> > /builds/robherring/linux-dt-
> > review/Documentation/devicetree/bindings/display/mediatek/mediatek,md
> > p-rdma.yaml: ignoring, error in schema: properties: compatible
> > Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
> > rdma.example.dtb:0:0: /example-0/soc/rdma@1c104000: failed to match
> > any schema with compatible: ['mediatek,mt8195-vdo1-rdma']
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/
> > 
> > This check can fail if there are any dependencies. The base for a
> > patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up
> > to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> Hello Rob,
> 
> We found that if we write this, and the error will disapear:
>  properties:
>    compatible:
> -    - const: mediatek,mt8195-vdo1-rdma
> +    items:
> +      - const: mediatek,mt8195-vdo1-rdma
> 
> But from Krzysztof's review[1], he adviced us to drop items.
> 
> Is there any suggsetion for this error or do we have any
> misunderstanding?

The '-' is important.

compatible:
  const: mediatek,mt8195-vdo1-rdma
