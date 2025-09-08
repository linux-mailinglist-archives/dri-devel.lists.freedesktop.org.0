Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A91B486DB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 10:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D91C10E105;
	Mon,  8 Sep 2025 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bGIc93kA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9D610E105
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 08:26:15 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45b99c18484so17099445e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757319974; x=1757924774;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OnHARbdkEp4PUIEXLxBi52Eid01cJA5Jgk1L/pOVvBU=;
 b=bGIc93kAdex7f8PoX95MtgXjpt+yWNuw6s3+JlKemLr0Ora19hgvFAKG5d9g9ee/aq
 JzUYShosM286wypQdym7FmomaHu/lGxt3APS1tUCKPma7+94Mj74buhXS9E7hwpBwiR1
 1u5kaP9QmVc0UKRE2gmGuJilkP7ZkhyMe41I2pUtxnmzDt3IK3b4GZXn0yJuK3XeZ5qJ
 vmEX0GHShyLoy1R9uzJXZlkqEEI4ITUzkal7bW/69WFSoDFA+ieMlp7sZPh2GCF2mdaG
 tnGlS4bN78FUgmc/Wwb2d2smEsuIoJ1QNoWu7uxlAtlnhoHKWRxqUcsT3afAftqtKT5e
 we4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757319974; x=1757924774;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OnHARbdkEp4PUIEXLxBi52Eid01cJA5Jgk1L/pOVvBU=;
 b=K7X7GvvTF4uJD7ZWYHjTQeTVPdUomeedfZoIDPHh0V+UEInSeeCusHUEBm9VFCZas2
 XkAZ5TyDie+Bldb0HJcgBOzJ1Z34q/apxCZl02sa6NPf2ZETEY7qHPxnm6nXzxqp6Oye
 ZYd5528Jx5MKZtnjW8n1Sqf/Ay0pCxveW0HRYxPG2j1AfErAx82peoNyLTSY4djB0CC6
 VMRVNfZPcvWKIG1mvtjI4NrdfTpUXD0z5m9L2xYbCPAqbNktWXJv/rdwlF3M8zVNaMQb
 A99L1hxdEHw3fmY80v7NNRiVGo+11DQypG5eRUDWvyr3cMWYfVsJcrmRZrex2qohD6Ya
 Jxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNyZAzwpgd+GptnadcPRNvmeVt8buLrrvUJf5h/f52IAECo5N5BqtqcHJ+Htto4P+kDDpKhBZHsk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1EyMx1di599OULwry++K6E8dNpJil1Zs/VSekMzSvhJ6qoCqE
 mLumIZG5W+TJoN6jqnCKRHNB/b2LrP0RfyheMN7FCpazVeVEItbuRqdMjKs2lpczKjPGlVRt66f
 Ru5UEwPL9Qo7zaByM5w==
X-Google-Smtp-Source: AGHT+IHmAGS9iw5p+qpRXfi08CMknpisf8y9SJ/Rv5N3Oluu+SFLgdV4jan6x32Afnezxx99GFjYRiK5SIRpfUE=
X-Received: from wmon9.prod.google.com ([2002:a05:600c:4649:b0:45d:d1dd:6750])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d24:b0:45b:7185:9e5 with SMTP id
 5b1f17b1804b1-45dea7a561dmr4688775e9.5.1757319974085; 
 Mon, 08 Sep 2025 01:26:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 08:26:13 +0000
In-Reply-To: <20250908091140.44856fde@fedora>
Mime-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com>
 <20250908091140.44856fde@fedora>
Message-ID: <aL6TJYRmWIkQXujj@google.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
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

On Mon, Sep 08, 2025 at 09:11:40AM +0200, Boris Brezillon wrote:
> Hi Alice,
> 
> On Sun, 7 Sep 2025 11:39:41 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > Yeah I guess we could have unlink remove the gpuva, but then allow the
> > end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
> > way, the drm_gpuva_unlink() is not deferred but any resources it has can
> > be.
> 
> This ^.
> 
> > 
> > Of course, this approach also makes deferred gpuva cleanup somewhat
> > orthogonal to this patch.
> 
> Well, yes and no, because if you go for gpuva deferred cleanup, you
> don't really need the fancy kref_put() you have in this patch, it's
> just a regular vm_bo_put() that's called in the deferred gpuva path on
> the vm_bo attached to the gpuva being released.

Ok, so what you suggest is that on gpuva_unlink() we remove the gpuva
from the vm_bo's list, but then instead of putting the vm_bo's refcount,
we add the gpuva to a list, and in the deferred cleanup codepath we
iterate gpuvas and drop vm_bo refcounts *at that point*. Is that
understood correctly?

That means we don't immediately remove the vm_bo from the gem.gpuva
list, but the gpuva list in the vm_bo will be empty. I guess you already
have to handle such vm_bos anyway since you can already have an empty
vm_bo in between vm_bo_obtain() and the first call to gpuva_link().

One disadvantage is that we might end up preparing or unevicting a GEM
object that doesn't have any VAs left, which the current approach
avoids.

> > One annoying part is that we don't have an gpuvm ops operation for
> > freeing gpuva, and if we add one for this, it would *only* be used in
> > this case as most drivers explicitly kfree gpuvas, which could be
> > confusing for end-users.
> 
> Also not sure ::vm_bo_free() was meant to be used like that. It was for
> drivers that need to control the drm_gpuvm_bo allocation, not those
> that rely on the default implementation (kmalloc). Given how things
> are described in the the doc, it feels weird to have a ::vm_bo_free()
> without ::vm_bo_alloc(). So, if we decide to go this way (which I'm
> still not convinced we should, given ultimately we might want to defer
> gpuvas cleanup), the ::vm_bo_free() doc should be extended to cover
> this 'deferred vm_bo free' case.

I can implement vm_bo_alloc() too, but I think it seems like a pretty
natural way to use vm_bo_free().

Alice
