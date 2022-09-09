Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A615B4100
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF4510EE57;
	Fri,  9 Sep 2022 20:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC96D10EE58;
 Fri,  9 Sep 2022 20:47:09 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso1841987otv.1; 
 Fri, 09 Sep 2022 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ctBj19lXOSEAyh1C28UnDwMWPyBLl2d98Ybb5NQ3Hpo=;
 b=iuGPTsfMp1NLIEZHZAPWw5d6sEmLrxK3sDvVQ62rW3vFn4NnGwKgcKlPopYhtpt3Y0
 G1TFMRos64Y9tcPqSTvAlGxsKYDwHmFcVxSjSBwAKLZCtTPauF2HVlFfgrgOd0tWt6rx
 fPUNODtIJ8u8YEHzakdi/SLg2+8ZQTx8elW1Zfsu1A/MymzVJ7p1uBoA/pY7ogxMLrSD
 bCYYDaT54dWsdJN/sbb9ju6QKcrcyX+nsqKehiVwXET2RmvkD47yQsiR9V4ImTjmzdKP
 n8RHpNgZ/Pp622K6GtZHBrjY9xpGCB9HAiUgMnFa079xH50MI78jta+EGWh7+USy034Q
 adqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ctBj19lXOSEAyh1C28UnDwMWPyBLl2d98Ybb5NQ3Hpo=;
 b=h2GU7B5kMQVx5++mOZ4XI3TV8WylU430ZOy10EW+wLDGIsQeLoM3ex5BRk5elUTO01
 jUE0pMQmxXQukrzrudJ2rrrx5EVOJQiA3b+P13ISPRpjnHStPwxubtSHGTzpeA2EFDPy
 vK+JQ7hDvF4+UqevaZvvoscW9L+gVwhbjHaf+o4aN4QQzOW+7qnxYjqc1lWqGeNdGITC
 Z6Ps6pdGwwe7DIbWcP6bZlVG+t3gbdbazHtktwNJva5+QCPmGiVIuD/ZgokgjwQRxAgk
 gzrs57xYrDI+zxHLPY6g7QJFFcBXxO90gsNE/AhREl8Wec77/7G5IkKQjadH2DRhY5P/
 8ZgA==
X-Gm-Message-State: ACgBeo2HGmgoSLz5EQLyf3g+JTex/q7QVxWmpdvMhGY/aVMoNqt5Y310
 rX+SXeoNgdLJN37EmqfNBy3rgGLWMCpq/3UFd+eJfvh8
X-Google-Smtp-Source: AA6agR4RQJLT8qIZlpEO6stNFrHhIBxAwc918rt2nme3NTrorkRuJjc8eZFzhQc6GM8r3MWq7LGUkYYN7AoldJjmfpU=
X-Received: by 2002:a9d:376:0:b0:655:b4bc:fd6e with SMTP id
 109-20020a9d0376000000b00655b4bcfd6emr1332692otv.233.1662756428882; Fri, 09
 Sep 2022 13:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220902080401.320050-1-zhang.songyi@zte.com.cn>
In-Reply-To: <20220902080401.320050-1-zhang.songyi@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:46:57 -0400
Message-ID: <CADnq5_NQByVi1dnxzc4jdPX+sKtA6OtU9j-L9M+uGXqvrJP+kA@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: Remove the unneeded result variable
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
Cc: Jack.Xiao@amd.com, airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, ray.huang@amd.com, Stanley.Yang@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, Likun.Gao@amd.com,
 Hawking.Zhang@amd.com, christian.koenig@amd.com, zhang.songyi@zte.com.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Sep 2, 2022 at 4:04 AM <cgel.zte@gmail.com> wrote:
>
> From: zhang songyi <zhang.songyi@zte.com.cn>
>
> Return the sdma_v6_0_start() directly instead of storing it in another
> redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 2bc1407e885e..2cc2d851b4eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1373,12 +1373,9 @@ static int sdma_v6_0_sw_fini(void *handle)
>
>  static int sdma_v6_0_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = sdma_v6_0_start(adev);
> -
> -       return r;
> +       return sdma_v6_0_start(adev);
>  }
>
>  static int sdma_v6_0_hw_fini(void *handle)
> --
> 2.25.1
>
>
