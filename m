Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179FB3E4C42
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ED389CB9;
	Mon,  9 Aug 2021 18:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1B89CAF;
 Mon,  9 Aug 2021 18:38:00 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 d10-20020a9d4f0a0000b02904f51c5004e3so14688972otl.9; 
 Mon, 09 Aug 2021 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hF3J2nitrZIyoEjWGUnb52bS6szzJmi/8nrZtEgocBU=;
 b=nG+VNsdWX0azIvITBY1SWd1dBDzHOWEdGeeHzzUQlULUMr+ac+/LKqK8jMNvlawmWK
 m4P4bhIIcQMmI+1JUUuuWykgySO49NH6/HbEkPQ8wP15Xr7MRcgjQnFAif5yeBdShHqx
 C9VqPpebmHRgzmp895zZfWaKxkUEjR5r320OFNGBrhnFtT5g5ZbXbwgDia8em/GMnZVi
 Ly1NPZeLw6KvJVTjKMWk9Lfox2+pVeKPAIvMAm6rh/v5lzpAkmB46c82okHEC5+ssVa8
 5Uv0npO0b9orvvYX/wuX0cpqjJqebj+jfSvvs5rVleoEIooUJZ6rIoBeT6l88RtwE3ng
 n36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hF3J2nitrZIyoEjWGUnb52bS6szzJmi/8nrZtEgocBU=;
 b=J8D0ru//C+En7UewbJfDXfNVMV+KcTjqZsGXFWUgQ34Hcmbx9Jejfgy2P+K2P5ANE3
 bHncTBvsctW2FtlSnhi5e6kd+OlwDp9mpkqNRGklSj89FxkwaJtHdwb/XtFJDD3J6sGt
 JlNs+RXfHfh2NsXeHptjkLbEEQjWY3xg3FZa1KQVv3Rm0N3JJukBGKMG9JmT0M6ccc1w
 lMg5w2AZOPQ7DGRhXEXa9FjOMj8pM7Z1LNdaqd/srl+w0rW/fnJ79q1fsRbXBC0gi/eD
 ivJAsQZF7MkJeOKz5JVMXTiz4yNvRoUR/TV/ROsE1obxD29BnWA6VhtOlp9GvjbA1QjR
 dfOA==
X-Gm-Message-State: AOAM532w3Uq+QOsFvbqB3ZqicyyVMubYtw4aPLuEjXZVJTcjSU5kOAky
 FtLL9DseGqlYJdNPLZ8Shf77G9e96F1FvnWC3Ak=
X-Google-Smtp-Source: ABdhPJzUNyO2F6LNmKtN4pThy7CkMaQ+/UixJOOSIsBEA4eAMFcUvyU32t6qyIqEXOzGOTYAEjsF5aA+euDrIko27Xc=
X-Received: by 2002:a05:6830:1e78:: with SMTP id
 m24mr12195440otr.23.1628534280053; 
 Mon, 09 Aug 2021 11:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210809120050.679048-1-sergio@lony.xyz>
In-Reply-To: <20210809120050.679048-1-sergio@lony.xyz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Aug 2021 14:37:48 -0400
Message-ID: <CADnq5_NuDDMaKzAm0pRo1dQ-PQ+niibM7u3_1vcAvC4DnP4Ufw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Removed unnecessary if statement
To: =?UTF-8?Q?Sergio_Migu=C3=A9ns_Iglesias?= <lonyelon@gmail.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Lee Jones <lee.jones@linaro.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 =?UTF-8?Q?Sergio_Migu=C3=A9ns_Iglesias?= <sergio@lony.xyz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 9, 2021 at 9:59 AM Sergio Migu=C3=A9ns Iglesias
<lonyelon@gmail.com> wrote:
>
> There was an "if" statement that did nothing so it was removed.
>
> Signed-off-by: Sergio Migu=C3=A9ns Iglesias <sergio@lony.xyz>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_fb.c
> index 09b048647523..5eb3869d029e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> @@ -273,9 +273,6 @@ static int amdgpufb_create(struct drm_fb_helper *help=
er,
>         return 0;
>
>  out:
> -       if (abo) {
> -
> -       }
>         if (fb && ret) {
>                 drm_gem_object_put(gobj);
>                 drm_framebuffer_unregister_private(fb);
> --
> 2.32.0
>
