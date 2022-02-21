Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D594BED51
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 23:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B40810E4EA;
	Mon, 21 Feb 2022 22:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E808F10E4EA;
 Mon, 21 Feb 2022 22:42:21 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 k22-20020a9d4b96000000b005ad5211bd5aso6531368otf.8; 
 Mon, 21 Feb 2022 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KCOv3IEPa+T4atHLSyX9F9YZSMAkm0uJbW+qyWXOhY=;
 b=QaUey7Incygh7qSfWMM7R3LEigTajw2Ot386xexAxmDWeE9dnrvc/SJfMD76bFTWyX
 HkutP29w+aqiv/e8GzwLVBvjfa2ReVlzbmRcOm+GNHqlyg7y6Ev9fADJXK+rwEfxnalX
 NRB/F6Ad6rnf+rfT5muNNgf28H1owIrtsKfFfn4DJiLwyJlnQeUcV5G41gtuJXI9wYIg
 WKfytkGIFLRjfTOsYj49MZdUPUxNp8+OWHwdBpf0hNtN8EkRcZInawtiCtavxKeRTimt
 qi2CI2uXgRwo3HtfEMeh3XpYG4gdTOXpIOiKFbItc7hNvnXw019A3oAsNydm2t81d3jV
 rZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KCOv3IEPa+T4atHLSyX9F9YZSMAkm0uJbW+qyWXOhY=;
 b=srkUI41xhebHL0tDKUkLXk1Li+XoY/l99qtb+QbHEzsRaGDl6cKm/7mfY2O/0w7TuE
 Jci5PLLYIQe/eHJRuSSA6FESI5plCPF+g+rMVgeqVETFDirVHoy0Ubx7Hi63Nud1gqx4
 aClniANarTCObuJGs8fcuI73uLtDNE/uXvJy1j5SsnIriQBPK7kYtuP7+05vP2NhdVsu
 wUejllPKug49lO4xqMshPZaiR0IDCmZicJM+BGeo68PWrDlspt277gs8CBLIQGb+3ZEv
 EWtsCw56tDs01QuMljyv+Sx7dnF1fv/RrCOKKKSkAlp9HWX4LgQu+8b0YtIzTEogTGHs
 i5vw==
X-Gm-Message-State: AOAM533zLdm6uCGRQ1/yn1ziOH4RiqYSychmeIgCf1GnEY4t80Y1HXU0
 jfZwHO5fBOj4IsF8xh5Bx74YNuU+ZFVD321Dkfy5ikSo
X-Google-Smtp-Source: ABdhPJwJNVx6lk7bOd/b5bqtlSO8oe7IFdSdEEWyoCtexhjLEMwSnMGqG9ldOWZW3FTSnswg5KIucx9atziT+RVKYCE=
X-Received: by 2002:a9d:4a8:0:b0:5ad:35f8:31a6 with SMTP id
 37-20020a9d04a8000000b005ad35f831a6mr5676376otm.200.1645483341228; Mon, 21
 Feb 2022 14:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20220219045445.146570-1-pmenzel@molgen.mpg.de>
In-Reply-To: <20220219045445.146570-1-pmenzel@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Feb 2022 17:42:09 -0500
Message-ID: <CADnq5_OStk3baHXKtejpvQR3cAMb-DknU-dqts2_eAYs3+_8Hw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix typo in *whether* in comment
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Feb 18, 2022 at 11:56 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 63a089992645..430e56583751 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -740,7 +740,7 @@ MODULE_PARM_DESC(debug_largebar,
>   * systems with a broken CRAT table.
>   *
>   * Default is auto (according to asic type, iommu_v2, and crat table, to decide
> - * whehter use CRAT)
> + * whether use CRAT)
>   */
>  int ignore_crat;
>  module_param(ignore_crat, int, 0444);
> --
> 2.35.1
>
