Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5D1F7AD3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 17:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5C96E98C;
	Fri, 12 Jun 2020 15:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84D86E135;
 Fri, 12 Jun 2020 15:24:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e1so10161973wrt.5;
 Fri, 12 Jun 2020 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdrA1iXEBobTaCltTFCacW9YJrABdUKyjxuRObbJj7Q=;
 b=fopozOD8Q9Z316h4yVtPKbKc4/uZH8jo/Yv8Ed+vhZ2zQeOnNIBp9uuZ3U7aHsCENZ
 Hk/OB/Jw+k4+xKCd61Eybax+nVK94EPdXXonB+vQHqFF1Q4BOHDnZSUL1MdaBRxPxr+Y
 GqWlriaM/FTUdVrsgIZnkaCQhATCDCZ7RvqsmAxaz+uNfcewFS6su67gOj3XcHr6BDkl
 o5okfVLgoB+TN7NAdJwRNQsiE3XNI3NVs91y+Gb/BwjP2eUdYIP+qYTFmWWMmPosv5+A
 YHx94AkQtK5nH45f79IQw+yy+vjGFBKc8SeSQIkgx5MqP3dMhtbi98OFtObjwTQqTwwj
 4Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdrA1iXEBobTaCltTFCacW9YJrABdUKyjxuRObbJj7Q=;
 b=Y6fw6ssPCXE9yd1magZlwiBxsDfB6LwJ5rqR6cC7+SOVWrvx0+pecTMwRy4Agi3kFh
 uB4E6jbz8PZ7HBlQCbA6oQd+8qqTXxkkWs906O4YEItVtAb39AX0NPeovYuTei2GDv+W
 o1KQCpglvWEuArTGa7K3JAD+iADS740xi+A3adHr8i+mVvYqTZzwvl7jjVROmbgmF9q5
 r5eBoPmK2GeWoNqDgjD7teGsZ2ChPR5SnBjjByekjHsUcJRvlDqi7PySFzG7AOOLuepg
 SlDnpkzAWxeDigHPHawLRka9T++CGRumMzvRYO/FpXXmn7VEa9J0SJldbF/2/oIXY+YE
 pWKA==
X-Gm-Message-State: AOAM530HaIu0YUs1TpDFvrIyQN044Dyfr/qZThKDnicoi6gpTqUba7ej
 IOEuUvSidKumEwDtUgeIlOmpE7GJmAXRW8EUu48=
X-Google-Smtp-Source: ABdhPJw/HQbjV25QRzQyt5NHirKIUr0sdJ8NaQMgtbOdZDHffLIShgu8/5/AFDXmgcgg3APrFmdNsuef1af5bjqGHh8=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr16355895wrp.419.1591975493465; 
 Fri, 12 Jun 2020 08:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200612122825.10450-1-bernard@vivo.com>
In-Reply-To: <20200612122825.10450-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jun 2020 11:24:42 -0400
Message-ID: <CADnq5_M2V3g9AA2HpL_XEbRvLW=BWUbiE=RpZa2YKnTX24Zqkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: remove unnecessary conversion to bool
To: Bernard Zhao <bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 9:22 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> In function is_support_sw_smu, remove unnecessary conversion
> to bool return, this change is to make the code a bit readable.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Vega20 support was removed from this code path so the patch is no
longer relevant.

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index 8c684a6e0156..3e1cfb010378 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -568,7 +568,7 @@ int smu_update_table(struct smu_context *smu, enum smu_table_id table_index, int
>  bool is_support_sw_smu(struct amdgpu_device *adev)
>  {
>         if (adev->asic_type == CHIP_VEGA20)
> -               return (amdgpu_dpm == 2) ? true : false;
> +               return (amdgpu_dpm == 2);
>         else if (adev->asic_type >= CHIP_ARCTURUS) {
>               if (amdgpu_sriov_is_pp_one_vf(adev) || !amdgpu_sriov_vf(adev))
>                         return true;
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
