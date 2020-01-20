Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E668142B64
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 13:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986E26E934;
	Mon, 20 Jan 2020 12:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB70B6E934
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:57:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KCvFrD093036;
 Mon, 20 Jan 2020 06:57:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579525035;
 bh=ddOzjfWs/Y8RzWmQNHDFPZm5igKmLYM6xMSjTfQMbyY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=kKhJt7edgXfcKTWjZAmo8m/zPNTUaXttW56fDzM4oA7d6Jkkm9W8cuB9SFAd7piiI
 AYz64VMQaS3F+cMmI4aKN3PHrhzBIOSH4vlA2ec92aSN8hb3iBeptqSSuiv88i+Nhn
 V0xI4w2Gfl6Fy8ZjoTvisCKXA48lWWqYvrvusvDc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KCvE8f091634;
 Mon, 20 Jan 2020 06:57:14 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:57:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:57:14 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00KCvETT020358;
 Mon, 20 Jan 2020 06:57:14 -0600
Date: Mon, 20 Jan 2020 07:01:03 -0600
From: Benoit Parrot <bparrot@ti.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v7 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20200120130102.xo2ajioik7koryby@ti.com>
References: <cover.1579202260.git.jsarha@ti.com>
 <a8d5b5dfad831b780d6d2639bd291089c4c5b0a9.1579202260.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8d5b5dfad831b780d6d2639bd291089c4c5b0a9.1579202260.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
 subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jyri Sarha <jsarha@ti.com> wrote on Thu [2020-Jan-16 23:06:00 +0200]:
> Add entry for tidss DRM driver.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Move tidss entry after omapdrm
>     - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"
> 
> v4: no change
> 
> v5: no change
> 
> v6: no change
> 
> v7: no change
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa9add598b7d..d8f65dc1dde8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5630,6 +5630,17 @@ S:	Maintained
>  F:	drivers/gpu/drm/omapdrm/
>  F:	Documentation/devicetree/bindings/display/ti/
>  
> +DRM DRIVERS FOR TI KEYSTONE
> +M:	Jyri Sarha <jsarha@ti.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tidss/
> +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +
>  DRM DRIVERS FOR V3D
>  M:	Eric Anholt <eric@anholt.net>
>  S:	Supported
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
