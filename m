Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB25A6DE5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 21:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD3A10E078;
	Tue, 30 Aug 2022 19:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926210E069;
 Tue, 30 Aug 2022 19:56:17 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11f34610d4aso8548626fac.9; 
 Tue, 30 Aug 2022 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lBTUT+GVdBiQUCihY+/A5rUw5kNVJzfY/JeA/pnXpEs=;
 b=DgaiEVgslI7e0eGNfIOS5Vp94gC4G2BU9LxhMOe3TchCkRG9cnOj/FnEXjayigu4DL
 ZdJT3HDemNCb6dFTR+Uz6SDQKuyibPwDoc2ASmRiEIHgYZ/t1BO+gcFIgzpofiPzdUxp
 24XMiwCeGU4GTiAbSQSjQegzHgkTPhU6Fb9GmYrR8/Fsc6rLlh9B/Z/XoGAbJIbtBSAE
 TyV3oDVj/nlrUGPA8NnKCmErrGWQ5+11J016FaTWPPPkxHmNnv5mIb+K1DvflSgH3Txc
 d/ev4tICWkHSxrtFUIyNgioJWSzu32zFuDZBtdPrXaKL/5yq5eBlAPC6fg1lLCYt+jV8
 pvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lBTUT+GVdBiQUCihY+/A5rUw5kNVJzfY/JeA/pnXpEs=;
 b=TndoOgdx8BqUR+3IySCVNqxIelxXszCFzbKTzF39dEvhE6lPrGMzbmJP41kNoVXwjq
 ZhB/QLf9yFIpppH3qTfot/rFmQD340jtkS62H5bSahx64UwNX5NT2x4BQy/zTVMBVOr4
 bVzZC/tD2IvudhE9iHa9ar/EL7m/YDm+ovUUVnSUnp9NvvSuTHfUfgb6OO16iizDIjbm
 DTyG8FygJwhaZzgkQ3cL1EFetvvI5DwEgZT0Do8r/S/FfkwWfe/YYNjotgaKC3TBX8QJ
 HC73RZhOP6bWXpym/QH43EewE8dVfjurzcLgi5TTOEsaRM+5cToW7RycGLUtHG9qyi/r
 rcYw==
X-Gm-Message-State: ACgBeo1PNlEpkecOsLv+gwYJRFV9gC+4kvqTElSa4sV0czp0U8IycaGX
 Y48rTfDcMExL8VJ9VvLwZKnDJlUYvpBxImB2n5I=
X-Google-Smtp-Source: AA6agR641haMjojLY/HZV4ZaOM/8iZ69AXdkLv8EK6YA7hL7dCZBvYc4kpbe7afMxtyK/FXR/v6fZTgZQKPGSv0CkCk=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr10666398oib.46.1661889376533; Tue, 30
 Aug 2022 12:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220830083243.276646-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220830083243.276646-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Aug 2022 15:56:05 -0400
Message-ID: <CADnq5_OhFNSLus1-=NxgePEvJhUu3pxgtwZZA6LOvO9QngCCvg@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: Remove the unneeded result
 variable 'r'
To: cgel.zte@gmail.com
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
Cc: Jack.Xiao@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 tao.zhou1@amd.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 rajib.mahapatra@amd.com, YiPeng.Chai@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Aug 30, 2022 at 4:32 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value sdma_v4_0_start() directly instead of storing it in
> another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 65181efba50e..0cf9d3b486b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2002,7 +2002,6 @@ static int sdma_v4_0_sw_fini(void *handle)
>
>  static int sdma_v4_0_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
>         if (adev->flags & AMD_IS_APU)
> @@ -2011,9 +2010,7 @@ static int sdma_v4_0_hw_init(void *handle)
>         if (!amdgpu_sriov_vf(adev))
>                 sdma_v4_0_init_golden_registers(adev);
>
> -       r = sdma_v4_0_start(adev);
> -
> -       return r;
> +       return sdma_v4_0_start(adev);
>  }
>
>  static int sdma_v4_0_hw_fini(void *handle)
> --
> 2.25.1
