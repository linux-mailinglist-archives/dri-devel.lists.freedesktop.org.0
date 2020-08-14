Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA4244ED6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 21:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806096EC0C;
	Fri, 14 Aug 2020 19:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9EA6EC0D;
 Fri, 14 Aug 2020 19:29:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so9268628wrc.7;
 Fri, 14 Aug 2020 12:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NgBvL72lGEMPO8V0JGlSVt8hvtRykmxLkhIGKF1BTd4=;
 b=EOZlMUtLDuWd2sUKs9zY75nSy5FRPY0fQeTyJcZSvvbEck/+vWecu22x1YQKxTg1Vl
 isyYNwgJ0ynir7OdQjAdTFppuCieLp4b4bkTnFORzFM6RerCCND4kKv92PE5+lTdP8gn
 Lbz+EEChRNWcAD/f9e2n4miE98XtobpuUk76KBPYlgj1mZgSARrgF+JCT0qQfXjByM7N
 /dkh6/R1/+S0BV3AmBgTIQ+yxFGhjFh/I1QlWbQIkLc4i4Z14hvduXSaEKCzGQjgMvjQ
 O2omB5dQD9KZnLoSbZvaUewMGvl1povNNckSjdQQAdJhHdsKYRVWDA437lXEK3CVoKk8
 iBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgBvL72lGEMPO8V0JGlSVt8hvtRykmxLkhIGKF1BTd4=;
 b=YjTbpuNXPETCzoeqrx4VXIW2CqzBQVHtHMksbZOE4gZ4d/wWOob5oznosnuoYBNTTn
 RhUpbpaISzaB3p6bl4pzVVwLjRQEqDvTEr0JLCQ9f5PlSk1bdID8QVILae7r0X7AY+wv
 BZyX6jrRc10StC3DkIfQ/E/Z0O1s/wzITmlQsWmHD+LD0mCkIgRDeULn8WJX4kn4KLyk
 AddcyF7ZPBsr+udvI3R6W/og/y4BLF5ZnreBZea6UMSTJll5UpMnpq3fC2xUyzBGrvHz
 VetuQJ8W8S/KJEgFQCR2nnlABdwvejYSlrkwBASZYlWPz4gZGJA+4Ow3yM6DjqNAHGAg
 pHyQ==
X-Gm-Message-State: AOAM530zdIRjFo/Bxhw2vHxBoL+3dth2sI7H+6ARgUJDczwHI3VM+6mY
 hn8LwdaFXwDloBgta28UOQ5XKpLXxwqR2kLX0yMM/yqI
X-Google-Smtp-Source: ABdhPJxVAF1Yr++eCsCfdWWlEKxoRsqWnmQfhOYxjKdmupRZjgePZ7bufMWgxEE5Gof+sBUogbes2blJO0Vu0UqV2U8=
X-Received: by 2002:adf:a351:: with SMTP id d17mr3889235wrb.111.1597433346784; 
 Fri, 14 Aug 2020 12:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200814191401.25606-1-luben.tuikov@amd.com>
 <20200814191401.25606-3-luben.tuikov@amd.com>
In-Reply-To: <20200814191401.25606-3-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Aug 2020 15:28:55 -0400
Message-ID: <CADnq5_M=T3gQ1pov8gZqbxVbZ_N1TO6HdKnevkQ336m60XBz-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/scheduler: Remove priority macro INVALID
To: Luben Tuikov <luben.tuikov@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel


On Fri, Aug 14, 2020 at 3:14 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Remove DRM_SCHED_PRIORITY_INVALID. We no longer
> carry around an invalid priority and cut it off
> at the source.
>
> Backwards compatibility behaviour of AMDGPU CTX
> IOCTL passing in garbage for context priority
> from user space and then mapping that to
> DRM_SCHED_PRIORITY_NORMAL is preserved.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 21 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 62 +++++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h |  3 +-
>  include/drm/gpu_scheduler.h               |  1 -
>  4 files changed, 53 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index fd97ac34277b..10d3bfa416c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -384,42 +384,41 @@ static int amdgpu_ctx_query2(struct amdgpu_device *adev,
>  int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>                      struct drm_file *filp)
>  {
> -       int r;
> +       int res;
>         uint32_t id;
> -       enum drm_sched_priority priority;
> +       enum drm_sched_priority prio;

The variable renaming is not directly related to the functional change
in the patch and should be split out as a separate patch is you think
it should be applied.  I personally prefer the original naming.  The
driver uses r or ret for return value checking pretty consistently.  I
also prefer to spell things out unless the names are really long.
Makes it more obvious what they are for.  Same comment on the
functions below as well.

Alex

>
>         union drm_amdgpu_ctx *args = data;
>         struct amdgpu_device *adev = dev->dev_private;
>         struct amdgpu_fpriv *fpriv = filp->driver_priv;
>
> -       r = 0;
>         id = args->in.ctx_id;
> -       priority = amdgpu_to_sched_priority(args->in.priority);
> +       res = amdgpu_to_sched_priority(args->in.priority, &prio);
>
>         /* For backwards compatibility reasons, we need to accept
>          * ioctls with garbage in the priority field */
> -       if (priority == DRM_SCHED_PRIORITY_INVALID)
> -               priority = DRM_SCHED_PRIORITY_NORMAL;
> +       if (res == -EINVAL)
> +               prio = DRM_SCHED_PRIORITY_NORMAL;
>
>         switch (args->in.op) {
>         case AMDGPU_CTX_OP_ALLOC_CTX:
> -               r = amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id);
> +               res = amdgpu_ctx_alloc(adev, fpriv, filp, prio, &id);
>                 args->out.alloc.ctx_id = id;
>                 break;
>         case AMDGPU_CTX_OP_FREE_CTX:
> -               r = amdgpu_ctx_free(fpriv, id);
> +               res = amdgpu_ctx_free(fpriv, id);
>                 break;
>         case AMDGPU_CTX_OP_QUERY_STATE:
> -               r = amdgpu_ctx_query(adev, fpriv, id, &args->out);
> +               res = amdgpu_ctx_query(adev, fpriv, id, &args->out);
>                 break;
>         case AMDGPU_CTX_OP_QUERY_STATE2:
> -               r = amdgpu_ctx_query2(adev, fpriv, id, &args->out);
> +               res = amdgpu_ctx_query2(adev, fpriv, id, &args->out);
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
> -       return r;
> +       return res;
>  }
>
>  struct amdgpu_ctx *amdgpu_ctx_get(struct amdgpu_fpriv *fpriv, uint32_t id)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> index e05bc22a0a49..2398eb646043 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> @@ -32,24 +32,32 @@
>
>  #include "amdgpu_vm.h"
>
> -enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority)
> +int amdgpu_to_sched_priority(int amdgpu_priority,
> +                            enum drm_sched_priority *prio)
>  {
>         switch (amdgpu_priority) {
>         case AMDGPU_CTX_PRIORITY_VERY_HIGH:
> -               return DRM_SCHED_PRIORITY_HW;
> +               *prio = DRM_SCHED_PRIORITY_HW;
> +               break;
>         case AMDGPU_CTX_PRIORITY_HIGH:
> -               return DRM_SCHED_PRIORITY_SW;
> +               *prio = DRM_SCHED_PRIORITY_SW;
> +               break;
>         case AMDGPU_CTX_PRIORITY_NORMAL:
> -               return DRM_SCHED_PRIORITY_NORMAL;
> +               *prio = DRM_SCHED_PRIORITY_NORMAL;
> +               break;
>         case AMDGPU_CTX_PRIORITY_LOW:
>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
> -               return DRM_SCHED_PRIORITY_MIN;
> +               *prio = DRM_SCHED_PRIORITY_MIN;
> +               break;
>         case AMDGPU_CTX_PRIORITY_UNSET:
> -               return DRM_SCHED_PRIORITY_UNSET;
> +               *prio = DRM_SCHED_PRIORITY_UNSET;
> +               break;
>         default:
>                 WARN(1, "Invalid context priority %d\n", amdgpu_priority);
> -               return DRM_SCHED_PRIORITY_INVALID;
> +               return -EINVAL;
>         }
> +
> +       return 0;
>  }
>
>  static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
> @@ -116,30 +124,42 @@ int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
>  {
>         union drm_amdgpu_sched *args = data;
>         struct amdgpu_device *adev = dev->dev_private;
> -       enum drm_sched_priority priority;
> -       int r;
> +       enum drm_sched_priority prio;
> +       int res;
>
> -       priority = amdgpu_to_sched_priority(args->in.priority);
> -       if (priority == DRM_SCHED_PRIORITY_INVALID)
> +       /* First check the op, then the op's argument.
> +        */
> +       switch (args->in.op) {
> +       case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
> +       case AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE:
> +               break;
> +       default:
> +               DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
>                 return -EINVAL;
> +       }
> +
> +       res = amdgpu_to_sched_priority(args->in.priority, &prio);
> +       if (res)
> +               return res;
>
>         switch (args->in.op) {
>         case AMDGPU_SCHED_OP_PROCESS_PRIORITY_OVERRIDE:
> -               r = amdgpu_sched_process_priority_override(adev,
> -                                                          args->in.fd,
> -                                                          priority);
> +               res = amdgpu_sched_process_priority_override(adev,
> +                                                            args->in.fd,
> +                                                            prio);
>                 break;
>         case AMDGPU_SCHED_OP_CONTEXT_PRIORITY_OVERRIDE:
> -               r = amdgpu_sched_context_priority_override(adev,
> -                                                          args->in.fd,
> -                                                          args->in.ctx_id,
> -                                                          priority);
> +               res = amdgpu_sched_context_priority_override(adev,
> +                                                            args->in.fd,
> +                                                            args->in.ctx_id,
> +                                                            prio);
>                 break;
>         default:
> -               DRM_ERROR("Invalid sched op specified: %d\n", args->in.op);
> -               r = -EINVAL;
> +               /* Impossible.
> +                */
> +               res = -EINVAL;
>                 break;
>         }
>
> -       return r;
> +       return res;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
> index 12299fd95691..67e5b2472f6a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.h
> @@ -30,7 +30,8 @@ enum drm_sched_priority;
>  struct drm_device;
>  struct drm_file;
>
> -enum drm_sched_priority amdgpu_to_sched_priority(int amdgpu_priority);
> +int amdgpu_to_sched_priority(int amdgpu_priority,
> +                            enum drm_sched_priority *prio);
>  int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
>                        struct drm_file *filp);
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 8ae9b8f73bf9..d6ee3b2e8407 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -44,7 +44,6 @@ enum drm_sched_priority {
>         DRM_SCHED_PRIORITY_HIGH,
>
>         DRM_SCHED_PRIORITY_COUNT,
> -       DRM_SCHED_PRIORITY_INVALID = -1,
>         DRM_SCHED_PRIORITY_UNSET = -2
>  };
>
> --
> 2.28.0.215.g878e727637
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
