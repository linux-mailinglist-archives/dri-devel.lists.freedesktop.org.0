Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949F5267B0
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 18:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A62910EAFC;
	Fri, 13 May 2022 16:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E43610EAFC;
 Fri, 13 May 2022 16:57:43 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so5344512oty.3; 
 Fri, 13 May 2022 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7inaUSclrf0VoHqtvyXb/+X2/367hf5aKqzQDTPP0w=;
 b=dmrJnjeUII3S5RbtkSzGhvHYK+zHcs0jNahICu8kyZal4PwidiPCR8MXTLSss19D9e
 xaSsvyZmh9pAVCzBKCjqPupfbsCBVc4oD8fiZIY78PAdar7S2x1o6H2dQN/PHuS4/+Ge
 mFf/j+mmuCNN776nELbHkivXdWsaqtFw5q8tbEST9hUvoOyEawC1CHHbtFCwOFetptVl
 nsOJviRovcwSWCHChEFQDxCGlhU67YZ8JQgbUhkEovWbK0Ddj2tTMyBXE6VH/NXsjPil
 28y376u5hCKOEkhz4pdKFUgpTomLaMmumQF9GVYcwQ+IJkp6nH+CJzIXNgWLODambtnD
 oWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7inaUSclrf0VoHqtvyXb/+X2/367hf5aKqzQDTPP0w=;
 b=tSZ/IiKSm3vF1Oxwwb39fxYaKWiiK1bptJjMq7bHMscNwZ8XbIDZCnKHmTQ99U3RNq
 OJpXrnAGnk2QtaYVdapvO8G2HBGUI+K9tPzg3jP5tnwX0GOVOJ2RAX0v3GKZuEhpM2vZ
 ZLsBQCtgCa7Yuaprj9eXEsBSDY020SAQxiS0u7cf1Oh1akABDNQD6iy4lXrJf7d81q8L
 T98GHMvBxH3YKqsBah5aTswnjwamXoqbcpgizUQLInwWtXxsf5OznUpQzHg28I9ZvtrH
 DnwmD/tgF5CMQeuY/f06kP2grSeczSJi7KKtrsazMlD7P+Zx9gU3Hiee3O3sPH214Cs3
 S1gA==
X-Gm-Message-State: AOAM532/fPIvNp/KdNhpGoHLsXntMQ7yy3jvI/ktKNpygieIqNbJ8k88
 f1FgejtQVzFCNna+lnfKepEfu3xY91AnIQOb0XBj23QB
X-Google-Smtp-Source: ABdhPJyS8xlu00GejRMagYrsXXjuTB9+4YR4559CIPKjUVksi4LMvOtB1f54GGhUBnv4wW2Tf1tGLa/KctH0vmH00ek=
X-Received: by 2002:a9d:195:0:b0:605:eb43:5b84 with SMTP id
 e21-20020a9d0195000000b00605eb435b84mr2216769ote.357.1652461062958; Fri, 13
 May 2022 09:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220512071934.119922-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220512071934.119922-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 May 2022 12:57:31 -0400
Message-ID: <CADnq5_PvrX_C96=PDk-+hk_BzqtLZ8LvUqWtLKb0gm30Y-s8Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 12, 2022 at 3:19 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9687
> amdgpu_dm_atomic_commit_tail() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e2b57cf6506c..a92cfb055c15 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9681,9 +9681,10 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>                 dm_enable_per_frame_crtc_master_sync(dc_state);
>                 mutex_lock(&dm->dc_lock);
>                 WARN_ON(!dc_commit_state(dm->dc, dc_state));
> -               /* Allow idle optimization when vblank count is 0 for display off */
> -               if (dm->active_vblank_irq_count == 0)
> -                   dc_allow_idle_optimizations(dm->dc,true);
> +
> +               /* Allow idle optimization when vblank count is 0 for display off */
> +               if (dm->active_vblank_irq_count == 0)
> +                       dc_allow_idle_optimizations(dm->dc, true);
>                 mutex_unlock(&dm->dc_lock);
>         }
>
> --
> 2.20.1.7.g153144c
>
