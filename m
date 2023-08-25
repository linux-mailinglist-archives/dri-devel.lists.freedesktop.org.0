Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35C7886BB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5F010E667;
	Fri, 25 Aug 2023 12:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4450 seconds by postgrey-1.36 at gabe;
 Fri, 25 Aug 2023 12:13:19 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43DF10E667
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:13:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37PAwoVT003475;
 Fri, 25 Aug 2023 05:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1692961130;
 bh=FaCrkca4JLKb6nFTJfggo8RMTTzc91fMCiax4jyX4qQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oK/Xf439t0IB4qN+/eRD6VJDHsww/1WC5DO8wpXMCzQct9U7+tJ35ca85XjAIyDZa
 5r7h0+7cpU+1Z/4jovZD3kvhljwxamj7lm+jtz5UdyzZjNLzvAniYzZgRRvUbXjp3s
 BRMhoPkcbXvtDeSmdTmAFrqhxPL6RzqTDw+vT3VA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37PAwo8S062184
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Aug 2023 05:58:50 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Aug 2023 05:58:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Aug 2023 05:58:49 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37PAwnAY006368;
 Fri, 25 Aug 2023 05:58:49 -0500
Date: Fri, 25 Aug 2023 05:58:49 -0500
From: Nishanth Menon <nm@ti.com>
To: Nicolas Belin <nbelin@baylibre.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [3/3] drm: bridge: it66121: Add audio support
Message-ID: <20230825105849.crhon42qndxqif4i@gondola>
References: <20220316135733.173950-4-nbelin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220316135733.173950-4-nbelin@baylibre.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 "Andy . Hsieh" <Andy.Hsieh@mediatek.com>, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14:57-20220316, Nicolas Belin wrote:
> Adding the audio support on the HDMI bridge for I2S only.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Andy.Hsieh <Andy.Hsieh@mediatek.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 627 +++++++++++++++++++++++++++
>  1 file changed, 627 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 64912b770086..514989676d07 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c

Not sure how, but I see this when HDMI is not connected on BeaglePlay

https://gist.github.com/nmenon/f3d4a34ec9b9d188fbefb65f94090bcb

Cc Jai Luthra
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
