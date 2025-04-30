Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5BAA47A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0B910E70F;
	Wed, 30 Apr 2025 09:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lC82QTne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5914510E70F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:49:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so3578670f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746006557; x=1746611357; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LLFFbFj4LwW7R7V2JhHGReQ4jijzBvrTImoxET+7TD4=;
 b=lC82QTneHETexUwDTeTIpYpgo38XSDWTOnZgH37q6MGU+fr9O9lbElm58Urj/Oegzs
 6iDv8B3EUhwSujXS5bbM+aIWtWza0UXS18LplsnvuwbqDMrIR9iN1662oeIV4gk5PY6h
 bEoDL0SPp/VuHmib0LENGsQDrySkMZ6GjvlLIxf5/ieM0oYftO/wsGO+5jey3/V83Pf9
 iMjymHrIQtPo5AIg4PA1PsIw/kpNt2pg5bHbnz4QLZwGEuFbJrUo6x39IRdt3LCoUcq3
 FDVszSs/zKe+QdxkJtaSPeil9UxiNAyeYjnrifP1JlDZPx6xNHKJ8yOKzmz0om6W4Xy8
 OHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746006557; x=1746611357;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLFFbFj4LwW7R7V2JhHGReQ4jijzBvrTImoxET+7TD4=;
 b=tfHUwcNVSuClyJ2nJEe64RHD5DocQMdzoLQTQ1ogCQCJ3JqMATo7VkwOOTzNMMkUuJ
 8rob/xgiKbPJkX7EwQ0Q9r0LoQHuKPXG0D1A8WdEJJRyuJFt4hDvh+uvgpHNkh7Tz7XL
 /333Za4L+l4TSpNqsuNgKYdxuPuduJiqD3NC9VtxQsyprd3u6iy1mweeSGFS0mpg8vYN
 h57r6FrYooCqWCwgw1B8fIbJdatxrq/y+7ZAvUmciKxFQ5Mf1An9fMVJY5qtDlJDM/yN
 Qjk4ZuOj/vxB1+wiVJtpZHJdgvqWKZhIf7IsNwqfXoj0miFLRoTJTI73TpZaYHOIIrqP
 821A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHnuowmXRWXLAHfVb9Y/IZlgJyTOKvJxWztn4bCKnLznMk6H2lCPN0RhENHS4UKI+R5E2xLvFueDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTYEEh7LPg4ASchhFoF5uWkFI/yN9TJwVpdaWG/GwXfpNF9Wkq
 N4h+daUKato40Sbyx2qzBzUSFJS+w8ZqTwKGWZ2iZdtrK/08ASKBVMr6+hFsCXs=
X-Gm-Gg: ASbGncsx3PxrhhVLd0vcqJC29AKb+H3CpgmasCUIlJe3Bw0Nwwpk6HPw3zmdPBvKVLP
 EWmIiazrnx5zCK+NY6I+uNWFj8T5yFdHeQhJ6v/Key7c2pPTjGnUrR27HUpV7KnWY0GSx5reX1V
 XP6kDfa+zOtOu2UcoxptZY2mA2MsWqfryAmgAtb5SOO+Ohdg/0TXvLQQ2rcajS4nrtyfau/fRWg
 nHknnG2EBYX0Zk9s3BqaYBE77G+7G4m4QLkmCx1a6X4I06zoTvKHAkOeAPltPDY+bg8QQqeCpq7
 12nzVvbwhcFh7Ry39VijBpEHa2DnPkI0mJr7DNgQPdjO38zGPVa11QTf
X-Google-Smtp-Source: AGHT+IEK9MNRUEuA0t/++NHkSN+uAgTx0QHITofMQSiawq0yr1kRwXaeYfFa/CByGh7RO0Ly8OPlsA==
X-Received: by 2002:a05:6000:420e:b0:39e:dbb0:310f with SMTP id
 ffacd0b85a97d-3a08f7c862emr2373168f8f.39.1746006557355; 
 Wed, 30 Apr 2025 02:49:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a073c8d1a5sm16918149f8f.13.2025.04.30.02.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 02:49:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:49:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Yadav, Arvind" <Arvind.Yadav@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Message-ID: <ac039a7e-4152-4df5-af3d-c952cedfa6dd@stanley.mountain>
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
 <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
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

On Wed, Apr 30, 2025 at 09:28:59AM +0000, Sharma, Shashank wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hello Dan,
> 
> ________________________________
> From: Dan Carpenter
> Sent: Wednesday, April 30, 2025 10:05 AM
> To: Deucher, Alexander
> Cc: Koenig, Christian; David Airlie; Simona Vetter; Sharma, Shashank; Khatri, Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
> 
> The "ticket" pointer points to in the middle of the &exec struct so it
> can't be NULL.  Remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index b0e8098a3988..7505d920fb3d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>                          clear = false;
>                          unlock = true;
>                  /* The caller is already holding the reservation lock */
> -               } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
> +               } else if (dma_resv_locking_ctx(resv) == ticket) {
> 
> Its a Nack for me, There are a few situations (particularly during the
> first launch of the desktop, and also when eviction fence and new queue
> creation are working in parallel) where this ticket can be NULL, we
> observed it during the stress validation and hence added this check,
> 

It shouldn't be NULL.  It sounds like you are experiencing stack
corruption and this is just a bandaid.

drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
   566  static int
   567  amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
   568  {
   569          struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
   570          struct amdgpu_vm *vm = &fpriv->vm;
   571          struct amdgpu_device *adev = uq_mgr->adev;
   572          struct amdgpu_bo_va *bo_va;
   573          struct ww_acquire_ctx *ticket;
   574          struct drm_exec exec;
                ^^^^^^^^^^^^^^^^^^^^^
The "exec" struct is declared on the stack.

   575          struct amdgpu_bo *bo;
   576          struct dma_resv *resv;
   577          bool clear, unlock;
   578          int ret = 0;
   579  
   580          drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
   581          drm_exec_until_all_locked(&exec) {
   582                  ret = amdgpu_vm_lock_pd(vm, &exec, 2);
   583                  drm_exec_retry_on_contention(&exec);
   584                  if (unlikely(ret)) {
   585                          DRM_ERROR("Failed to lock PD\n");
   586                          goto unlock_all;
   587                  }
   588  
   589                  /* Lock the done list */
   590                  list_for_each_entry(bo_va, &vm->done, base.vm_status) {
   591                          bo = bo_va->base.bo;
   592                          if (!bo)
   593                                  continue;
   594  
   595                          ret = drm_exec_lock_obj(&exec, &bo->tbo.base);
   596                          drm_exec_retry_on_contention(&exec);
   597                          if (unlikely(ret))
   598                                  goto unlock_all;
   599                  }
   600          }
   601  
   602          spin_lock(&vm->status_lock);
   603          while (!list_empty(&vm->moved)) {
   604                  bo_va = list_first_entry(&vm->moved, struct amdgpu_bo_va,
   605                                           base.vm_status);
   606                  spin_unlock(&vm->status_lock);
   607  
   608                  /* Per VM BOs never need to bo cleared in the page tables */
   609                  ret = amdgpu_vm_bo_update(adev, bo_va, false);
   610                  if (ret)
   611                          goto unlock_all;
   612                  spin_lock(&vm->status_lock);
   613          }
   614  
   615          ticket = &exec.ticket;
                ^^^^^^^^^^^^^^^^^^^^^
ticket is only set here.  We know that &exec is non-NULL because it's
declared on the stack.  ticket is 4 bytes into the middle of a non-NULL
struct.  It is impossible for ticket to be NULL here.

   616          while (!list_empty(&vm->invalidated)) {
   617                  bo_va = list_first_entry(&vm->invalidated, struct amdgpu_bo_va,
   618                                           base.vm_status);
   619                  resv = bo_va->base.bo->tbo.base.resv;
   620                  spin_unlock(&vm->status_lock);
   621  
   622                  bo = bo_va->base.bo;
   623                  ret = amdgpu_userq_validate_vm_bo(NULL, bo);
   624                  if (ret) {
   625                          DRM_ERROR("Failed to validate BO\n");
   626                          goto unlock_all;
   627                  }
   628  
   629                  /* Try to reserve the BO to avoid clearing its ptes */
   630                  if (!adev->debug_vm && dma_resv_trylock(resv)) {
   631                          clear = false;
   632                          unlock = true;
   633                  /* The caller is already holding the reservation lock */
   634                  } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {

I've included the whole rest of the function so that we can see it is not
set a second time.

regards,
dan carpenter

   635                          clear = false;
   636                          unlock = false;
   637                  /* Somebody else is using the BO right now */
   638                  } else {
   639                          clear = true;
   640                          unlock = false;
   641                  }
   642  
   643                  ret = amdgpu_vm_bo_update(adev, bo_va, clear);
   644  
   645                  if (unlock)
   646                          dma_resv_unlock(resv);
   647                  if (ret)
   648                          goto unlock_all;
   649  
   650                  spin_lock(&vm->status_lock);
   651          }
   652          spin_unlock(&vm->status_lock);
   653  
   654          ret = amdgpu_eviction_fence_replace_fence(&fpriv->evf_mgr, &exec);
   655          if (ret)
   656                  DRM_ERROR("Failed to replace eviction fence\n");
   657  
   658  unlock_all:
   659          drm_exec_fini(&exec);
   660          return ret;
   661  }


