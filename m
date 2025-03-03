Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF020A4C7A5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4F10E203;
	Mon,  3 Mar 2025 16:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l8eZ8Q18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29C10E1D8;
 Mon,  3 Mar 2025 16:41:40 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fe99d5f1e8so1127763a91.1; 
 Mon, 03 Mar 2025 08:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741020100; x=1741624900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47bsIKlcqHp5H3TD9jYyEu2X6naolmhs59XvhjHuXVI=;
 b=l8eZ8Q18Y6f+g/KRqstDTWdMc6REQoxaf0ND+wiEFyEIF7j2rwUedlS62263QaxDcp
 mowlfP1/X/r3PsQ2MagRP1LOM6MKbiSHQaAf5tKBwXYjz/oUmRIzAehSDkKApHw/refR
 eu+LRXVmZrlnfhk55I39bQhx6gYOoZSXW+XTjLeZ0eYi5UZjakvOvtlwFmKQpTKsyb8s
 2VpNiFaGaf48htq5CTqxgXDDauzlYZmQLsKz4BcUgfmZ6jjO5rcslcC2sofx3PFLqHmz
 lR49/nEdGcPfOQ4iKE2tWkqDFUGBEBbd1OqxAarHERlOOBPyrJZZN314VfIaH0bCMgpm
 qvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741020100; x=1741624900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=47bsIKlcqHp5H3TD9jYyEu2X6naolmhs59XvhjHuXVI=;
 b=qsYzB5HsKehGJpTstvTz+VtN62bnnUjDu5EqiDf3g7nlLgrC0s5ZzwUEBjFKnCc+ZI
 ebwgv+tBCF4uVe2lSF7B97w+qqoejtC9Gx+3P8Y7Gw3huUc8cCaCvwgizT4dG+sVP2Np
 3dqnIJgxQGw5WNeeN0eWD0mUSKqJnrWLkXUwkE9K+xlctWNd/oKWi/A41b/pNaxsbZrx
 UDa9D/zDDHaJsSz2W1l33PQ9xmUiIlk4fJFlmkQ9lDa9YvN0jlw9WUgSkj9InEdJhG6w
 +2MyAhQFioTt9yMcrpyPGcht8KyzYNkoBSsTOYfVPOQZkNFxn76dlpdzyNY4trgVX6mv
 Te+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNc0tIcwjkKnoABIBH8U+8Tfrlb+ntR9InLOip9RnGU0MGOEDy+WXFUULLIbDFgmjvSFhURzHi@lists.freedesktop.org,
 AJvYcCXsof4w8nKamw6P8sbjNBiCGE7jy7yRxncQshHjsVndpe5sSmP3+r/sKdTAXgL151XELzJoLbEHobQA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzatGUMOx/mEkjfQp1dpKdMljWawjHhy+yGk5C7pApO4FYfyuUv
 VHx5Z+2Gnr8o/0CnWe7q95W5x1w7mT1amHrg02tAICNQOoKpeQcuSBnL9oTqRQ/aiDqaaARyeuI
 OaluNR2JySY0aM4C5fRxv2r3nwzQkkw==
X-Gm-Gg: ASbGnctxXk0OpcyyWt8oetkOKweHMjhpbNoattV2Onxputm+Gzr+5xXoV+dC5V/vcxv
 m0cZpuFNVSSD6/sJUM7V4LRGanLsvePp2L3SoGXAry0Rhz8mDGmi1qbDESO6V7D0DXzQSK8nguM
 G69g+Z8jg08qghmLKb38E7vyeWnw==
X-Google-Smtp-Source: AGHT+IEAJzJpNaIfKrGq6gWR/l/GrV12fhRWU68m5gj94YkVE5KNJFVW5RIOxT9G5mqyQ2NgSg+1fySiP9uwEYuDi6s=
X-Received: by 2002:a17:90b:38c4:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-2febab2b8dcmr8430918a91.2.1741020100399; Mon, 03 Mar 2025
 08:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20250303143922.36342-1-linux@treblig.org>
 <20250303143922.36342-7-linux@treblig.org>
In-Reply-To: <20250303143922.36342-7-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Mar 2025 11:41:28 -0500
X-Gm-Features: AQ5f1JqMkiUo-EtSFJEpEP0sLmjYwcpl5M0qfR0G_2Hgs53cXx-WZsW_hzhnm8o
Message-ID: <CADnq5_MmWqwgXQ5DVyp435ziPbpTE_EOhqgN6L4ZTWVXvVYtiQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/amdgpu: Remove unused pqm_get_kernel_queue
To: linux@treblig.org
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com, 
 christian.koenig@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 siqueira@igalia.com, austin.zheng@amd.com, jun.lei@amd.com, 
 kenneth.feng@amd.com, linux-kernel@vger.kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Applied the series.  Thanks!

Alex

On Mon, Mar 3, 2025 at 9:49=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> pqm_get_kernel_queue() has been unused since 2022's
> commit 5bdd3eb25354 ("drm/amdkfd: Remove unused old debugger
> implementation")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h               |  2 --
>  .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  | 13 -------------
>  2 files changed, 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index 2c22e335a02e..bc26a2609f64 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1363,8 +1363,6 @@ int pqm_update_mqd(struct process_queue_manager *pq=
m, unsigned int qid,
>                         struct mqd_update_info *minfo);
>  int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
>                         void *gws);
> -struct kernel_queue *pqm_get_kernel_queue(struct process_queue_manager *=
pqm,
> -                                               unsigned int qid);
>  struct queue *pqm_get_user_queue(struct process_queue_manager *pqm,
>                                                 unsigned int qid);
>  int pqm_get_wave_state(struct process_queue_manager *pqm,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/dri=
vers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index bd36a75309e1..2b30ed0cecb6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -652,19 +652,6 @@ int pqm_update_mqd(struct process_queue_manager *pqm=
,
>         return 0;
>  }
>
> -struct kernel_queue *pqm_get_kernel_queue(
> -                                       struct process_queue_manager *pqm=
,
> -                                       unsigned int qid)
> -{
> -       struct process_queue_node *pqn;
> -
> -       pqn =3D get_queue_by_qid(pqm, qid);
> -       if (pqn && pqn->kq)
> -               return pqn->kq;
> -
> -       return NULL;
> -}
> -
>  struct queue *pqm_get_user_queue(struct process_queue_manager *pqm,
>                                         unsigned int qid)
>  {
> --
> 2.48.1
>
