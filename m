Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302A36CC42
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 22:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752A86E5C6;
	Tue, 27 Apr 2021 20:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFF46E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 20:29:17 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a18so21386429qtj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vfiIHDVMlVeESQIjaXmQJ983GJVYD/T5iw1l2CbiIBs=;
 b=t5ljGeNgy8sor0vjWW9i2+OQL7YaQPKarZAIkJV1wsoOOAewOoN/BSW199tlHLzFgn
 B5VbDXWcOwPtaRcz2kZ3w3keiRF9Sa3dVD12HIfl2aAK/PebZ04w+CKLnMcxVhIta5wQ
 7KTmo/MXQ3HvMtCxgtQDDs1qceQRms3dcVzIY77cbbyWOlWaCmOBf5z/tsBrLiayyAIQ
 RG0/SD3OGF4ercEAT7qqD9SdYnq2ZZhYYKN3BYU+w2/NKZeYhwCdBrjw1ob14nCf16BS
 inWiY2gXff/ElRHgMpLeYeeOQ4AH5TOF7y383xtWT1+HTwvnSwyl3tBidaHjWdpc3oKO
 8eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfiIHDVMlVeESQIjaXmQJ983GJVYD/T5iw1l2CbiIBs=;
 b=DGU7/nYgWWsXM9RwDRbki437pBpkfILQG9LkHcYpHjpyKNPUIMipBvltWw7Ka2qZzo
 eMLb4oHrvo+FWOtdUn/HfajYg+Jgx/CJrbuq6Q6DKi0x9CJS+aNIILfdNBDVtO/r4wqG
 GPy5F9y6p3vlZDN2vN7zKPneX7oaKRowRRotJd5pT/WE2U5UG66Udkp6VcBL9s9SUAb9
 BkYgwTB9Hv+UocrXEYFyhK7KpU8JYJ1B/+dbOyPpmLBPLMptkiIAf9Adw2Av8PbkFbJM
 +3GfJQZnyR453Oc4Snv8KYHqHLL+hCuUUef94tKEUXzrw+CnJtGBaVz8TSrnFsezFHN8
 9iqw==
X-Gm-Message-State: AOAM531HKQzql8XFniQzfBB0ms1LTDQNXoHV2zjKrf5QJQ7r+QSWNOFU
 FeELCPHtv2nwoD+SX5eCCHS+RD6Ccwzn3DuW/OtbTQ==
X-Google-Smtp-Source: ABdhPJyEETtLs8I0S0NfrhT1eKaNSfaSe0nLhRAFPdL2082V5orYaLtzENC0KDOQpKtabDM5xzBq/7YQUu7zdEdMrQY=
X-Received: by 2002:a05:622a:54a:: with SMTP id
 m10mr23894209qtx.298.1619555356255; 
 Tue, 27 Apr 2021 13:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-3-dmitry.baryshkov@linaro.org>
 <64eb1a3343cc9530eecea6816d298ae0@codeaurora.org>
In-Reply-To: <64eb1a3343cc9530eecea6816d298ae0@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Apr 2021 23:29:05 +0300
Message-ID: <CAA8EJpqpHqjWups3_fQfxjJhFXO+Z1Zr0LVwEy+8C-2GMj8oyw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: make msm_disp_state transient
 data struct
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021 at 22:19, <abhinavk@codeaurora.org> wrote:
>
> Hi Dmitry
>
> On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> > Instead of allocating snapshotting structure at the driver probe time
> > and later handling concurrent access, actual state, etc, make
> > msm_disp_state transient struct. Allocate one when snapshotting happens
> > and free it after coredump data is read by userspace.
> >
> Can you please check my previous comment on coredump_pending?
>
> https://lore.kernel.org/dri-devel/186825e2fb7bea8d45f33b5c1fa3509f@codeaurora.org/T/#u
>
> That helps to serialize read/write of coredump.

Regarding the serialization of read/write. As the disp_state becomes
the transient object, the need for such serialization vanishes:
 - Before the snapshot is complete, the object is not linked outside
of msm_disp_snapshot functions.
 - When the snapshot is complete, it becomes linked from the codedump
subsystem. After this it is only read by the coredump, nobody will
write to it.
 - Next snapshot will allocate a new disp_state structure.
 - If dev_coredumpm is called when the previous snapshot is still
referenced (the device exists), the new snapshot is silently freed.

Thus there is no need to sync the read/write operations. They are now
naturally serialized.

>
> Rest of the changes on this one look fine to me.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 90 ++++++-------------
> >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
> >  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
> >  drivers/gpu/drm/msm/msm_kms.h                 |  6 +-
> >  4 files changed, 37 insertions(+), 77 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> > b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> > index 70fd5a1fe13e..a4a7cb06bc87 100644
> > --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> > +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> > @@ -7,8 +7,7 @@
> >
> >  #include "msm_disp_snapshot.h"
> >
> > -#ifdef CONFIG_DEV_COREDUMP
> > -static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
> > +static ssize_t __maybe_unused disp_devcoredump_read(char *buffer,
> > loff_t offset,
> >               size_t count, void *data, size_t datalen)
> >  {
> >       struct drm_print_iterator iter;
> > @@ -29,52 +28,47 @@ static ssize_t disp_devcoredump_read(char *buffer,
> > loff_t offset,
> >       return count - iter.remain;
> >  }
> >
> > -static void disp_devcoredump_free(void *data)
> > +static void _msm_disp_snapshot_work(struct kthread_work *work)
> >  {
> > +     struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
> > +     struct drm_device *drm_dev = kms->dev;
> >       struct msm_disp_state *disp_state;
> > +     struct drm_printer p;
> >
> > -     disp_state = data;
> > -
> > -     msm_disp_state_free(disp_state);
> > +     disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
> > +     if (!disp_state)
> > +             return;
> >
> > -     disp_state->coredump_pending = false;
> > -}
> > -#endif /* CONFIG_DEV_COREDUMP */
> > +     disp_state->dev = drm_dev->dev;
> > +     disp_state->drm_dev = drm_dev;
> >
> > -static void _msm_disp_snapshot_work(struct kthread_work *work)
> > -{
> > -     struct msm_disp_state *disp_state = container_of(work, struct
> > msm_disp_state, dump_work);
> > -     struct drm_printer p;
> > +     INIT_LIST_HEAD(&disp_state->blocks);
> >
> > -     mutex_lock(&disp_state->mutex);
> > +     /* Serialize dumping here */
> > +     mutex_lock(&kms->dump_mutex);
> >
> >       msm_disp_snapshot_capture_state(disp_state);
> >
> > +     mutex_unlock(&kms->dump_mutex);
> > +
> >       if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
> >               p = drm_info_printer(disp_state->drm_dev->dev);
> >               msm_disp_state_print(disp_state, &p);
> >       }
> >
> >       /*
> > -      * if devcoredump is not defined free the state immediately
> > -      * otherwise it will be freed in the free handler.
> > +      * If COREDUMP is disabled, the stub will call the free function.
> > +      * If there is a codedump pending for the device, the dev_coredumpm()
> > +      * will also free new coredump state.
> >        */
> > -#ifdef CONFIG_DEV_COREDUMP
> >       dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0,
> > GFP_KERNEL,
> > -                     disp_devcoredump_read, disp_devcoredump_free);
> > -     disp_state->coredump_pending = true;
> > -#else
> > -     msm_disp_state_free(disp_state);
> > -#endif
> > -
> > -     mutex_unlock(&disp_state->mutex);
> > +                     disp_devcoredump_read, msm_disp_state_free);
> >  }
> >
> >  void msm_disp_snapshot_state(struct drm_device *drm_dev)
> >  {
> >       struct msm_drm_private *priv;
> >       struct msm_kms *kms;
> > -     struct msm_disp_state *disp_state;
> >
> >       if (!drm_dev) {
> >               DRM_ERROR("invalid params\n");
> > @@ -83,30 +77,13 @@ void msm_disp_snapshot_state(struct drm_device
> > *drm_dev)
> >
> >       priv = drm_dev->dev_private;
> >       kms = priv->kms;
> > -     disp_state = kms->disp_state;
> > -
> > -     if (!disp_state) {
> > -             DRM_ERROR("invalid params\n");
> > -             return;
> > -     }
> >
> > -     /*
> > -      * if there is a coredump pending return immediately till dump
> > -      * if read by userspace or timeout happens
> > -      */
> > -     if (disp_state->coredump_pending) {
> > -             DRM_DEBUG("coredump is pending read\n");
> > -             return;
> > -     }
> > -
> > -     kthread_queue_work(disp_state->dump_worker,
> > -                     &disp_state->dump_work);
> > +     kthread_queue_work(kms->dump_worker, &kms->dump_work);
> >  }
> >
> >  int msm_disp_snapshot_init(struct drm_device *drm_dev)
> >  {
> >       struct msm_drm_private *priv;
> > -     struct msm_disp_state *disp_state;
> >       struct msm_kms *kms;
> >
> >       if (!drm_dev) {
> > @@ -117,22 +94,13 @@ int msm_disp_snapshot_init(struct drm_device
> > *drm_dev)
> >       priv = drm_dev->dev_private;
> >       kms = priv->kms;
> >
> > -     disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct
> > msm_disp_state), GFP_KERNEL);
> > -
> > -     mutex_init(&disp_state->mutex);
> > +     mutex_init(&kms->dump_mutex);
> >
> > -     disp_state->dev = drm_dev->dev;
> > -     disp_state->drm_dev = drm_dev;
> > -
> > -     INIT_LIST_HEAD(&disp_state->blocks);
> > -
> > -     disp_state->dump_worker = kthread_create_worker(0, "%s",
> > "disp_snapshot");
> > -     if (IS_ERR(disp_state->dump_worker))
> > +     kms->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
> > +     if (IS_ERR(kms->dump_worker))
> >               DRM_ERROR("failed to create disp state task\n");
> >
> > -     kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
> > -
> > -     kms->disp_state = disp_state;
> > +     kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
> >
> >       return 0;
> >  }
> > @@ -141,7 +109,6 @@ void msm_disp_snapshot_destroy(struct drm_device
> > *drm_dev)
> >  {
> >       struct msm_kms *kms;
> >       struct msm_drm_private *priv;
> > -     struct msm_disp_state *disp_state;
> >
> >       if (!drm_dev) {
> >               DRM_ERROR("invalid params\n");
> > @@ -150,12 +117,9 @@ void msm_disp_snapshot_destroy(struct drm_device
> > *drm_dev)
> >
> >       priv = drm_dev->dev_private;
> >       kms = priv->kms;
> > -     disp_state = kms->disp_state;
> > -
> > -     if (disp_state->dump_worker)
> > -             kthread_destroy_worker(disp_state->dump_worker);
> >
> > -     list_del(&disp_state->blocks);
> > +     if (kms->dump_worker)
> > +             kthread_destroy_worker(kms->dump_worker);
> >
> > -     mutex_destroy(&disp_state->mutex);
> > +     mutex_destroy(&kms->dump_mutex);
> >  }
> > diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> > b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> > index 32f52799a1ba..c6174a366095 100644
> > --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> > +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> > @@ -41,26 +41,17 @@
> >   * struct msm_disp_state - structure to store current dpu state
> >   * @dev: device pointer
> >   * @drm_dev: drm device pointer
> > - * @mutex: mutex to serialize access to serialze dumps, debugfs access
> > - * @coredump_pending: coredump is pending read from userspace
> >   * @atomic_state: atomic state duplicated at the time of the error
> > - * @dump_worker: kworker thread which runs the dump work
> > - * @dump_work: kwork which dumps the registers and drm state
> >   * @timestamp: timestamp at which the coredump was captured
> >   */
> >  struct msm_disp_state {
> >       struct device *dev;
> >       struct drm_device *drm_dev;
> > -     struct mutex mutex;
> > -
> > -     bool coredump_pending;
> >
> >       struct list_head blocks;
> >
> >       struct drm_atomic_state *atomic_state;
> >
> > -     struct kthread_worker *dump_worker;
> > -     struct kthread_work dump_work;
> >       ktime_t timestamp;
> >  };
> >
> > @@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct
> > msm_disp_state *disp_state);
> >
> >  /**
> >   * msm_disp_state_free - free the memory after the coredump has been
> > read
> > - * @disp_state:          handle to struct msm_disp_state
> > + * @data:        handle to struct msm_disp_state
> >
> >   * Returns: none
> >   */
> > -void msm_disp_state_free(struct msm_disp_state *disp_state);
> > +void msm_disp_state_free(void *data);
> >
> >  /**
> >   * msm_disp_snapshot_add_block - add a hardware block with its
> > register dump
> > diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> > b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> > index ca6632550337..cabe15190ec1 100644
> > --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> > +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> > @@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct
> > msm_disp_state *disp_state)
> >       msm_disp_capture_atomic_state(disp_state);
> >  }
> >
> > -void msm_disp_state_free(struct msm_disp_state *disp_state)
> > +void msm_disp_state_free(void *data)
> >  {
> > +     struct msm_disp_state *disp_state = data;
> >       struct msm_disp_state_block *block, *tmp;
> >
> >       if (disp_state->atomic_state) {
> > @@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state
> > *disp_state)
> >               kfree(block->state);
> >               kfree(block);
> >       }
> > +
> > +     kfree(disp_state);
> >  }
> >
> >  void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state,
> > u32 len,
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h
> > b/drivers/gpu/drm/msm/msm_kms.h
> > index 146dcab123f4..086a2d59b8c8 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -156,8 +156,10 @@ struct msm_kms {
> >       /* mapper-id used to request GEM buffer mapped for scanout: */
> >       struct msm_gem_address_space *aspace;
> >
> > -     /* handle to disp snapshot state */
> > -     struct msm_disp_state *disp_state;
> > +     /* disp snapshot support */
> > +     struct kthread_worker *dump_worker;
> > +     struct kthread_work dump_work;
> > +     struct mutex dump_mutex;
> >
> >       /*
> >        * For async commit, where ->flush_commit() and later happens



-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
