Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A15A86075
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 16:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB85810EBC9;
	Fri, 11 Apr 2025 14:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xwvi3DiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CFE10E27A;
 Fri, 11 Apr 2025 14:24:37 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so317004a91.3; 
 Fri, 11 Apr 2025 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744381477; x=1744986277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmvDAObE9KnZ7MxQaf1cosOUGUMZW3ptn6EF2w8TGFE=;
 b=Xwvi3DiUV9AKu1E3IpaxsZkeW6uMBp3Az1VyU9dAUyR5Y1T9x9hvD7yfkY+PtQlD2a
 2a4FYy+pQ13eZWKirtACANON9BShnvu700DVOPtpNRWm1ohcdVUPKoyZEb+MBYJq5UqE
 SWzXAOp75kdah5aigN7PrQ8LOtzEWUctMZv6nhNQGZkDVhUZiJ0qWzI581YgbScvX/n4
 iKXG96Rvfr8Fx3hcWUzYwGLrUK3Hscmb7/zfSWFTuETfLr7SL8tzA85B0mZ+j6vN+JP2
 fpgfC/pH5ivuLeMMiLbPpsaG41Q2qfS7T0EoAJ3NfN6TxSYWtBFELTDOVtl7ankp061O
 brjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744381477; x=1744986277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmvDAObE9KnZ7MxQaf1cosOUGUMZW3ptn6EF2w8TGFE=;
 b=hB3T2jSgMuYC9rCjx/8R4A9tY/xqGVbJ03T9VV3KFeFJcmKfPB3iFb34z9lx17PLTa
 Q6z7clXHGXWyjU9dRyBTVTHvqkHKrg9zQaHJlwMyNtTGCFLB6GyKihojS6bfxBAFXrGg
 ETk0xd3HkS1LBjJpvbhbGqduLv7t9zDgN9PyucrLb6OdaiKQ9tWZrpFszO0ZDVM0vQU0
 DZRt1yP/KpxL3wj5P+g+196OZvxSm/q2/FM3kjMoo3VwI2+NvhReGMNkHANs3OQrNvNg
 vpv3SbqmDW1VimhbvD72F6HY4JvKGhv1dYeMzOP8n4xr0ofbAqNSP0VSb063ZQTmde1b
 jyvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWReiNCO8V5uxArF+EyOfJnUb6Y0gsZwO29vtz7I4tuu+O1SL9bkfK+sWM85E0m9hOlaeIvUjM3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8uyOum2Qs7geSKy6+KNiomA2Zfm7H4KeoCLsDB8CkyjnBzJUO
 VnPlE5tStQWuIPBvNzvIDJf8hTH+CI3hHJdJ4aLN6+ltCbkaGWXSzTDwfWY41WjE8khndGu97X+
 leHdRNwBSmzITlSsmL9+aWHqU2rQ=
X-Gm-Gg: ASbGnctNkRkzLswRj6UuufoGPLb6xAkPwfp5nrvasl8U+GMjANoSK3vXCpQpdo1mEBa
 Aw1YlHxJyWqsqGl0TmgzZVKlvCqobXP0Kc2uJH1CCrrnH6sy5kLSyG5nS/Kr7nfFw7WQu2h5zYF
 0aW0vhUof8n78sldJjP4j6dg==
X-Google-Smtp-Source: AGHT+IF8/xiqfxc74SNY+655UdZS8KB8xv4cGvNV3z2CV5ll0ko60gQXBgUzEXAIYLUJ357RKhv1zIqQbhsDS0EVOFE=
X-Received: by 2002:a17:90b:3147:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-308274175f7mr1196848a91.8.1744381476603; Fri, 11 Apr 2025
 07:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
 <20250411130428.4104957-3-sunil.khatri@amd.com>
In-Reply-To: <20250411130428.4104957-3-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Apr 2025 10:24:25 -0400
X-Gm-Features: ATxdqUFh11dEoIlyIjZ2-Wx4KSTAk_OFwuaPZ0tT-EQkbf1dTlZq4mtc3Zdap9s
Message-ID: <CADnq5_Oo_9YEafxTXFPCuxvtKLUKCTpfM=M1yrBR97E2vhyrpg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/amdgpu: update the error logging for more
 information
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Fri, Apr 11, 2025 at 9:05=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> add process and pid information in the userqueue error
> logging to make it more useful in resolving the error
> by logs.
>
> Sample log:
> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Ti=
med out waiting for fence f=3D000000001c74d978 for comm:Xwayland pid:3427
> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspen=
ding userqueue, timeout waiting for comm:Xwayland pid:3427
> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] *ERROR* Ti=
med out waiting for fence f=3D0000000074407d3e for comm:systemd-logind pid:=
1058
> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not suspen=
ding userqueue, timeout waiting for comm:systemd-logind pid:1058
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 45 +++++++++++++++----
>  1 file changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_userqueue.c
> index ecd49cf15b2a..5b58c41618ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
> @@ -62,12 +62,17 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr *uq_=
mgr,
>         struct amdgpu_device *adev =3D uq_mgr->adev;
>         const struct amdgpu_userq_funcs *uq_funcs =3D adev->userq_funcs[q=
ueue->queue_type];
>         struct dma_fence *f =3D queue->last_fence;
> +       struct drm_file *file;
> +       char proc_log[50];
>         int ret;
>
>         if (f && !dma_fence_is_signaled(f)) {
>                 ret =3D dma_fence_wait_timeout(f, true, msecs_to_jiffies(=
100));
>                 if (ret <=3D 0) {
> -                       DRM_ERROR("Timed out waiting for fence f=3D%p\n",=
 f);
> +                       file =3D uq_mgr->file;
> +                       drm_process_info(file, proc_log, sizeof(proc_log)=
);
> +                       DRM_ERROR("Timed out waiting for fence f=3D%p for=
 %s\n",
> +                                 f, proc_log);

user drm_err() here and below so we get proper handling of multiple devices=
.

Alex

>                         return;
>                 }
>         }
> @@ -427,6 +432,8 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr *=
uq_mgr)
>         const struct amdgpu_userq_funcs *userq_funcs;
>         struct amdgpu_usermode_queue *queue;
>         int queue_id;
> +       struct drm_file *file;
> +       char proc_log[50];
>         int ret =3D 0;
>
>         /* Resume all the queues for this process */
> @@ -435,8 +442,12 @@ amdgpu_userqueue_resume_all(struct amdgpu_userq_mgr =
*uq_mgr)
>                 ret =3D userq_funcs->resume(uq_mgr, queue);
>         }
>
> -       if (ret)
> -               DRM_ERROR("Failed to resume all the queue\n");
> +       if (ret) {
> +               file =3D uq_mgr->file;
> +               drm_process_info(file, proc_log, sizeof(proc_log));
> +               DRM_ERROR("Failed to resume all the queue for %s\n",
> +                         proc_log);
> +               }
>         return ret;
>  }
>
> @@ -585,6 +596,8 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr =
*uq_mgr)
>         const struct amdgpu_userq_funcs *userq_funcs;
>         struct amdgpu_usermode_queue *queue;
>         int queue_id;
> +       struct drm_file *file;
> +       char proc_log[50];
>         int ret =3D 0;
>
>         /* Try to suspend all the queues in this process ctx */
> @@ -593,8 +606,12 @@ amdgpu_userqueue_suspend_all(struct amdgpu_userq_mgr=
 *uq_mgr)
>                 ret +=3D userq_funcs->suspend(uq_mgr, queue);
>         }
>
> -       if (ret)
> -               DRM_ERROR("Couldn't suspend all the queues\n");
> +       if (ret) {
> +               file =3D uq_mgr->file;
> +               drm_process_info(file, proc_log, sizeof(proc_log));
> +               DRM_ERROR("Couldn't suspend all the queues for %s\n",
> +                         proc_log);
> +               }
>         return ret;
>  }
>
> @@ -602,6 +619,8 @@ static int
>  amdgpu_userqueue_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
>  {
>         struct amdgpu_usermode_queue *queue;
> +       struct drm_file *file;
> +       char proc_log[50];
>         int queue_id, ret;
>
>         idr_for_each_entry(&uq_mgr->userq_idr, queue, queue_id) {
> @@ -611,7 +630,10 @@ amdgpu_userqueue_wait_for_signal(struct amdgpu_userq=
_mgr *uq_mgr)
>                         continue;
>                 ret =3D dma_fence_wait_timeout(f, true, msecs_to_jiffies(=
100));
>                 if (ret <=3D 0) {
> -                       DRM_ERROR("Timed out waiting for fence f=3D%p\n",=
 f);
> +                       file =3D uq_mgr->file;
> +                       drm_process_info(file, proc_log, sizeof(proc_log)=
);
> +                       DRM_ERROR("Timed out waiting for fence f=3D%p for=
 %s\n",
> +                                 f, proc_log);
>                         return -ETIMEDOUT;
>                 }
>         }
> @@ -624,19 +646,26 @@ amdgpu_userqueue_suspend(struct amdgpu_userq_mgr *u=
q_mgr,
>                          struct amdgpu_eviction_fence *ev_fence)
>  {
>         int ret;
> +       struct drm_file *file;
> +       char proc_log[50];
>         struct amdgpu_fpriv *fpriv =3D uq_mgr_to_fpriv(uq_mgr);
>         struct amdgpu_eviction_fence_mgr *evf_mgr =3D &fpriv->evf_mgr;
>
>         /* Wait for any pending userqueue fence work to finish */
>         ret =3D amdgpu_userqueue_wait_for_signal(uq_mgr);
>         if (ret) {
> -               DRM_ERROR("Not suspending userqueue, timeout waiting for =
work\n");
> +               file =3D uq_mgr->file;
> +               drm_process_info(file, proc_log, sizeof(proc_log));
> +               DRM_ERROR("Not suspending userqueue, timeout waiting for =
%s\n",
> +                         proc_log);
>                 return;
>         }
>
>         ret =3D amdgpu_userqueue_suspend_all(uq_mgr);
>         if (ret) {
> -               DRM_ERROR("Failed to evict userqueue\n");
> +               file =3D uq_mgr->file;
> +               drm_process_info(file, proc_log, sizeof(proc_log));
> +               DRM_ERROR("Failed to evict userqueue for %s\n", proc_log)=
;
>                 return;
>         }
>
> --
> 2.34.1
>
