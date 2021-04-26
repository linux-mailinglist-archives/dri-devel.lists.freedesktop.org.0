Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4236BB86
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 00:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74D6E883;
	Mon, 26 Apr 2021 22:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068D16E883
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 22:14:50 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id j19so2539866qtx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RAq8My4wjRjemL6tqurAH0uK5r/Dek/9oOnAphO7Mc=;
 b=r7xTgbZOI8GNfclq/Lx7WRVw8ehrBu21S2md+JyeYuMN2dRjESxlMHeeJAAW7Lyk3k
 43huRjVahswCdnHKejezj9B+VKEMF93fGkHXB7lCUz3tmGz6BQAaNMHYGXftOUftGUCj
 N6RWbOIsuCoYQ82tKobLwPEO27v3uTQkwivrToqOPWtJOeNs3YRFSWljmPTcIQgJAD2h
 YgwPxSjuP2BwHleENg177kTntzVHZuxTa9f9gOPXoLx/sXdrExDfgp/u5yCsaQ6cIsVV
 9yDkyt2LbLwMZ84beM5HHBBUcKVS500EOXE8TxQr8pxelFWdNr42+k6dRIcEKcHovLU/
 Po3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RAq8My4wjRjemL6tqurAH0uK5r/Dek/9oOnAphO7Mc=;
 b=mBVDMrsToMTdF0XcsM4N0ZIa5Knykh2AStvPwp/sByVFz+ZBGxpIttf0oXxh7xVPKT
 Yu+pVMXUJnaK2YLerttT6EOnxaWNVCVYdeb8NXZotJyu1TKhTU82bKruoAx/59L0nFUo
 fCN7vqjPjp+yGrMw51k5k9zrOCiEVCG0FmvG3NjDwV2UWpOsKguOORr+ocA2ES1o+CTI
 iftWTqt3Xm9xC0X8eW1K2gBgkI68AaU3rbvvm1BkaQOaluWPij8vqcErgMIHuMPFuBGG
 GqCfMRoW35ovKnumVCG0kycZlhJS3kESarLjSzKUYQq2AOzsf2ooDEkJPT4i15whYa6Q
 R0aQ==
X-Gm-Message-State: AOAM532Coa+1vYRqBPWH7h9qP6p2tOKkY3EvFzlM72HSEnjZvCVTO6OK
 qNaTqmJBVrI0dJUFU4K3AzgKviYOckS/SNH7fTgpNQ==
X-Google-Smtp-Source: ABdhPJx+sbe+uIOgPmhI1UbrKb3qThOGoq3eXEEXslwcgK0UnFwFG2oOwnzXTNb3MyCtn21e4VBbdV3YzqDi3RCY1ec=
X-Received: by 2002:a05:622a:54a:: with SMTP id
 m10mr19205883qtx.298.1619475288999; 
 Mon, 26 Apr 2021 15:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
 <20210425160800.1201337-3-dmitry.baryshkov@linaro.org>
 <30ed3860d33681e7904005265892f689@codeaurora.org>
 <a88fbf4c-aaa1-a144-dd08-0dd4890818bb@linaro.org>
 <1c465b53e200d0f07959d776ce8e1c10@codeaurora.org>
In-Reply-To: <1c465b53e200d0f07959d776ce8e1c10@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 27 Apr 2021 01:14:37 +0300
Message-ID: <CAA8EJpqaRx8gHOW4S6gvR0Xdwv4FeS_bRguLPDYDK_wbrGJpgQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: make msm_disp_state transient
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021 at 01:03, <abhinavk@codeaurora.org> wrote:
>
> On 2021-04-26 14:23, Dmitry Baryshkov wrote:
> > On 26/04/2021 23:50, abhinavk@codeaurora.org wrote:
> >> On 2021-04-25 09:08, Dmitry Baryshkov wrote:
> >>> Instead of allocating snapshotting structure at the driver probe time
> >>> and later handling concurrent access, actual state, etc, make
> >>> msm_disp_state transient struct. Allocate one when snapshotting
> >>> happens
> >>> and free it after coredump data is read by userspace.
> >>
> >> the purpose of the mutex is that when there are two coredumps being
> >> triggered
> >> by two consecutive errors, we want to make sure that till one coredump
> >> is completely
> >> read and/or processed, we do not allow triggering of another one as we
> >> want to capture
> >> the accurate hardware/software state.
> >>
> >> So moving disp_state out of kms might be okay and just allocated it
> >> when actually capturing the state
> >> but we will need the mutex and some sort of pending flag in my
> >> opinion.
> >
> > I'll return the mutex to the kms struct, so that we won't start
> > another snapshot untill previous one is complete.
>
> I think mutex should remain as part of snapshot so that they go
> together. Since this mutex is not used
> by any other module, I thought its better to keep it there.

I don't think so: we will serialize access to the snapshot, but not
dumping between snapshots. Note, that your code also serializes
writing to snapshot, not reading from it.
With disp_state being allocated on demand we do not have to protect
its contents (since it is not available before registration using
dev_codedumpm).
I thought that you wanted to be sure that one snapshot is fully
captured before next error triggers the next snapshot. And for  this
we'd need 'global' mutex (in kms).

> > Concerning the pending flag, I think it is also handled by the
> > coredump code: dev_coredumpm() will not create another device if there
> > is one already associated with the device being dumped. I should
> > probably mention this in the commit message.
>
> Thats a good point, I checked that now as well but I still think we need
> this flag because
> it also makes sure devcoredump is taken and read together within our
> driver itself instead of relying
> on the devcoredump. Its not a strong preference.
>
> But if you would like to go ahead with this, might have to retest its
> robustness.
> With the older logic how i verified this was that I relaxed the underrun
> cnt check in this patch
> ( https://patchwork.freedesktop.org/patch/429112/?series=89181&rev=1 )
> here and simulated an error:
>
> @@ -1336,6 +1337,11 @@  static void dpu_encoder_underrun_callback(struct
> drm_encoder *drm_enc,
>
>         DPU_ATRACE_BEGIN("encoder_underrun_callback");
>         atomic_inc(&phy_enc->underrun_cnt);
> +
> +       /* trigger dump only on the first underrun */
> +       if (atomic_read(&phy_enc->underrun_cnt) == 1)
> +               msm_disp_snapshot_state(drm_enc->dev);
> +
>
> And verified that across various underrun interrupts, the devcoredump is
> stable.

I'll try testing it this way, thank you for the pointer!

>
> >
> > If you agree with this, I'll send v2 then (also adding plls dumping).
> Looking fwd to seeing the pll dumping, that will be a great addition to
> this.
> >
> >>
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 87
> >>> ++++---------------
> >>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
> >>>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
> >>>  drivers/gpu/drm/msm/msm_kms.h                 |  5 +-
> >>>  4 files changed, 28 insertions(+), 82 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> >>> index 70fd5a1fe13e..371358893716 100644
> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> >>> @@ -7,8 +7,7 @@
> >>>
> >>>  #include "msm_disp_snapshot.h"
> >>>
> >>> -#ifdef CONFIG_DEV_COREDUMP
> >>> -static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
> >>> +static ssize_t __maybe_unused disp_devcoredump_read(char *buffer,
> >>> loff_t offset,
> >>>          size_t count, void *data, size_t datalen)
> >>>  {
> >>>      struct drm_print_iterator iter;
> >>> @@ -29,24 +28,21 @@ static ssize_t disp_devcoredump_read(char
> >>> *buffer,
> >>> loff_t offset,
> >>>      return count - iter.remain;
> >>>  }
> >>>
> >>> -static void disp_devcoredump_free(void *data)
> >>> +static void _msm_disp_snapshot_work(struct kthread_work *work)
> >>>  {
> >>> +    struct msm_kms *msm_kms = container_of(work, struct msm_kms,
> >>> dump_work);
> >>> +    struct drm_device *drm_dev = msm_kms->dev;
> >>>      struct msm_disp_state *disp_state;
> >>> +    struct drm_printer p;
> >>>
> >>> -    disp_state = data;
> >>> -
> >>> -    msm_disp_state_free(disp_state);
> >>> -
> >>> -    disp_state->coredump_pending = false;
> >>> -}
> >>> -#endif /* CONFIG_DEV_COREDUMP */
> >>> +    disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
> >>> +    if (!disp_state)
> >>> +        return;
> >>>
> >>> -static void _msm_disp_snapshot_work(struct kthread_work *work)
> >>> -{
> >>> -    struct msm_disp_state *disp_state = container_of(work, struct
> >>> msm_disp_state, dump_work);
> >>> -    struct drm_printer p;
> >>> +    disp_state->dev = drm_dev->dev;
> >>> +    disp_state->drm_dev = drm_dev;
> >>>
> >>> -    mutex_lock(&disp_state->mutex);
> >>> +    INIT_LIST_HEAD(&disp_state->blocks);
> >>>
> >>>      msm_disp_snapshot_capture_state(disp_state);
> >>>
> >>> @@ -55,26 +51,15 @@ static void _msm_disp_snapshot_work(struct
> >>> kthread_work *work)
> >>>          msm_disp_state_print(disp_state, &p);
> >>>      }
> >>>
> >>> -    /*
> >>> -     * if devcoredump is not defined free the state immediately
> >>> -     * otherwise it will be freed in the free handler.
> >>> -     */
> >>> -#ifdef CONFIG_DEV_COREDUMP
> >>> +    /* If COREDUMP is disabled, the stub will call the free
> >>> function. */
> >> This is a good cleanup, I just checked that the free() is called even
> >> if the config is not enabled
> >>>      dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0,
> >>> GFP_KERNEL,
> >>> -            disp_devcoredump_read, disp_devcoredump_free);
> >>> -    disp_state->coredump_pending = true;
> >>> -#else
> >>> -    msm_disp_state_free(disp_state);
> >>> -#endif
> >>> -
> >>> -    mutex_unlock(&disp_state->mutex);
> >>> +            disp_devcoredump_read, msm_disp_state_free);
> >>>  }
> >>>
> >>>  void msm_disp_snapshot_state(struct drm_device *drm_dev)
> >>>  {
> >>>      struct msm_drm_private *priv;
> >>>      struct msm_kms *kms;
> >>> -    struct msm_disp_state *disp_state;
> >>>
> >>>      if (!drm_dev) {
> >>>          DRM_ERROR("invalid params\n");
> >>> @@ -83,30 +68,13 @@ void msm_disp_snapshot_state(struct drm_device
> >>> *drm_dev)
> >>>
> >>>      priv = drm_dev->dev_private;
> >>>      kms = priv->kms;
> >>> -    disp_state = kms->disp_state;
> >>> -
> >>> -    if (!disp_state) {
> >>> -        DRM_ERROR("invalid params\n");
> >>> -        return;
> >>> -    }
> >>> -
> >>> -    /*
> >>> -     * if there is a coredump pending return immediately till dump
> >>> -     * if read by userspace or timeout happens
> >>> -     */
> >>> -    if (disp_state->coredump_pending) {
> >>> -        DRM_DEBUG("coredump is pending read\n");
> >>> -        return;
> >>> -    }
> >>>
> >>> -    kthread_queue_work(disp_state->dump_worker,
> >>> -            &disp_state->dump_work);
> >>> +    kthread_queue_work(kms->dump_worker, &kms->dump_work);
> >>>  }
> >>>
> >>>  int msm_disp_snapshot_init(struct drm_device *drm_dev)
> >>>  {
> >>>      struct msm_drm_private *priv;
> >>> -    struct msm_disp_state *disp_state;
> >>>      struct msm_kms *kms;
> >>>
> >>>      if (!drm_dev) {
> >>> @@ -117,22 +85,11 @@ int msm_disp_snapshot_init(struct drm_device
> >>> *drm_dev)
> >>>      priv = drm_dev->dev_private;
> >>>      kms = priv->kms;
> >>>
> >>> -    disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct
> >>> msm_disp_state), GFP_KERNEL);
> >>> -
> >>> -    mutex_init(&disp_state->mutex);
> >>> -
> >>> -    disp_state->dev = drm_dev->dev;
> >>> -    disp_state->drm_dev = drm_dev;
> >>> -
> >>> -    INIT_LIST_HEAD(&disp_state->blocks);
> >>> -
> >>> -    disp_state->dump_worker = kthread_create_worker(0, "%s",
> >>> "disp_snapshot");
> >>> -    if (IS_ERR(disp_state->dump_worker))
> >>> +    kms->dump_worker = kthread_create_worker(0, "%s",
> >>> "disp_snapshot");
> >>> +    if (IS_ERR(kms->dump_worker))
> >>>          DRM_ERROR("failed to create disp state task\n");
> >>>
> >>> -    kthread_init_work(&disp_state->dump_work,
> >>> _msm_disp_snapshot_work);
> >>> -
> >>> -    kms->disp_state = disp_state;
> >>> +    kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
> >>>
> >>>      return 0;
> >>>  }
> >>> @@ -141,7 +98,6 @@ void msm_disp_snapshot_destroy(struct drm_device
> >>> *drm_dev)
> >>>  {
> >>>      struct msm_kms *kms;
> >>>      struct msm_drm_private *priv;
> >>> -    struct msm_disp_state *disp_state;
> >>>
> >>>      if (!drm_dev) {
> >>>          DRM_ERROR("invalid params\n");
> >>> @@ -150,12 +106,7 @@ void msm_disp_snapshot_destroy(struct drm_device
> >>> *drm_dev)
> >>>
> >>>      priv = drm_dev->dev_private;
> >>>      kms = priv->kms;
> >>> -    disp_state = kms->disp_state;
> >>> -
> >>> -    if (disp_state->dump_worker)
> >>> -        kthread_destroy_worker(disp_state->dump_worker);
> >>> -
> >>> -    list_del(&disp_state->blocks);
> >>>
> >>> -    mutex_destroy(&disp_state->mutex);
> >>> +    if (kms->dump_worker)
> >>> +        kthread_destroy_worker(kms->dump_worker);
> >>>  }
> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> >>> index 32f52799a1ba..c6174a366095 100644
> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
> >>> @@ -41,26 +41,17 @@
> >>>   * struct msm_disp_state - structure to store current dpu state
> >>>   * @dev: device pointer
> >>>   * @drm_dev: drm device pointer
> >>> - * @mutex: mutex to serialize access to serialze dumps, debugfs
> >>> access
> >>> - * @coredump_pending: coredump is pending read from userspace
> >>>   * @atomic_state: atomic state duplicated at the time of the error
> >>> - * @dump_worker: kworker thread which runs the dump work
> >>> - * @dump_work: kwork which dumps the registers and drm state
> >>>   * @timestamp: timestamp at which the coredump was captured
> >>>   */
> >>>  struct msm_disp_state {
> >>>      struct device *dev;
> >>>      struct drm_device *drm_dev;
> >>> -    struct mutex mutex;
> >>> -
> >>> -    bool coredump_pending;
> >>>
> >>>      struct list_head blocks;
> >>>
> >>>      struct drm_atomic_state *atomic_state;
> >>>
> >>> -    struct kthread_worker *dump_worker;
> >>> -    struct kthread_work dump_work;
> >>>      ktime_t timestamp;
> >>>  };
> >>>
> >>> @@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct
> >>> msm_disp_state *disp_state);
> >>>
> >>>  /**
> >>>   * msm_disp_state_free - free the memory after the coredump has been
> >>> read
> >>> - * @disp_state:        handle to struct msm_disp_state
> >>> + * @data:        handle to struct msm_disp_state
> >>>
> >>>   * Returns: none
> >>>   */
> >>> -void msm_disp_state_free(struct msm_disp_state *disp_state);
> >>> +void msm_disp_state_free(void *data);
> >>>
> >>>  /**
> >>>   * msm_disp_snapshot_add_block - add a hardware block with its
> >>> register dump
> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> >>> index ca6632550337..cabe15190ec1 100644
> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> >>> @@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct
> >>> msm_disp_state *disp_state)
> >>>      msm_disp_capture_atomic_state(disp_state);
> >>>  }
> >>>
> >>> -void msm_disp_state_free(struct msm_disp_state *disp_state)
> >>> +void msm_disp_state_free(void *data)
> >>>  {
> >>> +    struct msm_disp_state *disp_state = data;
> >>>      struct msm_disp_state_block *block, *tmp;
> >>>
> >>>      if (disp_state->atomic_state) {
> >>> @@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state
> >>> *disp_state)
> >>>          kfree(block->state);
> >>>          kfree(block);
> >>>      }
> >>> +
> >>> +    kfree(disp_state);
> >>>  }
> >>>
> >>>  void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state,
> >>> u32 len,
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.h
> >>> b/drivers/gpu/drm/msm/msm_kms.h
> >>> index 146dcab123f4..529b9dacf7ca 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.h
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.h
> >>> @@ -156,8 +156,9 @@ struct msm_kms {
> >>>      /* mapper-id used to request GEM buffer mapped for scanout: */
> >>>      struct msm_gem_address_space *aspace;
> >>>
> >>> -    /* handle to disp snapshot state */
> >>> -    struct msm_disp_state *disp_state;
> >>> +    /* disp snapshot support */
> >>> +    struct kthread_worker *dump_worker;
> >>> +    struct kthread_work dump_work;
> >>>
> >>>      /*
> >>>       * For async commit, where ->flush_commit() and later happens



-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
