Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF453BA2F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACC5112B05;
	Thu,  2 Jun 2022 13:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29005112B05
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:56:06 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso6792235fac.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ItU4+oZlqrhVsTFDZffq1bHsfD8LPaRiGahfhp8yC6g=;
 b=tz1tebyEGI/yneBVBasv+TmxrqX50fgEd2fVimnd9mWRHNSyhUpAVsCMtpcP7PLKOR
 zCYBZGhN4D0VJTSOySqjlE3xmIQ0jd4Am0SrCz4KNThzmXOhuyOUIQgjXsAKgN65Xeeb
 sv2QWD02D4IjWZjsCpdSA55NtAwpxroczqaQtXs30AFFvW+OMkAs05fz2Dox9mE9JF/i
 sQcTW8/aQMkplM0opm9VPEfkVR8F1WD3FTqyqAMcJGQyQSuRYk7l+Fa0uqpdaocZUhGP
 6eb+nlibomjR76CEB9K9rVDcQGBOArxkX7V4lkGL168BeaV/+x129R9PNBT9qyNaJJj8
 s+pA==
X-Gm-Message-State: AOAM530ma5AoHAMHCC8Xkhn5SQ2s1LECAUGpLGUxtj3LpA2QSP+MdbAC
 kEjRD+rHtyKK1abDVW24fw==
X-Google-Smtp-Source: ABdhPJxg9znekohzZ8yCO9gbFG1TwRG0wCp2dzp7Q9YlFVk8Z/w1M4q2XVJue+i1UtPEKiJWdkNyqA==
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr2783044oaq.223.1654178165323; 
 Thu, 02 Jun 2022 06:56:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05680807c300b00325cda1ffa8sm2212823oij.39.2022.06.02.06.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:56:04 -0700 (PDT)
Received: (nullmailer pid 2197386 invoked by uid 1000);
 Thu, 02 Jun 2022 13:56:04 -0000
Date: Thu, 2 Jun 2022 08:56:04 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Message-ID: <20220602135604.GA2194286-robh@kernel.org>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
 <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
 <CADiBU39jZ6TdYZoH80m4R-X2_fUXZOvDA4yUd_TQdPzBJLE+JA@mail.gmail.com>
 <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <076d53d3-6062-686f-8e45-14c5f936bbf6@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 ChiYuan Huang <u0084500@gmail.com>, jingoohan1@gmail.com, deller@gmx.de,
 lucas_tsai@richtek.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 cy_huang <cy_huang@richtek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 26, 2022 at 12:32:12PM +0200, Krzysztof Kozlowski wrote:
> On 26/05/2022 10:13, ChiYuan Huang wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年5月26日 週四 下午4:06寫道：
> >>
> >> On 26/05/2022 05:16, cy_huang wrote:
> >>> From: ChiYuan Huang <cy_huang@richtek.com>
> >>>
> >>> Add the new property for ocp level selection.
> >>>
> >>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> >>> ---
> >>>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
> >>>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
> >>>  2 files changed, 13 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> >>> index e0ac686..c1c59de 100644
> >>> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> >>> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> >>> @@ -47,6 +47,14 @@ properties:
> >>>      minimum: 0
> >>>      maximum: 3
> >>>
> >>> +  richtek,bled-ocp-sel:
> >>
> >> Skip "sel" as it is a shortcut of selection. Name instead:
> >> "richtek,backlight-ocp"
> >>
> > OK, if so, do I need to rename all properties from 'bled' to 'backlight' ?
> > If  only this property is naming as 'backlight'. it may conflict with
> > the others like as "richtek,bled-ovp-sel".
> 
> Ah, no, no need.
> 
> >>
> >>> +    description: |
> >>> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A
> >>
> >> Could you explain here what is OCP (unfold the acronym)?
> > Yes. And the full name is 'over current protection'.
> 
> Thanks and this leads to second thing - you encode register value
> instead of logical value. This must be a logical value in mA, so
> "richtek,bled-ocp-microamp".

We already have common properties for setting current of LEDs. We should 
use that here I think.

Rob
