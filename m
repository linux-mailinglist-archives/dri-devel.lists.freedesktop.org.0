Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6099CA73477
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 15:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F14210E8EE;
	Thu, 27 Mar 2025 14:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F4610E8EE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:32:04 +0000 (UTC)
Date: Thu, 27 Mar 2025 10:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1743085919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=94E5zNKWexfdhy9/zLLR62MY3bZA9D3wBjKM1n1wS5g=;
 b=A42cFazMozBqfD87sP7Sa2kB/8zoB6t+Vk3ae71qFfV4Sy85/tcA86Os3YgB6DIl0eaWSf
 J8jxjlzM0esqPFlyr7ChSse38X0KXqHXPPt21CsQpFkz/bvwMKqsIuJ5NiWHhaY4x7L87f
 gj+Auz0JtVBvfDeXIJZQSLV8qotCWsjVGqJEnUCetOlQe/nKT+xfbQa/XhCeZR1xHdpSXj
 46AqThTGcUHcbfaJl4xrzZbSxH4t5v44Az3j7dvDjl5iV4Z8VQ+TXypshcxAR64EGMgLxl
 OJs7MBV9RNEpM5w7BkCYWTkX5SQt9zcb0Y6nVtQ3R1eRM4qXU8bMT595Riawfg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Janne Grunau <j@jannau.net>
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
 Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>,
 Sergio Lopez Pascual <slp@sinrega.org>,
 Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
Message-ID: <Z-VhSaE8nopGy0e-@blossom>
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
 <20250327085817.GA341311@robin.jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327085817.GA341311@robin.jannau.net>
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
> > + * struct drm_asahi_params_global - Global parameters.
> > + *
> > + * This struct may be queried by drm_asahi_get_params.
> > + */
> > +struct drm_asahi_params_global {
> > +	/** @features: Feature bits from drm_asahi_feature */
> > +	__u64 features;
> > +
> > +	/** @gpu_generation: GPU generation, e.g. 13 for G13G */
> > +	__u32 gpu_generation;
> > +
> > +	/** @gpu_variant: GPU variant as a character, e.g. 'G' for G13G */
> > +	__u32 gpu_variant;
> 
> nit: the example can avoid the duplication of 'G' with "e.g. 'C' for
> G13C"

done in v6, thanks.

> > +/**
> > + * struct drm_asahi_get_params - Arguments passed to DRM_IOCTL_ASAHI_GET_PARAMS
> > + */
> > +struct drm_asahi_get_params {
> > +	/** @param_group: Parameter group to fetch (MBZ) */
> > +	__u32 param_group;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	/** @pointer: User pointer to write parameter struct */
> > +	__u64 pointer;
> > +
> > +	/** @size: Size of user buffer, max size supported on return */
> > +	__u64 size;
> 
> The comment is misleading in the case of newer / extended kernel which
> supports a larger size than supplied. You could change it to "size
> written on return" or clarify that the value on return will not exceed
> the input value.

fixed.

> > +struct drm_asahi_vm_create {
> > +	/**
> > +	 * @kernel_start: Start of the kernel-reserved address range. See
> > +	 * drm_asahi_params_global::vm_kernel_min_size.
> > +	 *
> > +	 * Both @kernel_start and @kernel_end must be within the range of
> > +	 * valid VAs given by drm_asahi_params_global::vm_user_start and
> > +	 * drm_asahi_params_global::vm_user_end. The size of the kernel range
> 
> This reads a little strange. Would it make sense to rename drm_asahi_params_global's
> vm_user_start and vm_user_end to vm_start/vm_end?

Good point, renamed.

> > +	/**
> > +	 * @bind: Union holding the bind request.
> > +	 *
> > +	 * This union is named to make the Rust bindings nicer to work with.
> > +	 */
> 
> This comment could use a short justification why this union does not
> defeat extensibility after the initial statement that "structures should
> not contain unions"

Added.

> > +	/**
> > +	 * @syncs: An optional array of drm_asahi_sync. First @in_sync_count
> > +	 * in-syncs then @out_sync_count out-syncs.
> > +	 */
> > +     __u64 syncs;
> 
> Would it make sense to explictly state that this is a pointer?

Done.

> Reviewed-by: Janne Grunau <j@jannau.net>

Thanks!
