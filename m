Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D1D355748
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 17:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116F6E0E4;
	Tue,  6 Apr 2021 15:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04C6E0E4;
 Tue,  6 Apr 2021 15:05:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e18so14603594wrt.6;
 Tue, 06 Apr 2021 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFEzASxc1JqcNqRvKv47QdpZej2mZkmCYZTLblwB5X0=;
 b=p4CiawB48QRjP5DEzSyjsiOuHMtn5Sw07O65fp4IYCOi5qMaJk+pyzGhegxDB+IdLQ
 uJtt1wgZAwCHotGy4vnFV6Y6GlD8XOtggqSlPEO4y6F3lQhxf4gtydSatJXk7ZTovTMS
 HtAnO2prJKYwjTcgsWQeM7lmUgrlVvuggAPosmeGp2e8PgHjMw2xrb9Zeq7h9LOCa5PI
 3yRQqotK6ez56yc97WN3v+7b6xHxUE6XI2S4XKzQPgVk2ma0YkAta/uIS3Jd2Ka66As6
 YVgh0gJYpCgVVV9dDzys8mwHfyC+mSGr2QT3yRBfgB0l8ZlaZzEQew+VoUxDPjIyrcfh
 oL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFEzASxc1JqcNqRvKv47QdpZej2mZkmCYZTLblwB5X0=;
 b=XX5/z0pDORWByRxKR91s13LWNwt85Y90OaZDm7sHUyMbyqbsWqCt5I06a8CIV1hzaM
 PQti8HKNMtCfjbwwAF2pAIZsIvbuvzXx8swoTD1GRQdGVAHUhe2/uXJ25RoshniHaeXc
 2LYHElq2ToLwVr0Nbj2Tuw/3Ly9r8JcRWHZ39UDismIjC1+QDblEMQNyPnNNtBjVFoID
 3dNfbzBaF0o3V/8B3uy0+mPdr2SpBai+Kzg0ZOxCGJNiZGf3gmGr66YbEaMFlLFxh3fF
 GN5udKOcV642NliTKGcQJyDVBrt3ZeRSEGSbEVPyDZ99+eB0v4QjCSw9d+ky3MXuZCLm
 +KKA==
X-Gm-Message-State: AOAM530p6AZcDjlmBjnnfHs4PpKDKuswyNq1oMos4DH7EHxapcwZLTVr
 4Sm7fqmkR4WTUWJHr3wbzy/HX5j6dRYnX4IXrlM=
X-Google-Smtp-Source: ABdhPJytCaId03MYNFodGWm6D+7GzSxzkxMkuGIB/nHbeWbRxRmdRjbPIFMwAvCUBuvFdXm9VUnDSqzD3jNAJautXKY=
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr17335178wrd.327.1617721553409; 
 Tue, 06 Apr 2021 08:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210406133939.425987-1-colin.king@canonical.com>
In-Reply-To: <20210406133939.425987-1-colin.king@canonical.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 6 Apr 2021 08:09:21 -0700
Message-ID: <CAF6AEGuRvmBdiR=g4eVtxfYzsS_-XWc3kmdBu_3012CtwsdzcQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: Fix spelling mistake "Purgable" ->
 "Purgeable"
To: Colin King <colin.king@canonical.com>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 6, 2021 at 6:39 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in debugfs gem stats. Fix it. Also
> re-align output to cater for the extra 1 character.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index f146d9c5ba9c..4e2e0a93d17d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -979,13 +979,13 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
>                 msm_gem_describe(obj, m, &stats);
>         }
>
> -       seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Total:     %4d objects, %9zu bytes\n",
>                         stats.all.count, stats.all.size);
> -       seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
>                         stats.active.count, stats.active.size);
> -       seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
>                         stats.purgable.count, stats.purgable.size);

oh, whoops.. I spel gud..

Thanks, applied.. I'll follow-up with fixing the spelling in the code

BR,
-R

> -       seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
> +       seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
>                         stats.purged.count, stats.purged.size);
>  }
>  #endif
> --
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
