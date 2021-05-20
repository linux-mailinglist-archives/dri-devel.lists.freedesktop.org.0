Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057938B777
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1A86E431;
	Thu, 20 May 2021 19:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5CF6E431;
 Thu, 20 May 2021 19:24:05 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso15904225ote.1; 
 Thu, 20 May 2021 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uDEsiQtbchmRIITN3UCJ9tWbvJK1S8JafoWC9Tf39fo=;
 b=cT527s+sufXiRjfevP2Z86/uo3kcGD/J3zfs21rZAvE9FxI/yXy4JxlWbMvo3xV8nw
 31J9i5dKdSOAY8W5i7n7sVEz/f45QGFodvdQ2PgvkF1O64CrRQ3LuSf7N8zMu4nU5bmd
 dPksVTTUuwMI9AaXqhPaWyFaaf/U5KkmA2c/sKtwJB3uQDoYEKf39Oq4ks//qmm7Bg3M
 mzcyotkXXBQBsJDlz72MxszK2dLyM+zdIfVTREUOyfRIEoYKUV991fUHX6XB2gD8qVpp
 s3EIUQpeY3jMSwMKdj5lwwbAgFDIq3vwDq8hYHKLM14ibVCSYstqzQKIFjZYvWLxL0Qk
 Wi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uDEsiQtbchmRIITN3UCJ9tWbvJK1S8JafoWC9Tf39fo=;
 b=GSd8yWJShOJ0PIdsqN2lQWZWj2tCI5y9Tx3avb4RG7Qd6WzJeOMeLtgB2mF5JkLM/N
 ZY07BYQCsmqyQu1kc5h/uzLWJXPWuxTduqVK1qkv4zU9bHW/56su4EzTZy+0IEfvmbZc
 KmPKZxL1/zy9tCWHDfGnefMgli59tXSwCIvjJeAjbXl8r92K9uQl+4Ts30lLNG7RuRVR
 ObUW+7hkwum2U648lmUMoxtoXNX1BVADyBqrEwTIEp8V9nKaPQnaE2ASBPOcos5h7ZVA
 8d4Q7leb6yctsb4vPVHAjhsgZoYR9wyZzTY/lCaUCfwOAttYbSV+qwODPUT7MisoSeHg
 V2sQ==
X-Gm-Message-State: AOAM530fitopju49gOQOacZ3UpNobBtwmjxzP0bNa/soMBxuDbxKZHsO
 QDkhAv49YBvBO1nI2J2Soo8MFbrskZNU5yrlDgs=
X-Google-Smtp-Source: ABdhPJyzye1K6JHvOg90QPOZBsYe6gdLyPfrjFwT1au75ov5XHlqzFhSAKtHadiPVsL4JEI9JtvR32tUOIE95DLglKc=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5126794oti.23.1621538645387; 
 Thu, 20 May 2021 12:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-34-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-34-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:23:54 -0400
Message-ID: <CADnq5_N-V0uGfGtwTQGhQrT+ex7jG0t3ipu4+EBxzAEq6m_Jug@mail.gmail.com>
Subject: Re: [PATCH 33/38] drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:563: warning: expecting prototype=
 for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_0_ctx_switch_e=
nable() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_0.c
> index 75d7310f84392..2a2b9d50afb70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -571,7 +571,7 @@ static void sdma_v5_0_rlc_stop(struct amdgpu_device *=
adev)
>  }
>
>  /**
> - * sdma_v_0_ctx_switch_enable - stop the async dma engines context switc=
h
> + * sdma_v5_0_ctx_switch_enable - stop the async dma engines context swit=
ch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> --
> 2.31.1
>
