Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8270390E48
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 04:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4606EB61;
	Wed, 26 May 2021 02:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CE56EB61;
 Wed, 26 May 2021 02:24:33 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so19431164otk.5; 
 Tue, 25 May 2021 19:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8/0UlIoa5BxVLTVf3fq7Bs3VS9aphKLm905opuNfYBg=;
 b=JeFb6Z+IEgbcvkYetzS4rF18s1kdEJhNaPsyXpKwCuJmX/sVsvAE42bLuxU6lPslKC
 kOvwWhHEcGBr0ql0pbQiL4jETjilgtEf6N3uk+z05suyEbmnaVBjgempZZbvBEjdJnP1
 a0bIHyqUH9AgZRskX3eUPgn0eozBbua3ONQasfXlGCKJxZRJE6fmNYZ6BeEcv7zaWM0b
 7eOSrJcOpc92LzuB3O7ED+7w0si9c7v3+OXzyDKqngYTZB0CV+sL+u5RvDIXo0o6UHCR
 X9e/QgzP3sVk59a5EbK2MW3loT34RFAP7P3yO+k8zZKGGY8MqgGHTK3ec3zpmx4u2mzu
 UIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8/0UlIoa5BxVLTVf3fq7Bs3VS9aphKLm905opuNfYBg=;
 b=VvfgF6pM2pF+0s+u62HEAgVf/MbWy0nj2vctCZsLWn1SSvUdg/qfJNE8u0+g7/zrFq
 qf/EZLXijc77FLTnPRrfFww07ff/+Mg2kD7mk5sUp6f4noa7ANm9m7zeoWAtkbNIshDV
 4FuM865+fd+RBF9b9s1pEGhzrqkcVTeoF2RJLKbZ4BGa3WVrVRW4W+O4HZ45CC+1mNVI
 kn4bW3Y2E+CTF5d61QZRADOTEB3bJMYNfQKZYcScPuzxB8DyXXxrNvkBobaxC8mjQvFT
 qOkLMLI/gZAhr7IvtSpu8D1RFZDN1IGvH495VI4ZqEBN5AUDnI9mi+qYQuUXlWKlC9aR
 rEwA==
X-Gm-Message-State: AOAM53322OraYrjPSnrgEkFXeEpfoYXvhh9Euf+c9CMW+v9ZqDSh/N0y
 WPa+05XrNM/B5sE8sLq97wF1O/6mklriWSOVqmZMYI7M
X-Google-Smtp-Source: ABdhPJw50VYgqV7PLoQ6GPPAq/UEjsBpe0xm6uzc8jArabsew4i+7bf4hP6L92Oz4AvOTkT+1L5E20PXLMIeydAId74=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr519904oti.23.1621995872545;
 Tue, 25 May 2021 19:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <1621929101-24607-1-git-send-email-zhangshaokun@hisilicon.com>
In-Reply-To: <1621929101-24607-1-git-send-email-zhangshaokun@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 22:24:21 -0400
Message-ID: <CADnq5_PMJR0zmJpK6ysSOEoxEA93gA87E-jG-T8tFre4ersTjw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove the repeated declaration
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, May 25, 2021 at 3:51 AM Shaokun Zhang
<zhangshaokun@hisilicon.com> wrote:
>
> Function 'r300_mc_wait_for_idle' and 'r600_mc_wait_for_idle'
> are declared twice, remove the repeated declaration.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/gpu/drm/radeon/radeon_asic.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeo=
n/radeon_asic.h
> index 1cf2a5e0d91d..1e00f6b99f94 100644
> --- a/drivers/gpu/drm/radeon/radeon_asic.h
> +++ b/drivers/gpu/drm/radeon/radeon_asic.h
> @@ -187,7 +187,6 @@ extern int rv370_pcie_gart_init(struct radeon_device =
*rdev);
>  extern void rv370_pcie_gart_fini(struct radeon_device *rdev);
>  extern int rv370_pcie_gart_enable(struct radeon_device *rdev);
>  extern void rv370_pcie_gart_disable(struct radeon_device *rdev);
> -extern int r300_mc_wait_for_idle(struct radeon_device *rdev);
>
>  /*
>   * r420,r423,rv410
> @@ -404,7 +403,6 @@ void r600_hdmi_update_ACR(struct drm_encoder *encoder=
, uint32_t clock);
>  void r600_hdmi_audio_workaround(struct drm_encoder *encoder);
>  int r600_hdmi_buffer_status_changed(struct drm_encoder *encoder);
>  void r600_hdmi_update_audio_settings(struct drm_encoder *encoder);
> -int r600_mc_wait_for_idle(struct radeon_device *rdev);
>  u32 r600_get_xclk(struct radeon_device *rdev);
>  uint64_t r600_get_gpu_clock_counter(struct radeon_device *rdev);
>  int rv6xx_get_temp(struct radeon_device *rdev);
> --
> 2.7.4
>
