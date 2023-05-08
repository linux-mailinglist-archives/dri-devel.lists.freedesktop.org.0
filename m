Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5046FB33B
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 16:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE23E10E2C2;
	Mon,  8 May 2023 14:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8010E147;
 Mon,  8 May 2023 14:48:56 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so31826533fac.1; 
 Mon, 08 May 2023 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683557335; x=1686149335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04DgYL9ZmEKaOVbUM4T7mAu34s7OhOg8hMlDmx91xxc=;
 b=kYnsHzNbR1qG49sGNL1PXh2+Zlj+RgCIFyEXKDff56OhszMSee14AKlklmCWAScd9Q
 zDRxPh0O5sQhykgRgzyBKJ/34sn8gDAAZnsYK+/6q1mn4TY8bMcQlg/Lvm8LZLy3+R7r
 sMYljHaVKy3B39wEtUVFYdhIhKfhvOKXG1KpE3xqE5BN38AFGodiMZ3o74hkkv448irY
 piLnoEnf6l/zg/uEYgnZfp6bC+fF8yLbFMOBpFBzecculsyj2gEMsRanL04l/ySbLldj
 7i7atqVlypl5Pqo2sKoptt8NoeRwWUzpXdubYghD+cAWPvVeJAXrOnQ2qiIogfn8wsww
 0pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683557335; x=1686149335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04DgYL9ZmEKaOVbUM4T7mAu34s7OhOg8hMlDmx91xxc=;
 b=H+HDOv6Uv05IQB2R5AoSCWygygkQQlcBAHNxTwH/2r9X1/sOD43+fiIv5Now6m0o9W
 WYGnR995COYQzpidNSjnl1tJdpHGgrfmlkADVwB3lAnwaGaazROr3Dxnexy2gGtQWlO0
 zs1JwkjPnRmJb4pOqx9GcAy+q/FbRcGyCk58odqq0wGgEZGLLjo6U8jEUaqsIZmjd/IL
 xlk39X2MyWV1YYwnQCXpZg83zKLJNPzN4tUSiLzwLWbP03o9ejfn1+EDfBDyJgiWW4qB
 BxFc0SfuzbBlAENh+U+sC/STVB+KsoxFU5lTF2y0r9df6fJF5pAYorb1twEyAjVJON7D
 V0iA==
X-Gm-Message-State: AC+VfDxcNVEWNgGjw2EUaJ685+ac5Pp95B7+JUw/5mzXjB57+bD0NVH/
 7ekUXcd23Qx4x5POGA5QENDBG5vdenm2nPdJ5vU=
X-Google-Smtp-Source: ACHHUZ5uFtaaZR1vMZ02+lkLzojO4L4M4UVAAAwwix4mKnkizhVuz2ka1KhN5RWUbkjK0YLdJfR0IvFX1S/fG8H60ys=
X-Received: by 2002:aca:df03:0:b0:38c:2c79:37e with SMTP id
 w3-20020acadf03000000b0038c2c79037emr7844626oig.20.1683557335416; Mon, 08 May
 2023 07:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230506081043.73456-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230506081043.73456-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 May 2023 10:48:43 -0400
Message-ID: <CADnq5_PCdwi_d_gPjH0uBngHanzzC1nk8vfTRMO=ZrP6dSVY2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove the unused variable
 golden_settings_gc_9_4_3
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sat, May 6, 2023 at 4:11=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Variable golden_settings_gc_9_4_3 is not effectively used, so delete it.
>
> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: =E2=80=98golden_s=
ettings_gc_9_4_3=E2=80=99 defined but not used.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4877
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_3.c
> index 312491455382..74be46d382f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -45,10 +45,6 @@ MODULE_FIRMWARE("amdgpu/gc_9_4_3_rlc.bin");
>  #define GFX9_MEC_HPD_SIZE 4096
>  #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L
>
> -static const struct soc15_reg_golden golden_settings_gc_9_4_3[] =3D {
> -
> -};
> -
>  static void gfx_v9_4_3_set_ring_funcs(struct amdgpu_device *adev);
>  static void gfx_v9_4_3_set_irq_funcs(struct amdgpu_device *adev);
>  static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev);
> --
> 2.20.1.7.g153144c
>
