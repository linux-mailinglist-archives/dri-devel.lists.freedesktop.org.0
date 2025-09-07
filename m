Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5088AB47B07
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 13:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE2610E1B7;
	Sun,  7 Sep 2025 11:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="z69Iq/HY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B48E10E1B7
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 11:39:44 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45b98de0e34so27332865e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757245183; x=1757849983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=76k1w/hZUONsc9kXw+6H44ujJP9uLKMcBhBot9MBRw0=;
 b=z69Iq/HYkr4nfYyfWREUl7RmVaXTj++YyzoohHWj6vYB2EtFSJpuZafSQndai74d3b
 9Gh48ip3lmAQJqav0ElRudPqZqIE7BfBo9J2IXFNMEjqRXXokXTLG0g+U3phvDVhLnXl
 6mt9qkPWK6G5EcVpCLHvx14+X7Z6838qQWPgsKfaV/sDcE2jv0fxFeIpyZqzYg/9K0NX
 xCYpuMhBTNh26xhzlUG4uOiwvRadmGFsfjIirvWI0lfZZ1vJJzUw6yc/lTUk027jHtfn
 0SKI8BGPdoUTDsLt4/JtpHGwq+e9k+AVw8plp5n7lF43rCk2O4thSThFWuRJowX8KoL6
 AUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757245183; x=1757849983;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=76k1w/hZUONsc9kXw+6H44ujJP9uLKMcBhBot9MBRw0=;
 b=JPZWGrw83u6GtM6Vy2RUhxk050RJ/vXA7zPEJtSr9eYRSzc0Vs6Gjs/4MayTJhZ3wD
 MmcQPaxtWNUEm/H/vBdQu7FLT+Q/PJcnRg0HaFZLfAmK4F1PUFgvaYQlopAZDPjPAH4A
 a3/FG2THP3sXPzPF2JWRl0mH04RIEbj257yJVnG2XrPZTR/xc5U7vQQuKJOLPwuQGOeO
 iNNtpFtFZOV/aT1g+U0JqjzmjmQ8P00aYXNCuRvAt0+vHpGq3hUMN+YB2u+8uwme0sqU
 ur0l9B0ICx5TLNUvApvAX6O9D8jU0iQWgBsJJCeA44A3pOu4LktQrjzKjNF2UM66kEe+
 dFUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwcd/FT0p8cb5vv5cHo3mRt36HryGq8K8ELV6w8o/aggNjHMwJCLP+cPfIjRHnJMW9MCQRtrFBs+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGrk5DAzePCeX1p2rFo+fkGAEsiAT1MWMpvCMBq/zlSWfmYJGb
 YMlCNvz6m4X+O7blVLcNDpFJXXsoQER16YkcjBBU839jMWoPcwgI9GZxv/JUGqP0MgK2jFgigC0
 XBNqse4+y0MqsL/wYpA==
X-Google-Smtp-Source: AGHT+IHoVcPYbe0iUJKGBmK7yYOxv27qbhfcAB9Hc59veTuVIOgoY0qC6MoiuHeagEO6EoOqKdzaexiDWmVsuiQ=
X-Received: from wmbes11.prod.google.com
 ([2002:a05:600c:810b:b0:459:7c15:15b9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e8c:b0:45c:b6fa:352e with SMTP id
 5b1f17b1804b1-45dddecf506mr42361025e9.18.1757245182810; 
 Sun, 07 Sep 2025 04:39:42 -0700 (PDT)
Date: Sun, 7 Sep 2025 11:39:41 +0000
In-Reply-To: <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
Mime-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
Message-ID: <aL1u_YxOkuj1kIq6@google.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Sep 07, 2025 at 01:28:05PM +0200, Danilo Krummrich wrote:
> On Sun Sep 7, 2025 at 1:15 PM CEST, Alice Ryhl wrote:
> > On Sat, Sep 06, 2025 at 12:47:36AM +0200, Danilo Krummrich wrote:
> >> On Fri Sep 5, 2025 at 8:18 PM CEST, Alice Ryhl wrote:
> >> > On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
> >> > <boris.brezillon@collabora.com> wrote:
> >> >> On Fri, 05 Sep 2025 12:11:28 +0000
> >> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> > +static bool
> >> >> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> >> >> > +{
> >> >> > +     return !kref_read(&vm_bo->kref);
> >> >>
> >> >> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer =
the
> >> >> vm_bo release. I get why it's done like that, but I'm wondering why=
 we
> >> >> don't defer the release of drm_gpuva objects instead (which is real=
ly
> >> >> what's being released in va_unlink()). I can imagine drivers wantin=
g to
> >> >> attach resources to the gpuva that can't be released in the
> >> >> dma-signalling path in the future, and if we're doing that at the g=
puva
> >> >> level, we also get rid of this kref dance, since the va will hold a
> >> >> vm_bo ref until it's destroyed.
> >> >>
> >> >> Any particular reason you went for vm_bo destruction deferral inste=
ad
> >> >> of gpuva?
> >> >
> >> > All of the things that were unsafe to release in the signalling path
> >> > were tied to the vm_bo, so that is why I went for vm_bo cleanup.
> >> > Another advantage is that it lets us use the same deferred logic for
> >> > the vm_bo_put() call that drops the refcount from vm_bo_obtain().
> >> >
> >> > Of course if gpuvas might have resources that need deferred cleanup,
> >> > that might change the situation somewhat.
> >>=20
> >> I think we want to track PT(E) allocations, or rather reference counts=
 of page
> >> table structures carried by the drm_gpuva, but we don't need to releas=
e them on
> >> drm_gpuva_unlink(), which is where we drop the reference count of the =
vm_bo.
> >>=20
> >> Deferring drm_gpuva_unlink() isn't really an option I think, the GEMs =
list of
> >> VM_BOs and the VM_BOs list of VAs is usually used in ttm_device_funcs:=
:move to
> >> map or unmap all VAs associated with a GEM object.
> >>=20
> >> I think PT(E) reference counts etc. should be rather released when the=
 drm_gpuva
> >> is freed, i.e. page table allocations can be bound to the lifetime of =
a
> >> drm_gpuva. Given that, I think that eventually we'll need a cleanup li=
st for
> >> those as well, since once they're removed from the VM tree (in the fen=
ce
> >> signalling critical path), we loose access otherwise.
> >
> > Hmm. Another more conceptual issue with deferring gpuva is that
> > "immediate mode" is defined as having the GPUVM match the GPU's actual
> > address space at all times, which deferred gpuva cleanup would go
> > against.
>=20
> Depends on what "deferred gpuva cleanup" means.
>=20
> What needs to happen in the run_job() is drm_gpuva_unlink() and
> drm_gpuva_unmap(). Freeing the drm_gpuva, inluding releasing the assoicia=
ted
> driver specific resources, can be deferred.

Yeah I guess we could have unlink remove the gpuva, but then allow the
end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
way, the drm_gpuva_unlink() is not deferred but any resources it has can
be.

Of course, this approach also makes deferred gpuva cleanup somewhat
orthogonal to this patch.

One annoying part is that we don't have an gpuvm ops operation for
freeing gpuva, and if we add one for this, it would *only* be used in
this case as most drivers explicitly kfree gpuvas, which could be
confusing for end-users.

Alice
