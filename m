Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6274B315FA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5510EAC0;
	Fri, 22 Aug 2025 10:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DhXFH25H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103810EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:58:24 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-45a1b0060bfso12276155e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755860303; x=1756465103;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lN++07lUAqPEyNZeQbX5pIHFHJClvSv5yNvs5J86bac=;
 b=DhXFH25HadEV+bP2wawhFDD3dty7BMByBK5Ssz6YZw2RbmZBBGV8dFPc41Q4N89NwK
 u9dU+dtLerm3cv0n9261QYpwoemEFR1rDsiUy2ywTSfCFQ7TVOp0zcERPKpe32PA5Wb+
 9vzLCKlikzrU+qDX/C+yJlx5zwTOFZa2i0x5LEqpKd/gwvo7NJF2dBiGHyDn72TqswK4
 23nWPHPxUGUrjcn1Sve2jZjLI/2tRQvbw63+jPihtzaeYEyqdiDt8FDzHq3MSysGbwLr
 xFDz/2kWdOIeE7fUejcHqjR0Y5gr394NiaYOJwyXgPlkxMDi1BSm4zw/BLnUYcI2d5YR
 ThGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755860303; x=1756465103;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lN++07lUAqPEyNZeQbX5pIHFHJClvSv5yNvs5J86bac=;
 b=N7e6/1uQE6TcwNWPAAhF072+IKFSGzxgUh8T5wYz27MeXlvkesldS74h/Q5Ao2QDL2
 1/7xNe05RICj6rfXI93V3XVrHOLbaa9TUzfg1xEeONgtbEx7ITnhqpZz7HmQVAKO/w3/
 him4FiWiKM3SfKBvXM0VPI3AC7id4n9Ih1cavp1PC9Z+jGFCYd6+Y+OcMkzIvpYxXJnZ
 nxeLeF9z31lz5NJnLqHzSSpfEXHNLUWi0099vgmkEvP96NELQWmCdsAadFbBHmTxtq+q
 yawerkeWiaYmT5S28sSxIwKUIQAbe34vhEvmIMuXDF2jqW5A4MgPjdaOkr/nfz2KfEG4
 t36A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU2pLCZRu1n/VDuCGWXzqVhArjGBmkuKZPKh1/CmmOha2Xbz82jvSoVoPIjW9jUKW15KqL70IdRFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzVYQnnKgk72EmCh9hqy7ahXP9XKHRqqvxzd+sHGjMuXj6Swfc
 UyeQB3njB+jq19Im0kHc1WMnstiDR69y1/UfHEunEWaLoExaNAmhhLlgtcNyv4QOcF2yl3GRJu8
 Mm4T1AJRt3l5W/PnT4A==
X-Google-Smtp-Source: AGHT+IHpXT7FmVk8RuJ028/KgbugYZVF29dYSJUueN6hZexCX/5at84pZTIxdA+EfL+hrrSqvoKJLIl/f66psQg=
X-Received: from wmbfp14.prod.google.com
 ([2002:a05:600c:698e:b0:459:dd85:efda])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:450a:b0:459:dfde:3359 with SMTP id
 5b1f17b1804b1-45b517d9bd1mr17939435e9.32.1755860303434; 
 Fri, 22 Aug 2025 03:58:23 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:58:22 +0000
In-Reply-To: <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
Mime-Version: 1.0
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-3-c41a10d1d3b9@google.com>
 <DC8VTZ5OZY42.1OCS3QJHZGPAK@kernel.org>
Message-ID: <aKhNTpQ_8ZWXTbpq@google.com>
Subject: Re: [PATCH v2 3/3] gpuvm: remove gem.gpuva.lock_dep_map
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Fri, Aug 22, 2025 at 12:25:34PM +0200, Danilo Krummrich wrote:
> On Fri Aug 22, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 4a22b9d848f7b3d5710ca554f5b01556abf95985..598ba376b9430cdd4ab7bacdc15de031a887cf71 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -196,10 +196,20 @@ enum drm_gpuvm_flags {
> >  	 */
> >  	DRM_GPUVM_RESV_PROTECTED = BIT(0),
> >  
> > +	/**
> > +	 * @DRM_GPUVM_IMMEDIATE_MODE: use the locking scheme that makes it safe
> > +	 * to modify the GPUVM during the fence signalling path
> 
> I think this isn't entirely true yet or at least can be ambiguous for now,
> because it doesn't prevent users from having DRM_GPUVM_RESV_PROTECTED set, which
> requires the DMA resv lock to destroy a struct drm_gpuvm_bo, which may happen
> from drm_gpuva_unlink().
> 
> So, for now, until we have the deferred drop idea in place, it also
> requires DRM_GPUVM_RESV_PROTECTED to not be set.
> 
> (Eventually, we of course want both to be represented as a single flag, such
> that it becomes an either or.)
> 
> I also wouldn't say "makes it safe to", but rather "makes it possible to
> safely". We have no control over what the users do with the mutex. :)
> 
> NIT: missing period

Yeah, it probably makes sense to modify this wording, at least until the
deferred vm_bo thing.

Alice
