Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344A55347E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 16:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5364110E247;
	Tue, 21 Jun 2022 14:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E0B10E077;
 Tue, 21 Jun 2022 14:30:10 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fd6so16876966edb.5;
 Tue, 21 Jun 2022 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmyUppEAbHEw40UHdzEMcMYioES0t5g3cXHjzlejo6I=;
 b=hzoq/W5TmKdJsmBhVvm014iKS/gQsMH0dIMooz1q2kjGRwwR+q7LaTJx4L8/jAFCae
 AmfKaKVVpm2TacyaKEKZG54rd/XT5Q1hNL+MKDxBwJFrOHy8DWSyu8Yl9ua29AgKkoVK
 65pfV/EKbrxV6eCP9VaiWYslQB4jhI8VBewDHFUf0aFicQee0hPR3zgg96zak3Wm3Wp8
 yMJbSY7L/zH61A27mwlfzc/Fa/WneHMN9k3FrR8KqloRELKaKhY44rmvWFvKef38TzC4
 xz1gcNiahV/jruiuIaNHUkedmJWI835SUj8I4sZ2S+WUJ+FVHvK4GrNzLojev7pTRT4S
 cdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmyUppEAbHEw40UHdzEMcMYioES0t5g3cXHjzlejo6I=;
 b=5Y80Wp90VDJ9uUwYzeEPGxBCLXiErKoansvq7HSMGLusMeUnkNHZ1Vj7fxPfv0M+RO
 lXsDU04bPatGpX5YozCFPOYDZAjoo3YhHQRjPJC0OlUQOEEtf+hFnimmW80hp/koRo87
 cV32jV2ScGxjkJsRnR7gdQr+EzVBLm8FS3iWXHpZE02zW+ddqYw5k6HDSj7yJHp5YQfW
 rlFayN505WbX6CSZV04iGifl4tYkMEe8EoFnHuA+vVJI3oB/DD1eku7tfDRczT0A7Ire
 3thds4viWOdGER2j5tr1mlExMGKieW1jtBjk1amDmrxu8/l/P5UX4R21VaG3eEsqxEF9
 hMrQ==
X-Gm-Message-State: AJIora/CkRMhVkuRlNkcKfeL+oZgm/cGxvxfS5PZem0tLC+Bfsh/Nh15
 vkHiUHn2cGGXIeTEcCaa3BMM6Bv4S+OJqaPsYig=
X-Google-Smtp-Source: AGRyM1skIT1zie/U8t4CrgIh821FCoNNzShxUjjckoKmUGsshKj/ON1AA+2CiyhmuGbjMtV/MY5jjSrsIiY1RDf76aU=
X-Received: by 2002:a05:6402:2933:b0:435:80dd:f75c with SMTP id
 ee51-20020a056402293300b0043580ddf75cmr12579482edb.302.1655821808373; Tue, 21
 Jun 2022 07:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220621131041.129513-1-jiangjian@cdjrlc.com>
In-Reply-To: <20220621131041.129513-1-jiangjian@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Jun 2022 10:29:55 -0400
Message-ID: <CADnq5_NPrY-=jbKOxWCggD2UukxCXVQhVthbybvviWdkyZXbww@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: vm - drop unexpected word "the" in the
 comments
To: Jiang Jian <jiangjian@cdjrlc.com>
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Qiang Yu <qiang.yu@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Eric Huang <JinhuiEric.Huang@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Jun 21, 2022 at 9:17 AM Jiang Jian <jiangjian@cdjrlc.com> wrote:
>
> there is an unexpected word "the" in the comments that need to be dropped
>
> file: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> line: 57
>   * the kernel tells the the ring what VMID to use for that command
> changed to
>   * the kernel tells the ring what VMID to use for that command
>
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index dc76d2b3ce52..8530befb2051 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -54,7 +54,7 @@
>   * (uncached system pages).
>   * Each VM has an ID associated with it and there is a page table
>   * associated with each VMID.  When executing a command buffer,
> - * the kernel tells the the ring what VMID to use for that command
> + * the kernel tells the ring what VMID to use for that command
>   * buffer.  VMIDs are allocated dynamically as commands are submitted.
>   * The userspace drivers maintain their own address space and the kernel
>   * sets up their pages tables accordingly when they submit their
> --
> 2.17.1
>
