Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9AB331929
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FBF6E1A5;
	Mon,  8 Mar 2021 21:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA176E1A5;
 Mon,  8 Mar 2021 21:15:05 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id u6so5189547oic.2;
 Mon, 08 Mar 2021 13:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bK1egWRIYmAM57JGkevuvF9LMdJfxUITtPUiQtDDxH8=;
 b=EenPaZb8C5Pijx6LJUC0kSF/ossy/pi8y6ZPOsNrLIEGnRwr+gDjWinvE/IfeHPl0B
 Kwqh/gBucHSUJfPse7F9QsHL5OVGBnSGQKBvNrth5IPfVHFNyAmfGDaYvPsFCY8eKkYv
 25ug1JFNnNqDwSqXhPd0HUU13YhGyUgxMOVAT1MU7U4Z+1YfDTV3KW3E1ViLyLdhUkBV
 SAD5oPTvLGBS5fHJQG28JKAG4kv/V74CAvHXT4uTHKMVl7klbfdMvgelxr1ug53dP26X
 6F0sQtG4CBIVgJMwx5RxRaIkQXs4YjFcBFuQUz/WOVlptAMzm6R85WPpyqUIMnBigfch
 JLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bK1egWRIYmAM57JGkevuvF9LMdJfxUITtPUiQtDDxH8=;
 b=iRMWvyPE0x56Zv6NPAjsBKeN+bndUwDIXxLCewY77u5+ms5NSJKES3pXMLWyY9KEcA
 CfopdoUVMgXRyjb8fqZ6MM38T70hShhPzkscge38IPKeYiLIB/pH62eFPkYFtEYUVil3
 mAx94RM6TDlwLhlgQXS9dx2WW+YMncklpv3mfvPHM8u4+36hIyfzSqkPzr2gmutUpMxO
 Yng5WyiEU9faB8wqPEDp1XszvdECS9sZHnczcueZIGg6JGnDWPYeDG64z7UolziTamnY
 mdvKf/WfqLPSpmvoPhMp47g0GKBl+u4OcQ8p7DhMkcMm+gRpWesCz0LmW0n/gAJFr4K0
 woVQ==
X-Gm-Message-State: AOAM533dwntXhEIhvjsjdyJKalfAuw/G/r+3cSf/icIUna3BH0wXTmfO
 zF04WLeWOknZt+7B1y0xrM6TJM1t1MQ8INZCEhgWVN4L
X-Google-Smtp-Source: ABdhPJxScjMLq05XElf34SOT5GTz4dxjnLMllur9XID5rsea9TR6bipOie5rALc2/DMyuKzAGrR7QNAHzksvpQaARGw=
X-Received: by 2002:a05:6808:f15:: with SMTP id
 m21mr606723oiw.123.1615238104977; 
 Mon, 08 Mar 2021 13:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20210305035428.6750-1-baijiaju1990@gmail.com>
 <DM6PR12MB26198FF9499CD3ADCCF93546E4969@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26198FF9499CD3ADCCF93546E4969@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Mar 2021 16:14:53 -0500
Message-ID: <CADnq5_MquFxnRxLrfjrUL_jcj6fSi=5ymuDS5ovMRiBJH3odMw@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: swsmu: fix error return code of
 smu_v11_0_set_allowed_mask()
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Mar 4, 2021 at 11:02 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Public Use]
>
> Thanks. Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> -----Original Message-----
> From: Jia-Ju Bai <baijiaju1990@gmail.com>
> Sent: Friday, March 5, 2021 11:54 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie; daniel@ffwll.ch; Quan, Evan <Evan.Quan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Gao, Likun <Likun.Gao@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Jia-Ju Bai <baijiaju1990@gmail.com>
> Subject: [PATCH] gpu: drm: swsmu: fix error return code of smu_v11_0_set_allowed_mask()
>
> When bitmap_empty() or feature->feature_num triggers an error, no error return code of smu_v11_0_set_allowed_mask() is assigned.
> To fix this bug, ret is assigned with -EINVAL as error return code.
>
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> index 90585461a56e..82731a932308 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> @@ -747,8 +747,10 @@ int smu_v11_0_set_allowed_mask(struct smu_context *smu)
>         int ret = 0;
>         uint32_t feature_mask[2];
>
> -       if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64)
> +       if (bitmap_empty(feature->allowed, SMU_FEATURE_MAX) || feature->feature_num < 64) {
> +               ret = -EINVAL;
>                 goto failed;
> +       }
>
>         bitmap_copy((unsigned long *)feature_mask, feature->allowed, 64);
>
> --
> 2.17.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
