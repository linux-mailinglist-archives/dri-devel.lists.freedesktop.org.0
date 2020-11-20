Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BF2BB944
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 23:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C886E937;
	Fri, 20 Nov 2020 22:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502896E937;
 Fri, 20 Nov 2020 22:42:51 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id t33so10036660ybd.0;
 Fri, 20 Nov 2020 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+/p0vsaZaZ5eJ4n4W/6kpMXGlN10lE2LER/KFN9S5s=;
 b=YnUi7YuNuw8mKKyydLvw5QmsWlZh9G7Hpn1spIT8RDTKUXYY13Bdxmk2fyzYfaErqE
 Asbi0nrX6Dkr+ZsTTAmv2yPPxoNN5RBSKqB6jgsNcvaCfd/NyrS79hQRaD+ZjC3hak7i
 neGJNQiXMdMH2t/nVgmdGZV9/ZEPtbs829cRB1laYEDnvivjitpGDwIofQ2fzZroA62j
 5YPYQlzIggcV4spdaMob8NPflrEt4tOAJ9eydFDf162XehoY+LkQmJZyV6enRbfV7zDL
 RuiTSBs7Lrn3O4YvLm6si/JY31SdwPVSGSV7o18NonKTuaze082T1eyGembEoKNEBVsi
 7lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+/p0vsaZaZ5eJ4n4W/6kpMXGlN10lE2LER/KFN9S5s=;
 b=U5i2KDP7s8hERxU1m+WsCeazBiUdvNOKvXTTHWfe9hLv9SdspygZf1t8ORbhQZoh2l
 QOLTeVWM++4W7k4eKYoT1Tpzl+rpkW/9UkwFKhaTReXiKVveyFg4aKhNH08Rh0u+N9Wq
 /CmDRGvwgJiYd/rPQz5hdpzzZzxprAq4nTtzdVpFVjN9DfQBonp5DqbuOTPHP/PaaQ4/
 bOVwF+JqKUJ1rKqfiBsG/ruKSZwQNji5B9JJv7TH/y8IpZyspacDxsWEtMK2KT28anO5
 x8iU21XBAX/3OXlewGc2FxQOAOmOQzAydU0mpJ3hCMsIuOSGmrOqDZs38UwPlDtROTol
 Sslw==
X-Gm-Message-State: AOAM532676wrv1l/F8086NLlqfoIsnuqdiQu97UM/i+dQgiTxrWqZiXt
 4Fzth4Ij3sftBtQq3YKwY8oboCvOKzlll/8O6/I=
X-Google-Smtp-Source: ABdhPJznvvvinnh9ZMC/o+FJus/kMLARw94VjcalVRGgnDnpdX/NRwfA7QFMoYTZF4aZs0JOYd/9VAXxpWa9YkmSLkg=
X-Received: by 2002:a25:7614:: with SMTP id r20mr25968047ybc.157.1605912170528; 
 Fri, 20 Nov 2020 14:42:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <dc55f2cf59d8d3426bf9b01a6555db6de61c9361.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <dc55f2cf59d8d3426bf9b01a6555db6de61c9361.1605896059.git.gustavoars@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 17:42:38 -0500
Message-ID: <CADnq5_OsDDGcy1EvEOP23pqfF628dGEq=3-hY_G45b_5j4nmtQ@mail.gmail.com>
Subject: Re: [PATCH 004/141] drm/amdgpu: Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 1:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements instead of just
> letting the code fall through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 1 +
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 1 +
>  drivers/gpu/drm/amd/amdgpu/vi.c        | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 3579565e0eab..98ca6b976b6e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -8398,6 +8398,7 @@ static int gfx_v10_0_set_priv_inst_fault_state(struct amdgpu_device *adev,
>                 WREG32_FIELD15(GC, 0, CP_INT_CNTL_RING0,
>                                PRIV_INSTR_INT_ENABLE,
>                                state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 0d8e203b10ef..e61121629b93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -5683,6 +5683,7 @@ static int gfx_v9_0_set_priv_inst_fault_state(struct amdgpu_device *adev,
>                 WREG32_FIELD15(GC, 0, CP_INT_CNTL_RING0,
>                                PRIV_INSTR_INT_ENABLE,
>                                state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 3ebbddb63705..584b99b80c29 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -502,6 +502,7 @@ static int gmc_v9_0_vm_fault_interrupt_state(struct amdgpu_device *adev,
>                                 WREG32(reg, tmp);
>                         }
>                 }
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 9bcd0eebc6d7..d56b474b3a21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -1645,6 +1645,7 @@ static int vi_common_set_clockgating_state(void *handle,
>         case CHIP_POLARIS12:
>         case CHIP_VEGAM:
>                 vi_common_set_clockgating_state_by_smu(adev, state);
> +               break;
>         default:
>                 break;
>         }
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
