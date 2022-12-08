Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC0646948
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 07:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895CF10E460;
	Thu,  8 Dec 2022 06:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A5F10E460
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670481112; x=1702017112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XwlSPJYQoDb5djKNg20xU0ESkaG40RvAlk42JH3DpE=;
 b=hlA7xinGi+E4pERoQAxIV1lxqiYZBlHRqWUDD/H2g6JaZEGsU+/oUQMX
 uh4w3+H/iYnXCDrXM2LVZAR9prQ86yBq1xaxbXFI1Rt+AQUy5/VG2p6eZ
 GIEX3ZMHWUEWo+Oq9ncdup0sDodUSIq4zj7N3hYXEIOC1kJ7PYhYNt/qN
 W3XD/auYPvQehpa2+yCx8cJWDA8F8FxWUpLHVWeDt8Jkst4MS0L8HCzYM
 WBB/DJ2Pwo/dQJsCE+HC2Ykj8Dfq66c7X/VXbYKc8HKh6Aq9p2T9paIkJ
 LHl9HIr0IzuJxm8fJ6R4PDe9Kog5ndlx7zmT1IDAbifLCOF9MnMmb1NvP Q==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27824962"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 07:31:50 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 07:31:51 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 07:31:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670481110; x=1702017110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XwlSPJYQoDb5djKNg20xU0ESkaG40RvAlk42JH3DpE=;
 b=iF17+7VTAT+EuO9vpap3N6vOkLN7230Xskm0pNwRIewqe8Z4rcMb64jK
 ZaeB1t8PwHIZ07lB5qg7IK5b4FGpC5yR95D5GzxThVTmEu1Suq5eYpz7T
 it1nNeEJ6mMn3NjwQq1PKtgHbvNC/gTLKF1eqe1j5vn1fXS7K7e8+Ahq0
 x591RYtKd6QYc3FHbEmWXXkHNYQ2OjQZ5TvZ0DReslmYl0vfrom7g3Nt7
 SSgFd+x1fIp9pSg8jHmQDLt9q6tuDAtrBM1+k7CuCAP3vmuv6DwyKRpUY
 A0Ij5O3yG1nSLPRHqEZDIwBPlOaJ06SByTGNC1Z735kIltJxFeDCnuCGx w==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27824961"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 07:31:50 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A9EB0280071;
 Thu,  8 Dec 2022 07:31:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Fix clock constraints for imx8mp
Date: Thu, 08 Dec 2022 07:31:46 +0100
Message-ID: <2861512.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e5d8f530-9814-48eb-76b3-e4712300466d@denx.de>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
 <e5d8f530-9814-48eb-76b3-e4712300466d@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Marek,

Am Mittwoch, 7. Dezember 2022, 16:59:50 CET schrieb Marek Vasut:
> On 12/7/22 16:13, Alexander Stein wrote:
> > i.MX8MP uses 3 clocks, so soften the restrictions for clocks &
> > clock-names.
> > 
> > Fixes: f5419cb0743f ("dt-bindings: lcdif: Add compatible for i.MX8MP")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> > 876015a44a1e6..793e8eccf8b8b 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > 
> > @@ -70,7 +70,9 @@ allOf:
> >         properties:
> >           compatible:
> >             contains:
> > -            const: fsl,imx6sx-lcdif
> > +            enum:
> > +              - fsl,imx6sx-lcdif
> > +              - fsl,imx8mp-lcdif
> > 
> >       then:
> >         properties:
> >           clocks:
> Reviewed-by: Marek Vasut <marex@denx.de>

Thanks!

> btw you might want to update the clock-names and clock proerty order in
> imx8mp.dtsi to match the clock-names order in these bindings.

The lcdif nodes are not yet in linux-next ;-) So its probably a local commit 
on your side. But yes, the upcoming patches will address this.

Best regards,
Alexander



