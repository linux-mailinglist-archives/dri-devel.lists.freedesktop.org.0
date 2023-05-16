Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45D6704642
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F9D10E303;
	Tue, 16 May 2023 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD9010E303
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:24:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so73571205e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221878; x=1686813878;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YDM/0KI2jSc6jBFtRefPfdCkyTGKEYZyqTibHMCF2h8=;
 b=vpwnD6FRg4uTYZCT1VlLgshN/K2Dc49iQQpokmPlFPbT/hBx47tfXOn8p4WTCc/xl/
 91VSV4Ojwo1xmBhpmNRJU+GNYiDXE77XEXVlQqJvGPYpZIwuG2iO7sT8gc/ss8UWeUDC
 bQ3y/x10oZUUhjvSOhLucr7ySSC0sk9svL9frBBBKf29V/vXi8Mmt1P3EJg1ekiayXL8
 8Ia9q57uMDvCyV4hPEkU8by9Szh2XCLlMCZB1S5yWKztmgth9ZRUvB+cX7/CskjtBF6o
 BrmHczDCMNIGwY6Op8mi5qjTshQnIPEg7amiI9RkHAPQXZEFmrhJXh4gPhPLRoZRlRmC
 kzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221878; x=1686813878;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YDM/0KI2jSc6jBFtRefPfdCkyTGKEYZyqTibHMCF2h8=;
 b=LRxXXxejysXyhFUE/tws1J5zUYmSsYNCg1Ib3fjfc+UoOMoe7T52JhdKj38j3+yscR
 kl/ln0vJw+8b9/RC0bwYaDnVIvA41COYo2NdJfWzTrIzVCzK8aOJHxbMCGw410c1nUws
 3qnnI0Iq3OH92uYK7FJb4JjfW75TAP58X0j/EgQOB/TqHgi2H1wrj09BzSzQV+SKrMf+
 SFbTSRwyZbMMhZubJilzgbCjV33nBsyjUKT0t71lzk+Ax/nNzb6m0Q1XQfN+yeQdXlXZ
 0FETjyhbKg7m+hRCCnwYjXEseJbeEXieP77axalhC9JYqajrE/wKj++KFqmwnQElrvQB
 NJSw==
X-Gm-Message-State: AC+VfDyfGmS3fgTNWXTNLvC+qekxR79KHbEEupEC1s17Pyl7pSn/CHSx
 CHZX7FdhBudcuSmJhO+ZVhFwqg==
X-Google-Smtp-Source: ACHHUZ7xKfBWlqvjEYdFHTXy8kWr2iVTvc08iUpbXDEGdfA5Xw63Pd8EewFYaYzjKJtIoY0IZhjy3Q==
X-Received: by 2002:a1c:ed01:0:b0:3f5:3de:19c0 with SMTP id
 l1-20020a1ced01000000b003f503de19c0mr5260088wmh.21.1684221878273; 
 Tue, 16 May 2023 00:24:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a5d4490000000b0030795b2be15sm1508866wrq.103.2023.05.16.00.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:24:37 -0700 (PDT)
Message-ID: <8a060ecc-4289-15b1-2f31-fe83af77b5ca@linaro.org>
Date: Tue, 16 May 2023 09:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 6/8] drm/bridge: sii902x: Set input_bus_flags in
 atomic_check
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
 <20230509093036.3303-7-a-bhatia1@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <20230509093036.3303-7-a-bhatia1@ti.com>
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
> input_bus_flags are specified in drm_bridge_timings (legacy) as well
> as drm_bridge_state->input_bus_cfg.flags
> 
> The flags from the timings will be deprecated. Bridges are supposed
> to validate and set the bridge state flags from atomic_check.
> 
> Implement atomic_check hook for the same.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 662b6cb4aa62..4d1f10532fa6 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -495,6 +495,20 @@ static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   	return input_fmts;
>   }
>   
> +static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	/*
> +	 * There might be flags negotiation supported in future but
> +	 * set the bus flags in atomic_check statically for now.
> +	 */
> +	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> +
> +	return 0;
> +}
> +
>   static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>   	.attach = sii902x_bridge_attach,
>   	.mode_set = sii902x_bridge_mode_set,
> @@ -506,6 +520,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
> +	.atomic_check = sii902x_bridge_atomic_check,
>   };
>   
>   static int sii902x_mute(struct sii902x *sii902x, bool mute)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
