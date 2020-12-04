Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B82CF5E5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 21:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034116EC6F;
	Fri,  4 Dec 2020 20:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE16EB7F;
 Fri,  4 Dec 2020 20:56:25 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x16so7689141oic.3;
 Fri, 04 Dec 2020 12:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oCRFwoQksFKYxL9oDoarBzLvwPjlXv3hZNckKayt7VE=;
 b=qtVhX699Z+sdbwQ0ORNcWDXHwHjkZyYC8BLl8PrsqffUGnX1Nflju5sQJ9vxci2hTA
 pNcPyzTncdV4ImSnFytm/qrKywE5ktZDoohXPdzQdTeAqgPRAU1WwMrvvATQO00FLhnQ
 ptLQcrME+z99/L4GzViD6O1B/mcnIBZQrr4jJgtErgbr/gSWh+N76dM+5eZp9P5wOx7i
 0JWz09RtGf3eWmo5MMtrrjFZMUGB+4QmOVxfIV5BCbiPsvUaWULkjXEFOBcGL9FRZk4t
 h2A5oz2Rt6X42vobKLOOuvZKsbrMZ1lPzlSpdNPN3mDpsk/CiiiB8WFsiFU9161Y66XS
 qTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oCRFwoQksFKYxL9oDoarBzLvwPjlXv3hZNckKayt7VE=;
 b=CruPLkWaczZFJ0G+PjPadfPW44+eJKvLXoYpUOdTWjDg9Ld6H50DnhYDsV/3BVSXO+
 vgdH8sT2734rjuSeneh/m/uUUUjgoeQhCPb67OeugdCwf6lgCxsPm1rnxHULwsXs66ZP
 sP5nCf93LVa76UEUG6Ix0wWfY+dg/pQBWlBQXciMrNSANkjI+m/Ki8TwXCfNE4ma5YRe
 z0/rF1pfdVTjhJt0BgBuZCLnUM7uEUC6jdsJn2lyP6QKUFs1JvOCa2a66r38jpv1FEPP
 vSYK16ls9Luot/uaAdPHoNu5Cr0ScYzkc/UxNXeEgU4L9Ew8HdQYqKa0B4AwbI8UKmtT
 xPNg==
X-Gm-Message-State: AOAM5306Bg/gQU/oKtjZ/mnsAbwM4x6jSR3pcDZReGV1AnU9cHB9v7Gn
 jX21cVAuO2MYnRsYzupxIfsd+gWvZlTOTsOL6eJ+bWQ8
X-Google-Smtp-Source: ABdhPJyXohy3tSCW8i4Y64blynsYCsiiFXP/mTHQmJppzn38tpXoDpmHXnpmSlNLMQD2uV987pardlFK657tYR2yRWM=
X-Received: by 2002:a54:4608:: with SMTP id p8mr4365387oip.5.1607115384748;
 Fri, 04 Dec 2020 12:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20201204165128.3747878-1-arnd@kernel.org>
In-Reply-To: <20201204165128.3747878-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Dec 2020 15:56:13 -0500
Message-ID: <CADnq5_NBqx5U+JAxSAaUD6qwCmZsnCzGk1mF9=rkPRPm0Ug0yw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fw_attestation: fix unused function warning
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 4, 2020 at 11:51 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Without debugfs, the compiler notices one function that is not used at
> all:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c:123:12: error: unused function 'amdgpu_is_fw_attestation_supported' [-Werror,-Wunused-function]
>
> In fact the static const amdgpu_fw_attestation_debugfs_ops structure is
> also unused here, but that warning is currently disabled.
>
> Removing the #ifdef check does the right thing and leads to all of this
> code to be dropped without warning.
>
> Fixes: 19ae333001b3 ("drm/amdgpu: added support for psp fw attestation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
> index e47bca1c7635..7c6e02e35573 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c
> @@ -130,7 +130,6 @@ static int amdgpu_is_fw_attestation_supported(struct amdgpu_device *adev)
>
>  void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
>  {
> -#if defined(CONFIG_DEBUG_FS)
>         if (!amdgpu_is_fw_attestation_supported(adev))
>                 return;
>
> @@ -139,5 +138,4 @@ void amdgpu_fw_attestation_debugfs_init(struct amdgpu_device *adev)
>                             adev_to_drm(adev)->primary->debugfs_root,
>                             adev,
>                             &amdgpu_fw_attestation_debugfs_ops);
> -#endif
>  }
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
