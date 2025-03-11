Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E38A5C19B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8097E10E1B3;
	Tue, 11 Mar 2025 12:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848F10E1B3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:46:47 +0000 (UTC)
Date: Tue, 11 Mar 2025 08:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741697201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mOG0CEw3FP2FlG0epn5X7Xw21NWLyIUELyR5vBonHPk=;
 b=iOqEUJgvADrMU0rIWuG0Ruc7Rtt8IZl+4o95HtRzhUdZyQGFZ1JqrK6ZYGRItGhaB/i6vx
 SUKlcXNM56cjtmk6uLgcFTxRSu13CBv7gM8RK/UHtKCdvpIuuoCKgOg2ZyE5WaPzY26G76
 uyHRVJJ+1DwdlUYaed7Wflte4dOcoRNxcMzYlo6FIlE42eXoaGrJVauc3xcB5jmYo5XCcD
 BUXc+bXEclIcJh9ZSiUkawPEsyTzJaoUtop39EGchJ3EqbnbnlWjQvuj3E3YGsIrgGFuaL
 uZv6bDGFaxw6XdeG2kdrdBdFkuQ7+IJDK/zThbDQLqxqGNj8xUbEJQw7INmUrA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Clark <robdclark@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] drm: Add UAPI for the Asahi driver
Message-ID: <Z9Awpj5Avh0rx_fq@blossom>
References: <20250310-agx-uapi-v1-1-86c80905004e@rosenzweig.io>
 <CAF6AEGukrBzwwdDWX5jUXDKqj7+kn7LBRy6NocE4=bw1D9WjcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGukrBzwwdDWX5jUXDKqj7+kn7LBRy6NocE4=bw1D9WjcQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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

> > +/**
> > + * struct drm_asahi_gem_bind - Arguments passed to
> > + * DRM_IOCTL_ASAHI_GEM_BIND
> > + */
> > +struct drm_asahi_gem_bind {
> > +       /** @op: Bind operation (enum drm_asahi_bind_op) */
> > +       __u32 op;
> > +
> > +       /** @flags: One or more of ASAHI_BIND_* (BIND only) */
> > +       __u32 flags;
> > +
> > +       /** @handle: GEM object to bind/unbind (BIND or UNBIND_ALL) */
> > +       __u32 handle;
> > +
> > +       /** @vm_id: The ID of the VM to operate on */
> > +       __u32 vm_id;
> > +
> > +       /** @offset: Offset into the object (BIND only) */
> > +       __u64 offset;
> > +
> > +       /**
> > +        * @range: Number of bytes to bind/unbind to addr (BIND or UNBIND only)
> > +        */
> > +       __u64 range;
> > +
> > +       /** @addr: Address to bind to (BIND or UNBIND only) */
> > +       __u64 addr;
> > +};
> 
> No in/out syncobj/fences?  This seems to diverge from xe/nouveau/panthor..

Async vm_bind is useful mainly as an optimization, it's not (as far as I
know) required for correctness - you can always wait/signal from a
userspace submit thread with sync vm_bind. It's my understanding (from
when I chatted with Faith about this when bringing up sparse) that this
is how sparse was implemented historically and maybe still is on
Windows?

> > +/**
> > + * enum drm_asahi_sync_type - Sync item type
> > + */
> > +enum drm_asahi_sync_type {
> > +       /** @DRM_ASAHI_SYNC_SYNCOBJ: Binary sync object */
> > +       DRM_ASAHI_SYNC_SYNCOBJ = 0,
> > +
> > +       /** @DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ: Timeline sync object */
> > +       DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ = 1,
> > +};
> 
> IMHO it would still be worthwhile to also support fence fd's, since it
> would avoid a couple extra ioctls to convert btwn fence fds and
> syncobj for virtgpu native context..

Ditto for this as an optimization. Both of these can be added in a
straightforward backwards-compat way later, so I'm inclined to not add
any extra functionality beyond what we already have (and know works),
rather than commit prematurely to new features and risk getting
something wrong.

(and then it means more rust bindings...)
