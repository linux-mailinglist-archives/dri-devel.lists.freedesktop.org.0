Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CD96468D0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 06:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D144D10E1AF;
	Thu,  8 Dec 2022 05:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EB410E1AF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670479158; x=1702015158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8GP9HBNN8u4TgS3Cfxnp4Ee0zlrtM1U7+RBzmaiZbc=;
 b=IPDifZI+n92dzNZD078+tPnFnUoeZfz/vTJSqzk4m7QZ+r0A5ZkMcsT4
 /pAh12XZ3vODezfIeSGY2IRAmmJcjVwAgkh/3yLo+9iLKpxL3iJIbut+2
 G6U4JhxDzVE5bdR0e6isyuytUexJPm9S75+yxu6h+mcaUmIDrr5E7ejal
 Mkj91gRKbVF5iOIvM4w/u/EEZy8l5wHFRqD/NLeZFN8ANOKd5WnJV5G2J
 pQWq3opMMZ63GAo0gBCM3+Diyq1lrtcuPM+TMjcYgcyENTMPsxeEJXjNn
 7gIbqekoL8rYsFZGkcm4Q1EhAGd996xnLBj/ZP7PS9R6z0q4vfVT5spCF Q==;
X-IronPort-AV: E=Sophos;i="5.96,226,1665439200"; d="scan'208";a="27824370"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 06:59:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 06:59:16 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 06:59:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670479156; x=1702015156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8GP9HBNN8u4TgS3Cfxnp4Ee0zlrtM1U7+RBzmaiZbc=;
 b=hDlNmNkAJN0IbccOQvCcy0rK9BRELoYkCQ/DzNwTKp4EC2tejRjZEqAc
 K6O4KiU+xjHRRRiEcDQO5vCtT4Y8ad6PieuzzEBg8w6JrQEXOcLSF+N/8
 ibj/SBLzfPzih3yxJ73ckM7TgWWVnquDBNL4AQxVifZr7etzyAJEg5CWC
 qmaDn7wBV2TwVo0hnQSdYHlUGAeiLO4TsF27O9UY1puYA2X1BRSFnhWkN
 bnhyahwshw+mP6h+0vCokn/gReQw0CxDlQ2QVArBpKDdYrtoF72gtxV0V
 1GFv4njm1rALBIf+C0usJqN8+GE1WGkRtbwPyQ2DSmYdbtr7tHDAcGZnW w==;
X-IronPort-AV: E=Sophos;i="5.96,226,1665439200"; d="scan'208";a="27824368"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 06:59:16 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2CD77280071;
 Thu,  8 Dec 2022 06:59:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: lcdif: Add optional power-domain
Date: Thu, 08 Dec 2022 06:59:12 +0100
Message-ID: <1839665.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <00789ae3-7fd7-e662-6348-8a31a72ee589@denx.de>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
 <20221207151400.1572582-2-alexander.stein@ew.tq-group.com>
 <00789ae3-7fd7-e662-6348-8a31a72ee589@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 7. Dezember 2022, 17:00:22 CET schrieb Marek Vasut:
> On 12/7/22 16:14, Alexander Stein wrote:
> > i.MX8MP requires a power-domain for this peripheral to use. Add it as
> > an optional property.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> > 793e8eccf8b8b..9d9fb5ad587c2 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > 
> > @@ -52,6 +52,9 @@ properties:
> >     interrupts:
> >       maxItems: 1
> > 
> > +  power-domains:
> > +    maxItems: 1
> > +
> > 
> >     port:
> >       $ref: /schemas/graph.yaml#/properties/port
> >       description: The LCDIF output port
> 
> Should this be required on mx8mp then ?

I'm hesitating to add a required property later on. But I'm okay with both.
Rob, Krzysztof: Any preference here? Shall power-domains be made required for 
fsl,imx8mp-lcdif only?

Best regards,
Alexander



