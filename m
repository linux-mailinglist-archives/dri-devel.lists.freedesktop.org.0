Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CE845602
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 12:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204410E2DC;
	Thu,  1 Feb 2024 11:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BBC10E2DC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 11:09:44 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a27e7b70152so26139866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Feb 2024 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706785783; x=1707390583; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4zajV3DuntnwciMaJsJzMp72JxPFMFfqsP1I/Ggssmk=;
 b=lpFIDgZ3Xhyspy9utmr0fzxtAfIRDP2HTjIIaonaJzFWCkC6B5nVAzQvJOKLTRHaT4
 ocdqFjYqdtv4umtRPoiWoUZXA7O2MKTbKEUgPFYm9uCMvjMKeUmI3LKaQaOsa6zAo57y
 NiXDC3gWFmHfgQ2f0hLf2SfBGQPnDGCgWTVwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706785783; x=1707390583;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zajV3DuntnwciMaJsJzMp72JxPFMFfqsP1I/Ggssmk=;
 b=j51Lddqyth3iTRDj8aFMYVhxgt5V2vv4Xy901aMSsrADrDjgKLGRUTq1qMxmpJ9Ddh
 arf/K0HHSEQGNbQo2+UuHQ0OKNDkV02Kk7iELY+xjvpUgmsrQ57fKOhSXku5FLix0aWz
 lvuN5KM5bHOjmcZVQdFhuFCrr23YUsD3uRxsk4gcfa860tcb5obKI0lyEIWScMgFgmvv
 VsMHJFX77eSUlxE1hz8hKPpQDAaqDaCPrfScPGq6vEW5xnDpKY7eq5gPhaa8tMYylWfh
 SdrP5TBVq9voQO02eg5aGp0+6vqFCQeho3eKH9cRX+4ohnc2dWij39E33P7j3o5pp+Tn
 RPAQ==
X-Gm-Message-State: AOJu0YyeU/ssHd+yjbrVb5xS8ORpjjM7GcnklbTptGbxVwMrQ7p9iI1I
 pBEQwK7IuM7RVTI/uV0tzN7xaDL9ehAGSmK4W3IDAXIv2E5KV0ywWAzDMoRWpfw=
X-Google-Smtp-Source: AGHT+IFg8DiVsYSA87BtWAPkltvveg4AFEMlXJSRBxkZMD9C3Jau28z+jXxHKQ/dVAwLu2T9H7lRNw==
X-Received: by 2002:a17:907:9723:b0:a34:d7db:1ae3 with SMTP id
 jg35-20020a170907972300b00a34d7db1ae3mr1997192ejc.1.1706785782656; 
 Thu, 01 Feb 2024 03:09:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXFTk/8Sn722GKhFK+xeaHRbUnFkRwwlo4tNpE9d3BAxL40EuNdWk8HzH2dDLqlgaWRS/EU9ONmd8HnrKKqDWBjJfl0FmT+S9CunFxqxjvtDKCDVkw/zrE9qLY5UbjZfLN15hpsJL2JxQZ7QE87xP3Rp5Vc9Js0qbjUy6KyOvtZElYg1wO4dga+csLc7iq3qxUgPPS8R5ZU+mEzoPvKPUMKcYivHbR6B0R8fA5iIHo9t7CLtMbwU6fcTFnMPsDXgM+maupFyROwt6PLg2f4FkDvT8JqU1UEsBffAT4R
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 mc4-20020a170906eb4400b00a338fedb9ebsm7146900ejb.54.2024.02.01.03.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 03:09:42 -0800 (PST)
Date: Thu, 1 Feb 2024 12:09:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matt Coster <Matt.Coster@imgtec.com>
Subject: Re: [PATCH] drm/imagination: On device loss, handle unplug after
 critical section
Message-ID: <Zbt79ORZzz4Eo7uT@phenom.ffwll.local>
References: <59bb4827-43a5-4e87-8026-77777b2a8087@imgtec.com>
 <ZbKsE2mWTZTfsFBk@phenom.ffwll.local>
 <42207bd6-2167-49a3-8895-b76fb79a06e6@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42207bd6-2167-49a3-8895-b76fb79a06e6@imgtec.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 05:22:26PM +0000, Matt Coster wrote:
> On 25/01/2024 18:44, Daniel Vetter wrote:
> > On Tue, Jan 23, 2024 at 01:04:24PM +0000, Matt Coster wrote:
> >> From: Donald Robson <donald.robson@imgtec.com>
> >>
> >> When the kernel driver 'loses' the device, for instance if the firmware
> >> stops communicating, the driver calls drm_dev_unplug(). This is
> >> currently done inside the drm_dev_enter() critical section, which isn't
> >> permitted. In addition, the bool that marks the device as lost is not
> >> atomic or protected by a lock.
> >>
> >> This fix replaces the bool with an atomic that also acts as a mechanism
> >> to ensure the device is unplugged after drm_dev_exit(), preventing a
> >> concurrent call to drm_dev_enter() from succeeding in a race between it
> >> and drm_dev_unplug().
> > 
> > Uh ... atomic_t does not make locking.
> > 
> > From a quick look this entire thing smells a bit like bad design overall,
> > and my gut feeling is that you probably want to rip out pvr_dev->lost
> > outright. Or alternatively, explain what exactly this does beyond
> > drm_dev_enter/exit, and then probably add that functionality there instead
> > of hand-roll lockless trickery in drivers.
> > 
> > From a quick look keeping track of where you realize the device is lost
> > and then calling drm_dev_unplug after the drm_dev_exit is probably the
> > clean solution. That also means the drm_dev_unplug() is not delayed due to
> > a drm_dev_enter/exit section on a different thread, which is probably a
> > good thing.
> > 
> > Cheers, Sima
> 
> Hi Sima,
> 
> Thanks for taking the time to look over this patch.
> 
> This was the last piece of work Donald did for us at Imagination but he
> never got a chance to send it out himself.
> 
> I'll put it on my list to try a new, more minimal, approach before
> sending a v2. Your suggestion sounds very promising – that's probably
> the first thing I'll try.

If it turns out to not be enough, then I think adding some tracking for
delayed unplug to drm_dev_enter/exit might be a good addition. But it
should imo be done in core drm code, with some proper docs, explanations
and really clear comments about why the locking/atomics/barriers are
correct. Since that stuff is tricky and having drivers play atomic
trickery worries me a lot ..

Cheers, Sima

> 
> Cheers,
> Matt
>  
> >> Reported-by: Steven Price <steven.price@arm.com>
> >> Closes: https://lore.kernel.org/dri-devel/1b957ca4-71cf-42fd-ac81-1920592b952d@arm.com/
> >> Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
> >> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> >> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> >> ---
> >>  drivers/gpu/drm/imagination/pvr_ccb.c      |  2 +-
> >>  drivers/gpu/drm/imagination/pvr_device.c   | 98 +++++++++++++++++++++-
> >>  drivers/gpu/drm/imagination/pvr_device.h   | 72 +++++++++++++---
> >>  drivers/gpu/drm/imagination/pvr_drv.c      | 87 ++++++++++---------
> >>  drivers/gpu/drm/imagination/pvr_fw.c       | 12 +--
> >>  drivers/gpu/drm/imagination/pvr_fw_trace.c |  4 +-
> >>  drivers/gpu/drm/imagination/pvr_mmu.c      | 20 ++---
> >>  drivers/gpu/drm/imagination/pvr_power.c    | 42 +++-------
> >>  drivers/gpu/drm/imagination/pvr_power.h    |  2 -
> >>  9 files changed, 237 insertions(+), 102 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
> >> index 4deeac7ed40a..1fe64adc0c2c 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_ccb.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_ccb.c
> >> @@ -247,7 +247,7 @@ pvr_kccb_send_cmd_reserved_powered(struct pvr_device *pvr_dev,
> >>  	u32 old_write_offset;
> >>  	u32 new_write_offset;
> >>  
> >> -	WARN_ON(pvr_dev->lost);
> >> +	WARN_ON(pvr_device_is_lost(pvr_dev));
> >>  
> >>  	mutex_lock(&pvr_ccb->lock);
> >>  
> >> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> >> index 1704c0268589..397491375b7d 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_device.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> >> @@ -6,14 +6,15 @@
> >>  
> >>  #include "pvr_fw.h"
> >>  #include "pvr_params.h"
> >> -#include "pvr_power.h"
> >>  #include "pvr_queue.h"
> >>  #include "pvr_rogue_cr_defs.h"
> >>  #include "pvr_stream.h"
> >>  #include "pvr_vm.h"
> >>  
> >> +#include <drm/drm_drv.h>
> >>  #include <drm/drm_print.h>
> >>  
> >> +#include <linux/atomic.h>
> >>  #include <linux/bitfield.h>
> >>  #include <linux/clk.h>
> >>  #include <linux/compiler_attributes.h>
> >> @@ -556,6 +557,101 @@ pvr_device_fini(struct pvr_device *pvr_dev)
> >>  	pvr_device_gpu_fini(pvr_dev);
> >>  }
> >>  
> >> +/**
> >> + * pvr_device_enter() - Try to enter device critical section.
> >> + * @pvr_dev: Target PowerVR device.
> >> + * @idx: Pointer to index that will be passed to the matching pvr_device_exit().
> >> + *
> >> + * Use this in place of drm_dev_enter() within this driver.
> >> + *
> >> + * Returns:
> >> + *  * %true if the critical section was entered, or
> >> + *  * %false otherwise.
> >> + */
> >> +bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx)
> >> +{
> >> +	const enum pvr_device_state old_state =
> >> +		atomic_cmpxchg(&pvr_dev->state,
> >> +			       PVR_DEVICE_STATE_PRESENT,
> >> +			       PVR_DEVICE_STATE_ENTERED);
> >> +
> >> +	switch (old_state) {
> >> +	case PVR_DEVICE_STATE_PRESENT:
> >> +	case PVR_DEVICE_STATE_ENTERED:
> >> +		return drm_dev_enter(from_pvr_device(pvr_dev), idx);
> >> +
> >> +	case PVR_DEVICE_STATE_LOST:
> >> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
> >> +		WARN_ONCE(1, "Attempt to use GPU after becoming lost.");
> >> +		break;
> >> +	}
> >> +
> >> +	return false;
> >> +}
> >> +
> >> +/**
> >> + * pvr_device_exit() - Exit a device critical section.
> >> + * @pvr_dev: Target PowerVR device.
> >> + * @idx: Index given by matching pvr_device_enter().
> >> + *
> >> + * Use this in place of drm_dev_exit() within this driver.
> >> + */
> >> +void pvr_device_exit(struct pvr_device *pvr_dev, int idx)
> >> +{
> >> +	const enum pvr_device_state old_state =
> >> +		atomic_cmpxchg(&pvr_dev->state,
> >> +			       PVR_DEVICE_STATE_ENTERED,
> >> +			       PVR_DEVICE_STATE_PRESENT);
> >> +
> >> +	switch (old_state) {
> >> +	case PVR_DEVICE_STATE_PRESENT:
> >> +	case PVR_DEVICE_STATE_ENTERED:
> >> +		drm_dev_exit(idx);
> >> +		return;
> >> +
> >> +	case PVR_DEVICE_STATE_LOST:
> >> +		/* Unplug the device if it was lost during the critical section. */
> >> +		atomic_set(&pvr_dev->state, PVR_DEVICE_STATE_LOST_UNPLUGGED);
> >> +
> >> +		drm_dev_exit(idx);
> >> +
> >> +		WARN_ONCE(1, "GPU lost and now unplugged.");
> >> +		drm_dev_unplug(from_pvr_device(pvr_dev));
> >> +
> >> +		return;
> >> +
> >> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
> >> +		WARN_ONCE(1, "GPU unplugged during critical section.");
> >> +		drm_dev_exit(idx);
> >> +		return;
> >> +	}
> >> +}
> >> +
> >> +/**
> >> + * pvr_device_set_lost() - Mark GPU device as lost.
> >> + * @pvr_dev: Target PowerVR device.
> >> + *
> >> + * This will cause the DRM device to be unplugged at the next call to
> >> + * pvr_device_exit().
> >> + */
> >> +void pvr_device_set_lost(struct pvr_device *pvr_dev)
> >> +{
> >> +	/*
> >> +	 * Unplug the device immediately if the device is not in a critical
> >> +	 * section.
> >> +	 */
> >> +	const bool unplug = atomic_cmpxchg(&pvr_dev->state,
> >> +					   PVR_DEVICE_STATE_PRESENT,
> >> +					   PVR_DEVICE_STATE_LOST_UNPLUGGED) ==
> >> +			    PVR_DEVICE_STATE_PRESENT;
> >> +
> >> +	if (unplug)
> >> +		drm_dev_unplug(from_pvr_device(pvr_dev));
> >> +	else
> >> +		atomic_cmpxchg(&pvr_dev->state, PVR_DEVICE_STATE_ENTERED,
> >> +			       PVR_DEVICE_STATE_LOST);
> >> +}
> >> +
> >>  bool
> >>  pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk)
> >>  {
> >> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
> >> index ecdd5767d8ef..7c08b2bda395 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_device.h
> >> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> >> @@ -274,20 +274,19 @@ struct pvr_device {
> >>  	} kccb;
> >>  
> >>  	/**
> >> -	 * @lost: %true if the device has been lost.
> >> -	 *
> >> -	 * This variable is set if the device has become irretrievably unavailable, e.g. if the
> >> -	 * firmware processor has stopped responding and can not be revived via a hard reset.
> >> +	 * @state: Indicates whether the device is present and in use. One of
> >> +	 * &enum pvr_device_state.
> >>  	 */
> >> -	bool lost;
> >> +	atomic_t state;
> >>  
> >>  	/**
> >>  	 * @reset_sem: Reset semaphore.
> >>  	 *
> >> -	 * GPU reset code will lock this for writing. Any code that submits commands to the firmware
> >> -	 * that isn't in an IRQ handler or on the scheduler workqueue must lock this for reading.
> >> -	 * Once this has been successfully locked, &pvr_dev->lost _must_ be checked, and -%EIO must
> >> -	 * be returned if it is set.
> >> +	 * GPU reset code will lock this for writing. Any code that submits
> >> +	 * commands to the firmware that isn't in an IRQ handler or on the
> >> +	 * scheduler workqueue must lock this for reading.
> >> +	 * Once this has been successfully locked, pvr_device_is_lost() _must_
> >> +	 * be checked, and -%EIO must be returned if it is.
> >>  	 */
> >>  	struct rw_semaphore reset_sem;
> >>  
> >> @@ -487,7 +486,60 @@ packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gpu_id *gpu_id)
> >>  
> >>  int pvr_device_init(struct pvr_device *pvr_dev);
> >>  void pvr_device_fini(struct pvr_device *pvr_dev);
> >> -void pvr_device_reset(struct pvr_device *pvr_dev);
> >> +
> >> +/**
> >> + * enum pvr_device_state - States used by &struct pvr_device.state.
> >> + */
> >> +enum pvr_device_state {
> >> +	/** @PVR_DEVICE_STATE_PRESENT: The device is available for use. */
> >> +	PVR_DEVICE_STATE_PRESENT,
> >> +
> >> +	/** @PVR_DEVICE_STATE_ENTERED: The device is in a critical section. */
> >> +	PVR_DEVICE_STATE_ENTERED,
> >> +
> >> +	/**
> >> +	 * @PVR_DEVICE_STATE_LOST: The device was lost during the current device
> >> +	 * critical section and will be unplugged once the section exits.
> >> +	 */
> >> +	PVR_DEVICE_STATE_LOST,
> >> +
> >> +	/**
> >> +	 * @PVR_DEVICE_STATE_LOST_UNPLUGGED: The device was lost and
> >> +	 * subsequently unplugged.
> >> +	 *
> >> +	 * The device may become irretrievably unavailable, e.g. if the firmware
> >> +	 * processor has stopped responding and can not be revived via a hard
> >> +	 * reset.
> >> +	 */
> >> +	PVR_DEVICE_STATE_LOST_UNPLUGGED,
> >> +};
> >> +
> >> +/**
> >> + * pvr_device_is_lost() - Check if GPU device has been marked lost.
> >> + * @pvr_dev: Target PowerVR device.
> >> + *
> >> + * Returns:
> >> + *  * %true if device is lost, or
> >> + *  * %false otherwise.
> >> + */
> >> +static __always_inline bool pvr_device_is_lost(struct pvr_device *pvr_dev)
> >> +{
> >> +	switch ((enum pvr_device_state)atomic_read(&pvr_dev->state)) {
> >> +	case PVR_DEVICE_STATE_PRESENT:
> >> +	case PVR_DEVICE_STATE_ENTERED:
> >> +		return false;
> >> +
> >> +	case PVR_DEVICE_STATE_LOST:
> >> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
> >> +		break;
> >> +	}
> >> +
> >> +	return true;
> >> +}
> >> +
> >> +bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx);
> >> +void pvr_device_exit(struct pvr_device *pvr_dev, int idx);
> >> +void pvr_device_set_lost(struct pvr_device *pvr_dev);
> >>  
> >>  bool
> >>  pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
> >> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> >> index 5c3b2d58d766..55bea656a40f 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> >> @@ -81,13 +81,13 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	/* All padding fields must be zeroed. */
> >>  	if (args->_padding_c != 0) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/*
> >> @@ -101,7 +101,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
> >>  	if (args->size > SIZE_MAX || args->size == 0 || args->flags &
> >>  	    ~DRM_PVR_BO_FLAGS_MASK || args->size & (PVR_DEVICE_PAGE_SIZE - 1)) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	sanitized_size = (size_t)args->size;
> >> @@ -113,7 +113,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
> >>  	pvr_obj = pvr_gem_object_create(pvr_dev, sanitized_size, args->flags);
> >>  	if (IS_ERR(pvr_obj)) {
> >>  		err = PTR_ERR(pvr_obj);
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/* This function will not modify &args->handle unless it succeeds. */
> >> @@ -121,7 +121,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
> >>  	if (err)
> >>  		goto err_destroy_obj;
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >> @@ -133,8 +133,8 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, void *raw_args,
> >>  	 */
> >>  	pvr_gem_object_put(pvr_obj);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -164,19 +164,20 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
> >>  			     struct drm_file *file)
> >>  {
> >>  	struct drm_pvr_ioctl_get_bo_mmap_offset_args *args = raw_args;
> >> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> >>  	struct pvr_file *pvr_file = to_pvr_file(file);
> >>  	struct pvr_gem_object *pvr_obj;
> >>  	struct drm_gem_object *gem_obj;
> >>  	int idx;
> >>  	int ret;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	/* All padding fields must be zeroed. */
> >>  	if (args->_padding_4 != 0) {
> >>  		ret = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/*
> >> @@ -188,7 +189,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
> >>  	pvr_obj = pvr_gem_object_from_handle(pvr_file, args->handle);
> >>  	if (!pvr_obj) {
> >>  		ret = -ENOENT;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	gem_obj = gem_from_pvr_gem(pvr_obj);
> >> @@ -202,7 +203,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
> >>  	if (ret != 0) {
> >>  		/* Drop our reference to the buffer object. */
> >>  		drm_gem_object_put(gem_obj);
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/*
> >> @@ -214,8 +215,8 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *drm_dev, void *raw_args,
> >>  	/* Drop our reference to the buffer object. */
> >>  	pvr_gem_object_put(pvr_obj);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return ret;
> >>  }
> >> @@ -626,7 +627,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
> >>  	int idx;
> >>  	int ret = -EINVAL;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	switch ((enum drm_pvr_dev_query)args->type) {
> >> @@ -655,7 +656,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, void *raw_args,
> >>  		break;
> >>  	}
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return ret;
> >>  }
> >> @@ -680,16 +681,17 @@ pvr_ioctl_create_context(struct drm_device *drm_dev, void *raw_args,
> >>  			 struct drm_file *file)
> >>  {
> >>  	struct drm_pvr_ioctl_create_context_args *args = raw_args;
> >> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> >>  	struct pvr_file *pvr_file = file->driver_priv;
> >>  	int idx;
> >>  	int ret;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	ret = pvr_context_create(pvr_file, args);
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return ret;
> >>  }
> >> @@ -738,18 +740,19 @@ pvr_ioctl_create_free_list(struct drm_device *drm_dev, void *raw_args,
> >>  			   struct drm_file *file)
> >>  {
> >>  	struct drm_pvr_ioctl_create_free_list_args *args = raw_args;
> >> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> >>  	struct pvr_file *pvr_file = to_pvr_file(file);
> >>  	struct pvr_free_list *free_list;
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	free_list = pvr_free_list_create(pvr_file, args);
> >>  	if (IS_ERR(free_list)) {
> >>  		err = PTR_ERR(free_list);
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/* Allocate object handle for userspace. */
> >> @@ -761,15 +764,15 @@ pvr_ioctl_create_free_list(struct drm_device *drm_dev, void *raw_args,
> >>  	if (err < 0)
> >>  		goto err_cleanup;
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >>  err_cleanup:
> >>  	pvr_free_list_put(free_list);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -824,18 +827,19 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
> >>  			      struct drm_file *file)
> >>  {
> >>  	struct drm_pvr_ioctl_create_hwrt_dataset_args *args = raw_args;
> >> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> >>  	struct pvr_file *pvr_file = to_pvr_file(file);
> >>  	struct pvr_hwrt_dataset *hwrt;
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	hwrt = pvr_hwrt_dataset_create(pvr_file, args);
> >>  	if (IS_ERR(hwrt)) {
> >>  		err = PTR_ERR(hwrt);
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/* Allocate object handle for userspace. */
> >> @@ -847,15 +851,15 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device *drm_dev, void *raw_args,
> >>  	if (err < 0)
> >>  		goto err_cleanup;
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >>  err_cleanup:
> >>  	pvr_hwrt_dataset_put(hwrt);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -910,23 +914,24 @@ pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
> >>  			    struct drm_file *file)
> >>  {
> >>  	struct drm_pvr_ioctl_create_vm_context_args *args = raw_args;
> >> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
> >>  	struct pvr_file *pvr_file = to_pvr_file(file);
> >>  	struct pvr_vm_context *vm_ctx;
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	if (args->_padding_4) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	vm_ctx = pvr_vm_create_context(pvr_file->pvr_dev, true);
> >>  	if (IS_ERR(vm_ctx)) {
> >>  		err = PTR_ERR(vm_ctx);
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	/* Allocate object handle for userspace. */
> >> @@ -938,15 +943,15 @@ pvr_ioctl_create_vm_context(struct drm_device *drm_dev, void *raw_args,
> >>  	if (err < 0)
> >>  		goto err_cleanup;
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >>  err_cleanup:
> >>  	pvr_vm_context_put(vm_ctx);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -1022,26 +1027,26 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	/* Initial validation of args. */
> >>  	if (args->_padding_14) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	if (args->flags != 0 ||
> >>  	    check_add_overflow(args->offset, args->size, &offset_plus_size) ||
> >>  	    !pvr_find_heap_containing(pvr_dev, args->device_addr, args->size)) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	vm_ctx = pvr_vm_context_lookup(pvr_file, args->vm_context_handle);
> >>  	if (!vm_ctx) {
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	pvr_obj = pvr_gem_object_from_handle(pvr_file, args->handle);
> >> @@ -1079,8 +1084,8 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, void *raw_args,
> >>  err_put_vm_context:
> >>  	pvr_vm_context_put(vm_ctx);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -1148,12 +1153,12 @@ pvr_ioctl_submit_jobs(struct drm_device *drm_dev, void *raw_args,
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	err = pvr_submit_jobs(pvr_dev, pvr_file, args);
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
> >> index 3debc9870a82..07547e167963 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_fw.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_fw.c
> >> @@ -1094,7 +1094,7 @@ pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_obj
> >>  
> >>  	down_read(&pvr_dev->reset_sem);
> >>  
> >> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
> >> +	if (!pvr_device_enter(pvr_dev, &idx)) {
> >>  		err = -EIO;
> >>  		goto err_up_read;
> >>  	}
> >> @@ -1118,22 +1118,22 @@ pvr_fw_structure_cleanup(struct pvr_device *pvr_dev, u32 type, struct pvr_fw_obj
> >>  		break;
> >>  	default:
> >>  		err = -EINVAL;
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	err = pvr_kccb_send_cmd(pvr_dev, &cmd, &slot_nr);
> >>  	if (err)
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  
> >>  	err = pvr_kccb_wait_for_completion(pvr_dev, slot_nr, HZ, &rtn);
> >>  	if (err)
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  
> >>  	if (rtn & ROGUE_FWIF_KCCB_RTN_SLOT_CLEANUP_BUSY)
> >>  		err = -EBUSY;
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  err_up_read:
> >>  	up_read(&pvr_dev->reset_sem);
> >> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> >> index 31199e45b72e..26d67483eac2 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> >> @@ -149,7 +149,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
> >>  	fw_trace->group_mask = group_mask;
> >>  
> >>  	down_read(&pvr_dev->reset_sem);
> >> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
> >> +	if (!pvr_device_enter(pvr_dev, &idx)) {
> >>  		err = -EIO;
> >>  		goto err_up_read;
> >>  	}
> >> @@ -159,7 +159,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 group_mask)
> >>  
> >>  	err = pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  err_up_read:
> >>  	up_read(&pvr_dev->reset_sem);
> >> diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
> >> index 4fe70610ed94..59911f70e9ca 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_mmu.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_mmu.c
> >> @@ -129,18 +129,18 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait)
> >>  	u32 slot;
> >>  	int idx;
> >>  
> >> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	/* Can't flush MMU if the firmware hasn't booted yet. */
> >>  	if (!pvr_dev->fw_dev.booted)
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  
> >>  	cmd_mmu_cache_data->cache_flags =
> >>  		atomic_xchg(&pvr_dev->mmu_flush_cache_flags, 0);
> >>  
> >>  	if (!cmd_mmu_cache_data->cache_flags)
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  
> >>  	cmd_mmu_cache.cmd_type = ROGUE_FWIF_KCCB_CMD_MMUCACHE;
> >>  
> >> @@ -156,7 +156,7 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait)
> >>  	if (err)
> >>  		goto err_reset_and_retry;
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >> @@ -167,23 +167,23 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev, bool wait)
> >>  	 */
> >>  	err = pvr_power_reset(pvr_dev, true);
> >>  	if (err)
> >> -		goto err_drm_dev_exit; /* Device is lost. */
> >> +		goto err_pvr_device_exit; /* Device is lost. */
> >>  
> >>  	/* Retry sending flush request. */
> >>  	err = pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
> >>  	if (err) {
> >> -		pvr_device_lost(pvr_dev);
> >> -		goto err_drm_dev_exit;
> >> +		pvr_device_set_lost(pvr_dev);
> >> +		goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	if (wait) {
> >>  		err = pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
> >>  		if (err)
> >> -			pvr_device_lost(pvr_dev);
> >> +			pvr_device_set_lost(pvr_dev);
> >>  	}
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
> >> index ba7816fd28ec..c927def3d3f3 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_power.c
> >> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> >> @@ -23,21 +23,6 @@
> >>  
> >>  #define WATCHDOG_TIME_MS (500)
> >>  
> >> -/**
> >> - * pvr_device_lost() - Mark GPU device as lost
> >> - * @pvr_dev: Target PowerVR device.
> >> - *
> >> - * This will cause the DRM device to be unplugged.
> >> - */
> >> -void
> >> -pvr_device_lost(struct pvr_device *pvr_dev)
> >> -{
> >> -	if (!pvr_dev->lost) {
> >> -		pvr_dev->lost = true;
> >> -		drm_dev_unplug(from_pvr_device(pvr_dev));
> >> -	}
> >> -}
> >> -
> >>  static int
> >>  pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
> >>  {
> >> @@ -186,7 +171,7 @@ pvr_watchdog_worker(struct work_struct *work)
> >>  						  watchdog.work.work);
> >>  	bool stalled;
> >>  
> >> -	if (pvr_dev->lost)
> >> +	if (pvr_device_is_lost(pvr_dev))
> >>  		return;
> >>  
> >>  	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <= 0)
> >> @@ -208,10 +193,9 @@ pvr_watchdog_worker(struct work_struct *work)
> >>  	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
> >>  
> >>  out_requeue:
> >> -	if (!pvr_dev->lost) {
> >> +	if (!pvr_device_is_lost(pvr_dev))
> >>  		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
> >>  				   msecs_to_jiffies(WATCHDOG_TIME_MS));
> >> -	}
> >>  }
> >>  
> >>  /**
> >> @@ -239,21 +223,21 @@ pvr_power_device_suspend(struct device *dev)
> >>  	int err = 0;
> >>  	int idx;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	if (pvr_dev->fw_dev.booted) {
> >>  		err = pvr_power_fw_disable(pvr_dev, false);
> >>  		if (err)
> >> -			goto err_drm_dev_exit;
> >> +			goto err_pvr_device_exit;
> >>  	}
> >>  
> >>  	clk_disable_unprepare(pvr_dev->mem_clk);
> >>  	clk_disable_unprepare(pvr_dev->sys_clk);
> >>  	clk_disable_unprepare(pvr_dev->core_clk);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -267,12 +251,12 @@ pvr_power_device_resume(struct device *dev)
> >>  	int idx;
> >>  	int err;
> >>  
> >> -	if (!drm_dev_enter(drm_dev, &idx))
> >> +	if (!pvr_device_enter(pvr_dev, &idx))
> >>  		return -EIO;
> >>  
> >>  	err = clk_prepare_enable(pvr_dev->core_clk);
> >>  	if (err)
> >> -		goto err_drm_dev_exit;
> >> +		goto err_pvr_device_exit;
> >>  
> >>  	err = clk_prepare_enable(pvr_dev->sys_clk);
> >>  	if (err)
> >> @@ -288,7 +272,7 @@ pvr_power_device_resume(struct device *dev)
> >>  			goto err_mem_clk_disable;
> >>  	}
> >>  
> >> -	drm_dev_exit(idx);
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return 0;
> >>  
> >> @@ -301,8 +285,8 @@ pvr_power_device_resume(struct device *dev)
> >>  err_core_clk_disable:
> >>  	clk_disable_unprepare(pvr_dev->core_clk);
> >>  
> >> -err_drm_dev_exit:
> >> -	drm_dev_exit(idx);
> >> +err_pvr_device_exit:
> >> +	pvr_device_exit(pvr_dev, idx);
> >>  
> >>  	return err;
> >>  }
> >> @@ -345,7 +329,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
> >>  
> >>  	down_write(&pvr_dev->reset_sem);
> >>  
> >> -	if (pvr_dev->lost) {
> >> +	if (pvr_device_is_lost(pvr_dev)) {
> >>  		err = -EIO;
> >>  		goto err_up_write;
> >>  	}
> >> @@ -407,7 +391,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
> >>  
> >>  err_device_lost:
> >>  	drm_err(from_pvr_device(pvr_dev), "GPU device lost");
> >> -	pvr_device_lost(pvr_dev);
> >> +	pvr_device_set_lost(pvr_dev);
> >>  
> >>  	/* Leave IRQs disabled if the device is lost. */
> >>  
> >> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
> >> index 9a9312dcb2da..360980f454d7 100644
> >> --- a/drivers/gpu/drm/imagination/pvr_power.h
> >> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> >> @@ -12,8 +12,6 @@
> >>  int pvr_watchdog_init(struct pvr_device *pvr_dev);
> > 
> > 
> > 
> > 
> > 
> > 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
