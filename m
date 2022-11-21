Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCD1632B05
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 18:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FC10E31D;
	Mon, 21 Nov 2022 17:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C6210E31C;
 Mon, 21 Nov 2022 17:30:42 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so7750863oti.5; 
 Mon, 21 Nov 2022 09:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHlfylBzHyxuRrCu5Gd5N0EZtslgI+tXadFm3xqwgLc=;
 b=GPa1o3Rcj+50tQvouk5qo5D5tCBoi+/yWwLq65jVuXNFSgRxVVPLP5nqeVsdQ6xDAV
 P343mNaxvkG83iWOVgBFwhnPT2mbkyiX4Keu0Xb85YdPLz6NFSpL+FvzA0KimKXYvCpN
 LgO1cT6yHmo9sYb0cVAdj5ARFQvxgRKoZ8dDDdzQOCHxV1DPNSYMztGo7C/38hH1GLai
 ics8varwttrOva3oHYcAj+zFs7bXM7Zlesu7y+79wyUBE2e5Nw1Wj76kDTShCcNk1ySI
 CdS77P8pfZ+V5KynFG0wL7Qlu+XiwI9bXAzKKZccMGNG2QwFjx6j9Vj1EXDcJML7gobH
 8esA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHlfylBzHyxuRrCu5Gd5N0EZtslgI+tXadFm3xqwgLc=;
 b=nG4hS/r6VEySlt/QcLZgF+UMo8WdoSHq3b9T6YKg0lOo7IC4K+gEl46p2/lkk5qvlU
 b16LBsr6HI0L1dr3LwqdHSKWX5GlvMH9mkWU9GZ3EGclJE6yvK2b69bxVHC7UHi9cRT2
 dQSCqK41timso+H/7KGcPpQgI69L3peTFAJ2/UbF7FQZFt+41Um90miglrLiNbZ2h/0v
 L2zLZZRSBPHrk17v6xd3zZPMpqX2MPsemPt1CdHBaW5OabAp8zkw6q8alRBPhHvsTwOV
 qmoqgO7LFgkwJ2oRULxzxBqtDaEP9iWR4bWwHRixSbpiNzmP6Hw7CCNAdL+pPCp4Wp7R
 6nuQ==
X-Gm-Message-State: ANoB5pnDt2ydB1S9+BlSU8zrX1hCzp0cN91HUiYcB9iDp1/87lAhMS3c
 sS9X2k6aDzdXIa31PSr6KgTK8sAnPUr11Idp5VM=
X-Google-Smtp-Source: AA0mqf4Z9t3knMWwkFNeQBsM1hIZgB6MGpcpaCCacZ2HGI+ZYi8fRJk7r1JKsInHmmIXz7YtMp3ZM7SdGnMzAGwSkfQ=
X-Received: by 2002:a9d:628b:0:b0:66c:6afa:5006 with SMTP id
 x11-20020a9d628b000000b0066c6afa5006mr3585319otk.233.1669051842247; Mon, 21
 Nov 2022 09:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20221121130418.53267-1-renzhijie2@huawei.com>
In-Reply-To: <20221121130418.53267-1-renzhijie2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Nov 2022 12:30:30 -0500
Message-ID: <CADnq5_Mi+dTQOdB0QV+TNSfA+jCbFEfZ1VvRbo2GJ_NB2XKOCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix unused-function error
To: Ren Zhijie <renzhijie2@huawei.com>
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
Cc: yusongping@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, weiyongjun1@huawei.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 21, 2022 at 8:09 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
>
> If CONFIG_DRM_AMDGPU=3Dy and CONFIG_DRM_AMD_DC is not set,
> gcc complained about unused-function :
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1705:13: error: =E2=80=98am=
dgpu_discovery_set_sriov_display=E2=80=99 defined but not used [-Werror=3Du=
nused-function]
>  static void amdgpu_discovery_set_sriov_display(struct amdgpu_device *ade=
v)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> To fix this error, use CONFIG_DRM_AMD_DC to wrap
> the definition of amdgpu_discovery_set_sriov_display().
>
> Fixes: 25263da37693 ("drm/amdgpu: rework SR-IOV virtual display handling"=
)
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 6b48178455bc..2509341df92d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1702,11 +1702,13 @@ static int amdgpu_discovery_set_smu_ip_blocks(str=
uct amdgpu_device *adev)
>         return 0;
>  }
>
> +#if defined(CONFIG_DRM_AMD_DC)
>  static void amdgpu_discovery_set_sriov_display(struct amdgpu_device *ade=
v)
>  {
>         amdgpu_device_set_sriov_virtual_display(adev);
>         amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>  }
> +#endif
>
>  static int amdgpu_discovery_set_display_ip_blocks(struct amdgpu_device *=
adev)
>  {
> --
> 2.17.1
>
