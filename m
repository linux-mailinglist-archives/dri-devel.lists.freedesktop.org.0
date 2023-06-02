Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32D72039E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449E10E084;
	Fri,  2 Jun 2023 13:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEDF10E081;
 Fri,  2 Jun 2023 13:42:25 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-392116ae103so1309883b6e.0; 
 Fri, 02 Jun 2023 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685713344; x=1688305344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LYau0cpbmF2229LuNjRzjCtrizI+QeTZguYhYONJy44=;
 b=Q3KewNjK/7pLX444EB0kKH6U91G8KeWRicAYJ9sG+qg1EK9VZisOmZZ4xM8lyvndEW
 wht5pV3zDDJLXAOhM4xqKRQ1iCnRner83eae5AJ/bkWDga+l9p0G/mtSOnOOaxwWBVSo
 vTCX3Rd8svk/OGRh2z1Oo3oLHUq+HfcT9pZ2g6gnEsXftTeeLkWQN54JtVJzYPw7BK1g
 gIdMFSINk5CjJw2cDf8sb82kPAL/Xw5J0ifqFD644+aGHt1zw4LSnOvSSA/dU2gjRaDr
 tLauubkp9tx5gD69U22mx4hjvBoQgumRryCKVzzrw+QCJdzg3MpslEOD0rkbtrEfDksL
 5rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685713344; x=1688305344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYau0cpbmF2229LuNjRzjCtrizI+QeTZguYhYONJy44=;
 b=HoiF2Z46m3/DXEz7sLKJ0rVGMqzGI+6W3qdbUvb/BEEF9mmUV9/0foQBpdWBHCRM3j
 DWh16orXuh+XDJqBzxJHhU7RVu2mTVMx2s/7TpQMO5qt0SnwZJIfXL7uYdoz2dDm8AR9
 eHeFKxBhI24qgbE8TXdgiUSgXrScKjeSAUK3VO9aC0exMtsiq8Uo+Dyd+6R4w+w22Fy3
 sqPkzqFgR/2PcDb0w82skCgYE5PuiPQdoi+CGSnmF8mDi0VQ/SIqlMaqNc6QH6Gqw5ly
 2XQEXAcarIn3c4OiI4BMk9ijML8+wlCvNnvBlFHCAX9AtKou02tWKh2XMmI4FZCXEGlZ
 pxfg==
X-Gm-Message-State: AC+VfDy1uSVe7J9GX/p63MtFtWZu+CZjxUoh9TNCcTeLWx0fxfWy4+vg
 4Tw1VzL5UgZUjdREqZA/zhU0vlYlOibGuud3Pq/ved/gaE4=
X-Google-Smtp-Source: ACHHUZ4d+mPkSE0hu7HbOz7ZkhsDyhfO7It5De8ZVs8k1eJrsdMkPa7OxS3RePrIKnDAMZGlNipapCXHq7t4gt5/JvM=
X-Received: by 2002:a05:6870:709:b0:19f:ce38:f01 with SMTP id
 ea9-20020a056870070900b0019fce380f01mr1358399oab.30.1685711797050; Fri, 02
 Jun 2023 06:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230602061650.115385-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230602061650.115385-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 09:16:26 -0400
Message-ID: <CADnq5_NzXJezQNVSUY4D9cWg1TuBu3AS_HEmQFaoQHuczQeVbA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Jun 2, 2023 at 2:17=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:614 amdgpu_gfx_enable_kcq() warn:=
 inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5377
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index a33d4bc34cee..37a8f43cf281 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -611,8 +611,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev,=
 int xcc_id)
>         kiq->pmf->kiq_set_resources(kiq_ring, queue_mask);
>         for (i =3D 0; i < adev->gfx.num_compute_rings; i++) {
>                 j =3D i + xcc_id * adev->gfx.num_compute_rings;
> -                       kiq->pmf->kiq_map_queues(kiq_ring,
> -                                                &adev->gfx.compute_ring[=
j]);
> +               kiq->pmf->kiq_map_queues(kiq_ring, &adev->gfx.compute_rin=
g[j]);
>         }
>
>         r =3D amdgpu_ring_test_helper(kiq_ring);
> --
> 2.20.1.7.g153144c
>
