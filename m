Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651851B5D3
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D1810EDEB;
	Thu,  5 May 2022 02:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05210ED83;
 Thu,  5 May 2022 02:24:30 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 l9-20020a4abe09000000b0035eb3d4a2aeso509029oop.0; 
 Wed, 04 May 2022 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D1b0HeUhFBeNKN2FYsIQkaN3rxaQMWP2KFVM4rsp4jc=;
 b=UZ0DrSh8fY2ykyDbM3LBeIwSBJ9QEY3Kgh7jT+0AADbpCXCf2WJxAxNfPXedRrbY3d
 XpibHEhpyIk1HyqalJ5MvHjYDejYiDn+T0nabIGwcCDckEEmWoWlWRV31Tk0P3eM4pSa
 0pfKhKWMAPSSaHkdeX7yX+1vOKWw8jvvWTjQThmO01WHVT77x4L0mKv8qJ8s2f1l5W37
 U5BlcO0OvQMGPaG6zrL/dr4pUIqOKmJHyHQ8w6fSgfeQy/wus68WWhUwYmRDA1y4tSFT
 eeEQaYOliZjS12LRzktPizxhlS8/mVvDOu4nY3/7VWQ9uA+gFvw4+f0C1EvGbmObs8qu
 uKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1b0HeUhFBeNKN2FYsIQkaN3rxaQMWP2KFVM4rsp4jc=;
 b=hypGKS6IC+L5tjPE13svmzhBDnU5iGtHlbc/7tfNlLHNEs587k7z0GU88geO70x9S8
 TYesrsxENmITzBMN+49MbCzbGP+yvyhFT+JYo8dlzN51ezLr1P/T2awkV11jdKVWhn72
 V/TZsFXfDvgitvr1aLDOIA7dFb6nFxi8HHj/MtE6rYZ+vYOj/rgTYGbdctvcH7lYKJPq
 aRuvgp8+dPOjYe6pfiexcsb68kSntiVdcd3UJS1VPimyMKEBExUHQmomKjNN4SXu7k1F
 pwQ8j4zJsuT9EHrYQP/73FjZhX0nUN00hpW7CT3wFXwcl37IsFngEFqvo+gkV3g4pKUv
 YlwA==
X-Gm-Message-State: AOAM531RCtn+QZjsqfuhTChIM6xO2pxjXei7xKZ6HYPBJGkGLrN4nuhe
 4ePzkCzF83aOLtX+iD0P7hzYPMQpgBBtKiqhJYo=
X-Google-Smtp-Source: ABdhPJwc1+OUJ0Ez3LmYL0k1WAFwiwBeLHeltqdtrVuvvYg7f9LzA2gXJvus9VH4s/4b1m8U6AfEDSHe0AlMr82SHR4=
X-Received: by 2002:a4a:e2ca:0:b0:35e:b623:8799 with SMTP id
 l10-20020a4ae2ca000000b0035eb6238799mr8437220oot.68.1651717470097; Wed, 04
 May 2022 19:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220505022239.58334-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220505022239.58334-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 May 2022 22:24:18 -0400
Message-ID: <CADnq5_N1yG+Jpg-+0R=Xo4DL0pgnwb_bGEY+TUBXTv1v94-_KQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify the return expression of
 vega10_ih_hw_init()
To: CGEL <cgel.zte@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Zeal Robot <zealci@zte.com.cn>,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, May 4, 2022 at 10:22 PM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index 3070466f54e1..cdd599a08125 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -521,14 +521,9 @@ static int vega10_ih_sw_fini(void *handle)
>
>  static int vega10_ih_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = vega10_ih_irq_init(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> +       return vega10_ih_irq_init(adev);
>  }
>
>  static int vega10_ih_hw_fini(void *handle)
> --
> 2.25.1
>
>
