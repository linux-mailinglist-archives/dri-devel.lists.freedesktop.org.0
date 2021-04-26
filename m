Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C453F36BBDD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 00:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881189F31;
	Mon, 26 Apr 2021 22:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D0A89F31
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 22:56:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619477779; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nJlW5FHrGmuFBHiwVhBJ7d41XXNEEZmQ1UNbJjpF4Jg=;
 b=se/rlc4tghjmKiKzhYkYf0wjY+Npk+LHoCaY5YvYWQ74x/2RDuOExAu8sYbR06iW+hM3j/cx
 kqwIuc3gv5IF41GpS1GWJdy0uHQkbrxWjcj5tQtHHBoBwfv/Zee2L0aRUH4LagY0HP12FgTW
 ARGuETykhbjLAwHAEwNMQ6+qHYY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60874510853c0a2c460a6f7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 22:56:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 189B1C4323A; Mon, 26 Apr 2021 22:56:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC452C4338A;
 Mon, 26 Apr 2021 22:56:12 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Apr 2021 15:56:12 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: make msm_disp_state transient
 data struct
In-Reply-To: <CAA8EJpqaRx8gHOW4S6gvR0Xdwv4FeS_bRguLPDYDK_wbrGJpgQ@mail.gmail.com>
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
 <20210425160800.1201337-3-dmitry.baryshkov@linaro.org>
 <30ed3860d33681e7904005265892f689@codeaurora.org>
 <a88fbf4c-aaa1-a144-dd08-0dd4890818bb@linaro.org>
 <1c465b53e200d0f07959d776ce8e1c10@codeaurora.org>
 <CAA8EJpqaRx8gHOW4S6gvR0Xdwv4FeS_bRguLPDYDK_wbrGJpgQ@mail.gmail.com>
Message-ID: <186825e2fb7bea8d45f33b5c1fa3509f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-26 15:14, Dmitry Baryshkov wrote:
> On Tue, 27 Apr 2021 at 01:03, <abhinavk@codeaurora.org> wrote:
>> 
>> On 2021-04-26 14:23, Dmitry Baryshkov wrote:
>> > On 26/04/2021 23:50, abhinavk@codeaurora.org wrote:
>> >> On 2021-04-25 09:08, Dmitry Baryshkov wrote:
>> >>> Instead of allocating snapshotting structure at the driver probe time
>> >>> and later handling concurrent access, actual state, etc, make
>> >>> msm_disp_state transient struct. Allocate one when snapshotting
>> >>> happens
>> >>> and free it after coredump data is read by userspace.
>> >>
>> >> the purpose of the mutex is that when there are two coredumps being
>> >> triggered
>> >> by two consecutive errors, we want to make sure that till one coredump
>> >> is completely
>> >> read and/or processed, we do not allow triggering of another one as we
>> >> want to capture
>> >> the accurate hardware/software state.
>> >>
>> >> So moving disp_state out of kms might be okay and just allocated it
>> >> when actually capturing the state
>> >> but we will need the mutex and some sort of pending flag in my
>> >> opinion.
>> >
>> > I'll return the mutex to the kms struct, so that we won't start
>> > another snapshot untill previous one is complete.
>> 
>> I think mutex should remain as part of snapshot so that they go
>> together. Since this mutex is not used
>> by any other module, I thought its better to keep it there.
> 
> I don't think so: we will serialize access to the snapshot, but not
> dumping between snapshots. Note, that your code also serializes
> writing to snapshot, not reading from it.
> With disp_state being allocated on demand we do not have to protect
> its contents (since it is not available before registration using
> dev_codedumpm).
> I thought that you wanted to be sure that one snapshot is fully
> captured before next error triggers the next snapshot. And for  this
> we'd need 'global' mutex (in kms).

True, the intention of the mutex is to serialize access to snapshot.
the coredump_pending flag is the one which will serialize the write and 
read
because its set to false only in the free() method of the coredump.
I was referring to the pending flag when I meant that it will serialize 
read/write.

Regarding the mutex, well, if you word it that way that it protects one 
snapshot
from being overwritten by the other and hence we need a 'global' mutex 
in kms, it convinced
me :)

The only reason it was within the disp_state itself was because its not 
used outside the module
but I am okay with moving it to kms if Rob is okay with that.

> 
>> > Concerning the pending flag, I think it is also handled by the
>> > coredump code: dev_coredumpm() will not create another device if there
>> > is one already associated with the device being dumped. I should
>> > probably mention this in the commit message.
>> 
>> Thats a good point, I checked that now as well but I still think we 
>> need
>> this flag because
>> it also makes sure devcoredump is taken and read together within our
>> driver itself instead of relying
>> on the devcoredump. Its not a strong preference.
>> 
>> But if you would like to go ahead with this, might have to retest its
>> robustness.
>> With the older logic how i verified this was that I relaxed the 
>> underrun
>> cnt check in this patch
>> ( https://patchwork.freedesktop.org/patch/429112/?series=89181&rev=1 )
>> here and simulated an error:
>> 
>> @@ -1336,6 +1337,11 @@  static void 
>> dpu_encoder_underrun_callback(struct
>> drm_encoder *drm_enc,
>> 
>>         DPU_ATRACE_BEGIN("encoder_underrun_callback");
>>         atomic_inc(&phy_enc->underrun_cnt);
>> +
>> +       /* trigger dump only on the first underrun */
>> +       if (atomic_read(&phy_enc->underrun_cnt) == 1)
>> +               msm_disp_snapshot_state(drm_enc->dev);
>> +
>> 
>> And verified that across various underrun interrupts, the devcoredump 
>> is
>> stable.
> 
> I'll try testing it this way, thank you for the pointer!
> 
>> 
>> >
>> > If you agree with this, I'll send v2 then (also adding plls dumping).
>> Looking fwd to seeing the pll dumping, that will be a great addition 
>> to
>> this.
>> >
>> >>
>> >>>
>> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> >>> ---
>> >>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 87
>> >>> ++++---------------
>> >>>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
>> >>>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
>> >>>  drivers/gpu/drm/msm/msm_kms.h                 |  5 +-
>> >>>  4 files changed, 28 insertions(+), 82 deletions(-)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> >>> index 70fd5a1fe13e..371358893716 100644
>> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>> >>> @@ -7,8 +7,7 @@
>> >>>
>> >>>  #include "msm_disp_snapshot.h"
>> >>>
>> >>> -#ifdef CONFIG_DEV_COREDUMP
>> >>> -static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
>> >>> +static ssize_t __maybe_unused disp_devcoredump_read(char *buffer,
>> >>> loff_t offset,
>> >>>          size_t count, void *data, size_t datalen)
>> >>>  {
>> >>>      struct drm_print_iterator iter;
>> >>> @@ -29,24 +28,21 @@ static ssize_t disp_devcoredump_read(char
>> >>> *buffer,
>> >>> loff_t offset,
>> >>>      return count - iter.remain;
>> >>>  }
>> >>>
>> >>> -static void disp_devcoredump_free(void *data)
>> >>> +static void _msm_disp_snapshot_work(struct kthread_work *work)
>> >>>  {
>> >>> +    struct msm_kms *msm_kms = container_of(work, struct msm_kms,
>> >>> dump_work);
>> >>> +    struct drm_device *drm_dev = msm_kms->dev;
>> >>>      struct msm_disp_state *disp_state;
>> >>> +    struct drm_printer p;
>> >>>
>> >>> -    disp_state = data;
>> >>> -
>> >>> -    msm_disp_state_free(disp_state);
>> >>> -
>> >>> -    disp_state->coredump_pending = false;
>> >>> -}
>> >>> -#endif /* CONFIG_DEV_COREDUMP */
>> >>> +    disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
>> >>> +    if (!disp_state)
>> >>> +        return;
>> >>>
>> >>> -static void _msm_disp_snapshot_work(struct kthread_work *work)
>> >>> -{
>> >>> -    struct msm_disp_state *disp_state = container_of(work, struct
>> >>> msm_disp_state, dump_work);
>> >>> -    struct drm_printer p;
>> >>> +    disp_state->dev = drm_dev->dev;
>> >>> +    disp_state->drm_dev = drm_dev;
>> >>>
>> >>> -    mutex_lock(&disp_state->mutex);
>> >>> +    INIT_LIST_HEAD(&disp_state->blocks);
>> >>>
>> >>>      msm_disp_snapshot_capture_state(disp_state);
>> >>>
>> >>> @@ -55,26 +51,15 @@ static void _msm_disp_snapshot_work(struct
>> >>> kthread_work *work)
>> >>>          msm_disp_state_print(disp_state, &p);
>> >>>      }
>> >>>
>> >>> -    /*
>> >>> -     * if devcoredump is not defined free the state immediately
>> >>> -     * otherwise it will be freed in the free handler.
>> >>> -     */
>> >>> -#ifdef CONFIG_DEV_COREDUMP
>> >>> +    /* If COREDUMP is disabled, the stub will call the free
>> >>> function. */
>> >> This is a good cleanup, I just checked that the free() is called even
>> >> if the config is not enabled
>> >>>      dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0,
>> >>> GFP_KERNEL,
>> >>> -            disp_devcoredump_read, disp_devcoredump_free);
>> >>> -    disp_state->coredump_pending = true;
>> >>> -#else
>> >>> -    msm_disp_state_free(disp_state);
>> >>> -#endif
>> >>> -
>> >>> -    mutex_unlock(&disp_state->mutex);
>> >>> +            disp_devcoredump_read, msm_disp_state_free);
>> >>>  }
>> >>>
>> >>>  void msm_disp_snapshot_state(struct drm_device *drm_dev)
>> >>>  {
>> >>>      struct msm_drm_private *priv;
>> >>>      struct msm_kms *kms;
>> >>> -    struct msm_disp_state *disp_state;
>> >>>
>> >>>      if (!drm_dev) {
>> >>>          DRM_ERROR("invalid params\n");
>> >>> @@ -83,30 +68,13 @@ void msm_disp_snapshot_state(struct drm_device
>> >>> *drm_dev)
>> >>>
>> >>>      priv = drm_dev->dev_private;
>> >>>      kms = priv->kms;
>> >>> -    disp_state = kms->disp_state;
>> >>> -
>> >>> -    if (!disp_state) {
>> >>> -        DRM_ERROR("invalid params\n");
>> >>> -        return;
>> >>> -    }
>> >>> -
>> >>> -    /*
>> >>> -     * if there is a coredump pending return immediately till dump
>> >>> -     * if read by userspace or timeout happens
>> >>> -     */
>> >>> -    if (disp_state->coredump_pending) {
>> >>> -        DRM_DEBUG("coredump is pending read\n");
>> >>> -        return;
>> >>> -    }
>> >>>
>> >>> -    kthread_queue_work(disp_state->dump_worker,
>> >>> -            &disp_state->dump_work);
>> >>> +    kthread_queue_work(kms->dump_worker, &kms->dump_work);
>> >>>  }
>> >>>
>> >>>  int msm_disp_snapshot_init(struct drm_device *drm_dev)
>> >>>  {
>> >>>      struct msm_drm_private *priv;
>> >>> -    struct msm_disp_state *disp_state;
>> >>>      struct msm_kms *kms;
>> >>>
>> >>>      if (!drm_dev) {
>> >>> @@ -117,22 +85,11 @@ int msm_disp_snapshot_init(struct drm_device
>> >>> *drm_dev)
>> >>>      priv = drm_dev->dev_private;
>> >>>      kms = priv->kms;
>> >>>
>> >>> -    disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct
>> >>> msm_disp_state), GFP_KERNEL);
>> >>> -
>> >>> -    mutex_init(&disp_state->mutex);
>> >>> -
>> >>> -    disp_state->dev = drm_dev->dev;
>> >>> -    disp_state->drm_dev = drm_dev;
>> >>> -
>> >>> -    INIT_LIST_HEAD(&disp_state->blocks);
>> >>> -
>> >>> -    disp_state->dump_worker = kthread_create_worker(0, "%s",
>> >>> "disp_snapshot");
>> >>> -    if (IS_ERR(disp_state->dump_worker))
>> >>> +    kms->dump_worker = kthread_create_worker(0, "%s",
>> >>> "disp_snapshot");
>> >>> +    if (IS_ERR(kms->dump_worker))
>> >>>          DRM_ERROR("failed to create disp state task\n");
>> >>>
>> >>> -    kthread_init_work(&disp_state->dump_work,
>> >>> _msm_disp_snapshot_work);
>> >>> -
>> >>> -    kms->disp_state = disp_state;
>> >>> +    kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
>> >>>
>> >>>      return 0;
>> >>>  }
>> >>> @@ -141,7 +98,6 @@ void msm_disp_snapshot_destroy(struct drm_device
>> >>> *drm_dev)
>> >>>  {
>> >>>      struct msm_kms *kms;
>> >>>      struct msm_drm_private *priv;
>> >>> -    struct msm_disp_state *disp_state;
>> >>>
>> >>>      if (!drm_dev) {
>> >>>          DRM_ERROR("invalid params\n");
>> >>> @@ -150,12 +106,7 @@ void msm_disp_snapshot_destroy(struct drm_device
>> >>> *drm_dev)
>> >>>
>> >>>      priv = drm_dev->dev_private;
>> >>>      kms = priv->kms;
>> >>> -    disp_state = kms->disp_state;
>> >>> -
>> >>> -    if (disp_state->dump_worker)
>> >>> -        kthread_destroy_worker(disp_state->dump_worker);
>> >>> -
>> >>> -    list_del(&disp_state->blocks);
>> >>>
>> >>> -    mutex_destroy(&disp_state->mutex);
>> >>> +    if (kms->dump_worker)
>> >>> +        kthread_destroy_worker(kms->dump_worker);
>> >>>  }
>> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> >>> index 32f52799a1ba..c6174a366095 100644
>> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>> >>> @@ -41,26 +41,17 @@
>> >>>   * struct msm_disp_state - structure to store current dpu state
>> >>>   * @dev: device pointer
>> >>>   * @drm_dev: drm device pointer
>> >>> - * @mutex: mutex to serialize access to serialze dumps, debugfs
>> >>> access
>> >>> - * @coredump_pending: coredump is pending read from userspace
>> >>>   * @atomic_state: atomic state duplicated at the time of the error
>> >>> - * @dump_worker: kworker thread which runs the dump work
>> >>> - * @dump_work: kwork which dumps the registers and drm state
>> >>>   * @timestamp: timestamp at which the coredump was captured
>> >>>   */
>> >>>  struct msm_disp_state {
>> >>>      struct device *dev;
>> >>>      struct drm_device *drm_dev;
>> >>> -    struct mutex mutex;
>> >>> -
>> >>> -    bool coredump_pending;
>> >>>
>> >>>      struct list_head blocks;
>> >>>
>> >>>      struct drm_atomic_state *atomic_state;
>> >>>
>> >>> -    struct kthread_worker *dump_worker;
>> >>> -    struct kthread_work dump_work;
>> >>>      ktime_t timestamp;
>> >>>  };
>> >>>
>> >>> @@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct
>> >>> msm_disp_state *disp_state);
>> >>>
>> >>>  /**
>> >>>   * msm_disp_state_free - free the memory after the coredump has been
>> >>> read
>> >>> - * @disp_state:        handle to struct msm_disp_state
>> >>> + * @data:        handle to struct msm_disp_state
>> >>>
>> >>>   * Returns: none
>> >>>   */
>> >>> -void msm_disp_state_free(struct msm_disp_state *disp_state);
>> >>> +void msm_disp_state_free(void *data);
>> >>>
>> >>>  /**
>> >>>   * msm_disp_snapshot_add_block - add a hardware block with its
>> >>> register dump
>> >>> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> >>> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> >>> index ca6632550337..cabe15190ec1 100644
>> >>> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> >>> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
>> >>> @@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct
>> >>> msm_disp_state *disp_state)
>> >>>      msm_disp_capture_atomic_state(disp_state);
>> >>>  }
>> >>>
>> >>> -void msm_disp_state_free(struct msm_disp_state *disp_state)
>> >>> +void msm_disp_state_free(void *data)
>> >>>  {
>> >>> +    struct msm_disp_state *disp_state = data;
>> >>>      struct msm_disp_state_block *block, *tmp;
>> >>>
>> >>>      if (disp_state->atomic_state) {
>> >>> @@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state
>> >>> *disp_state)
>> >>>          kfree(block->state);
>> >>>          kfree(block);
>> >>>      }
>> >>> +
>> >>> +    kfree(disp_state);
>> >>>  }
>> >>>
>> >>>  void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state,
>> >>> u32 len,
>> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.h
>> >>> b/drivers/gpu/drm/msm/msm_kms.h
>> >>> index 146dcab123f4..529b9dacf7ca 100644
>> >>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> >>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> >>> @@ -156,8 +156,9 @@ struct msm_kms {
>> >>>      /* mapper-id used to request GEM buffer mapped for scanout: */
>> >>>      struct msm_gem_address_space *aspace;
>> >>>
>> >>> -    /* handle to disp snapshot state */
>> >>> -    struct msm_disp_state *disp_state;
>> >>> +    /* disp snapshot support */
>> >>> +    struct kthread_worker *dump_worker;
>> >>> +    struct kthread_work dump_work;
>> >>>
>> >>>      /*
>> >>>       * For async commit, where ->flush_commit() and later happens
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
