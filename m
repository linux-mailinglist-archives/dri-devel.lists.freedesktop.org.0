Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055694F62B1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1010E15D;
	Wed,  6 Apr 2022 15:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786BD10E15D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:15:18 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-d39f741ba0so3185406fac.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RpvtWoojBQC/zAbnCARk8Keu9NdnUbRhNT220URCdbA=;
 b=vNSDNdpucVkt7rxyBGos2Oc+7QVfD2OE3DSHiSJwWRYlps4lJu3/xYSRXYaL1qRlC7
 dJ6oj1eH3rB1wFMQR78pp9z6jUOxIJhsi8oNuzomHA7YeeuDenAky8PL6miH/4TulBd5
 q0hpe4UxrKqFICGGWFvgBYu9G5IwOcQl2oBbKBSttrz3+YzFOP5vffMovGdh+xaUzfGn
 4cC+f+2Fv/icb2Uv+66pGrPxaW/bcJnT6Mo2VyUL0iWXj9YUcTFf5CzmSjK/Nop7FJIR
 EOqdxV0MYqaW0aWvMLkJlzDTns3YQdtHSQdpps9zRyCQVQQ974zvqIxAiMkc+cdjDuuA
 aIQA==
X-Gm-Message-State: AOAM531taFyAbDX0wEAT9dSc6S/CdcZNqGW0baXiDqGP8TCYTFEpT9HN
 m87Zbaklwf1M38rz3b4s/A==
X-Google-Smtp-Source: ABdhPJxPRAU35Z8YAsHokOrrhdeTBPlBAcUIPkn2lyOwPKuqU/qsErcv+UFsS47fLlo/nlTZi7C8HQ==
X-Received: by 2002:a05:6870:1807:b0:d7:2a4c:14b8 with SMTP id
 t7-20020a056870180700b000d72a4c14b8mr4123400oaf.97.1649258117511; 
 Wed, 06 Apr 2022 08:15:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q11-20020a4a330b000000b003289cbe97c6sm6422082ooq.13.2022.04.06.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:15:16 -0700 (PDT)
Received: (nullmailer pid 2263085 invoked by uid 1000);
 Wed, 06 Apr 2022 15:15:15 -0000
Date: Wed, 6 Apr 2022 10:15:15 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
Message-ID: <Yk2ugxQukjPmYbFL@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
 <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d5a344c8ec1f92357bd9d5b8782dded862c549.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 09:38:20AM +0800, Rex-BC Chen wrote:
> On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1
> > +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > index dd2896a40ff0..a73044c50b5f 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> > l
> > @@ -22,6 +22,7 @@ properties:
> >        - mediatek,mt7623-dpi
> >        - mediatek,mt8173-dpi
> >        - mediatek,mt8183-dpi
> > +      - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> >  
> >    reg:
> 
> Hello Xinlei,
> 
> From the dts we use, the dpi node needs other properties for MT8186.
> Please send another patch and add these properties to binding.
> 
> assigned-clocks = <&topckgen CLK_TOP_DPI>;
> assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;

Those are always allowed on any node with 'clocks', so no need to add 
them here.

Rob
