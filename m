Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECBA23E2B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8FB10EAAF;
	Fri, 31 Jan 2025 13:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nP+czKJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15910EAAD;
 Fri, 31 Jan 2025 13:12:33 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1268975f8f.0; 
 Fri, 31 Jan 2025 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738329152; x=1738933952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Qf5Ag+gkCkodLzQTGh44JB0E7mlh4X9B+GfpD3S+A8=;
 b=nP+czKJsxHNOFGSVQFQHdpT/+kE32LXIHf42AxZqyucSo5BwS5BXonmWVZaJzSqMBp
 b4ytEwt92dVLwQr8rRG0ocDukBPJWu9l5328lgXsuMOzaD2OUcfGUxMmhXEllu3VBiXT
 8ICAZfst/4mt1+hVdeuc8x0NZUmDEX7Gf8DIzdrhH9p8TmHMT0UjeXc5AJ9rfhRIsMiq
 VtGW1xBvOGXxIKXu/0R+EmTQW7nldmvTqp8Zl8nDRXWCz3LCgWvbuZ9kjIipr4itPIuq
 4y1z7creLLJRIKO7l2nx6zx+eKIUlc9yZhlZHAGNTD7kmyl1kMg+SpPc4fFX0oNkExXG
 JjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738329152; x=1738933952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Qf5Ag+gkCkodLzQTGh44JB0E7mlh4X9B+GfpD3S+A8=;
 b=HgfkeergWDBiuLs4/IQyTN4iCir043oq9G2qBOqJKsIVWoK6lRKXZVgcR8us/ydTdg
 +7KB3s8CEOqZlHGp72OHcj7s3MakoCFY2tfcC0/D0xotD2lFTlUa4v2pRkB8eB0VACiL
 opZfNCgq7teZ4PnhO3LfP9yf1R9iPvO0r9XR981rOnsaqC+FZVi9lQGxlv7d52UgqwVS
 MDl/H8m+KCvjrar87xsWBVRa8PALPIfo8zkT0NZ3jE2ABTF6I46+GUpZN6E+ZM3WFckV
 8XCEsW7sBmohqCO5UYpAY4h92X8jxQj0j8tCoNpr8n4Kc0OEzr6cEWhj0QL7m+8jk8NO
 xhjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Gu7rNNL8YaeNpdBNliYImydXbr3yd8eHqmO63NRrgSqCxMqTKpFI0m2oTBf2CSBSXCopy2P8V0Y=@lists.freedesktop.org,
 AJvYcCUK/pandPRx7cIbhgvcTwo+fj5q54PhZmyOp3wZpupNyzjs9o6VGliZSrkWelHoLWj63SHQndQUPFE=@lists.freedesktop.org,
 AJvYcCVAKh3QX8ENut49+SnaRGP6bFYWiWAnKw9vR2SHPDz8UHxX4uoLocApcU95XVHmOh4eA6+pnw==@lists.freedesktop.org,
 AJvYcCVe62XdqrKI61xSRUImfmG4SymYJpbU8Mz6B6gpcbt3h+eHH9TbscEXPE+3zldrhz1SNIhrSYUh0g==@lists.freedesktop.org,
 AJvYcCWaQPTsCjanua9piLkJNaeUMhnVaUPTFFnJef0shkJ5PgkB8oSpdfADWEjcw26jvoYFoftsOtnP71jA@lists.freedesktop.org,
 AJvYcCXDpfbC/We0AGxGNaB5ryBhmLo42FVFQ9jRp5kjbpHihDHk3W+asBVpgMB0oibntO+cux9GuL/TZw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8jm8CLa155e22e2+teyh5B5BCJAP8SGHXswOsycJM32ihqwSS
 4mNvuhdZTr6KAdz2Xc7ggUd4S1kF06eF4J++CxSinObnUxYAFvxf
X-Gm-Gg: ASbGncsNaFD9KEnDo7Ur7R5vsusmXxye1ZjIvyRmHpOUoEapr4tlKgGpSAy12cXkTrG
 piifCW9pcTWK7ttqjHsVpHVeAeIaO1lEtELgM8bCZQFR9bd8NwcFefl0SjqH5o5k3e+MMiOJNTd
 PmEOrv9NYOlZfTKpSWzHUQJoqO8edtuukyETvVpgtLw/dKRCJxs0csi4IRXsgbbDuVZzFc/pqP1
 Q+gTfeYxKvupIKVjxuIMkqw1pOkU/ebJRAQNCsKZ8QAofcI7yuw3yOadch2CqXzEPYon1YnyLuK
 e6gHqeo4EU/CQ4E+bAGt2TJHCguBN5zaoKLZv7UhiH7v
X-Google-Smtp-Source: AGHT+IGKBtM8zdX0f/k9fSlmikQgi6UfU2qNH1ycY66SNDkJyOrXViqSqC8f4KUEz2AE7pAcFmrXww==
X-Received: by 2002:a5d:59a6:0:b0:385:f1f2:13f1 with SMTP id
 ffacd0b85a97d-38c51951c51mr9664356f8f.22.1738329150361; 
 Fri, 31 Jan 2025 05:12:30 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc263f0sm90055545e9.9.2025.01.31.05.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 05:12:29 -0800 (PST)
Message-ID: <0b20e88a-9009-4fa2-b5cb-ab78ce834587@gmail.com>
Date: Fri, 31 Jan 2025 14:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Improve gpu_scheduler trace events + uAPI
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

I can't see patch #1 in my inbox for some reason, but I already know 
what it does from your repository.

Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> 
to the entire series.

Regards,
Christian.

Am 31.01.25 um 12:02 schrieb Pierre-Eric Pelloux-Prayer:
> Hi,
>
> The initial goal of this series was to improve the drm and amdgpu
> trace events to be able to expose more of the inner workings of
> the scheduler and drivers to developers via tools.
>
> Then, the series evolved to become focused only on gpu_scheduler.
> The changes around vblank events will be part of a different
> series, as well as the amdgpu ones.
>
> Moreover Sima suggested to make some trace events stable uAPI,
> so tools can rely on them long term.
>
> The first patches extend and cleanup the gpu scheduler events.
>
> The last one adds a documentation entry in drm-uapi.rst.
>
> Changes since v6:
> * Addressed comments from Philipp, Tvrtko, Steven
> * The commit storing drm_client_id in sched_fence adds an extra
> field which looks like a duplicate of the owner field. Currently
> amdgpu uses the owner field with some magic values, so we have to
> have 2 separate fields for now, but ultimately one could be removed.
> Similarly storing the drm_client_id in the sched_entity is not
> really possible as there's nothing preventing a driver to use a
> sched_entity with multiple drm_file instances.
>
>
> Useful links:
> - userspace tool using the updated events:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> - v6:
> https://lists.freedesktop.org/archives/dri-devel/2024-November/477644.html
>
> Pierre-Eric Pelloux-Prayer (7):
>    drm/debugfs: output client_id in in drm_clients_info
>    drm/sched: store the drm client_id in drm_sched_fence
>    drm/sched: add device name to the drm_sched_process_job event
>    drm/sched: cleanup gpu_scheduler trace events
>    drm/sched: trace dependencies for gpu jobs
>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job events
>    drm/doc: document some tracepoints as uAPI
>
>   Documentation/gpu/drm-uapi.rst                |  19 +++
>   drivers/accel/amdxdna/aie2_ctx.c              |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
>   drivers/gpu/drm/drm_debugfs.c                 |  10 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>   drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
>   drivers/gpu/drm/imagination/pvr_queue.c       |   5 +-
>   drivers/gpu/drm/imagination/pvr_queue.h       |   2 +-
>   drivers/gpu/drm/lima/lima_gem.c               |   2 +-
>   drivers/gpu/drm/lima/lima_sched.c             |   6 +-
>   drivers/gpu/drm/lima/lima_sched.h             |   3 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>   drivers/gpu/drm/panthor/panthor_drv.c         |   3 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c         |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c       |   5 +-
>   drivers/gpu/drm/panthor/panthor_sched.h       |   3 +-
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 123 ++++++++++++++----
>   drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>   drivers/gpu/drm/scheduler/sched_main.c        |   8 +-
>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>   include/drm/gpu_scheduler.h                   |  12 +-
>   28 files changed, 192 insertions(+), 64 deletions(-)
>

