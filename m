Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A7697038
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6441210E043;
	Tue, 14 Feb 2023 21:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA6010E043;
 Tue, 14 Feb 2023 21:58:02 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-169ba826189so20844734fac.2; 
 Tue, 14 Feb 2023 13:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NjGzXvdnEJUB6D7kqjmYJv2HzN53AJslHKM/titJfJ4=;
 b=XXJ00A1XEMdIXv4f0vrTjUnJqcqTFmCf90gyC4Zeq7LYqSfcU3+9lKi5zb8WuG97EP
 PzWMeT1hrvv4AbujgqIN87W485MTvjMUgsXWSoro/wGWwGF0q5gCOg8JDhKkwvNV2Wui
 MjiIcMV3rIY1wH4rOnFgeA6kE1ZpYywwxHzk1etZ2P+PJ+D3Fb7MJ1UacfC6Jr0l6Y2s
 ntzmZ67KOn5VVKFwDTU8cjjTiICpwNNLIsx/JowtEOZaGGGt+L1DlAMhs5hdgEJ2WItq
 3306YLeNnIJUr4IJGljZ0bxMKVrlt1wN4mYzufQnnT9HIU197DSjE4LSxZAKhClxhsgp
 BFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NjGzXvdnEJUB6D7kqjmYJv2HzN53AJslHKM/titJfJ4=;
 b=lSKmtYBAy8lH/M/zU+Wzd/bRRznYYyiLLnXD2iBF7d5HWukL9F6+r4Y9olQndsuJp3
 1PFqnouobZQD94RuCShtjCPHkFRs7/auhkJW+Fl0VZT/1OJg8FFumeQrGX6FmZDhjF+x
 yb147bu+5KbOC7EVbXkoLCUBpvAfllF+sDnAwWRvAeb7FKihJaJeNE07r95kcNPkCMXo
 nr1771X1aydcP+O/1Kwc51HtHSiFJpWOzvvOADq4bDdBE32V9qqeZ2Wf8U8iAQLk9acy
 TlqdPfHwQgOiWTUJE0BoxBzfpdwW5efburFajPS9a1LrCMWbKesAd0d71l9YWhZJICVd
 MK6w==
X-Gm-Message-State: AO0yUKXtOKKf8bvOF47qXfEye3H4ErwuDLPc8cDItE7Xfq5SLAceUYca
 dD8oQdgD++IryyRWd4MhOn2EAwSDYIvqzzQ6IXs=
X-Google-Smtp-Source: AK7set9yVxqJpoMHJzseC+CUFlplD6V8b0ioWtepVoXEA0EBbMcRrd6uqQ6eX9AhG7ZtHz6bc41C+FnVkf4SCrp+4WA=
X-Received: by 2002:a05:6871:259b:b0:16e:2bc5:1601 with SMTP id
 yy27-20020a056871259b00b0016e2bc51601mr32834oab.38.1676411880141; Tue, 14 Feb
 2023 13:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <ee96d47a-be2c-e85f-8150-57a77325fe6c@linaro.org>
In-Reply-To: <ee96d47a-be2c-e85f-8150-57a77325fe6c@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 13:57:49 -0800
Message-ID: <CAF6AEGt+fkVH-oqoTNLgE9fE4D6Bem_AsQEExP-pZBvP80LvoQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] GMU-less A6xx support (A610, A619_holi)
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Akhil

On Tue, Feb 14, 2023 at 10:03 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
> v1 -> v2:
> - Fix A630 values in [2/14]
> - Fix [6/14] for GMU-equipped GPUs
>
> Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/
>
> This series concludes my couple-weeks-long suffering of figuring out
> the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.
>
> The GMU functionality is essentially emulated by parting out a
> "GMU wrapper" region, which is essentially just a register space
> within the GPU. It's modeled to be as similar to the actual GMU
> as possible while staying as unnecessary as we can make it - there's
> no IRQs, communicating with a microcontroller, no RPMh communication
> etc. etc. I tried to reuse as much code as possible without making
> a mess where every even line is used for GMU and every odd line is
> used for GMU wrapper..
>
> This series contains:
> - plumbing for non-GMU operation, if-ing out GMU calls based on
>   GMU presence
> - GMU wrapper support
> - A610 support (w/ speedbin)
> - A619 support (w/ speedbin)
> - couple of minor fixes and improvements
> - VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
>   A6xx)
> - Enablement of opp interconnect properties
>
> A619_holi works perfectly fine using the already-present A619 support
> in mesa. A610 needs more work on that front, but can already replay
> command traces captures on downstream.
>
> NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
> two occurences of 0x18 used in place of a register #define, as it's
> supposed to be RBBM_GPR0_CNTL, but that will only be present after
> mesa-side changes are merged and headers are synced from there.
>
> Speedbin patches depend on:
> https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/
>
>
> Konrad Dybcio (14):
>   drm/msm/a6xx: De-staticize sptprac en/disable functions
>   drm/msm/a6xx: Extend UBWC config
>   drm/msm/a6xx: Introduce GMU wrapper support
>   drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
>   drm/msm/adreno: Disable has_cached_coherent for A610/A619_holi
>   drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
>   drm/msm/a6xx: Add support for A619_holi
>   drm/msm/a6xx: Add A610 support
>   drm/msm/a6xx: Fix some A619 tunables
>   drm/msm/a6xx: Fix up A6XX protected registers
>   drm/msm/a6xx: Enable optional icc voting from OPP tables
>   drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
>   drm/msm/a6xx: Add A619_holi speedbin support
>   drm/msm/a6xx: Add A610 speedbin support
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  55 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |   2 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 427 +++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c  |  34 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  19 +-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c       |   2 +-
>  9 files changed, 492 insertions(+), 66 deletions(-)
>
> --
> 2.39.1
>
