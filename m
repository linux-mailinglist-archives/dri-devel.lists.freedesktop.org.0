Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790248CD91
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 22:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E6D10EA17;
	Wed, 12 Jan 2022 21:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497DF10E8A3;
 Wed, 12 Jan 2022 21:19:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q8so6483703wra.12;
 Wed, 12 Jan 2022 13:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6TxiOntNhsCrtTXgbXmjcIfphc43hOl3QDBs0NNaLFY=;
 b=KFiMw3MPBADupNQlBvuHMx9S77BKhdF50zxz77/j9FbgxZiOW10JkOCDEu4tDtTIUZ
 AF2ne5pOpFtLLh0J/9OVlZ3Xk8elbrON8BeE8eBJFFtdl+rcmCx6FlCLn1TGlLjOGU1U
 MbEepFp7jfyJPApV+rIYxxpUAJzQ5eydRVetMrqCpxYELcUkPYCWoTUG1/frTgYsvUGJ
 ZiTlzH1EJEC+Ki3ORSUcCKfj0/d1Le+p8V28PtIAlySvlQOqa+hdOESzqWF4D3jzjQSP
 3LTRiZFk53hsfrs+MASoRHQUwhCVAtsh7bisLyz3COXkFx2eHCyN6mzF2beFQqpPV5MI
 6hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TxiOntNhsCrtTXgbXmjcIfphc43hOl3QDBs0NNaLFY=;
 b=sQMkM6DKv/29MIN3moVMDvVXG3a5F2PW2vmWs0Kq8ZhPnsGgAi1CQKhqZnMlygk6tx
 3xrSIqaWKyJtU/7Eszq3MCTc2cifzjKtAELMAOddftUSgAm9ZXkw2LfTnroW7OBqIw4/
 RsWOerUb5gNVvnRqGCngvrvx2xsr8sHPF3id2r+8F16mX+Y4vO+Nys7XqQu2YKVlU7mn
 CPdJeqVchJZK9Tj5ar1wgz9WBjXrtBpmMhb7jDi3A6tbI1wi6S8Pn+ePRJbmhLEtFXrr
 hYgTDM6Cv57yvRX0JvD7euH2nLyFQINsXnqJ+jwiv8w+ZNgV8jHnszl+Tzber3KVIc7l
 Kp8g==
X-Gm-Message-State: AOAM533pteNqRqF8VnTPepoQJP59duS27Gi2APs4Mbzz2obSB0IdOPG8
 iWkdI639Duvfg3/gNsr3LfUP4IGfalyo7G4lFmM=
X-Google-Smtp-Source: ABdhPJzFEuWp7Wsk8JdHQYZwsj1tBXEicac30GClml/cPixPa0nmwZPRG1lrU1uj5FLFPmz34phbSV+YiJmWRQFzecY=
X-Received: by 2002:a5d:6488:: with SMTP id o8mr1369457wri.93.1642022349685;
 Wed, 12 Jan 2022 13:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
 <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
In-Reply-To: <20220112030115.3.I86c32730e08cba9e5c83f02ec17885124d45fa56@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Jan 2022 13:19:07 -0800
Message-ID: <CAF6AEGuJxdrYM5XXt6sUGmjossqZTRzwQ6Y8qYsnfCYDvGQurw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/adreno: Expose speedbin to userspace
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 1:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Expose speedbin through MSM_PARAM_CHIP_ID parameter to help userspace
> identify the sku.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index f33cfa4..e970e6a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -242,10 +242,11 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>                 *value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
>                 return 0;
>         case MSM_PARAM_CHIP_ID:
> -               *value = adreno_gpu->rev.patchid |
> -                               (adreno_gpu->rev.minor << 8) |
> -                               (adreno_gpu->rev.major << 16) |
> -                               (adreno_gpu->rev.core << 24);
> +               *value = (uint64_t) adreno_gpu->rev.patchid |
> +                               (uint64_t) (adreno_gpu->rev.minor << 8) |
> +                               (uint64_t) (adreno_gpu->rev.major << 16) |
> +                               (uint64_t) (adreno_gpu->rev.core << 24) |
> +                               (((uint64_t) adreno_gpu->rev.sku) << 32);

How about this instead, so we are only changing the behavior for
new/unreleased devices:

*value = adreno_gpu->rev.patchid |
(adreno_gpu->rev.minor << 8) |
(adreno_gpu->rev.major << 16) |
(adreno_gpu->rev.core << 24);
if (!adreno_gpu->info->revn)
*value |= (((uint64_t) adreno_gpu->rev.sku) << 32);

(sorry about the butchered indentation.. somehow gmail has become
antagonistic about pasting code)

BR,
-R

>                 return 0;
>         case MSM_PARAM_MAX_FREQ:
>                 *value = adreno_gpu->base.fast_rate;
> --
> 2.7.4
>
