Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58918906787
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8E410E9A7;
	Thu, 13 Jun 2024 08:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Bd8/+7lD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D7C10E9A7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:50:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8oMcG015265;
 Thu, 13 Jun 2024 03:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718268622;
 bh=39EYWY7+nUf4nZ2MOh8ZDienfKEg5Se8HY2Tilf3GX8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Bd8/+7lD2OifN2hDM8Tj4cZeCorKA8kkTo905N6atrcelrGMmUCuXueH0OE2t5TuK
 tzzZmJmv2sYmEqtyhR5sU11Y+KYRrvJUEmZ0qdvG53KtVVgnQVF8/Ft4x/6cV3rFzM
 lHlPPVovdt3qJXkIVds4LTw1Jn1j445RJvunwrlM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8oMOv092927
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Jun 2024 03:50:22 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:50:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:50:22 -0500
Received: from [10.249.129.248] ([10.249.129.248])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8ntew089041;
 Thu, 13 Jun 2024 03:50:16 -0500
Message-ID: <bb081ec4-9c1a-4318-82c9-687751f05774@ti.com>
Date: Thu, 13 Jun 2024 14:20:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/bridge: sii902x: Support atomic bridge APIs
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <linux-kernel@vger.kernel.org>,
 <dmitry.baryshkov@linaro.org>, <sui.jingfeng@linux.dev>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <mripard@kernel.org>, <sam@ravnborg.org>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <20240613083805.439337-1-j-choudhary@ti.com>
 <20240613083805.439337-3-j-choudhary@ti.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240613083805.439337-3-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13-Jun-24 14:08, Jayesh Choudhary wrote:
> Change exisitig enable() and disable() bridge hooks to their atomic
> counterparts as the former hooks are deprecated.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 6a6055a4ccf9..00a8c469f553 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -322,7 +322,8 @@ static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs =
>  	.get_modes = sii902x_get_modes,
>  };
>  
> -static void sii902x_bridge_disable(struct drm_bridge *bridge)
> +static void sii902x_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>  
> @@ -335,7 +336,8 @@ static void sii902x_bridge_disable(struct drm_bridge *bridge)
>  	mutex_unlock(&sii902x->mutex);
>  }
>  
> -static void sii902x_bridge_enable(struct drm_bridge *bridge)
> +static void sii902x_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_bridge_state)
>  {
>  	struct sii902x *sii902x = bridge_to_sii902x(bridge);
>  
> @@ -520,8 +522,8 @@ sii902x_bridge_mode_valid(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.attach = sii902x_bridge_attach,
>  	.mode_set = sii902x_bridge_mode_set,
> -	.disable = sii902x_bridge_disable,
> -	.enable = sii902x_bridge_enable,
> +	.atomic_disable = sii902x_bridge_atomic_disable,
> +	.atomic_enable = sii902x_bridge_atomic_enable,
>  	.detect = sii902x_bridge_detect,
>  	.edid_read = sii902x_bridge_edid_read,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

-- 
Regards
Aradhya
