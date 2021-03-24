Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72A347D75
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 17:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9E96EC6A;
	Wed, 24 Mar 2021 16:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9353F6EC88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:16:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g25so13256075wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cmHkQeBu/tmgMqKyEeF23n+6U7cvdKqDUO8kQGUoRn4=;
 b=MXxPNLwFb7UA0/L0bRR5Zf7D7eitf1m/l1TBR/gQThIr0kQgVFK/iVjBJZSJYu2Jz5
 yu7gsxlKzsv+RHURl6EM/88itG2z2d+2SSe1BZ30qrBOuspP4YuOPgJEN3PuH1d8b5u8
 nJWJJqcIERh2uUJ7j9veLh051gmQgAxeygM9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cmHkQeBu/tmgMqKyEeF23n+6U7cvdKqDUO8kQGUoRn4=;
 b=JwUj/haU0UE+HEHs2c0uOLB/nxNyv5yOeMFKV+7uTOqIAkx2jSgiW9gTxUsxvyBSyW
 F4dbXsojnF9vwwLamN7nwg/MpaJewEBpdQpoy4t0yPED/zd8DZUrQoDeEmQFI4uyoeDA
 NTh9JAb99yRLYmR3ENKbhVIeG0ApO+UVz/c6d1ukTIH8YbUz6M+mlgwOFz69oSp/ml0z
 smEOS3VnDqjlUA7i7spZBkyGcoBePoHxRP8jsltBV7njxka3pAPmNTXe0B+xbpH/1R8T
 fdCDK1NwURd0AZAJPyf6fdjqoSxNFqMH8+xi7i8oiDio7A5oyW6Jjou1Jnh8mvgOLoBX
 KehA==
X-Gm-Message-State: AOAM531Wqy9OE7KId+kajV3Rsq6WhHDA1jTiThq980h1rYFcC+rHkoYa
 XAG8oExl1QCQbKy9n64se1U+yg==
X-Google-Smtp-Source: ABdhPJyLGPzXoOof0u6ikKuGAXMqpi1GYliDquxsiQf9eeL5d2UyARUMsV4V9bFsPYeT2nh7+20Vow==
X-Received: by 2002:a05:600c:2f08:: with SMTP id
 r8mr3690103wmn.95.1616602609217; 
 Wed, 24 Mar 2021 09:16:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm3968313wrt.1.2021.03.24.09.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:16:48 -0700 (PDT)
Date: Wed, 24 Mar 2021 17:16:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 31/70] drm/i915: Fix workarounds selftest, 
 part 1
Message-ID: <YFtl7tu2/4LTjAQa@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-32-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-32-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:20PM +0100, Maarten Lankhorst wrote:
> pin_map needs the ww lock, so ensure we pin both before submission.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

Another one where I picked an older version:

https://lore.kernel.org/intel-gfx/20210128162612.927917-32-maarten.lankhors=
t@linux.intel.com/

Cheers, Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 +
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 12 +++
>  .../gpu/drm/i915/gt/selftest_workarounds.c    | 95 +++++++++++++------
>  3 files changed, 80 insertions(+), 30 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 6c3f75adb53c..983f2d4b2a85 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -437,6 +437,9 @@ void i915_gem_object_writeback(struct drm_i915_gem_ob=
ject *obj);
>  void *__must_check i915_gem_object_pin_map(struct drm_i915_gem_object *o=
bj,
>  					   enum i915_map_type type);
>  =

> +void *__must_check i915_gem_object_pin_map_unlocked(struct drm_i915_gem_=
object *obj,
> +						    enum i915_map_type type);
> +
>  void __i915_gem_object_flush_map(struct drm_i915_gem_object *obj,
>  				 unsigned long offset,
>  				 unsigned long size);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index e947d4c0da1f..a24617af3c93 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -400,6 +400,18 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_ob=
ject *obj,
>  	goto out_unlock;
>  }
>  =

> +void *i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
> +				       enum i915_map_type type)
> +{
> +	void *ret;
> +
> +	i915_gem_object_lock(obj, NULL);
> +	ret =3D i915_gem_object_pin_map(obj, type);
> +	i915_gem_object_unlock(obj);
> +
> +	return ret;
> +}
> +
>  void __i915_gem_object_flush_map(struct drm_i915_gem_object *obj,
>  				 unsigned long offset,
>  				 unsigned long size)
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu=
/drm/i915/gt/selftest_workarounds.c
> index de6136bd10ac..a508614b2fd5 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -103,15 +103,13 @@ read_nonprivs(struct intel_context *ce, struct i915=
_vma *result)
>  	int err;
>  	int i;
>  =

> -	rq =3D intel_context_create_request(ce);
> +	rq =3D i915_request_create(ce);
>  	if (IS_ERR(rq))
>  		return rq;
>  =

> -	i915_vma_lock(result);
>  	err =3D i915_request_await_object(rq, result->obj, true);
>  	if (err =3D=3D 0)
>  		err =3D i915_vma_move_to_active(result, rq, EXEC_OBJECT_WRITE);
> -	i915_vma_unlock(result);
>  	if (err)
>  		goto err_rq;
>  =

> @@ -176,10 +174,11 @@ static int check_whitelist(struct intel_context *ce)
>  	u32 *vaddr;
>  	int i;
>  =

> -	result =3D __vm_create_scratch_for_read(&engine->gt->ggtt->vm, PAGE_SIZ=
E);
> +	result =3D __vm_create_scratch_for_read_pinned(&engine->gt->ggtt->vm, P=
AGE_SIZE);
>  	if (IS_ERR(result))
>  		return PTR_ERR(result);
>  =

> +	i915_gem_object_lock(result->obj, NULL);
>  	vaddr =3D i915_gem_object_pin_map(result->obj, I915_MAP_WB);
>  	if (IS_ERR(vaddr)) {
>  		err =3D PTR_ERR(vaddr);
> @@ -219,6 +218,8 @@ static int check_whitelist(struct intel_context *ce)
>  out_map:
>  	i915_gem_object_unpin_map(result->obj);
>  out_put:
> +	i915_vma_unpin(result);
> +	i915_gem_object_unlock(result->obj);
>  	i915_vma_put(result);
>  	return err;
>  }
> @@ -279,10 +280,14 @@ static int check_whitelist_across_reset(struct inte=
l_engine_cs *engine,
>  	if (IS_ERR(ce))
>  		return PTR_ERR(ce);
>  =

> -	err =3D igt_spinner_init(&spin, engine->gt);
> +	err =3D intel_context_pin(ce);
>  	if (err)
>  		goto out_ctx;
>  =

> +	err =3D igt_spinner_init(&spin, engine->gt);
> +	if (err)
> +		goto out_unpin;
> +
>  	err =3D check_whitelist(ce);
>  	if (err) {
>  		pr_err("Invalid whitelist *before* %s reset!\n", name);
> @@ -315,6 +320,13 @@ static int check_whitelist_across_reset(struct intel=
_engine_cs *engine,
>  		err =3D PTR_ERR(tmp);
>  		goto out_spin;
>  	}
> +	err =3D intel_context_pin(tmp);
> +	if (err) {
> +		intel_context_put(tmp);
> +		goto out_spin;
> +	}
> +
> +	intel_context_unpin(ce);
>  	intel_context_put(ce);
>  	ce =3D tmp;
>  =

> @@ -327,6 +339,8 @@ static int check_whitelist_across_reset(struct intel_=
engine_cs *engine,
>  =

>  out_spin:
>  	igt_spinner_fini(&spin);
> +out_unpin:
> +	intel_context_unpin(ce);
>  out_ctx:
>  	intel_context_put(ce);
>  	return err;
> @@ -475,6 +489,7 @@ static int check_dirty_whitelist(struct intel_context=
 *ce)
>  =

>  	for (i =3D 0; i < engine->whitelist.count; i++) {
>  		u32 reg =3D i915_mmio_reg_offset(engine->whitelist.list[i].reg);
> +		struct i915_gem_ww_ctx ww;
>  		u64 addr =3D scratch->node.start;
>  		struct i915_request *rq;
>  		u32 srm, lrm, rsvd;
> @@ -490,6 +505,29 @@ static int check_dirty_whitelist(struct intel_contex=
t *ce)
>  =

>  		ro_reg =3D ro_register(reg);
>  =

> +		i915_gem_ww_ctx_init(&ww, false);
> +retry:
> +		cs =3D NULL;
> +		err =3D i915_gem_object_lock(scratch->obj, &ww);
> +		if (!err)
> +			err =3D i915_gem_object_lock(batch->obj, &ww);
> +		if (!err)
> +			err =3D intel_context_pin_ww(ce, &ww);
> +		if (err)
> +			goto out;
> +
> +		cs =3D i915_gem_object_pin_map(batch->obj, I915_MAP_WC);
> +		if (IS_ERR(cs)) {
> +			err =3D PTR_ERR(cs);
> +			goto out_ctx;
> +		}
> +
> +		results =3D i915_gem_object_pin_map(scratch->obj, I915_MAP_WB);
> +		if (IS_ERR(results)) {
> +			err =3D PTR_ERR(results);
> +			goto out_unmap_batch;
> +		}
> +
>  		/* Clear non priv flags */
>  		reg &=3D RING_FORCE_TO_NONPRIV_ADDRESS_MASK;
>  =

> @@ -501,12 +539,6 @@ static int check_dirty_whitelist(struct intel_contex=
t *ce)
>  		pr_debug("%s: Writing garbage to %x\n",
>  			 engine->name, reg);
>  =

> -		cs =3D i915_gem_object_pin_map(batch->obj, I915_MAP_WC);
> -		if (IS_ERR(cs)) {
> -			err =3D PTR_ERR(cs);
> -			goto out_batch;
> -		}
> -
>  		/* SRM original */
>  		*cs++ =3D srm;
>  		*cs++ =3D reg;
> @@ -553,11 +585,12 @@ static int check_dirty_whitelist(struct intel_conte=
xt *ce)
>  		i915_gem_object_flush_map(batch->obj);
>  		i915_gem_object_unpin_map(batch->obj);
>  		intel_gt_chipset_flush(engine->gt);
> +		cs =3D NULL;
>  =

> -		rq =3D intel_context_create_request(ce);
> +		rq =3D i915_request_create(ce);
>  		if (IS_ERR(rq)) {
>  			err =3D PTR_ERR(rq);
> -			goto out_batch;
> +			goto out_unmap_scratch;
>  		}
>  =

>  		if (engine->emit_init_breadcrumb) { /* Be nice if we hang */
> @@ -566,20 +599,16 @@ static int check_dirty_whitelist(struct intel_conte=
xt *ce)
>  				goto err_request;
>  		}
>  =

> -		i915_vma_lock(batch);
>  		err =3D i915_request_await_object(rq, batch->obj, false);
>  		if (err =3D=3D 0)
>  			err =3D i915_vma_move_to_active(batch, rq, 0);
> -		i915_vma_unlock(batch);
>  		if (err)
>  			goto err_request;
>  =

> -		i915_vma_lock(scratch);
>  		err =3D i915_request_await_object(rq, scratch->obj, true);
>  		if (err =3D=3D 0)
>  			err =3D i915_vma_move_to_active(scratch, rq,
>  						      EXEC_OBJECT_WRITE);
> -		i915_vma_unlock(scratch);
>  		if (err)
>  			goto err_request;
>  =

> @@ -595,13 +624,7 @@ static int check_dirty_whitelist(struct intel_contex=
t *ce)
>  			pr_err("%s: Futzing %x timedout; cancelling test\n",
>  			       engine->name, reg);
>  			intel_gt_set_wedged(engine->gt);
> -			goto out_batch;
> -		}
> -
> -		results =3D i915_gem_object_pin_map(scratch->obj, I915_MAP_WB);
> -		if (IS_ERR(results)) {
> -			err =3D PTR_ERR(results);
> -			goto out_batch;
> +			goto out_unmap_scratch;
>  		}
>  =

>  		GEM_BUG_ON(values[ARRAY_SIZE(values) - 1] !=3D 0xffffffff);
> @@ -612,7 +635,7 @@ static int check_dirty_whitelist(struct intel_context=
 *ce)
>  				pr_err("%s: Unable to write to whitelisted register %x\n",
>  				       engine->name, reg);
>  				err =3D -EINVAL;
> -				goto out_unpin;
> +				goto out_unmap_scratch;
>  			}
>  		} else {
>  			rsvd =3D 0;
> @@ -678,15 +701,27 @@ static int check_dirty_whitelist(struct intel_conte=
xt *ce)
>  =

>  			err =3D -EINVAL;
>  		}
> -out_unpin:
> +out_unmap_scratch:
>  		i915_gem_object_unpin_map(scratch->obj);
> +out_unmap_batch:
> +		if (cs)
> +			i915_gem_object_unpin_map(batch->obj);
> +out_ctx:
> +		intel_context_unpin(ce);
> +out:
> +		if (err =3D=3D -EDEADLK) {
> +			err =3D i915_gem_ww_ctx_backoff(&ww);
> +			if (!err)
> +				goto retry;
> +		}
> +		i915_gem_ww_ctx_fini(&ww);
>  		if (err)
>  			break;
>  	}
>  =

>  	if (igt_flush_test(engine->i915))
>  		err =3D -EIO;
> -out_batch:
> +
>  	i915_vma_unpin_and_release(&batch, 0);
>  out_scratch:
>  	i915_vma_unpin_and_release(&scratch, 0);
> @@ -820,7 +855,7 @@ static int scrub_whitelisted_registers(struct intel_c=
ontext *ce)
>  	if (IS_ERR(batch))
>  		return PTR_ERR(batch);
>  =

> -	cs =3D i915_gem_object_pin_map(batch->obj, I915_MAP_WC);
> +	cs =3D i915_gem_object_pin_map_unlocked(batch->obj, I915_MAP_WC);
>  	if (IS_ERR(cs)) {
>  		err =3D PTR_ERR(cs);
>  		goto err_batch;
> @@ -955,11 +990,11 @@ check_whitelisted_registers(struct intel_engine_cs =
*engine,
>  	u32 *a, *b;
>  	int i, err;
>  =

> -	a =3D i915_gem_object_pin_map(A->obj, I915_MAP_WB);
> +	a =3D i915_gem_object_pin_map_unlocked(A->obj, I915_MAP_WB);
>  	if (IS_ERR(a))
>  		return PTR_ERR(a);
>  =

> -	b =3D i915_gem_object_pin_map(B->obj, I915_MAP_WB);
> +	b =3D i915_gem_object_pin_map_unlocked(B->obj, I915_MAP_WB);
>  	if (IS_ERR(b)) {
>  		err =3D PTR_ERR(b);
>  		goto err_a;
> -- =

> 2.31.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
