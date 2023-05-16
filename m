Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50017704645
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB6F10E302;
	Tue, 16 May 2023 07:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6C210E302
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:25:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so92665545e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221929; x=1686813929;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pnhqna47FEfmgaZcCMi7qszbbpjiASdlwelf324+/oM=;
 b=CGlyIw+aik9ZmayNRudjVITZUDS2G5AKQSVtYkNmMDET8BX1pwOnD4lX/NUfGfhEZc
 2TSdvz8IZ7y/SgLmMoi0c6i0LB7ZGQ9dHu6nG8KVlyoYAXsLx+JuJLPwOxAYcSel1S27
 MalVwszNUHTDScCNSkEuS6je3SfzpPvA1fCC2sG00+0cpOH9ggp88YHsaGI3RUXVQ7AA
 Tk6Wu8yjebU4D59Y8x2hP2NxIVY1KiQOSlyfpm6IEkxJIpbg8T1vHZbxrMN8jWparao9
 6Y+k7OXTu0iQu8TEmlKU1vfYPpbcbLmKQ2SStDYIPTpEnnCyrGopMI7kbdzFHOazxxNT
 F7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221929; x=1686813929;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pnhqna47FEfmgaZcCMi7qszbbpjiASdlwelf324+/oM=;
 b=LHAuvVYERNcUe9NemdfUuvXtiP5dWL/bLZSSY9Q483QCQzxOz+nmH5lIMpvyLej1Dt
 peeLZv0gZ3xS1f+Y4ubUQtAVXlncg8qPEcwFfXtY24f3ycG1xq3e02usCZmq5SBj5I91
 LIZD4ydzispT5J2l+CXxurzgD+m7K31zKp77TzYEk3XCX9pKzN8xiJmkAtYbUpzX/fJW
 pSOr/1jnbRXrcoPqiXccHWBdXYnxolFW1qHcgZ/WEb/xAFIDUy89yrIPPMjtcAEXHsBi
 wfRZIZrOt7Tfegndnu68vHWb7emtBfiIrHN3EHHeoHOdGP6dMiUQ2VRZsQd9VYx9sP3y
 MX3Q==
X-Gm-Message-State: AC+VfDxO6UTh98InkcERQRn02pycd6DMdj6gUu538BKdtuWZywQO/g52
 ZVjSVZAqHV33dGuE3RFErkvopA==
X-Google-Smtp-Source: ACHHUZ724hio13odoHFnB1sVgQLWEM/ZnD1YQ0srUJBr5yOd8SvHKrhe3YtBYfq3P+pnri6dYwvAfQ==
X-Received: by 2002:a05:600c:2056:b0:3f4:2bbf:40a with SMTP id
 p22-20020a05600c205600b003f42bbf040amr16533461wmg.37.1684221929643; 
 Tue, 16 May 2023 00:25:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6043000000b0030630de6fbdsm1569719wrt.13.2023.05.16.00.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:25:29 -0700 (PDT)
Message-ID: <3045292e-5801-74c5-5a6b-6e4c5802a035@linaro.org>
Date: Tue, 16 May 2023 09:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 2/8] drm/bridge: tfp410: Set input_bus_flags in
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
 <20230509093036.3303-3-a-bhatia1@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <20230509093036.3303-3-a-bhatia1@ti.com>
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
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> input_bus_flags are specified in drm_bridge_timings (legacy) as well
> as drm_bridge_state->input_bus_cfg.flags
> 
> The flags from the timings will be deprecated. Bridges are supposed
> to validate and set the bridge state flags from atomic_check.
> 
> Implement atomic_check hook for the same.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> 
> Notes:
>      changes from v4:
>      * fix a warning Reported-by: kernel test robot <lkp@intel.com>
> 
>      changes from v5:
>      * Moved the return statement here from patch 4 (where it was added
>        by mistake).
> 
>   drivers/gpu/drm/bridge/ti-tfp410.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 7dacc7e03eee..631ae8f11a77 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -228,6 +228,21 @@ static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
>   	return input_fmts;
>   }
>   
> +static int tfp410_atomic_check(struct drm_bridge *bridge,
> +			       struct drm_bridge_state *bridge_state,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_connector_state *conn_state)
> +{
> +	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
> +
> +	/*
> +	 * There might be flags negotiation supported in future.
> +	 * Set the bus flags in atomic_check statically for now.
> +	 */
> +	bridge_state->input_bus_cfg.flags = dvi->timings.input_bus_flags;

A newline here before return would look better

> +	return 0;
> +}
> +
>   static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>   	.attach		= tfp410_attach,
>   	.detach		= tfp410_detach,
> @@ -238,6 +253,7 @@ static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
> +	.atomic_check = tfp410_atomic_check,
>   };
>   
>   static const struct drm_bridge_timings tfp410_default_timings = {

With that fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
