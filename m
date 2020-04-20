Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717A1B1F0D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0866E899;
	Tue, 21 Apr 2020 06:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD716E7D5;
 Mon, 20 Apr 2020 16:15:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id v2so4114758plp.9;
 Mon, 20 Apr 2020 09:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mKMIW3mEg5t1gLoJ6mz8YW5V5YHdFX18CfmBOsT8+DM=;
 b=YaM9kPSkpUQtJJS2VdkSGJa4JKewLVvCHUpqCA8mvW2+M3ac5NAgXUUF7EsP7gXMqk
 1fWNPHUKASzmUQjTA7nBFt3RXr9arXU0n2MSXzwiC8eHaZ4gVhQMbHWjVqVfx/a6t9UV
 QTF69XnAPgqK8M5ojve8RhedLK68j+ooVJ1rKA5QDy2qbUAYSg7ee9p5PAKdkzN++1oY
 fmtXprUZJA1jxnKcL7FsxupqQYJzUDEc+VcbZMP6LvxM6n2jKYblbvAkIkPyl5bzl8CE
 pbCXpTLSE4TcEBNhCpeIN+uqCHXskVB6BKqtoG3DMOQRyvlDlmyfEy1RPboh2wSf7MP9
 1dtA==
X-Gm-Message-State: AGi0PuaSo29lNAJ34XZP6bf5m3iJRUiPRm33gNaL33QN78c5KlODZ9gJ
 XbTJu/6CsIMT67hKUT7w6DM=
X-Google-Smtp-Source: APiQypIo65I60EmrvJr0Fn9k464/b4BsdAENW1ihErA04xVYqn/vV5ywXSVnzlYGX6PHk/VUYYyFKA==
X-Received: by 2002:a17:90a:890a:: with SMTP id
 u10mr161799pjn.154.1587399317254; 
 Mon, 20 Apr 2020 09:15:17 -0700 (PDT)
Received: from sultan-box.localdomain ([104.200.129.62])
 by smtp.gmail.com with ESMTPSA id o1sm48749pjs.35.2020.04.20.09.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:15:16 -0700 (PDT)
Date: Mon, 20 Apr 2020 09:15:14 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
Message-ID: <20200420161514.GB1963@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
 <20200414061312.GA90768@sultan-box.localdomain>
 <158685263618.16269.9317893477736764675@build.alporthouse.com>
 <20200414144309.GB2082@sultan-box.localdomain>
 <20200420052419.GA40250@sultan-box.localdomain>
 <158737090265.8380.6644489879531344891@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158737090265.8380.6644489879531344891@jlahtine-desk.ger.corp.intel.com>
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 11:21:42AM +0300, Joonas Lahtinen wrote:
> So it seems that the patch got pulled into v5.6 and has been backported
> to v5.5 but not v5.4.

You're right, that's my mistake.

> In doing that zeroing of ring->vaddr is removed so the test to do mdelay(1)
> and "ring->vaddr = NULL;" is not correct.

I'm not so sure about this. Look at where `ring->vaddr` is assigned:
-------------------------------------8<-----------------------------------------
	ret = i915_vma_pin(vma, 0, 0, flags);
	if (unlikely(ret))
		goto err_unpin;

	if (i915_vma_is_map_and_fenceable(vma))
		addr = (void __force *)i915_vma_pin_iomap(vma);
	else
		addr = i915_gem_object_pin_map(vma->obj,
					       i915_coherent_map_type(vma->vm->i915));
	if (IS_ERR(addr)) {
		ret = PTR_ERR(addr);
		goto err_ring;
	}

	i915_vma_make_unshrinkable(vma);

	/* Discard any unused bytes beyond that submitted to hw. */
	intel_ring_reset(ring, ring->emit);

	ring->vaddr = addr;
------------------------------------->8-----------------------------------------

And then the converse of that is done *before* my reproducer patch does
`ring->vaddr = NULL;`:
-------------------------------------8<-----------------------------------------
	i915_vma_unset_ggtt_write(vma);
	if (i915_vma_is_map_and_fenceable(vma))
		i915_vma_unpin_iomap(vma);
	else
		i915_gem_object_unpin_map(vma->obj);

	/* mdelay(1);
	ring->vaddr = NULL; */

	i915_vma_make_purgeable(vma);
	i915_vma_unpin(vma);
------------------------------------->8-----------------------------------------

Isn't the value assigned to `ring->vaddr` trashed by those function calls above
where I've got the mdelay? If so, why would it be correct to let the stale value
sit in `ring->vaddr`?

My interpretation of the zeroing of ring->vaddr being removed by Chris was that
it was an unnecessary step before the ring was getting discarded anyway.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
