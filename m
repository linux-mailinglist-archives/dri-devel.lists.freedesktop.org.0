Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CF5B366A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A4310ECA7;
	Fri,  9 Sep 2022 11:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F10610ECA7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:32:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id v16so3244277ejr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SZHsUiERmS1OiRclpw++WSMWCMLSWrTWxLeIYpyoO6Q=;
 b=AtOK6o3UiZ8x4mhjnDJ/pBpLJ1neGtLe4RE39J5d0HHYeXSt/LOPJzFHYk2zvuknsZ
 T3f/PJxyPN1HEmdG7CdvH/8VI4PwA8Uja31v9vOlzqb2Kf++b0LaC5tpi7MM/P3XyXxE
 NUa6u09UvQf7gvibLmyaa6BoIYwApwyDrvudeJfV7bWJ6948xUawLw7ZUp2Yxh56vVZb
 ogbwxtRwFTZy+f/G4glFWWrs/vEHHbbiA3qy/QbN7PCeAn5R96Sr82z02bZAkLAAjbov
 v/KJz6yLif0oDWy4Ghk97sGQraIKKC8GaF8Qxx+BskzQYvNjR4h4LbXWYZOLAvJ9ab8K
 9jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SZHsUiERmS1OiRclpw++WSMWCMLSWrTWxLeIYpyoO6Q=;
 b=zefMYsygYYgYua0zfXULBKodD9KuehsQtIzuucRFpKHwW3plsvRshK6uGDFV9mc+fd
 /NRgE4sgfsMfDbaXtQaK3HYTjUaCh8XukB1wa/Zr72/ARJHwBRAGQEGCqWv6R8wLBDg6
 7UpQfceucXWbPNNXRemltf8R61MSzewawpaK7rFq+7Pwo3vmvpOlm3Q6QrVLjewlQlWy
 vzcBaylGIIYtMRdbXkCuPpswtlyJjmDjLpLzI0wAyMlRrSEsS3LEGmhv3XP8BCgrVBPW
 A6F3zkSdsoBZcUCfENy0yQbG+oLgf/6SawTqQnFe3rn2Kf5/hJvEhKe6Y+pz9Agd2ljj
 2iIw==
X-Gm-Message-State: ACgBeo2KIOOyUWt5UKyCRDOKOFCkuyI0wGE6VH2woZcSuxYzVloUoGnF
 G/iHqYPFXkNcLxCCEhirlgU=
X-Google-Smtp-Source: AA6agR4cLAreyhuyrrh8jrieDYpfhc8cSDUsUhnRs4sOP40THG/uswRlmdpSVWucNK4IrbedMFbCNA==
X-Received: by 2002:a17:906:7954:b0:742:7a6:b179 with SMTP id
 l20-20020a170906795400b0074207a6b179mr9416830ejo.679.1662723177505; 
 Fri, 09 Sep 2022 04:32:57 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2ad1:9592:69ea:f12b?
 ([2a02:908:1256:79a0:2ad1:9592:69ea:f12b])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b0073dc5bb7c32sm163295ejo.64.2022.09.09.04.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:32:56 -0700 (PDT)
Message-ID: <068ab330-dbf7-8aa8-8bed-156ca01be48b@gmail.com>
Date: Fri, 9 Sep 2022 13:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/5] GEM buffer memory tracking
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
References: <20220909111640.3789791-1-l.stach@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220909111640.3789791-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Michal Hocko <mhocko@suse.com>, David Airlie <airlied@linux.ie>,
 kernel@pengutronix.de, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.09.22 um 13:16 schrieb Lucas Stach:
> Hi MM and DRM people,
>
> during the discussions about per-file OOM badness [1] it repeatedly came up
> that it should be possible to simply track the DRM GEM memory usage by some
> new MM counters.
>
> The basic problem statement is as follows: in the DRM subsystem drivers can
> allocate buffer aka. GEM objects on behalf of a userspace process. In many
> cases those buffers behave just like anonymous memory, but they may be used
> only by the devices driven by the DRM drivers. As the buffers can be quite
> large (multi-MB is the norm, rather than the exception) userspace will not
> map/fault them into the process address space when it doesn't need access to
> the content of the buffers. Thus the memory used by those buffers is not
> accounted to any process and evades visibility by the usual userspace tools
> and the OOM handling.
>
> This series tries to remedy this situation by making such memory visible
> by accounting it exclusively to the process that created the GEM object.
> For now it only hooks up the tracking to the CMA helpers and the etnaviv
> drivers, which was enough for me to prove the concept and see it actually
> working, other drivers could follow if the proposal sounds sane.
>
> Known shortcomings of this very simplistic implementation:
>
> 1. GEM objects can be shared between processes by exporting/importing them
> as dma-bufs. When they are shared between multiple processes, killing the
> process that got the memory accounted will not actually free the memory, as
> the object is kept alive by the sharing process.
>
> 2. It currently only accounts the full size of them GEM object, more advanced
> devices/drivers may only sparsely populate the backing storage of the object
> as needed. This could be solved by having more granular accounting.
>
> I would like to invite everyone to poke holes into this proposal to see if
> this might get us on the right trajectory to finally track GEM memory usage
> or if it (again) falls short and doesn't satisfy the requirements we have
> for graphics memory tracking.

Good to see other looking into this problem as well since I didn't had 
time for it recently.

I've tried this approach as well, but was quickly shot down by the 
forking behavior of the core kernel.

The problem is that the MM counters get copied over to child processes 
and because of that become imbalanced when this child process now 
terminates.

What you could do is to change the forking behavior for MM_DRIVERPAGES 
so that it always stays with the process which has initially allocated 
the memory and never leaks to children.

Apart from that I suggest to rename it since the shmemfd and a few other 
implementations have pretty much the same problem.

Regards,
Christian.

>
> Regards,
> Lucas
>
> [1] https://lore.kernel.org/linux-mm/20220531100007.174649-1-christian.koenig@amd.com/
>
> Lucas Stach (5):
>    mm: add MM_DRIVERPAGES
>    drm/gem: track mm struct of allocating process in gem object
>    drm/gem: add functions to account GEM object memory usage
>    drm/cma-helper: account memory used by CMA GEM objects
>    drm/etnaviv: account memory used by GEM buffers
>
>   drivers/gpu/drm/drm_gem.c             | 42 +++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_gem_cma_helper.c  |  4 +++
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c |  3 ++
>   fs/proc/task_mmu.c                    |  6 ++--
>   include/drm/drm_gem.h                 | 15 ++++++++++
>   include/linux/mm.h                    |  3 +-
>   include/linux/mm_types_task.h         |  1 +
>   kernel/fork.c                         |  1 +
>   8 files changed, 72 insertions(+), 3 deletions(-)
>

