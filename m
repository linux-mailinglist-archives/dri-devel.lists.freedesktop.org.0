Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D986BF269
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6410EF99;
	Fri, 17 Mar 2023 20:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2EC10EF6A;
 Fri, 17 Mar 2023 20:27:50 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id bj30so4693692oib.6;
 Fri, 17 Mar 2023 13:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ba1T52G1S948o7T3Sv1JQdxUM0FGCuF6VR8R5Mn80os=;
 b=e5hycfXZJoahdd+EK2xsTNQpEheR1OaVRQ2wD6fTlb/tYwRqaK5PjxVNd2daMEJkIO
 BoXetfGiJLB6y6/krTD6mAKCvtObcv7WfzAO2r5K9a6JMbXjD0sT/vIhM0Y7a++WzQMo
 93o0pzgjrW+ffCHTUUclRJNrW9dkwSfOYuDEzAhTTwREnGRMLKuizTANO/1k7CGf4WBm
 kMbD/KtlI9cj7a7TQeD9D9Bh5nz/X4sso6fprKCGWUMeQlG3YG3hP29q4vjl3pR90q/7
 9NM4S0cDnoJFrTmloDK6+hj7tDvQ/UC9LmKLZRmK1n8LLEMy+Sop3ue/W+7Tln+2u1JT
 TPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ba1T52G1S948o7T3Sv1JQdxUM0FGCuF6VR8R5Mn80os=;
 b=sXZ3tbCE4dWnQi7+Hl355RzyxECW68SoqiNmzKzOWGsH7bimVvjkUhLPx1y7qWUFNB
 KTJPmeXwHu7dP6i3Uw2p35LWOiGLyduQrBiMRULQj8Dzt+Nh4WW0U5sKFYST4eAncqVU
 Lu+jlhS/FFzFBalgQdOaRHP1KnCG+R+yR5pXKW2DsKFjVX/FnzF3PA4abw9WPxarCraY
 zKYeWGDEQ86ZFEpsKcezmI0QVaTBZQLa4InDxNBmwdSy1Xt5QMFidDJK8QKvULu+Hm0T
 PGAM9Qzs/jFI3XrPGmq6zdHSKaFeH7mERTS78EP+1u7e2T+mD1ucJfLmV7H5ILApTBjL
 EkeQ==
X-Gm-Message-State: AO0yUKWYjIpLjrU3rHyC1ffwxBgBR+4PKIzn7huVkbS7P0mDXUr1byMI
 wYG/oCFnRJtspvJxT7pXnLepP82woVLsLs3jX2E=
X-Google-Smtp-Source: AK7set8/mMOeRQfI0SzS7VmayrF+lkziaBf2mSmKHYCfX8qAH2GPW32TprON+LtUX5ehQJAw/2SL7eWbeq0Hx8m8+Z0=
X-Received: by 2002:a05:6808:9a7:b0:386:d34c:16fe with SMTP id
 e7-20020a05680809a700b00386d34c16femr969451oig.3.1679084869443; Fri, 17 Mar
 2023 13:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-19-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-19-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:27:36 -0400
Message-ID: <CADnq5_Piyr=XPu3OvPAE6YUhT1gcuUFJYkxgf=0YZbVr1fKDHA@mail.gmail.com>
Subject: Re: [PATCH 18/37] drm/amd/amdgpu/amdgpu_vce: Provide description for
 amdgpu_vce_validate_bo()'s 'p' param
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with minor modification.  Thanks!

Alex

On Fri, Mar 17, 2023 at 4:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:599: warning: Function parameter=
 or member 'p' not described in 'amdgpu_vce_validate_bo'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index 2fb61410b1c02..c4d65ade5c00a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -585,6 +585,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_r=
ing *ring, uint32_t handle,
>  /**
>   * amdgpu_vce_validate_bo - make sure not to cross 4GB boundary
>   *
> + * @p: parser context
>   * @ib: indirect buffer to use
>   * @lo: address of lower dword
>   * @hi: address of higher dword
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
