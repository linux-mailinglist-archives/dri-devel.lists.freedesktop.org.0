Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB325F0DC9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A6510ED38;
	Fri, 30 Sep 2022 14:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA6710ED36;
 Fri, 30 Sep 2022 14:42:55 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q10so4935651oib.5;
 Fri, 30 Sep 2022 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8y2c2TXn+uSosI4ZLTz+ogttj1trZ26bdcKYksnCapE=;
 b=C+Y8ZNBSwPPc+m+SjB0bDFHqKJzfWC1iWpmSG3lUsgVw7qgbSsIP2I5LsL3TYnqahZ
 fUXZbWkoVkKYuexMDdVOL4nHtkR0kCjBYEh4ypTZLGJ52Z2kIOqBS2w9EDlUJ6VvDTBA
 x5E0oDBgJQYjdxqL0QL+XY4F56pAF+4xDQYUEdU+C/Y/6B0TCsfctxD18h6OdJ6xKsYk
 s9rBc/SajO1K99fPQtSvzECex68fPPp8UXGn5+wqkadqZM8un2RbbQGqFwiZO5YYCjdy
 +RuNof5Sbqp9qP2WeAufmPiGaKLtABtGZYJRKcE9/8YgcU60Pr90jad0IQIUEHRcU6gk
 lZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8y2c2TXn+uSosI4ZLTz+ogttj1trZ26bdcKYksnCapE=;
 b=kPmIubOlTvEyJhVaY1Cdv8ooIEDDm83woINi9XQzN5mvLGliVg0/E+wUwj9gG8fBh8
 dEx7RlbWa2jgUr9mxDk3dwhgUdVAQ/KmxfRwQReo+Sxzx5OlgLwaQpWARL8GRiBzMqFR
 UJ0BI95f7y45I5NrL3q3ax9P6CpfdhMGj60b/m7BdFuqp/MY1xxC64cR9uJHjXPSGfNk
 p2uRFOJMWlLsfX7LKSEC/qI+LY1oQKKah/tZeTk8p8xaIt77cX2QIc59etI+NZaBGko1
 p/0OkHpm5iCElPPlQK7VXG77Y24e9sPyCp5waNrdmLQroe0N2+hJBtbvD5eeG7baC9+b
 qjog==
X-Gm-Message-State: ACrzQf3Ku6Tr1Vz43h9H/t4qIUOJT6EUNSbZREYCxpRXtIXvd1yuKMLG
 GzQj4nngUwr7lCBm2+r9x1ESIMmyQqBWv/eB8hg=
X-Google-Smtp-Source: AMsMyM7osDVSZWUajrm3Igj7tejlkKVde0W47IAuomOnGAHzL5fMvLtUccMvXi++Z7Y6na5VELlgPTFDliQfdzBRFVU=
X-Received: by 2002:a05:6808:2390:b0:350:5c6b:5ef9 with SMTP id
 bp16-20020a056808239000b003505c6b5ef9mr4092691oib.96.1664548974916; Fri, 30
 Sep 2022 07:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220924221939.1736291-1-floridsleeves@gmail.com>
In-Reply-To: <20220924221939.1736291-1-floridsleeves@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Sep 2022 10:42:43 -0400
Message-ID: <CADnq5_MKscz-yV6PZUKpAY6oj7Wso6qUeX6B6RKaUGqa0vy+5g@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/amd/pm: check the return value of
 amdgpu_bo_kmap
To: Li Zhong <floridsleeves@gmail.com>
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
Cc: lijo.lazar@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 24, 2022 at 6:20 PM Li Zhong <floridsleeves@gmail.com> wrote:
>
> amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
> error check and propagate the error.
>
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>
> v2: revise the compile error

Applied.  Thanks!

>
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c       | 5 ++++-
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> index 8fd0782a2b20..f5e08b60f66e 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -1384,13 +1384,16 @@ static int kv_dpm_enable(struct amdgpu_device *adev)
>  static void kv_dpm_disable(struct amdgpu_device *adev)
>  {
>         struct kv_power_info *pi = kv_get_pi(adev);
> +       int err;
>
>         amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
>                        AMDGPU_THERMAL_IRQ_LOW_TO_HIGH);
>         amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
>                        AMDGPU_THERMAL_IRQ_HIGH_TO_LOW);
>
> -       amdgpu_kv_smc_bapm_enable(adev, false);
> +       err = amdgpu_kv_smc_bapm_enable(adev, false);
> +       if (err)
> +               DRM_ERROR("amdgpu_kv_smc_bapm_enable failed\n");
>
>         if (adev->asic_type == CHIP_MULLINS)
>                 kv_enable_nb_dpm(adev, false);
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> index 1eb4e613b27a..ec055858eb95 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
>  {
>         struct pp_hwmgr *hwmgr = handle;
>         struct amdgpu_device *adev = hwmgr->adev;
> +       int err;
>
>         if (!addr || !size)
>                 return -EINVAL;
> @@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
>         *addr = NULL;
>         *size = 0;
>         if (adev->pm.smu_prv_buffer) {
> -               amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +               err = amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> +               if (err)
> +                       return err;
>                 *size = adev->pm.smu_prv_buffer_size;
>         }
>
> --
> 2.25.1
>
