Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F1B52F51
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D837510EA92;
	Thu, 11 Sep 2025 11:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LU9AE6GB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE35710EA92
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:08:45 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45dcfc6558cso4574675e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757588924; x=1758193724;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dLDaDteT3053I0ySW3rWWywH2rFVkM2hJVgvFeuu/Nc=;
 b=LU9AE6GBFPJxv/HycpSxgTBg/T05wzvzoZuOUcwH4GoYWUl4Nf68/GQSxpf+P9WgtO
 Ius6aVE/WYiOrrOTBgZuSQ11GP/qYHkyx4PAIBrXvr0rNHdPX6SI5pxUEzR73NiwWmw6
 C81+DDUmCbduS0gnRo5t7p0UDlO9l+iIu1UwNXuw0MXG9LGwEv04QxwSUam++jTWu8iP
 2iG2b/8Fos2o2ZXwoSqqSFcNJ42rbdKDcFN40oBTzUf4HQeGkK8NP34qFp79kjJSoLcw
 55egDn8uDOhquktJ/BsnjonLQel0BiG6L4ju/ymqyrJ1ppRnP7ZcJYg7Cq3oq041mUNI
 xd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757588924; x=1758193724;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dLDaDteT3053I0ySW3rWWywH2rFVkM2hJVgvFeuu/Nc=;
 b=PvBdBFXx+Py9ZCcmscjGxHfx/9rVaY8OM9cjh28/Jd1zY9ksg/L+29fh5k2Pz+whUR
 8VCWJLZ/IBS3SDzVj2P7asXu4y45RasS93UDmPGcZG12E64xxllgSpAATyAsQ4quQwON
 gSOfDO0Bi/6XRvyxuwhzLRNMeP1e5awV3mYwn2H7gLC5PIYnPDvAw363yQsR7u0702Se
 MGahY7ZpA/PPEZ9Ou+iz4spehzA3wHAJd6ZWGdeFBZof+8ewuO27klN+VYLqWNy3wbOw
 hCDRpPlGMuPkHCGo5rdCqYRExNq41fAryJInrAU+JE1iaCx8VM5ADaiR+jm+RbbHxZeg
 Oiaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Hs8qgOOw3iB5NEHdLqCY1m4/yisoaosT8SanIujoN1jhml93M5LsLPL4rtsXsZjyc9RwEezgZU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFB8Pz4mpK0pEED2PsgLF4a6p1cnSP5aHtdduwi1UPBcddWEnI
 jRk0qFHxd1QN3fgQM6cJpiVLNAi7LF3xk9zs2V95BFyOA9iD5N9nn4YHQyZW21NZd44xntPd1mt
 ScQi8pJlP/4FkB5NqBQ==
X-Google-Smtp-Source: AGHT+IEk0csKfI2/BjWCy90xuPAu96V6W9xQvYBJ88BFoQPZm6+Zdl4YWe3zrLaDacwF6fcF/YNlvypSnsIR9nU=
X-Received: from wrbee10.prod.google.com
 ([2002:a05:6000:210a:b0:3b8:dd13:ef41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178e:b0:3dc:33aa:a2b8 with SMTP id
 ffacd0b85a97d-3e642da2f85mr15310927f8f.19.1757588924209; 
 Thu, 11 Sep 2025 04:08:44 -0700 (PDT)
Date: Thu, 11 Sep 2025 11:08:43 +0000
In-Reply-To: <20250911121537.523195c5@fedora>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-2-9835d7349089@google.com>
 <20250911121537.523195c5@fedora>
Message-ID: <aMKtuwdk2HsejS-Q@google.com>
Subject: Re: [PATCH v2 2/2] panthor: use drm_gpuva_unlink_defer()
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Thu, Sep 11, 2025 at 12:15:37PM +0200, Boris Brezillon wrote:
> On Tue, 09 Sep 2025 13:36:23 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> >  static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
> > @@ -2084,12 +2010,12 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* Ref owned by the mapping now, clear the obj field so we don't release the
> > -	 * pinning/obj ref behind GPUVA's back.
> > -	 */
> >  	drm_gpuva_map(&vm->base, &vma->base, &op->map);
> >  	panthor_vma_link(vm, vma, op_ctx->map.vm_bo);
> > +
> > +	drm_gpuvm_bo_put_deferred(op_ctx->map.vm_bo);
> >  	op_ctx->map.vm_bo = NULL;
> 
> Hm, I don't see why we need a drm_gpuvm_bo_put_deferred() here. The
> original idea was to delegate the vm_bo ownership to the VA being added
> to the VM tree, so if we put it here, we have a UAF situation, don't we?

The vm_bo refcount goes like this:

incr vm_bo_obtain()
incr vma_link()
decr vm_bo_put()

There is no decrement in panthor_vm_cleanup_op_ctx() due to this line:

	op_ctx->map.vm_bo = NULL

So when everything is done, it is linked once and the refcount is
incremented by one, which is correct.

Alice
