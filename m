Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B6691012
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E0610E090;
	Thu,  9 Feb 2023 18:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A146510E090
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:11:50 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-16346330067so3647497fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 10:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6XnIAiAClL5oAiPclHzd+Qs8gc/SNlQ6u+IiIFu1NM=;
 b=PlTAsOwoeQLeoGbOhNurg7qKUyTzOXy2wdcXmMt9KgQXPXZ+vzBCUux8tWrYOpEp0j
 EK/77WWlKCLJZY3NS2e9cy2F/j8hZn7zkLsHKgpn2inBB/BpDQM7/N0TC2q/JjTMSjl4
 enrRgRgHxh5iY/xrUQUegCMXgRHzZweNSf95UxR+KreipYK6zSBGPRFI0eZ5GKlIu1ZX
 ehRk38NiYlsuofmR+y8aPkRdRu2MR4F2uRdB2vUMYgnSpU5MhLIJ2tVvOvEcFxTDcqhu
 DGFAGoVgi+GXBJlTSZIJevgvOGAf38SqSMlC+Ioe5XfyE7lzGomhRdHkR1gf0+39+NR9
 4BXQ==
X-Gm-Message-State: AO0yUKUela2FFckVaKvM1MI2ePMVqCNM0Rv7OJkFS77cRRDv+ID4cb8t
 jWPJ/kedmUB1IDLPA9MaOQ==
X-Google-Smtp-Source: AK7set8RezWLgO8rJBbJEYH7HXlrkAborpT0Rbl7VhLs+8Jkmk2Zcuf8wsK3c7crwWe+tqDB/W2o0A==
X-Received: by 2002:a05:6870:e0cf:b0:163:3b10:d366 with SMTP id
 a15-20020a056870e0cf00b001633b10d366mr6740835oab.47.1675966309737; 
 Thu, 09 Feb 2023 10:11:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v35-20020a056870956300b0016a9f1616b0sm998708oal.5.2023.02.09.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:11:49 -0800 (PST)
Received: (nullmailer pid 584278 invoked by uid 1000);
 Thu, 09 Feb 2023 18:11:48 -0000
Date: Thu, 9 Feb 2023 12:11:48 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
Message-ID: <20230209181148.GA575482-robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
 <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 Chen-Yu Tsai <wenst@chromium.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 10:15:33AM +0100, AngeloGioacchino Del Regno wrote:
> Il 09/02/23 03:50, Chen-Yu Tsai ha scritto:
> > On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The sram-supply is MediaTek-specific, it is and will ever be used
> > > only for the mediatek,mt8183-mali compatible due to the addition of
> > > the mediatek-regulator-coupler driver: change the binding to add
> > > this supply when mediatek,mt8183-mali is present as a compatible
> > > instead of disabling it when not present.
> > > 
> > > This is done in preparation for adding new bindings for other
> > > MediaTek SoCs, such as MT8192 and others.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > index 78964c140b46..69212f3b1328 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > > @@ -57,8 +57,6 @@ properties:
> > > 
> > >     mali-supply: true
> > > 
> > > -  sram-supply: true
> > > -
> > 
> > Have you tried actually validating the device trees against this?
> > Based on my previous tests this gives out errors.
> 
> I did... and I didn't get any complaint... but perhaps something went wrong
> on my side?
> 
> I mean, I can retry just to be sure.

You should need unevaluatedProperties instead of additionalProperties 
for this to work. The latter cannot 'see' into an if/then schema.

But really we want the default top level to allow this and then disallow 
it in an if/then schema.

Rob
