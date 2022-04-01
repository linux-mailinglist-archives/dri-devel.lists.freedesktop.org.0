Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0804EE56C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF6A10F487;
	Fri,  1 Apr 2022 00:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581C110F487
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 00:38:50 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso1115505otj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 17:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Md3cCefLMSray2j1VFcGmjcxpcWEMbLoOD2HKB0PTXI=;
 b=U8DM55C3eVwKG6PkSMQZH6/RkQx5p/xvPcrY0zLnb3/yqLE0WwkQj1/archvghNmc3
 Ugy0Yiu6Do3JVIzdwHJpN/aILwNKnEv3q3hvtAX1BVQsAgwlTGL0JRTA8ajjIqiBaUbH
 Pj9IuaOjXzkOR3MsrvcQOU2mTbOIvyBB5L5MhNNfb9K08iIE+rqfVZwGPfBtj6LjAMhZ
 qVDRixAGBfAbIbrG8b+9tbzfXCDXMfOue4PcRAXMTSm3r8TrrGipmZWHz20fVKcbH4HW
 uM3Evpzzp7CJw4iwQCvcCf+B/O7S7LHgB4lFGTTecCg7ZYQGMYr9hh5CXlPdrhu/w0BV
 u+xA==
X-Gm-Message-State: AOAM532VIfEJrUDIdYXNptmj24wF4Xf7FyuIGIQNZwr3XaPsTWk6BLYK
 6NN7jEHWrg3KGLpYWEHWpg4/8H50OQ==
X-Google-Smtp-Source: ABdhPJxrSAu+8NUOgpFf3GPF5vnUKQ/glmdpSADcfPd0K+ga9g1rCslA/mzTPaQNCT8WkVeCO+SorQ==
X-Received: by 2002:a05:6830:22ea:b0:5b2:35c1:de3c with SMTP id
 t10-20020a05683022ea00b005b235c1de3cmr6718277otc.282.1648773529526; 
 Thu, 31 Mar 2022 17:38:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h83-20020aca3a56000000b002ece47dce52sm410301oia.26.2022.03.31.17.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 17:38:48 -0700 (PDT)
Received: (nullmailer pid 1796244 invoked by uid 1000);
 Fri, 01 Apr 2022 00:38:47 -0000
Date: Thu, 31 Mar 2022 19:38:47 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Message-ID: <YkZJl+z3OL32pCKU@robh.at.kernel.org>
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 07:49:30 +0100, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added full path for dsi-controller.yaml
>  * Modeled DSI + D-PHY as single block and updated reg property
>  * Fixed typo D_PHY->D-PHY
>  * Updated description
>  * Added interrupts and interrupt-names and updated the example
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
> RFC:-
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
