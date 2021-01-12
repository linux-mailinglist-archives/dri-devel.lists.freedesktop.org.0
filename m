Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4C2F3BF4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 22:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1A8941D;
	Tue, 12 Jan 2021 21:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0D5893ED;
 Tue, 12 Jan 2021 21:55:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id d20so3836871otl.3;
 Tue, 12 Jan 2021 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=znljSH1AVX8WCZj65lTt4Z1+9uZGjTLRkQMrZFvuyb0=;
 b=CV4VfIRWfi0R9/UOm+paur3SzGdcvRbnkHekd5JubxUHCQAkXkIK2Z9cPb8PyhpTvZ
 haIsTianWtYzprVnfWkrnh82ZIrr166EBK7zYtipvKQ5n9NNGntN7JLbKaq4gZJ948xt
 nN+TjGiXHKayMml9rDHdyTDexB6e+r6R6G7CBHE1lI5H4h4iKTSaHZCrknbDrNv0qjXu
 w0iqKcPKP2cg8Ua4vQsnKKJJoboI9vZH/xTWJJy4AcWJx0Fiaj46mMyBV/igT4sYxqcb
 VLTYIN/3uOEIVFlTkSCJjPKOqMpP+3QNeyPBUqcxB0n6+PGLbBGrCFnrA3DybcUqRzK1
 avFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=znljSH1AVX8WCZj65lTt4Z1+9uZGjTLRkQMrZFvuyb0=;
 b=nPdeuJAEB65M2j4/gmX3LLiPYwgW7ju3eNGuZo06orPFILwzPPZa0HJsfZPuRsi+/e
 x1eUWQsoSSVyPpNPbgq7GRUQFP3n/K5aPsnq4kVlGHqzp0pdZjyppeyp+fLLdI2lF5qJ
 aqS1LIrXlpBnZCzi1AYK4Vy0EmKUOsXYJUwuQTRFHwLyp+jMf1C8TZPF9PYAdAv76AMF
 v7dl1x26ca74dtjKddrq0FkXOGIa9jOuoBwW/WEZt8KQl/N8tVRuWkZryXSuK9kTchew
 g6uQc5nVKV1AUyQ0gbNxdw1gIN9PHREqdjj6E1rOxu4Y/DBPBoaxt3WOHEIdvG1A/fFU
 +F7Q==
X-Gm-Message-State: AOAM533UUfN1HmAuKV7iQUyadDXVV3EJeffbMV6ggkypLd2n6kRrd45L
 18k7e315Y3ZnjG818YnFAhZcvnP29BhPzbGXPsc=
X-Google-Smtp-Source: ABdhPJwR/ymc04CZJMQdWGDMKno7UUdM4OLE4UWCwA6cNKKLq9gjW0kQ1EOAWWo6yQOox74aWqAH8fBH3/5czIA5ZxE=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr1050326ote.132.1610488542949; 
 Tue, 12 Jan 2021 13:55:42 -0800 (PST)
MIME-Version: 1.0
References: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 16:55:31 -0500
Message-ID: <CADnq5_OtfqEHXopb=CiY7YQ4otGoR_DUF8Sirv0Yob=Fe4Nv+A@mail.gmail.com>
Subject: Re: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as
 static
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: Jinzhou.Su@amd.com, Xiaomeng.Hou@amd.com, Xiaojian Du <Xiaojian.Du@amd.com>,
 Dave Airlie <airlied@linux.ie>, "Lazar, Lijo" <lijo.lazar@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Quan,
 Evan" <evan.quan@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 3:23 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> kernel test robot throws below warnings ->
>
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
> [-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
> [-Wmissing-prototypes]
>
> Mark vangogh_clk_dpm_is_enabled() as static.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 75ddcad..3ffe56e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
>         return 0;
>  }
>
> -bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> +static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
>                                 enum smu_clk_type clk_type)
>  {
>         enum smu_feature_mask feature_id = 0;
> --
> 1.9.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
