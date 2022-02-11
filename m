Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D04B2F02
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 22:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A301010E291;
	Fri, 11 Feb 2022 21:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519E10E25F;
 Fri, 11 Feb 2022 21:02:00 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so11749120ooo.13; 
 Fri, 11 Feb 2022 13:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZeO5hcWCdKqnU1f53zfjTVOnwSJ9Wni2OfkSK8g/8Q=;
 b=i+UWfjEQcDeuesQh/b//2h18FVQeOfplmzqnZ7epGa5e7mL+spCmv8hW8ZCJEJbGnb
 fuZTG4ZmXDCq3x0dhVpdQFKpkOAW24uBhY9txj7Bhdk37MEZkcyBvh3b1wTudvW1ScvI
 PLz+SFDo6HfogYYHrR+PUCo4t/Ryf1TZZCp/ISRKM9Ss7LByNL69MSp6zP2QLO/FpjJC
 sEpp6Jny/qd+URXdU2xQO/BRgNs/6TsyTXV0JzabnH1A+q8Sn4GLK9e9sU7cCkACrpYe
 Ufparf1dN8Bc7neAF7dlBXcNQJqCz0o21JeZAL72G/FRe+TBjYJfBwFP1BiOWb1g4e0Q
 NVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZeO5hcWCdKqnU1f53zfjTVOnwSJ9Wni2OfkSK8g/8Q=;
 b=YaaqqMTCLr3Fe9DjQHvCninQKQ7l2V4lIkde1WluHehCxiT7Jhn+Am3RRnbto9lu0v
 RhMXaYN085R8op+bBTSg4nj/s1dhYK8863jnL4zGUWtlYPkLJ0IEsAev3/de12yc17nI
 LDyF6SKDWYSgtYxFB8h58OtphBsZPg5BpBJYjcC3T3D4ULXdJZ5Le2Y7FigLw46+YaK0
 QaIqsjsKf4PQ0P2tClyg9MDDFSGLvf+YErn1VWfnVq8vWXYpENZXBdDxdzN6dTqmYIqd
 3cq2VYP8aiz746RqEvxV2MOH97A14w/CVDJ/vYLI7K2aCMs2OBI4kpPxZezj8w+fpV7b
 fRHw==
X-Gm-Message-State: AOAM531LJf9fzvxZA+BxWknjFQBSn1fSBqeMSNsHelawF4rv3ID0Ergb
 0axWe7AEcPnDlPtp2MpPIvL23X1Udl8EmL1S9V0=
X-Google-Smtp-Source: ABdhPJx6q5W7dUdt31D6F8NEoc/p0VYD4pB6N0hi8Fs2KtDaR1R+ZoIzn1O4otKGJ/bl7zzIYys1+cJ9DKrKTC1keM8=
X-Received: by 2002:a05:6870:54d6:: with SMTP id
 g22mr716407oan.225.1644613319800; 
 Fri, 11 Feb 2022 13:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20220211205500.601391-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20220211205500.601391-1-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Feb 2022 16:01:48 -0500
Message-ID: <CADnq5_OCVUUoeBvQQBwK52HA-fVXkF+MMu7ssEqzEuGPajCfJg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix htmldoc warning
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 3:55 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Update function name.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 54f8e1fa4cae..d78141e2c509 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4978,7 +4978,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>  }
>
>  /**
> - * amdgpu_device_gpu_recover - reset the asic and recover scheduler
> + * amdgpu_device_gpu_recover_imp - reset the asic and recover scheduler
>   *
>   * @adev: amdgpu_device pointer
>   * @job: which job trigger hang
> --
> 2.25.1
>
