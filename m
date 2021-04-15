Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73056361008
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391496EA82;
	Thu, 15 Apr 2021 16:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC26EA97;
 Thu, 15 Apr 2021 16:21:48 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id x77so15441597oix.8;
 Thu, 15 Apr 2021 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t7pqJXti59c1rJZw2pACVhJls5W5jKhWFw5ukj9e48U=;
 b=R/O/tUak6DfYH8B+Kw9sxzRxBlisU2gV2zGdlsVd+Gf+3WQN6UF1UrcAVLfwAQDixd
 RJ3g8Wa4FsX9e2nQKAZw6BuSDTxAy3wgnCf396qM7TEfAOJdNSxfZtI/a/u2n0+4ruGw
 yG3EbY29ZC8VeFe6DR/hxxFL6GchyU6huaMgLFaKb3n8v6hOCut08KfMCdDetwuAO38G
 kEh2Ze+IQ0poo2z9pgYxEJw+DnXF6XWIBv8B8eDKH8aLf/ICDcf1fI6waMbaF6/2H+zU
 9ghTvXh9THRm0uVldKexJE68WLSnI6+8YzJrfe2z0mOluWF+UZgZukKaQXojYM/jnQiC
 88pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7pqJXti59c1rJZw2pACVhJls5W5jKhWFw5ukj9e48U=;
 b=FC7WB9QXaQ3CmZ2WuFWAgig0r8zf4rBq9bz8MbqhLGmb9mLZJoxHZMZQRpMtsHv/wy
 4Yx5UZ0AM9SG4ryuvYEm6AcmN0VVDKU38amcQ3SULKA2WFTKJbSSwNkwKNTvQ4Qsnb0p
 BEhIm8yRQtpjhpvQ4lDbr6G++Z0ZUDoF5nsSPI8m1LBOXoQZZwX5FJD1vWAKA8dwHAQE
 Lj+yzQBI55d1OKpjkuUO9WVwilHrkKjhCvWs/7hOCvx2N/8LeWojn65BtMfUQ+4ZdE22
 79xT4afCUvRV7v9ZAsN8w75jHogRS8PO+41TasCOaxAbbmQhn82h+dA0jfFv5Osi3jBP
 89Mg==
X-Gm-Message-State: AOAM531chiWpnl7Db9DQFi0NOorRMln1dKbpXRJk7xU80DOd7tiB4YfG
 mx25+ztWvpSQZwK+x4STOdrAfQfzNEnIv4q3Vx8=
X-Google-Smtp-Source: ABdhPJyrh8so60UP05DbmhzkFCCL+XuSDGiplhBalDHBQgGOJbpmiGOkUNLDHSgeIXiFmFlKjE+F7nb8TUjaJlmgjag=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr2977980oif.5.1618503708222; 
 Thu, 15 Apr 2021 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <YHaEn8h5JP9CGMee@mwanda>
In-Reply-To: <YHaEn8h5JP9CGMee@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Apr 2021 12:21:37 -0400
Message-ID: <CADnq5_Nt+QuaT6Qo2eRguJ34dxjK-_DttOKT-ZeL1cPjgKncjQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix an error code in
 init_pmu_entry_by_type_and_add()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 1:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If the kmemdup() fails then this should return a negative error code
> but it currently returns success
>
> Fixes: b4a7db71ea06 ("drm/amdgpu: add per device user friendly xgmi events for vega20")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
> v2: I sent this patch in Feb but I accidentally added an unrelated
> hunk from nouveau to the commit.  Now both hunks are have been sent to
> the correct lists.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> index 19c0a3655228..82e9ecf84352 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -519,8 +519,10 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
>         pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>                                                                 GFP_KERNEL);
>
> -       if (!pmu_entry->pmu.attr_groups)
> +       if (!pmu_entry->pmu.attr_groups) {
> +               ret = -ENOMEM;
>                 goto err_attr_group;
> +       }
>
>         snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_prefix,
>                                 adev_to_drm(pmu_entry->adev)->primary->index);
> --
> 2.30.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
