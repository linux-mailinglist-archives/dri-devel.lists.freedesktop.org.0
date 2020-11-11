Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FC92AEFD7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 12:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C48B89F5F;
	Wed, 11 Nov 2020 11:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6EE89F5F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 11:43:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBgw7n016142;
 Wed, 11 Nov 2020 05:42:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605094978;
 bh=fPWc/9NdzALBNzSWvHq+igX2F6gyMRMnGPNLVW8LQWg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=kI1Dwr1PNn+hIUno9Ub7ugCyA6/5Jx+0GZh6qDIyXQCu+e9M4hDDUd0JJKuCk5ytL
 f7h7zlsgeE4v4o9kTxzF1xJGmHHlMPEOuhXOQDFRGFZ/97ncKs4RHmxk7EQB+z4EHY
 BNhaXun+LK2biEY+cNr0nRJkIesbOF2yNl0RODoo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABBgwGN001914
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 05:42:58 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 05:42:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 05:42:57 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABBgtHR103667;
 Wed, 11 Nov 2020 05:42:56 -0600
Subject: Re: [PATCH v2 3/6] drm/bridge: mhdp8546: Add minimal format
 negotiation
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-4-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <bd70afff-be5c-38ae-26d4-201c6448808a@ti.com>
Date: Wed, 11 Nov 2020 13:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109170601.21557-4-nikhil.nd@ti.com>
Content-Language: en-US
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 19:05, Nikhil Devshatwar wrote:
> With new connector model, mhdp bridge will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support minimal format negotiations hooks in the drm_bridge_funcs.
> Complete format negotiation can be added based on EDID data.
> This patch adds the minimal required support to avoid failure
> after moving to new connector model.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..2cd809eed827 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2078,6 +2078,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
>  	return &cdns_mhdp_state->base;
>  }
>  
> +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      u32 output_fmt,
> +				      unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> +
> +	*num_input_fmts = 0;
> +
> +	if (output_fmt != MEDIA_BUS_FMT_FIXED)
> +		return NULL;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = default_bus_format;
> +	return input_fmts;
> +}
> +
>  static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state,
> @@ -2142,6 +2166,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.atomic_duplicate_state = cdns_mhdp_bridge_atomic_duplicate_state,
>  	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
>  	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
> +	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
>  	.detect = cdns_mhdp_bridge_detect,
>  	.get_edid = cdns_mhdp_bridge_get_edid,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
