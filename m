Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A811365DB4B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA2010E009;
	Wed,  4 Jan 2023 17:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E7510E009;
 Wed,  4 Jan 2023 17:30:34 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 p17-20020a9d6951000000b00678306ceb94so21151814oto.5; 
 Wed, 04 Jan 2023 09:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qcvt8eh5u3jiwS1uurMGyfwX+9LkSAcqQgzciAku68s=;
 b=d8/9SpVPU7WL3d9+TCOTqSUjTgV0TdrbEaPSgajJJe80tyjT9JW0e2ovpH1D5hQf1i
 5y+NXU1Isls0KfGTP45/Bc1gYfX51BRNOG8drqyq7w5WV5fJ9ACZ6A4CqWZ6De16gTtZ
 1wX3nWw4VyjWp8yTViHWaQqCLamPkidvDtHj12/uYbZfqkLGaPzhuN0EK2ZeCkrEbn4O
 yUmTbpQd+Mb02PZLFPuxCvjfxGnsvGPshMhkt2sq5J+yVlAx4sBU5ONIL8EcrFPcWFQz
 uZoChbKguX9jiIybrGeu2LdLadfMcXpwsmEtHw0Kx+t7Sjr5VihhAp0X4D/cIyBtqqC+
 pbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qcvt8eh5u3jiwS1uurMGyfwX+9LkSAcqQgzciAku68s=;
 b=ld0Yiuf+pgos8dPriT8qmj/0Hd4E52XS19iyXS7U68zETtiOVsx0to+qEJgcBIcuO+
 H+6zHxxT/qTnYtdtFxbiEHhwTK1/g4p800tkyXDuTvrfjUp8lRH4RgSG/44RrazUBW5x
 67qhZj70xGj1qL8a+JLPhzIVOxClsd0Lw44RJuWO5y4iaiAv8SzOii7dNr3j9Q3MRI6o
 MssBDRdAgmHJrKax4yKrUlgJ9+EiSbzc62OmRPgQ/Zv121PxXGN4F+2auuDDRXOX7/Dg
 KFNXL/F3Xx8Yo3gzwaEEjDeR0DnjvVKW2ZwXREiHkwnjUW28vVxoAY5Wa6jl7kKwvgtp
 uYhA==
X-Gm-Message-State: AFqh2kpie7GCOrrgSNhaOTbMxqmx74Z9xyUV5xDMoTBjrjKfdFpCVIGT
 YdRx7JNiLb8nc2fNrAtrU053beSKxQLlOrm9GpE=
X-Google-Smtp-Source: AMrXdXtMAMNL/KMNkRIFRDaQNb7XroAB+qD+qaH8wu1bibXrlG8xHLN3IbD2SQrSd9LHx19dUTDLMJ2ScX135Ata/0Q=
X-Received: by 2002:a9d:6ac6:0:b0:671:cacb:681f with SMTP id
 m6-20020a9d6ac6000000b00671cacb681fmr3039203otq.233.1672853433856; Wed, 04
 Jan 2023 09:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20230104164042.30271-1-mario.limonciello@amd.com>
 <20230104164042.30271-46-mario.limonciello@amd.com>
In-Reply-To: <20230104164042.30271-46-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jan 2023 12:30:22 -0500
Message-ID: <CADnq5_OkOvjaJFFj2HzQE+PTRqMby0uHEkgziGnaxwn1=JoRiA@mail.gmail.com>
Subject: Re: [PATCH v5 45/45] drm/amd: make amdgpu_ucode_validate static
To: Mario Limonciello <mario.limonciello@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Carlos Soriano Sanchez <csoriano@redhat.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other than the patches I commented directly on, this series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Jan 4, 2023 at 11:45 AM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> No consumers outside of amdgpu_ucode.c use amdgpu_ucode_validate
> anymore, so make the function static.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index dc6af1fffdd9..b759a4300d7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -504,7 +504,7 @@ void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr)
>         }
>  }
>
> -int amdgpu_ucode_validate(const struct firmware *fw)
> +static int amdgpu_ucode_validate(const struct firmware *fw)
>  {
>         const struct common_firmware_header *hdr =
>                 (const struct common_firmware_header *)fw->data;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> index 7fd2f04f7f98..28fc2960edfe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> @@ -543,7 +543,6 @@ void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
>  void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
> -int amdgpu_ucode_validate(const struct firmware *fw);
>  int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
>                          const char *fw_name);
>  void amdgpu_ucode_release(const struct firmware *fw);
> --
> 2.34.1
>
