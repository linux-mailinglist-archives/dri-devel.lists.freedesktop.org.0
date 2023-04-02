Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CD6D37A9
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 13:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E80B10E309;
	Sun,  2 Apr 2023 11:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3101910E2DE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 11:29:53 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 20so27566535lju.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 04:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680434991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/7XRyXQPa6yJyvS+yphXWWm19Lwy7X/A87+nuru+y3s=;
 b=oXPfZE7gWUQRMpE5jum+EFIbk9u52LTzYJvPItpXIVh7kRCktCZNDgxmzdqVeV9LUt
 BBefoqysJwisJX0MM3WX7GStyzzTy5ddqT9owS6YBb+ToyhCo1mu2NjUvHUA5fDNnD4Y
 2ouYOxIdA6Xf0FIdYZMF6LkElD2R13TBQS/jqAULyeTzoSxpMrZciUb1OHzacscVrhdN
 zs2qZEbGUS217+jCAaag4uNJQmOSNVTg8lCyxbzt3iPAoGyAfHTg8Hbfw25XoKV40qw0
 iBNI/heTMIwS0fWHVzHSbO6ftiuR6TheMqCSXfSYEM7DISungvZh8hlFmpDwOUGej3+r
 b6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680434991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/7XRyXQPa6yJyvS+yphXWWm19Lwy7X/A87+nuru+y3s=;
 b=nWRb96OPMXcIABamlqdLtk0gOi9NoJA98/kljD6U7gFRUQmAWpcRINZkqPYvvZLpVv
 tVNBIIz+QY8YvFZQ8jos2wl755A92HVjU87utKG4qmLCMhO7aFkGSAvuUbb9QOFwokyI
 ihgq+uH0aAO37fVSRSzZQBuKNlNHqwrOA0kP4AgoinvPAimfYj+pTOE8PUl3EwIloCqx
 eFlz0zMwofVXn6tJvzQvAYViFWacQvsTyEKOaqaGn0hswTPhQeNPYkPuOOT+hopRR5dS
 ib8sN083J3YspWW/cpKZWOKNbGxjXc4TM8OygD97m5sgAQSyv/ai9gi79qmZP/dJTgCw
 8/vA==
X-Gm-Message-State: AAQBX9fVZTZY7wKtOCEb2jn5/tyD58D5a6yJlJwHeX7GyK1G5p8CXlBd
 Y9eGfPYrmHk6q3cw3PMB3UWBMQ==
X-Google-Smtp-Source: AKy350a0VoDXEKdqcTVxNEiqs0DG5SxPlfMG5Q4hcYHJYMsPntTRlJDbBZdLmRf3Covna3wi11fZvw==
X-Received: by 2002:a2e:2409:0:b0:299:dfa0:e027 with SMTP id
 k9-20020a2e2409000000b00299dfa0e027mr9281756ljk.33.1680434991181; 
 Sun, 02 Apr 2023 04:29:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a2e8ed2000000b002987088bda4sm1163762ljl.69.2023.04.02.04.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 04:29:50 -0700 (PDT)
Message-ID: <deb5c8d2-2766-82ec-e116-f353fcb331f3@linaro.org>
Date: Sun, 2 Apr 2023 14:29:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 5/6] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-5-3c13ced536b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-5-3c13ced536b2@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 21:49, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Changes in V2:
> - *_calculate_initial_scale_value --> *_set_initial_scale_value
> - Split pkt_per_line and eol_byte_num changes to a separate patch
> - Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
>    block of dsi_update_dsc_timing()
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..b7ab81737473 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -28,6 +28,7 @@
>   #include "dsi.xml.h"
>   #include "sfpb.xml.h"
>   #include "dsi_cfg.h"
> +#include "msm_dsc_helper.h"
>   #include "msm_kms.h"
>   #include "msm_gem.h"
>   #include "phy/dsi_phy.h"
> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
>   	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>   
>   	/*
>   	 * If slice_count is greater than slice_per_intf
> @@ -951,7 +952,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		 * pulse width same
>   		 */
>   		h_total -= hdisplay;
> -		hdisplay /= 3;
> +		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +			hdisplay = msm_dsc_get_uncompressed_pclk_per_line(dsc, hdisplay,
> +					dsi_get_bpp(msm_host->format)) / 3;
> +		else
> +			hdisplay /= 3;
>   		h_total += hdisplay;
>   		ha_end = ha_start + hdisplay;

This chunk changes the calculated value (two other are mere updates to 
use new functions). Please move it to a separate patch, add proper 
description/justification and possibly a Fixes tag, if the original code 
was incorrect.

>   	}
> @@ -1759,7 +1764,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>   		return ret;
>   	}
>   
> -	dsc->initial_scale_value = 32;
> +	drm_dsc_set_initial_scale_value(dsc);
>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>   
>   	return drm_dsc_compute_rc_parameters(dsc);
> 

-- 
With best wishes
Dmitry

