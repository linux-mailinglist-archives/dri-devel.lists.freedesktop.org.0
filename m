Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RKivDOxzmWlrUAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:59:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0616C70E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 09:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EC410E004;
	Sat, 21 Feb 2026 08:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="02r6ueLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D6210E004
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 08:59:18 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836b7c302fso23220835e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771664357; x=1772269157;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
 b=02r6ueLttmrsH85pAtUonNBPDWaS/+FEnhHe8IhfSIBLoO3yTvJdR/k3zFEVt2p1Oi
 4NudQ1srvM/NYWG1JpsVLPouKTTF/MTDtVWCyjcBCjBZybgiEohMEIVXushj/Pj6PkMx
 WakiU/4ydpqWbvojk0JptPrnWUeCckrvDh2zzYKG18rceY+iQHcivqT09d6IC9e5A3y7
 I+Lk5YzifYrN7W/8l6OU23Cp1aFwxjWDaz6SF+hCqbmoBksaHQRw08O1ouLyWGeqX9ht
 B3PrBdueLga3EgKRVbmU/JExR+y/z/3keMsnqTrFXEg1hiMIZWJdifVPE5cy1L+bM+6V
 GsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771664357; x=1772269157;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
 b=DRMcXhtYpcKj6V8imtdTB8uSrYRhxtz/yWVZNa0TcxArB//FjEAiC4vK+2LsFdvowZ
 MapRqduI9IeyEyPfmw6p7TkjMIyYqjGWkxnjDIcwEwBaxDBfJXthjwB3C966haymO67X
 8OAYdJLuASbPEecMrprvKGnOwAODUa9GxOYo6vKsujbNnStTCJsD+iS2zznRwQy36YZQ
 5DnnKmGRTYjR5GZD8ZLPd2bArHq5l7PO3oIWNgyFQ87o6IXOgbE+XS0kMv99OYkazxAy
 QATVMmmy2xh81cG3gOyroynraAhV72bmx6WDH82gI+k0+a/sXW75op140TTiLXhP5ElS
 57VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqsARIo3q3wVtRXSqhB8plMscaGwVGjy4E/XkKja4BXoGiE7dDlQZGMM9iHAepWMF5CgFReksb2p0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFojJFgCekpkzzJ9dXclsPRGjd0xEgiQQCz1kKbcc5j1mFX9e7
 8x/90zgId3xpcr4wO1wkLCQZYadaHVirsrZJCgkgcqnsrMg9xpA4RkZUCRxEK3rwhMZAi1WhG3Z
 Q4OWXBJ/0X7pV8Gz3cQ==
X-Received: from wmbz1.prod.google.com ([2002:a05:600c:c081:b0:483:6f89:e2c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e09:b0:480:25ae:9993 with SMTP id
 5b1f17b1804b1-483a962e3c9mr39685415e9.20.1771664356547; 
 Sat, 21 Feb 2026 00:59:16 -0800 (PST)
Date: Sat, 21 Feb 2026 08:59:15 +0000
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
Message-ID: <aZlz49VtPA0JbEGx@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 81D0616C70E
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general this looks like a useful tool to write other abstractions, so
that's good. A few nits below.

Also, I think it would make more sense to split this series into two
with titles like this:

* Add clist helper for writing abstractions using C lists
* Move buddy alloctor one level up

That way, you can tell what the series actually does from its title.
Yes, the 'why' of a series is very important, and must be included in
the cover letter or commit messages, but I think the title of a series
should explain the 'what', not the 'why'.

> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> +    ///   for the lifetime `'a`.

I don't think C vs Rust is useful here. What you want is that the list
is not modified by random other code in ways you didn't expect. It
doesn't matter if it's C or Rust code that carries out the illegal
modification.

> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
> +// by non-Rust code per safety requirements of [`CListHead::from_raw`].
> +unsafe impl Sync for CListHead {}

Same here. If another piece of Rust code modifies the list in parallel
from another thread, you'll have a bad time too. C vs Rust does not
matter.

Alice
