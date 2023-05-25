Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5E711821
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 22:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02F610E75C;
	Thu, 25 May 2023 20:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5410E75B;
 Thu, 25 May 2023 20:28:40 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-55586f22ab7so40356eaf.2; 
 Thu, 25 May 2023 13:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685046519; x=1687638519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKNlFiicj++lChdv/3D3sNNYrSPfiz6K08kKs405o0I=;
 b=pu21L3a6VrMy6kXBYonuVWC1FyydgEt+EcNYGJOQqHpygK8IclVh3wxrF+V/DzntBb
 IhJn3BewNOONlcqN3gIPbAkFp6xBwD4XJ33Ze27lHaizzCa0OaC6s3W1RPYFtcSMag2b
 PHVMf98o1rhFeidOuDcmvq6PAqEs3eh8iZtt/aDqSQg1QHLFLBmcoZzXVOJ/UN3ebVws
 O6VIrJ9JWVdfcdPuamqrsfEwnIejmnpJ1o/hekPBJX5pGcz1P1vFEFVisCVUwY+/LTU+
 YbIzXvZI7IiF7/bFs21IpP0CDvKAqWY+7OVDpLaL84kLkKD/B2WcepBPmnRHtsgAn5U4
 7qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685046519; x=1687638519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKNlFiicj++lChdv/3D3sNNYrSPfiz6K08kKs405o0I=;
 b=csuVEoLUSXVRvYzUFGNLaDEofyL3xcX4W1NLWrMVabZ/P9Dzzu4IacV0wE8nEuftzc
 Eyfs15oHHPbVTmo27uFMGWzMuqAX0NJYPks5nr3jN3wGLq645qvQZiQ1RsB/8Kn839Id
 1qIdY4qLCv4BknR5sXjGIA1aj4XyYfMeRcHJ12joH1bgRSjkMI8Mhe8563ptNueAWqGG
 BlOAr/oc3dX7hBPRhsqkpuWtGS6NJo5wz8cdnW9TXlYSqKjHPUCx/vGIizRTDOVhMV3o
 CO1d2Iio8AR+MGSxmeD767LDZrjVNu3noxwzrWCHCuC+IA8p9wJvpd9ax2XyLSbzlEpl
 yGsA==
X-Gm-Message-State: AC+VfDz/j6SnfdNLH6ANEWdGAMUy8LKWhBXaf7KciFtmyKrFqQVqhAWf
 HKnpfayAvMkXdX5mxZbMfuW3QFWWcEQdZvRMM7Q=
X-Google-Smtp-Source: ACHHUZ7YPCy5VU7PLAKnwUVDAqKrgz79mw3IyRfKgUgb2Plnl2/z8CLwxHuomouqCjF7tNL7qLg7sGRYWKR8ZMnbFKE=
X-Received: by 2002:a4a:2451:0:b0:555:3212:6e51 with SMTP id
 v17-20020a4a2451000000b0055532126e51mr7234561oov.0.1685046518811; Thu, 25 May
 2023 13:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230525155227.560094-1-robdclark@gmail.com>
 <20230525155227.560094-2-robdclark@gmail.com>
In-Reply-To: <20230525155227.560094-2-robdclark@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 May 2023 16:28:27 -0400
Message-ID: <CADnq5_Mh-owF5Q9iSOzJDab2i8s=vbupFrO5YKcivse-V5FKsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Remove duplicate fdinfo fields
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 11:52=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Some of the fields that are handled by drm_show_fdinfo() crept back in
> when rebasing the patch.  Remove them again.
>
> Fixes: 376c25f8ca47 ("drm/amdgpu: Switch to fdinfo helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Series is:
Reviewed-by: <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_fdinfo.c
> index 13d7413d4ca3..a93e5627901a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -80,23 +80,20 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct=
 drm_file *file)
>
>         amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
>
>         /*
>          * **************************************************************=
****
>          * For text output format description please see drm-usage-stats.=
rst!
>          * **************************************************************=
****
>          */
>
>         drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
> -       drm_printf(p, "drm-driver:\t%s\n", file->minor->dev->driver->name=
);
> -       drm_printf(p, "drm-pdev:\t%04x:%02x:%02x.%d\n", domain, bus, dev,=
 fn);
> -       drm_printf(p, "drm-client-id:\t%Lu\n", vm->immediate.fence_contex=
t);
>         drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
>         drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
>         drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
>         drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
>                    stats.visible_vram/1024UL);
>         drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
>                    stats.evicted_vram/1024UL);
>         drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
>                    stats.evicted_visible_vram/1024UL);
>         drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
> --
> 2.40.1
>
