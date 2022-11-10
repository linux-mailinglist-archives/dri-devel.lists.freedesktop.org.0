Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341946245FA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 16:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8010E79E;
	Thu, 10 Nov 2022 15:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B42F10E1C4;
 Thu, 10 Nov 2022 15:32:25 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id c129so2212312oia.0;
 Thu, 10 Nov 2022 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YlufS2rrpOl6bjQHbeYc55nowELOVd0RziNpq3gmm5s=;
 b=nTWfyV0q/cj1yBtveVYWeJB3RB7gdN7CkYcms4hpuiQvVOWuDl0KENvnKsC2gf852D
 hFNJL3z5mZKzDB0kQPXuSZIa4VhNZydaqVvBQ5X3zwT6nbEgiameGxdKRZi12YplLCjX
 mCg38+o+i1VFTsbD3Ik3T6HWAh9zQBQqbDY560eDw3k2hygBWg5oyZMs0Iqo9ZXtTtAp
 0/PATR42Vg30OrGguo9cAHr0nWPmTp6m2osuDBuywOIZ0XODlu4k1e9/kU/gA6qLoL3W
 6LZd51mzd1NQkUxQ83SgxsGUxUHuyk4b0nvTxaEKadNvbrM+At3Y1UU+RW3eZ5nBHm8Z
 bh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YlufS2rrpOl6bjQHbeYc55nowELOVd0RziNpq3gmm5s=;
 b=k6tSgg1wM1Nq/x72tsOAmFFD2tOHDw0hcJV8ElhfkJRst+0/J65vCo/wItzthehS77
 rhtF8b5oMonQStcBNyNCJHI39wWRWZmcu4mhdIwx3d2/oSJ2vTiDxkz5RMe4MLBmqPb6
 KtjBgYrgx7ARS0IsKFQnwiRToodexd2u1ULlGUMnrxeotVWJIqwQg8ap0ZxRM/5qRpYW
 Qbg/CBCm3sUzGtx8jBoVapfrDV3e5oV31cZreVxfcwvkVwOh6vMzne8J6Y9vmdeMBFyl
 SzrmXUR2YdS/mwjVGU9RpEhZ05mLXNTzGyeQ7sM3Jw8UYZ0Fl0ruI0k7OKAdD8NykwYN
 0zAw==
X-Gm-Message-State: ACrzQf3Ksfepx3LwydqN38fr/miutXFcHskic0ECkZuJ9JRBy9d0iGJ/
 ZBJZ4LgYmX5+H6JnYtP3Pg8WPW1rzif8Cl8dGWI=
X-Google-Smtp-Source: AMsMyM6LHdZ/ETlKX9/b2JupO545+bEo2gtzg6mF3208MrJpNACahnUFlIlVARaay9tKV9WLzl7Khj9HrsAiu9bV2K0=
X-Received: by 2002:a05:6808:7dc:b0:34f:97ea:14d with SMTP id
 f28-20020a05680807dc00b0034f97ea014dmr1559347oij.96.1668094344285; Thu, 10
 Nov 2022 07:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20221109093122.6566-1-liujian56@huawei.com>
In-Reply-To: <20221109093122.6566-1-liujian56@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 10:32:11 -0500
Message-ID: <CADnq5_Mg6tX3e2HgPY+V-0vm4V2eGDb7ZQEba8KkY-=6NWv=Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: delete the duplicate .set_odm_bypass
 initialization in dcn314_tg_funcs
To: Liu Jian <liujian56@huawei.com>
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
Cc: Charlene.Liu@amd.com, rdunlap@infradead.org, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, duncan.ma@amd.com,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, michael.strauss@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Nov 9, 2022 at 8:51 AM Liu Jian <liujian56@huawei.com> wrote:
>
> Fix below sparse warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:244:18: warning: Initializer entry defined twice
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_optc.c:257:18:   also defined here
>
> Fixes: 5ade1b951dec ("drm/amd/display: Add OTG/ODM functions")
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> index 47eb162f1a75..58d38de6a0f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
> @@ -241,7 +241,6 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
>                 .set_dsc_config = optc3_set_dsc_config,
>                 .get_dsc_status = optc2_get_dsc_status,
>                 .set_dwb_source = NULL,
> -               .set_odm_bypass = optc3_set_odm_bypass,
>                 .set_odm_combine = optc314_set_odm_combine,
>                 .get_optc_source = optc2_get_optc_source,
>                 .set_out_mux = optc3_set_out_mux,
> --
> 2.17.1
>
