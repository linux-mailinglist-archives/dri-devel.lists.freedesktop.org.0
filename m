Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40143704615
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012DE10E2F8;
	Tue, 16 May 2023 07:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F45610E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:16:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso62216905e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221371; x=1686813371;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oiBlv5aXhyE1YrAkeylL1umyw4Re1O8pIBJgTabc1FQ=;
 b=RbJEbnh1z/xaER3RNUgf5EOZSOC80EEKBoUosRbeqy1rFudkKmVyHLaAVDOa2P6d5y
 ZqJGkrbz2RiezmpZ/BwBMtj3wNNKYReGLRfghwy+QDxWtOE89Tz2oFFEixsgt44LhGEi
 pyEPMh8brRRXj0yC2KDo1Rf9EpBUb7D8CHOxPY1lxlCSCaNfOlrPJVv6ijXvfGWJyyW5
 hbf+2U9/XPVPZ+k/074/0ZmE2x6BgTPwxbU/+4jLpatsvlclPa1dQkYM3kGghrz4MCg2
 j+2rObxkblkWZq72m9uOJ1BGeTjXKk7Dbzh9a4H8umoQGcETd/fqfneuyhg0v/6MARm0
 c6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221371; x=1686813371;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oiBlv5aXhyE1YrAkeylL1umyw4Re1O8pIBJgTabc1FQ=;
 b=k9qBVVzyYyWETDW+Fi8nTWV0ajEUS42sX/By3J1H6D9ZggGNuGFzqzaGGsXd1Q9G7U
 6m6jKp06M8V2j8RTx2rYPgWMYGkucGH768An8FkIjuDuLtTPDACIZME0v/9noXRO5Juf
 gZloPmEY0zQ5iyEau5cwvVz8e9gIF9KtMH2cVNhqh1+VVm6NmPms/gVzLpvHtFUu8UDa
 Vjo9lmCKH332LgY0cB0gLdtV+yGxd5FPgL4of7RRnqSWCINPZC79GWE+fYkFvZZNr4Sd
 /divWJGMUV/jwmdOCTDv5s0jKhqIN+8ezerLFSEG4R/zLh+lWZNU+/cR+Xos+xKRbyLY
 p9oQ==
X-Gm-Message-State: AC+VfDyIJ24DfDhZuZTAGEHo/fhiqE4Pur4HI78Qub3/t44X4I06ebA+
 cje5at5xI8YRaouNeM6cIfl3Ag==
X-Google-Smtp-Source: ACHHUZ6AXpYudBAFRiEXH4ZUFOhCaeBWcGirPae8q4ocfNIe/vPMVrz3fxWrayC5kbNtb738ZEXg7w==
X-Received: by 2002:a05:600c:2101:b0:3f4:2174:b28f with SMTP id
 u1-20020a05600c210100b003f42174b28fmr21031622wml.2.1684221371369; 
 Tue, 16 May 2023 00:16:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056000118200b003079ed1f0a0sm1526408wrx.44.2023.05.16.00.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:16:10 -0700 (PDT)
Message-ID: <fa513824-17cb-cf88-fd9b-0fc4e14da03d@linaro.org>
Date: Tue, 16 May 2023 09:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 5/8] drm/bridge: sii902x: Support format negotiation
 hooks
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-6-a-bhatia1@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <20230509093036.3303-6-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 11:30, Aradhya Bhatia wrote:
> With new connector model, sii902x will not create the connector, when
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and SoC driver will rely on format
> negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Use helper functions for state management.
> 
> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
> the case with older model.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index ef66461e7f7c..662b6cb4aa62 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -473,6 +473,28 @@ static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
>   	return sii902x_get_edid(sii902x, connector);
>   }
>   
> +static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						     struct drm_bridge_state *bridge_state,
> +						     struct drm_crtc_state *crtc_state,
> +						     struct drm_connector_state *conn_state,
> +						     u32 output_fmt,
> +						     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = default_bus_format;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
>   static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>   	.attach = sii902x_bridge_attach,
>   	.mode_set = sii902x_bridge_mode_set,
> @@ -480,6 +502,10 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>   	.enable = sii902x_bridge_enable,
>   	.detect = sii902x_bridge_detect,
>   	.get_edid = sii902x_bridge_get_edid,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
>   };
>   
>   static int sii902x_mute(struct sii902x *sii902x, bool mute)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
