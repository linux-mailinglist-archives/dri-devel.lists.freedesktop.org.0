Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46205772C8E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340D910E344;
	Mon,  7 Aug 2023 17:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D207010E340;
 Mon,  7 Aug 2023 17:17:33 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3629531fac.1; 
 Mon, 07 Aug 2023 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428653; x=1692033453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x941QFRlMNZmZDZM2xkbsmo9UZJniXSX6pOd9x9J2Qs=;
 b=blhY82Z2TAD9PejRmNdoxblYK6rGOr/pG9QeXBKDotxEHgZe3gVEfLcZBrhIKZ5CMk
 +N2OA83ILZ5n4KkKb6F/f7u7cI3CpdvCspz8dTAS6Bo5H/E93db8IndBORsE2glQH0cf
 n4wmdIn3ThQ671Q/vRQ5jw3JJE/7jgzDA7OkdKebIL4aEgmsFwtFiIQYSuDHdQ5ZRGXz
 KtfKW0Lj8Ds925SH18glTANjFG6z5sV69sQnWP3TWiVgTtoAV9uz9iN9fOcQ+v314H6p
 yyiLDhNqNmocQbt8kMZv74QFJBaW9Ts0H393Vy8Tw3b8GlHViwpEI893Yig2LwGVxVTb
 +18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428653; x=1692033453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x941QFRlMNZmZDZM2xkbsmo9UZJniXSX6pOd9x9J2Qs=;
 b=BO6CS9uK6qvI0QUCRu7+kAnp37Em6XaMPfR1mFPqw8eZ6bghx5jvBHbwcdsjFZ+BwK
 eN6r+9f/DFxIBjv7HmGnrXt8HZTf1Ret4361TpA8NSKnUBKm3cHL6fnjwSELXpahba//
 avFCcpiK8iJr9wF+lb0VbQJJD9A/nUu7Hd8W19078jn7lrbxkp4jSDY7yzYSEattNI+q
 KbtYaLH59vVsU+bN7c1FX0t0nsnnYm/G/rXGotghlLMNRtBjXQrYjbBgnGAp/fuYZU+k
 JL+qvP/u5AvRs9AvLmA4lwO65SenXDuM7FvkCp4yAgvXKqUlEj9j+qdz9joylWws/Ls9
 TjhQ==
X-Gm-Message-State: AOJu0Yz3OCd2hIyrjKRylF8TPPX0BrbR6MDn7mY0afLZ7SIrIffdAabd
 ih5yWokXTfn/ANT52TH4gkkwRcE3erzk5b553F0=
X-Google-Smtp-Source: AGHT+IHaA9hJV6vOMsXo4/1MdAleuqC1jj0XAUUTOZfjJpB83+O/s/QZSipeKBkSC0UZCxCc7qSr5BJUnGwHnuIA/vQ=
X-Received: by 2002:a05:6870:c1cb:b0:1bf:4a66:d54f with SMTP id
 i11-20020a056870c1cb00b001bf4a66d54fmr11775593oad.56.1691428653044; Mon, 07
 Aug 2023 10:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230802064024.11806-1-sunran001@208suo.com>
In-Reply-To: <20230802064024.11806-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:17:22 -0400
Message-ID: <CADnq5_Nk_kyK2SViK3cPKvkXQOgsW+tGCwz+4uFveCUBk0BjkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in amdgpu_psp.h
To: Ran Sun <sunran001@208suo.com>
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

Applied.  Thanks!

On Wed, Aug 2, 2023 at 2:40=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: open brace '{' following enum go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.h
> index c3203de4a007..feef988bf0c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> @@ -78,8 +78,7 @@ enum psp_bootloader_cmd {
>         PSP_BL__LOAD_TOS_SPL_TABLE      =3D 0x10000000,
>  };
>
> -enum psp_ring_type
> -{
> +enum psp_ring_type {
>         PSP_RING_TYPE__INVALID =3D 0,
>         /*
>          * These values map to the way the PSP kernel identifies the
> @@ -89,8 +88,7 @@ enum psp_ring_type
>         PSP_RING_TYPE__KM =3D 2  /* Kernel mode ring (formerly called GPC=
OM) */
>  };
>
> -struct psp_ring
> -{
> +struct psp_ring {
>         enum psp_ring_type              ring_type;
>         struct psp_gfx_rb_frame         *ring_mem;
>         uint64_t                        ring_mem_mc_addr;
> @@ -107,8 +105,7 @@ enum psp_reg_prog_id {
>         PSP_REG_LAST
>  };
>
> -struct psp_funcs
> -{
> +struct psp_funcs {
>         int (*init_microcode)(struct psp_context *psp);
>         int (*bootloader_load_kdb)(struct psp_context *psp);
>         int (*bootloader_load_spl)(struct psp_context *psp);
> @@ -307,8 +304,7 @@ struct psp_runtime_scpm_entry {
>         enum psp_runtime_scpm_authentication scpm_status;
>  };
>
> -struct psp_context
> -{
> +struct psp_context {
>         struct amdgpu_device            *adev;
>         struct psp_ring                 km_ring;
>         struct psp_gfx_cmd_resp         *cmd;
> --
> 2.17.1
>
