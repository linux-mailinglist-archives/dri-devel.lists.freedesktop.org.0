Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AF4D9F1A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F3210E534;
	Tue, 15 Mar 2022 15:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238B110E534;
 Tue, 15 Mar 2022 15:48:47 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso24723533ooe.6; 
 Tue, 15 Mar 2022 08:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0oBLK/WFMknYvKURGJIli6IvZDSQNi3zYIXFNVj9K60=;
 b=nYXBpvzGCEAvTjaVlPXhhHMWazEYvb5pBevKdKZrjbGvbas2C9XkIkGgKnPSBJx/OF
 ujaLhVNXscYH6hsNZWsciYzPdDO19U+K3SxeC0+Uqu+Jfr/qH9xiKYGckvY/7cXtP5lf
 RCA/RZfA0X8TdmrbV3KdffCBCpo/II30WreXLAhARRalIdmIed+r1m3QitVwpy2IwCMs
 62SDjBWk17V+nXt4xMdulGtjv16tb6M8G7nGa9xeZz3/hszDY/5SZpuIF7RnPuTy11BY
 KCRX/TRy7f0oVaCFoDOTllgiJoJBhSP5ihb0GLutPg4qtuU6eqSGqPKLGO6jYdF+t/KH
 HIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0oBLK/WFMknYvKURGJIli6IvZDSQNi3zYIXFNVj9K60=;
 b=p8rspFqhynAsqiFa4oGs2Sp98LZ3JnSyY2nKPtdNBXycNA12scH8QCSHq0E/lj9JrH
 cS+xyKI3idBYshkkqq+jebBLHXZrbH/BkJx6meZCZ5MhKpTq+m32oHOBBG+p9tRaMy7p
 hZ5xBSExSKuy6uqpLG1i4mCY5S+eZFV2zDhSeK9q9PTxIoVCHoy3pU0x2/IFeT/vTiG6
 aVNCR3omxLON6msxHZ6V0Y7mWeg7CNMR61bAV6DEo3hcp1p9sKOtiWk2ErC4Jtlx7NcC
 qPP8Wgk14BLQiHaAnLW8yMeArq/oEAvVOHIoUWF438LOFzvEdw2ylbK30GhjiygxgfXG
 +75A==
X-Gm-Message-State: AOAM531maFOlRQQEaBirX0Jw0Ey+GFOY3xjjBlsLxjFh3mO45uwoKWE0
 HqUv45sdnBLgy02XOm7M2VIGYJ3NOzhMr4fifWY=
X-Google-Smtp-Source: ABdhPJwpXOt0Mp8zlogrF70BHsQMg5Vyj96T9pKbpTFbnXrM3doKh9nhd30RmJatM32y9hkuDtFUuCQXArbWCE8AUXE=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr1816757oao.253.1647359326455; Tue, 15
 Mar 2022 08:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
 <20220314115354.144023-2-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-2-Julia.Lawall@inria.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 11:48:34 -0400
Message-ID: <CADnq5_OveiyS80yF=COha1iuAmm7NBay1q0JogkqcxqJ7ie=JQ@mail.gmail.com>
Subject: Re: [PATCH 01/30] drm/amd/pm: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
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
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Mar 14, 2022 at 8:01 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index cbbbd4079249..5cd67ddf8495 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -1870,7 +1870,7 @@ static ssize_t amdgpu_set_smartshift_bias(struct device *dev,
>         amdgpu_smartshift_bias = bias;
>         r = count;
>
> -       /* TODO: upadte bias level with SMU message */
> +       /* TODO: update bias level with SMU message */
>
>  out:
>         pm_runtime_mark_last_busy(ddev->dev);
>
