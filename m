Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F927683390
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473C10E14B;
	Tue, 31 Jan 2023 17:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C371810E142;
 Tue, 31 Jan 2023 17:16:33 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-15fe106c7c7so20217237fac.8; 
 Tue, 31 Jan 2023 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B87l4oW+IzOa4SGyozTxZ9rljUvc8DJMzBV7y0do9hE=;
 b=fYXjlQqnDIzFyCbHYKX1Q0MyU4ku3gKOxAKgmlKKXgTnXqHkcICbTxk6JPBOE+VotO
 nXJWq2bbVb+W1R1KZhRaOPlm9tI5cEhof+CPFpyPutTiJ/YPP12GdJVcynMH0dlkRacV
 r2L1obxi3aQn+vNEOY6xty+TQBV6XDTtQdJoBTtOee7HzpUhrRjf8Z2MpNwVGmsq3Dkn
 LFPRcDuWMhhJAzqzll1DAgiHz2g+XYpfXerP5CZUasOdhsIhjnADKaaSC7pgPeikd6n/
 0eBpPEPqlr5lkQEScwOqpo1avEWZpcBrczC5EUNpgd0OSyfKwom4R8X7FEiGvy6hy5VT
 zxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B87l4oW+IzOa4SGyozTxZ9rljUvc8DJMzBV7y0do9hE=;
 b=GU5AR2lKinv2FqNpCTLG0k7kOu9x4xF33XirsbmJRTCsXu2N13Q5V7mrWPZTGqId8u
 lMJWqWlkX2tgQJW/zbCtMKpkUuuvJY4bUgATHsSyxPCAgoWiGL9Z59KdbkkzDKteoVZK
 /a4AwK02Q1oVCGDIC17qgz+oPIcwQ4O+2hWN8zccEV74JYW2hUCHPsqcPKckp34v/4ZJ
 2hFLd/tRVY9BfV6snJ6irtxiD+41POKLvYKS93rQ340tdksgr90KqocSJ3nG+ELNX0Pk
 vYky4brO0tm3E0X+Cy6K1jY1ITzsFl1pwcYyI2rueS1P+N6E86wyO8A0l+xgtnrcMqO8
 yrSg==
X-Gm-Message-State: AO0yUKV1KVKumdvnl1Lq60BZB5Z0s/Ak7DnbLBScjdno6YMkUwlsGPTe
 PtsgC4YK8YOBVjxS804K4EzergZLI60JfPIxjK4=
X-Google-Smtp-Source: AK7set9yXyeTvqbVOfWQG6Pfo29EpuMgUtCfIPlMwTWGtILy/wFMlT/P1PY0Z2Og22WH2A2luE8gGp5X47byjlG82ws=
X-Received: by 2002:a05:6870:b522:b0:163:8cc6:86a with SMTP id
 v34-20020a056870b52200b001638cc6086amr1616043oap.46.1675185392993; Tue, 31
 Jan 2023 09:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20230129151752.1531144-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230129151752.1531144-1-j.neuschaefer@gmx.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:16:21 -0500
Message-ID: <CADnq5_MEzZm-QYfxXCR1CcZ4OLE241x_jFU28Uz+QXpP257wjg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo ("boradcast")
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Jan 29, 2023 at 10:18 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Spell it as "broadcast".
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/df_v1_7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c b/drivers/gpu/drm/amd/a=
mdgpu/df_v1_7.c
> index b991609f46c10..5dfab80ffff21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
> +++ b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
> @@ -94,7 +94,7 @@ static void df_v1_7_update_medium_grain_clock_gating(st=
ruct amdgpu_device *adev,
>                 WREG32_SOC15(DF, 0, mmDF_PIE_AON0_DfGlobalClkGater, tmp);
>         }
>
> -       /* Exit boradcast mode */
> +       /* Exit broadcast mode */
>         adev->df.funcs->enable_broadcast_mode(adev, false);
>  }
>
> --
> 2.39.0
>
