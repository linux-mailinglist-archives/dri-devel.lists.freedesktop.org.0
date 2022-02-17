Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12F4BA3E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65910EBB2;
	Thu, 17 Feb 2022 15:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EC510EBB2;
 Thu, 17 Feb 2022 15:00:10 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so3867632otf.1; 
 Thu, 17 Feb 2022 07:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM/QHOlU7DbqQK20LVBAm7uDj3BO+aqAJQxNjTOzdUg=;
 b=mnfgNDsECj10rcf5nLEGVYy/UUhxlCCcb1i2XqBTYEzNhFRsqRLXQrYbBVQnRl2XMZ
 arVLMKPkcKHjYa61q0J6DSVRXpVpBUQIOVCrWcZte/jo1nm3j2H06xjgfeBogzrD471N
 37F1DOtvmoKsLkK8jCg8LkvCrKX/sYRka+xnsnLXmE4EPu+KOj+DwxFh68WcemvCqwoq
 eeI7ICVHBeJr3Ot8VD6WtaFpZOynmU+fn9bR/g8RVuTwMP+Xr13So6u2TNSO4edm59fH
 7LdePAFxgi6G/KWUaiTX+yiUR4YUn6Q4NotjQU/NyWtgbtl0Snbr3w3PWagsEx7d3jcn
 6aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM/QHOlU7DbqQK20LVBAm7uDj3BO+aqAJQxNjTOzdUg=;
 b=vH4GalDBZjh18sn0L/baYVtTqVUOKHbfSv5GKdekOJFdkL4CZxUV8qP7OW644RqT8r
 pj87CjE/5K4gy4Bipc6QRwLbxEfq8GSDF5OtkKHFGE/XV7Scl2mZedeyBRvgNrKzIx3G
 kr5EFIkSHd4c+Ywmcd390dNLewhzN7DM78yh29vMOGpBivrz4RI79pBfhkR2pREg6tva
 yyf5avydeLcLLwfcoXkFM4kQOE2MVtFK7so+byRzHKe7oYQT3ngy0+Gh16EZ9Yw7h1cp
 PLlegOWVoWyzIytX7I94XeuAaqopIFb7nsD2u5wx8zTF8rXQ8WI9T6ZgHFAsACCToByZ
 wDQQ==
X-Gm-Message-State: AOAM531W69uCrAI2BNjzjM6PdcJtgxnnqQ2Hw3orJj3REQgRDI26Rw90
 1YrzyxNkMZHaZELOQE0mZI/Q3pdFkkzWO8m2B/Q=
X-Google-Smtp-Source: ABdhPJzyVJSfewKaWQhXyIXRiR0WdhbEoJAx4xw/ifHIEgMLYDsF4EPHdVHyvAmc8FrzZz7oR1+3b25snbXLc+Y7tXI=
X-Received: by 2002:a05:6830:54a:b0:5ac:f770:5ac5 with SMTP id
 l10-20020a056830054a00b005acf7705ac5mr986729otb.200.1645110007476; Thu, 17
 Feb 2022 07:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20220216114013.15192-1-yuehaibing@huawei.com>
In-Reply-To: <20220216114013.15192-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 09:59:56 -0500
Message-ID: <CADnq5_MDSU2U9bSfXm4U0c5EJeb=fygC6UtAx40jqV6kpFLJRg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: Remove unused function
 get_umc_v6_7_channel_index()
To: YueHaibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Feb 16, 2022 at 6:58 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> This is unused after commit 37ff945f804c ("drm/amdgpu: fix convert bad page retiremt")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/umc_v6_7.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
> index f5a1ba7db75a..00f87e3c6b0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
> +++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
> @@ -50,13 +50,6 @@ static inline uint32_t get_umc_v6_7_reg_offset(struct amdgpu_device *adev,
>         return adev->umc.channel_offs * ch_inst + UMC_V6_7_INST_DIST * umc_inst;
>  }
>
> -static inline uint32_t get_umc_v6_7_channel_index(struct amdgpu_device *adev,
> -                                             uint32_t umc_inst,
> -                                             uint32_t ch_inst)
> -{
> -       return adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_inst_num + ch_inst];
> -}
> -
>  static void umc_v6_7_ecc_info_query_correctable_error_count(struct amdgpu_device *adev,
>                                                    uint32_t umc_inst, uint32_t ch_inst,
>                                                    unsigned long *error_count)
> --
> 2.17.1
>
