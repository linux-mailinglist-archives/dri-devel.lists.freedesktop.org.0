Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMYSIy3DgmkpaAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:55:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC8E16B6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 04:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52310E725;
	Wed,  4 Feb 2026 03:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OIH1AelR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB7C10E185
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 03:55:18 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-894676e6863so74658116d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 19:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770177317; cv=none;
 d=google.com; s=arc-20240605;
 b=dD9vl2B+PRyfwHXFRWO1vQFhbsa2P68CkMutE6c5rMXc1pu8VADwyAC6/x9swDNG7Q
 2MOuzlv4cW1KnfR65wdbqCrUDKc5ZXgon2emM0j9NmWf58bXnRD0TpWmab1eAQlM2iXh
 MtIgGE+Lv521p+0KIa9h6peIZxuhv+sVIAETuo3kea2nl3bjIL5sFAs0XSH4M+r7n3hu
 NSNofCiDSYtqmhOB0v+hJwu9HQGB4q2ys2yU8sQwdM/ZC3x4k1EFuXnOGdUxmNtm1nGN
 nkpix1RHLbIcilMcHIEuHYdT1PNeS3hyzKWCuvrQOfYE9/zGJi3d4QLChURNlUbNOP+j
 Qcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
 fh=KtettU3Hn82sql02KywGyLXcMIF7W46VujyzdXGlh4Y=;
 b=SU4XJD0QB0Z0pCmKr8QiEVMvTtsxQD0ORbhuf8v45S8Vo9FQJE6T2XBREoGmD9FX6h
 /PneAJdu1ScmY0mLa6+GrFu438rtX2d+lXDh9ETirk30SEV3dTYH6r/d8PvhQRNul0AY
 +n3tuPhSF/gi8nzb5ccCSjpbcVpmXqarlOwiKENS63g4J8UWIRCKPXbD8kUNI3ViweWQ
 f89JzGrhK+vJ/52+2n9bYuY1xOOLz2YR6o/36Rt+zvxnROvQHmvvdglePxskinUwuanv
 FuAaCfYpT7d39BbaUSLCAM0c5KN/Mz/b5sOnEDuTSDFIHOxBnCJPWu5L91H2r7w7AO0V
 eFtA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770177317; x=1770782117; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
 b=OIH1AelRQuRLHF7yx4qnUmdl80k60rIk8cRXkjhEB9UqkppRYIyIpUAQDyIEugTGAA
 cmFOEXpK0EbcSNZ/yR3SMn2yqpKyIFywjwS/HLlf1TkwDRqImJ7wpXH85PZ16hyxv5yT
 2rdHw09P6I2MlWXjUALYkazq0EsflJEgZ2HFBq4ocNHfhFeMx8bY8LVfOgwG49fEYvue
 2Zxwsu9aUV4qgXxjloEqK8JOfhTP9ly7vzqu8HTOEtbRlzFEQ5VyMbL5jG9HcSsfE7Jk
 Syey57zYMCgxDz4FnPnwc0B6QjMqVe9icUrkRTMx4LimnyaqL56cRxqFXL06ug/uP+jt
 iXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770177317; x=1770782117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
 b=wrMOU48wBCZw1A+3sRPrc9aVnxUuogZ9KoEp+oEhPFwMVo9yWT+1aO7gelTXZNAlom
 c/BnBJcPwtUTAesYRXcYCTY8qY52ktbG8uQIDz93GojuLP8IDDwA5/HiqWFRFOtV7z0U
 V+/qTjXfPnFszwz6IL6tS55mSLq3jDVlyLro3H9V149j0voiEI3m2JeeQ9/wKVKmfLN0
 e1X1L0BMPT+Aox2alAZ89qh25tnHAqzVvzdbggkY1AV47RQsFvJn4pt2ukSWTuUENhnU
 zpk96sbQZnuWAKfh8W6UZRfcFnGllO9GYLX9p+bY7L1aokvXKqoXV57yb5qw7qruk48i
 wTAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhiWdIzgAbtayzRY2H6Ml/jcg0TuhjJqHB2S6KNgIoJzlV4BpwhzKcQDyxm5N1HivejvTH+vH3LM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoOkAvZd3QJfY6T/Vo9RKGzkQ26suZ8tNWE1m1q3DkJXt5X7ge
 1wrpVmfJLwo9b0AmsiyW6dcI7j/ZC2F2NWVAEe61yh7fcTBDXA7nVpmsf15y9Nl+hT8tt6U+o4Q
 vpu4pzxZMLkpPsRpayBS0CTOpKBjLYgs=
X-Gm-Gg: AZuq6aJhThFOoLZs+04knsgcI0BQS8jWaTlamRrhysupp6IF0tb9dRJqt8mQC8UJR48
 IJahcHEqtP10RKdl9gBxA3Al4gjoDGicIeMrVudTfiO4OPZBk8Chlsl56hOQwj51xYIZUTFVW/B
 xH6NwYxa06SRf3WGIYaxQlnD0p+wpok5zfTEbyE5QlQntSMzMkPJ7gf4XXl+hXqD0tCBGEXoSG3
 d+aDnUVw6Opfnc2N8GnYJeu/fVQVYymlpo5hZo0DvywdnqI1nN3HkA7SsHJyTByefkJ+Di42yWv
 PLeERhlYXVmX08Q9naYWxYdSpZkNHByRbsnEd44Go3K60IySOBxycvA=
X-Received: by 2002:a05:6214:1d29:b0:894:7eb9:ead2 with SMTP id
 6a1803df08f44-895221a66d7mr25922916d6.32.1770177317310; Tue, 03 Feb 2026
 19:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-4-joelagnelf@nvidia.com>
In-Reply-To: <20260120204303.3229303-4-joelagnelf@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Feb 2026 13:55:06 +1000
X-Gm-Features: AZwV_QgqNJTzw-ZqXx5fJP-IeYh6sbx0Oiz2PE2A1U4oPqZRrSE9m3Umv0I5kN4
Message-ID: <CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 03/26] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:corbet@lwn.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:deller@gmx.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:epeer@nvidia.com,m:acourbot@nvidia.com,m:arighi@nvidia.com,m:aritger@nvidia.com,m:zhiw@nvidia.com,m:alexeyi@nvidia.com,m:balbirs@nvidia.com,m:phasta@kernel.org,m:elle@weathered-steel.dev,m:daniel.almeida@col
 labora.com,m:joel@joelfernandes.org,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 39FC8E16B6
X-Rspamd-Action: no action

> +///
> +/// These flags control the allocation behavior of the buddy allocator.
> +#[derive(Clone, Copy, Default, PartialEq, Eq)]
> +pub struct BuddyFlags(usize);
> +
> +impl BuddyFlags {
> +    /// Range-based allocation from start to end addresses.
> +    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
> +
> +    /// Allocate from top of address space downward.
> +    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
> +
> +    /// Allocate physically contiguous blocks.
> +    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
> +
> +    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
> +    /// done by the allocator, but by the caller before freeing old blocks.
> +    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
> +
> +    /// Disable trimming of partially used blocks.
> +    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
> +
> +    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
> +    /// indicates that the caller has already zeroed the memory.
> +    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
> +
> +    /// Create [`BuddyFlags`] from a raw value with validation.
> +    ///
> +    /// Use `|` operator to combine flags if needed, before calling this method.
> +    pub fn try_new(flags: usize) -> Result<Self> {
> +        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
> +        if flags > u32::MAX as usize {
> +            return Err(EINVAL);
> +        }
> +
> +        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
> +        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
> +        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self(flags))
> +    }
> +
> +    /// Get raw value of the flags.
> +    pub(crate) fn as_raw(self) -> usize {
> +        self.0
> +    }
> +}
> +
> +/// Parameters for creating a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyParams {
> +    /// Base offset in bytes where the managed memory region starts.
> +    /// Allocations will be offset by this value.
> +    pub base_offset_bytes: u64,
> +    /// Total physical memory size managed by the allocator in bytes.
> +    pub physical_memory_size_bytes: u64,
> +    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
> +    pub chunk_size_bytes: u64,
> +}
> +
> +/// Parameters for allocating blocks from a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyAllocParams {
> +    /// Start of allocation range in bytes. Use 0 for beginning.
> +    pub start_range_address: u64,
> +    /// End of allocation range in bytes. Use 0 for entire range.
> +    pub end_range_address: u64,
> +    /// Total size to allocate in bytes.
> +    pub size_bytes: u64,
> +    /// Minimum block size for fragmented allocations in bytes.
> +    pub min_block_size_bytes: u64,
> +    /// Buddy allocator behavior flags.
> +    pub buddy_flags: BuddyFlags,
> +}
> +

(not a full review)

Any reason these two need Clone, Copy? I'm not seeing a use case for
that, maybe we should pass them as non-mutable references, but I don't
think there is any point in passing them by value ever.

Dave.
