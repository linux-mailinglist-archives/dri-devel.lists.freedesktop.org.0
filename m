Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD53377FF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 16:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDE26EE11;
	Thu, 11 Mar 2021 15:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556246EE11;
 Thu, 11 Mar 2021 15:39:10 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id r24so1824736otq.13;
 Thu, 11 Mar 2021 07:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8nU3otkqKDGoLnXZ+AyQvf2Qyce9hWCQRz5CGYNTV8=;
 b=YcOESLcl6A0DxELmb4Q3UlWuPIwjY/Gi64vBCZUBHVthOHA1c7hZbJ5ZyFx1ShfPX+
 UDBXkbf0bBJ69IdKKvHxGPdrz94adaGRFXEZvmClR/gYFpmJUxiTPatMLAMUwl0Kr2ew
 YImXGZF2QV8Kc0Sdr7//IBmcxMeUp74q1MOdPi4NRzbJnpMT9jd9k2yrBRmOk7Kj3rLI
 VGaEkR4caadslizFgAO2MX86IwC42yJjj6TD53EJBd1ndKHqxOsbQCJY0HagwDv6NK/V
 o29f/1sAPK23OLr1chPlFfl7NN6ki+6ZutXKq9c+JDqMqxex2FEAucpqibpFp1RX3FPO
 1S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8nU3otkqKDGoLnXZ+AyQvf2Qyce9hWCQRz5CGYNTV8=;
 b=ZWj5eCRtrHYcb4NTbknEuPLvVQeDP3DSYbdrKufzLTJUctx9nJUa6reEnqEyrKfxw6
 FRcf0kAJM0dYB5cOcPoQSLVIu7si9byJLKuJ2Z1ejNEe2nD6ZOhb6aEkHGxIQFSdqhlI
 lXRGpNu7wm0dB/7rd4oe4FlPAzRiKAIKHzbyM7KEG36xaiXWysyiTqJ5KH0nTfQsOl31
 WyhwaBWk7HgCBrICbWDAAAELoxfV++XTMOLyT3ekf4zl2N+UJYmqHa3Lw0D6j0S4dxpu
 w1Ncc0HC8HiFpjldqxBqJ1fvI2IAmZ22ET+63jAg1TxdsqFIAgv09eV1K5XCXnoLk6a4
 kkYw==
X-Gm-Message-State: AOAM532K1KjeSQUDo3JB/2Wi6oIDUAo7nyGbQEXXUwe9olgAtlGOCLe9
 L9Rz5LSC95JdXejfvWAMyPxbSBaE2MZ4Bqb4oeI=
X-Google-Smtp-Source: ABdhPJxOjP/JafiPMC5iAxWgHzxV7klk0G1enHWcpJxnjDmEpaJAZVjHHfOQIxpKPQnRhz+jSKit4DzGCNRjuClDMsk=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr7279798ota.311.1615477149643; 
 Thu, 11 Mar 2021 07:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20210311092830.5106-1-colin.king@canonical.com>
In-Reply-To: <20210311092830.5106-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Mar 2021 10:38:58 -0500
Message-ID: <CADnq5_PNgWJPjV-kny7pfRZZ7pS8FhpHxWYPBKbyGd7kVqW2Fg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix spelling mistake "disabed" ->
 "disabled"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Mar 11, 2021 at 4:28 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a drm debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 617e62e1eff9..dcbae9237cfa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3464,7 +3464,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>                                       adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
>                                       adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH ||
>                                       adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC)) {
> -                                       DRM_DEBUG("IP %s disabed for hw_init.\n",
> +                                       DRM_DEBUG("IP %s disabled for hw_init.\n",
>                                                 adev->ip_blocks[i].version->funcs->name);
>                                         adev->ip_blocks[i].status.hw = true;
>                                 }
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
