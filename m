Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF54F80C3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D86210E2D9;
	Thu,  7 Apr 2022 13:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C861010E2D9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:37:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bg10so10936485ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=91gMO47DfliTjZErBiHGK+I++hpQj/IZ3741SwnU9P8=;
 b=A2aE4chQYalRaxjQ0CVVQxgLAVDh0MUyG2in5jDmcORYk9caDmvNsw1q1/k1ktROsR
 BE54qjXgS9TZis/FKfvRjAX9rcyz9+K+6SR+uo51kKh705Lpb6yXmD+SDDsWPrXwlX2R
 +JyKe3+0SihrfbXutWZdcNynXskUJvGA7HQqr16Wras8qZmx66YBtbqLxentgOvZpscg
 m5orkzLA7LApXwTI1nr7hLMPoJ8wYimz7nxIjk+ALXY24tMMi1CXMmDeCOoMCI8UuVCv
 HJNRE0PV286NW+2kUvy5vbTJFjj9XsyVm4Ooq71+84hHI+gplY1o4sdtT9fNtOjWpeUq
 KK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=91gMO47DfliTjZErBiHGK+I++hpQj/IZ3741SwnU9P8=;
 b=4wyfLZkaABVZTG5pWsm+zWtN6VPcL0pTeW9EXubY+XqM2t7OIZhu2NOzfMjPCb9Hgq
 ddeH5bnM627LuqfOVbdh8n9AqyjC9WeAKblLkSCh3COYvFZSLfQ3LaIcH55HzIIQlZGo
 Bq6PgyY29CUAeB1y3BdHjWWVH6otFjJc5Xuxd8fz6svLGwrAADRRTrMyB5PeRqyUaWRM
 9xwfumhZa7f8icSJcc8hvic8Y+vcXzw4xkbLWfptxHCa+Xf7WltEbnJ/Bcop99vlLsB9
 MAhCYu1Xv2uSXJlMcZ4oc1UU/C6XG+BVVV4xZo55RoQ9TzSev0gwXs+stY3naBY/BXtj
 qubg==
X-Gm-Message-State: AOAM532YlkqUWpb/+DlXeblOpmmL6ODQcuo8dh7P09504hGAsUqhksb0
 F0eWViHNiQaroxDA/qSPOnWNbIXoaSv2VJha
X-Google-Smtp-Source: ABdhPJzkfACnX9dzj6ItR+oYpkhkEUakWUYMlVBjxoY+5xQkXguNanoXoqbipGhZkbAsP/7GTEpwBQ==
X-Received: by 2002:a17:906:3a55:b0:6ce:c2ee:3e10 with SMTP id
 a21-20020a1709063a5500b006cec2ee3e10mr12678084ejf.210.1649338641920; 
 Thu, 07 Apr 2022 06:37:21 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a50da04000000b0041ccfe9f0fdsm5887611edj.15.2022.04.07.06.37.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:37:21 -0700 (PDT)
Message-ID: <cac92bdf-d873-81e3-2dd0-de1bf20f381b@gmail.com>
Date: Thu, 7 Apr 2022 16:37:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] drm/fourcc: Introduce format modifiers for DG2 render
 and media compression
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20220404133846.131401-1-imre.deak@intel.com>
 <20220404133846.131401-2-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220404133846.131401-2-imre.deak@intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 4.4.2022 16.38, Imre Deak wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The render/media engines on DG2 unify render compression and media
> compression into a single format for the first time, using the Tile 4
> layout for main surfaces. The compression algorithm is different from
> any previous platform and the display engine must still be configured to
> decompress either a render or media compressed surface; as such, we
> need new RC and MC framebuffer modifiers to represent buffers in this
> format.
> 
> v2: Clarify modifier layout description.
> 
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Acked-by: Nanley Chery <nanley.g.chery@intel.com>
> ---
>   include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index b73fe6797fc37..4a5117715db3c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -583,6 +583,28 @@ extern "C" {
>    */
>   #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
>   
> +/*
> + * Intel color control surfaces (CCS) for DG2 render compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. The CCS data is stored
> + * outside of the GEM object in a reserved memory area dedicated for the
> + * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
> + * main surface pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
> +
> +/*
> + * Intel color control surfaces (CCS) for DG2 media compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
> + * GEM object in a reserved memory area dedicated for the storage of the
> + * CCS data for all RC/RC_CC/MC compressible GEM objects. The main surface
> + * pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
> +
>   /*
>    * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>    *

