Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EA050BF65
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B3E10E140;
	Fri, 22 Apr 2022 18:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD8A89AB9;
 Fri, 22 Apr 2022 18:23:20 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 12so9902629oix.12;
 Fri, 22 Apr 2022 11:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+e4BntlSJ6eS9gMNEO204GgU4j5QlVGYPmkYEN/7+0w=;
 b=llOz/bS4d527zVJ2EY0qyOmA8Y9sNZvjq/7iSiflH1OnFoDCyOwW0Ntzov/K7jKksE
 zceyjAASFQp0RnQZH63euLXwXXSc8x4oNJeZzMu5dkiPUnjSeLrp4SNYy8AVcK3kTIN1
 t2LNSgtclZTLSplOIB589ETnhaVXhGhuVDPE501hYU3q9CDQuWg8j/fvk9nja5+Qy9aU
 ZXlClbtz5odBRkMvQCSuFovlJ1rwnaZiEix8MRHt0RaIQW4mhUJ43OosY2Lf3xm3tYgL
 CgXWi8Y4r19/FApxvVAS3s7P0IYeyJIkpo86c5QX7VL9dmP234cxag9bZ2VxB1VmLuIW
 WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+e4BntlSJ6eS9gMNEO204GgU4j5QlVGYPmkYEN/7+0w=;
 b=Q2LItlczgf9MSlj8dIassS6mC3TA+bk0N4W4I20Ga9QBYZnINKUuED2jn7Y27zZSek
 ZCo/ZbX4RYvAQ3lA0vjDjieHBCpBEwGTQOEo+F1RocjyLpaz1JMgbb/1aJx0vijE4brl
 yLyN4tx2zqel9k7njyn8dksFbVoCncP3SKUu1iJIPOGnOMV4z1h0TdrYazSnStODugPL
 lMLC0Uftu5SUk2+JO8isBavZpe0ip0XDxMWv2XUbei7UALuhvch4O8EYbgcwxih4PSOb
 AoBnXSuWsU8rBsZH4SiDCBJMDdyxayssO4+q8duZ7Iyq9Ss7hlEQj6iWsKuvew71c1Bk
 YIOA==
X-Gm-Message-State: AOAM533AZiV7ua5fEZ0njZrA4zteU4Lgusc2MTA3u/4ZwkoUw1TB0cwA
 g7var37mqw4tMe9gPE0BpLHcgOljRL0I5B+z+PWZqnV+
X-Google-Smtp-Source: ABdhPJwhBuu62atsZ8fpp36cRof1utYWz0MCJ6T1bpq42QHi6pekge2EQre7emrZnKuU7y/iW6MivXk6TJH6fOP+osw=
X-Received: by 2002:a05:6808:1486:b0:2f9:e821:51d9 with SMTP id
 e6-20020a056808148600b002f9e82151d9mr3027385oiw.253.1650651799992; Fri, 22
 Apr 2022 11:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1650607437-22275-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1650607437-22275-1-git-send-email-baihaowen@meizu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Apr 2022 14:23:08 -0400
Message-ID: <CADnq5_NKJ2nC_2akBEX+7EOhgF-XsPjVw_QTHqKDkoA3G6qx1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove useless kfree
To: Haowen Bai <baihaowen@meizu.com>
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
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Apr 22, 2022 at 2:04 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> After alloc fail, we do not need to kfree.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index ec709997c9c7..5fb3e69c04c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1849,7 +1849,6 @@ static int amdgpu_ras_realloc_eh_data_space(struct amdgpu_device *adev,
>         void *bps = kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
>
>         if (!bps) {
> -               kfree(bps);
>                 return -ENOMEM;
>         }
>
> --
> 2.7.4
>
