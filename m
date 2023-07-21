Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1DA75CCEA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0210E6B9;
	Fri, 21 Jul 2023 16:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D3F10E6CE;
 Fri, 21 Jul 2023 16:00:05 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1b055510c9dso1357762fac.0; 
 Fri, 21 Jul 2023 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689955204; x=1690560004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5EvHH1DtEeFzSe/qfbeuuYUsnqICJDx2+XgzP0/NPs=;
 b=QbJzX9iZpCz6sryu/XX2sbkAG/F7Ftohnc5pzMW3hZqdW/isAkFf/g5ilsNkyhXlwK
 +WTjE6agHX3wYY3e5enOfq4YSz5wQEY9CCv88zbPaeL6+JuxwgEiu0ZtFnEgQeqJUnIu
 ODmlcdotKUQIm0/qUVERDiShiOp0OvTCy/HGzLzaIJ8jutp/H4QdeJf5TDDc7fqxHJDy
 foCNPc/MhMneu26q6uT+VSwHlNiSEBKvn55xkqBisEMH+Dib+cHmo893h9LCsOqkGqFg
 jo27fk99aa99nEnU0o9KX9m2XvKYfZGQnxtZNmB6z5mXpSvkym3wJJjOq27hAfXgPyUb
 WGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689955204; x=1690560004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5EvHH1DtEeFzSe/qfbeuuYUsnqICJDx2+XgzP0/NPs=;
 b=EOyNbo6LcNrRCygK7EQj+4laATB6isv05ZzrNPEWbH23G9kyzPTizMvckOz+VWnMZN
 8Ycv23rNCw4P6ald/YMPbGxZ/0TBKvsMU71mHDtRLR6s9Twec9y2Wj3CRzlZ3dtxPyiz
 Kk4P9Kn+eWrz7+3b884yJJ4c5mWLYgeAkZyXSx7/85nFEXCh5+cX+ur6tCdEt6DfLPyC
 KkL7zI3zzReUnb4OXHlNSb9lrqLZd38FfPr7NshzqDVVxxR5DLCPZcGWlb+4mzKcB7uF
 8VGhHJGiXE04lj/dTS1EB0URHfhKF6HB0siIOlYX89m81aorfrK+J/VrLvGbXyqMj0MI
 sMuw==
X-Gm-Message-State: ABy/qLayCPD3vziKYp55UFlaLZf5oiBSizoBYlI4dlSrpk7hflvNzG7l
 vcuOlspFRJlN5Rb9wXIw5HFhfhfYwG4NEFfRqQs=
X-Google-Smtp-Source: APBJJlH9uiN6ru/ABZodG46E50A0fohiI1ZXIZvNZwBeCL8QDXjl+XGWVujd3gtuauMG1+1seuNo/guT77TUv3eGpmE=
X-Received: by 2002:a05:6870:46a2:b0:1ba:64a5:d2d1 with SMTP id
 a34-20020a05687046a200b001ba64a5d2d1mr2503528oap.20.1689955204629; Fri, 21
 Jul 2023 09:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230721035225.4986-1-xujianghui@cdjrlc.com>
 <f2e8d7241330934429e19a960a232f9c@208suo.com>
In-Reply-To: <f2e8d7241330934429e19a960a232f9c@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 11:59:53 -0400
Message-ID: <CADnq5_NKs6n1v+j6cTeo9OZ04yB12fHXD06XbzjWGzdBaE7RpQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: open brace '{' following struct go on the
 same line
To: sunran001@208suo.com
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 11:53=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: open brace '{' following struct go on the same line
>

The description doesn't match what the patch is doing.

Alex

> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index ddc488251313..0cf564ea1ed8 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -429,10 +429,10 @@ int amdgpu_pm_load_smu_firmware(struct
> amdgpu_device *adev, uint32_t *smu_versio
>   int amdgpu_dpm_handle_passthrough_sbr(struct amdgpu_device *adev, bool
> enable);
>   int amdgpu_dpm_send_hbm_bad_pages_num(struct amdgpu_device *adev,
> uint32_t size);
>   int amdgpu_dpm_send_hbm_bad_channel_flag(struct amdgpu_device *adev,
> uint32_t size);
> -int amdgpu_dpm_get_dpm_freq_range(struct amdgpu_device *adev,enum
> pp_clock_type type,
> -                                 uint32_t *min,uint32_t *max);
> -int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev,enum
> pp_clock_type type,
> -                                  uint32_t min,uint32_t max);
> +int amdgpu_dpm_get_dpm_freq_range(struct amdgpu_device *adev, enum
> pp_clock_type type,
> +                                 uint32_t *min, uint32_t *max);
> +int amdgpu_dpm_set_soft_freq_range(struct amdgpu_device *adev, enum
> pp_clock_type type,
> +                                  uint32_t min, uint32_t max);
>   int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev);
>   int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev, enum
> smu_event_type event,
>                               uint64_t event_arg);
