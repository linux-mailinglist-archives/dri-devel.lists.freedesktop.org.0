Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF366D117
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25DF10E4E2;
	Mon, 16 Jan 2023 21:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F010E4E2;
 Mon, 16 Jan 2023 21:50:31 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-142b72a728fso30134732fac.9; 
 Mon, 16 Jan 2023 13:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jZ7eQSS6PMori/MjrjUvY94RXNIWpc7bEkAM61SOQ00=;
 b=jNZJzDDxMTiSQxqtYc6ERQOAkdFxwSnmoaMWS7tGajvvvLyQDgJX+f4IPCF3a3cnfM
 ID6opTgymIqqXHwm/AJ4YCOs6NfFIUbyAkqm0v1MqK5wmJjkaIUw9Q8JX7dp6hFxJdqS
 gQgEw6jB68dVbHbXEkIAMvg84aeAk91yxvoZwstvHwsiOCIpWSuBC4hLjsTn6o/D57KQ
 g8dOceykSCat79fiOGvWemcXJwmDldCpgysXvXkWHGMPlm/l0alVyOGjSX/8JLiTEeR1
 JxhABMaKN2vT5R1lYC+FCgz7/AGH1V5Y4ifEOyL68cBAzxAp5OFrfewq38HPU1DRjTE2
 wYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZ7eQSS6PMori/MjrjUvY94RXNIWpc7bEkAM61SOQ00=;
 b=hRL3jY86uCwgDUIytoRC9IVyRL2fQfJ0d7dPLHZ6LoeUSk6NqS36Rb90SUDXl7D+nS
 6xuCi1ezFUS0TJiLlyFwfm2HZR7t4kcjm3hLxujrkw0VmRYIIxzYIiNNLc7yKCEQygF9
 +S56Ir6pC8TpxOJueUSyiMScQLHrf5euZkSGROZ52Obm+NRVqQOU8YagRgkEcYviT2cp
 9dy56bovC4U/IcqfpBrc7iGuOlzwLKrORyRAK6XozAULnUbRlyUoWbqaQRTKuYVUGPdm
 SwCyL9IxktkeBILrD7OdRsEBKVUI1lKUdZxH8xkKZ2f5/7pTe1zC+7SUWhvKdol1U5YL
 g/1Q==
X-Gm-Message-State: AFqh2kqs97QuO4aBZNLh8qiZQQ2WY++C/PLBNQ8RNe6ecQN18IyYaxQ7
 SIyjwIBjKBvz03NFRQLnAOvgYRfW74Df/nFHr2BCar4n
X-Google-Smtp-Source: AMrXdXuOZSZ5ljOKO+BgJCtQuWVy3x1t+NPoAMYu8feiNFCQ5U0bEjuk7ez6LveeFIuRwqqJPvaMisivpqRNxDSUegA=
X-Received: by 2002:a05:6870:7a18:b0:15f:5509:9a0d with SMTP id
 hf24-20020a0568707a1800b0015f55099a0dmr102990oab.46.1673905830802; Mon, 16
 Jan 2023 13:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
In-Reply-To: <20230116212004.860968-3-gpiccoli@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 16:50:19 -0500
Message-ID: <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 4:21 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Currently the FW loading path perform some checks based on IP model
> and in case it is advertised as supported, the VCN indirect SRAM
> mode is used.
>
> Happens that in case there's any issue on FW and this mode ends-up
> not being properly supported, the driver probe fails [0]. Debugging
> this requires driver rebuilding, so to allow fast debug and experiments,
> add a parameter to force setting indirect SRAM mode to true/false from
> the kernel command-line; parameter default is -1, which doesn't change
> the current driver's behavior.

Probably a question for Leo or James, but I was under the impression
non-indirect mode didn't work on production silicon for most chips,
but maybe I'm mis-remembering that.

Alex


>
> [0] Example of this issue, observed on Steam Deck:
>
> [drm] kiq ring mec 2 pipe 1 q 0
> [drm] failed to load ucode VCN0_RAM(0x3A)
> [drm] psp gfx command LOAD_IP_FW(0x6) failed and response status is (0xFFFF0000)
> amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring vcn_dec_0 test failed (-110)
> [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP block <vcn_v3_0> failed -110
> amdgpu 0000:04:00.0: amdgpu: amdgpu_device_ip_init failed
> amdgpu 0000:04:00.0: amdgpu: Fatal error during GPU init
>
> Cc: James Zhu <James.Zhu@amd.com>
> Cc: Lazar Lijo <Lijo.Lazar@amd.com>
> Cc: Leo Liu <leo.liu@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>
>
> This work is based on agd5f/amd-staging-drm-next branch.
> Thanks in advance for reviews/comments!
> Cheers,
>
> Guilherme
>
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 3 +++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 872450a3a164..5d3c92c94f18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -215,6 +215,7 @@ extern int amdgpu_noretry;
>  extern int amdgpu_force_asic_type;
>  extern int amdgpu_smartshift_bias;
>  extern int amdgpu_use_xgmi_p2p;
> +extern int amdgpu_indirect_sram;
>  #ifdef CONFIG_HSA_AMD
>  extern int sched_policy;
>  extern bool debug_evictions;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 06aba201d4db..c7182c0bc841 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -187,6 +187,7 @@ int amdgpu_num_kcq = -1;
>  int amdgpu_smartshift_bias;
>  int amdgpu_use_xgmi_p2p = 1;
>  int amdgpu_vcnfw_log;
> +int amdgpu_indirect_sram = -1;
>
>  static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>
> @@ -941,6 +942,14 @@ MODULE_PARM_DESC(smu_pptable_id,
>         "specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
>  module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>
> +/**
> + * DOC: indirect_sram (int)
> + * Allow users to force using (or not) the VCN indirect SRAM mode in the fw load
> + * code. Default is -1, meaning auto (aka, don't mess with driver's behavior).
> + */
> +MODULE_PARM_DESC(indirect_sram, "Force VCN indirect SRAM (-1 = auto (default), 0 = disabled, 1 = enabled)");
> +module_param_named(indirect_sram, amdgpu_indirect_sram, int, 0444);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 1f880e162d9d..a2290087e01c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -137,6 +137,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                 return -EINVAL;
>         }
>
> +       if (amdgpu_indirect_sram >= 0)
> +               adev->vcn.indirect_sram = (bool)amdgpu_indirect_sram;
> +
>         hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
>         adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
>
> --
> 2.39.0
>
