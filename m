Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3744B04A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 16:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4716E84C;
	Tue,  9 Nov 2021 15:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1752 seconds by postgrey-1.36 at gabe;
 Tue, 09 Nov 2021 15:25:00 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893306E84C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 15:25:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A9EtdmV033385;
 Tue, 9 Nov 2021 08:55:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1636469739;
 bh=/9S7cEwEhjwd1n1GHF1WmCRCpoBx27XpIoMNXmVXuw8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nAGFjs/klY90qqE6oQN32qmP7nGw5Z2VnMXT29u3YQFt5x4xgI0+K4sgObd3tujeN
 ocYUzbmzvcGRy5kBj7OWtK+uEAwqnpIYu0NKgBEb7TxyUOyRqwRf6rs59wgG58F38E
 h5FwmppmTSWA0P6y2Hg68+KXTI2FJhaDQKnefMJI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A9EtdGk078253
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Nov 2021 08:55:39 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Nov 2021 08:55:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Nov 2021 08:55:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A9Etc87033665;
 Tue, 9 Nov 2021 08:55:39 -0600
Date: Tue, 9 Nov 2021 08:55:38 -0600
From: Nishanth Menon <nm@ti.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: Re: [PATCH] drm/bridge: cdns-dsi: Make sure to to create proper
 aliases for dt
Message-ID: <20211109145538.fh3vsfnvfvvmcovb@automated>
References: <20210921174059.17946-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210921174059.17946-1-nm@ti.com>
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
Cc: Milind Parab <mparab@cadence.com>, r-ravikumar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nikhil.nd@ti.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12:40-20210921, Nishanth Menon wrote:
> Add MODULE_DEVICE_TABLE to the device tree table to create required
> aliases needed for module to be loaded with device tree based platform.
> 
> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index d8a15c459b42..829e1a144656 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -1284,6 +1284,7 @@ static const struct of_device_id cdns_dsi_of_match[] = {
>  	{ .compatible = "cdns,dsi" },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
>  
>  static struct platform_driver cdns_dsi_platform_driver = {
>  	.probe  = cdns_dsi_drm_probe,
> -- 
> 2.32.0
> 
> 

Hi, Ping?
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
