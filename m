Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4D5FC6A1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F181910E150;
	Wed, 12 Oct 2022 13:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05D10E159;
 Wed, 12 Oct 2022 13:38:37 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u15so13210584oie.2;
 Wed, 12 Oct 2022 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=joLTVNTouxI+bu4m8Cy3+BuenzvdG1C2UbJSm6zfa0U=;
 b=UgFqP/Xo0NTI1fxzfk02TJGE9G1Xy26hBHd9hveQo1abKkM0mYVUFd/ByYXiKAHILt
 iMq/r7haGFNpJ+urBoopFLSqjkXkNv8OCgaReEa8YsjxOE+3aPaxephgrWUjppGKYHoD
 8LOUCSexqoRvafAoyRBFan3/kEUN5uGA009gGjNIZtoJfk2u2VWiccD1SpCwjDqCObYI
 65pE2vNGs3RaDmGYueVgb+WtNHwI5IBZkg5PeriPyYnhTaJBMJzMi1eKk6aTYhMWLRsD
 8TmMWV6h6qD1iY7DCq1IPn4jFtKMa7rfOQ6Q8hN3xJ7z+bsYA0TgRH6ozb3/89PpnOLr
 DsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=joLTVNTouxI+bu4m8Cy3+BuenzvdG1C2UbJSm6zfa0U=;
 b=FpmD8M9Cn2Eb6h5/Dt0+pOk/sIlL/KTONCtiGIc4w1DB+Cdyo6nDExmsF2DWtppF9Z
 tt2Fiuijv2mDBM9qkYNbp01xryZp/WtV3JTBWKRlQEUyX+449vpJD3zudLGYh0IjazPu
 rO9xMdf0aZO4Xw05Y6LTM+4Vmtd4k6a6+OLyWDi2RWVkP2gLD5yD0FSS6o2b+Bm0NPjZ
 jbzxSxbItA5un5We7h0IB/1PQkGFvlAXP2HruQQaXKzya5wbUHNjfezExPMQGg2WqncZ
 SZVilXJBNfyMBduGURG8dS5nLEuIAVGhudCh7RFCDz9dx2lI43BAr1ozf/n+evPBANYB
 TElw==
X-Gm-Message-State: ACrzQf1I0tJ1vNdSLZCBCzoQKnrOdeBNLn5UcDmEhCJr7ooeu7URPw17
 Ah5BK9FdQKqzetC/qhZOYgl9QtFYEJ6mlZXfkDu00qRL
X-Google-Smtp-Source: AMsMyM7A0QgukZ552j9gTwpiWgfXUyZugUbmENxFb7tjY/lcY2Ib0jT8wFfC655xViD6sNM9rLXZatNaaY4qeMvaNHk=
X-Received: by 2002:a05:6808:2194:b0:350:cb3d:ecd2 with SMTP id
 be20-20020a056808219400b00350cb3decd2mr2171928oib.46.1665581916944; Wed, 12
 Oct 2022 06:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221012073707.3456008-1-yangyingliang@huawei.com>
In-Reply-To: <20221012073707.3456008-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Oct 2022 09:38:25 -0400
Message-ID: <CADnq5_MtHkpk466NT=T81pX7H34ko3+k=24e70cNi7iOf-NKiA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/si_dma: remove unused variable in
 si_dma_stop()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 12, 2022 at 3:37 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> After commit 571c05365892 ("drm/amdgpu: switch sdma buffer function
> tear down to a helper"), the variable 'ring' is not used anymore, it
> can be removed.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/si_dma.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 4d5e718540aa..abca8b529721 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -112,14 +112,12 @@ static void si_dma_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
>
>  static void si_dma_stop(struct amdgpu_device *adev)
>  {
> -       struct amdgpu_ring *ring;
>         u32 rb_cntl;
>         unsigned i;
>
>         amdgpu_sdma_unset_buffer_funcs_helper(adev);
>
>         for (i = 0; i < adev->sdma.num_instances; i++) {
> -               ring = &adev->sdma.instance[i].ring;
>                 /* dma0 */
>                 rb_cntl = RREG32(DMA_RB_CNTL + sdma_offsets[i]);
>                 rb_cntl &= ~DMA_RB_ENABLE;
> --
> 2.25.1
>
