Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C172B6E0305
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 02:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B71610E9DB;
	Thu, 13 Apr 2023 00:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B33610E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 00:07:09 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a23so17424144lfk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681344427; x=1683936427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tOd7NOVIuKpcZyAlsPaoi5g+ynF8wF/mSBwzKeYJ5ps=;
 b=bbMFCdCC5Q+woKKSC+rAMZnhE26CHyAna2FNuf/0daVeomHgUZMCcTz71jrF5gkUOE
 VFSenACxQ9VBgf3V6mhncJfx26wo0J+QCQeKlH1a4bcU/yxK8wcD1dC868C62AQoSwin
 V1gJVj9GbVitZPMXvs0GP5y+4Jb+fIUVcTl45+nPD/6bkMBaAmU17Ubyk/5YL2gjRI4U
 PtkSkD4bqJwRyNeuRCGTlyGIUGy5BosKdfxc7MnczI8Xr+47myEmy17/Eebk126Mjhna
 h1i72YSoOkzH1Un473uRlcsvGm5yDYkMpibyrWkAUZvymQGpNbdsMmEb2v8C0GNmyM2d
 mV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681344427; x=1683936427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tOd7NOVIuKpcZyAlsPaoi5g+ynF8wF/mSBwzKeYJ5ps=;
 b=lr3GrRhtzDzWu+q443R065gZlXIJiT0qs3wmzmVvagU0QRqjdJmC1C+nx/3y0TsQa/
 LjETziX2c4wHjC3gKQMd5zQ4yTjvEP3rzDhZL/Y6AMqQNixZ28U/U/tBHJff6bwfuwUV
 NWwEaSJyfQLIn9wuVO50awgj3yyH27M8jngmyrwxpW6hSEn4HuVCjPcemRQwtnMApUxT
 CKUpFIeSYbegrlw6tLKT9YzL07x0DzEK1nkTaDkVoCH6dcJD5rc+p6vivjOMbzA+NbYw
 m5g2WA7QiU37+LSC/yCpT/rzVbZvMyykpeUmR2i0NfeL1YxOYeE3wj6CimX5p4oy6LAN
 Aapg==
X-Gm-Message-State: AAQBX9f2blbbLtcEhSz9YkfxyMy+QtsHEvn1CX23tTYGeFXfLwUTWTBO
 BtPvInojXFFn6BYFBYRrOcL95Ro1jNscsaeA4ss=
X-Google-Smtp-Source: AKy350ah9N6A7Y0npbYfR/g5D1BHtXhgKT5/gJslSWdjBm4pzyLOimPO2wm46OYGYljhsX5WI8fW4Q==
X-Received: by 2002:a05:6512:971:b0:4d7:44c9:9f4c with SMTP id
 v17-20020a056512097100b004d744c99f4cmr199797lft.4.1681344427048; 
 Wed, 12 Apr 2023 17:07:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac25f10000000b004db2ca9dd33sm35088lfq.275.2023.04.12.17.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 17:07:06 -0700 (PDT)
Message-ID: <be810874-0648-d57b-de7b-54ff7ec4576b@linaro.org>
Date: Thu, 13 Apr 2023 03:07:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 2/7] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com>
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

On 13/04/2023 02:25, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Changes in v2:
> - Moved files up to msm/ directory
> - Dropped get_comp_ratio() helper
> - Used drm_int2fixp() to convert to integers to fp
> - Style changes to improve readability
> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
> - Changed msm_dsc_get_slice_per_intf() to a static inline method
> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>    method name accordingly
> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
> - Fixed some math issues caused by passing in incorrect types to
>    drm_fixed methods in get_bytes_per_soft_slice()
> 
> Changes in v3:
> - Dropped src_bpp parameter from all methods -- src_bpp can be
>    calculated as dsc->bits_per_component * 3
> - Dropped intf_width parameter from get_bytes_per_soft_slice()
> - Moved dsc->bits_per_component to numerator calculation in
>    get_bytes_per_soft_slice()
> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>    *_get_uncompressed_pclk_per_intf()
> - Removed dsc->slice_width check from
>    msm_dsc_get_uncompressed_pclk_per_intf()
> - Made get_bytes_per_soft_slice() a public method (this will be called
>    later to help calculate DP pclk params)
> - Added documentation in comments
> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
>    renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
> 
> Changes in v4:
> - Changed msm_dsc_get_uncompressed_pclk_per_intf to
>    msm_dsc_get_pclk_per_intf
> 
> Changes in v5:
> - Added extra line at end of msm_dsc_helper.h
> - Simplified msm_dsc_get_bytes_per_soft_slice() math
> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
> - Removed unused headers
> 
> Changes in v6:
> - Documented return value for all helper functions
> - Fixed dependency issue caused by drm_fixed.h being included before
>    linux/kernel.h
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile         |  1 +
>   drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++
>   drivers/gpu/drm/msm/msm_dsc_helper.h | 81 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 108 insertions(+)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

