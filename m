Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CwA6OQimjGnVrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:53:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C2125DBC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925C610E0AB;
	Wed, 11 Feb 2026 15:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WaH5AqO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6A10E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:53:40 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-480717a8ef9so9591975e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770825218; x=1771430018;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fo7WKYebi3fAlOUB+zK2I6teKG+LDSaCT9sMVh6hilE=;
 b=WaH5AqO2znX7ZLQaQwzbhmGujMvwCE136n5LSdFDsD5lVRsNpVSjRqGFIK/qfjW1e7
 aXYaYq5DJzjtIjgSmxEcARiWqxK+ON5skdV/jyWgFwTxR+Sp9iLFhpWb8+lqhRMzCX7+
 u0hWQyLY3Qb3gsy/1VavkxxfSEB3QrGlowVZYewqMR9FuJ8QFSelnQp3wfInIkZfpVFD
 0+cph14eJoZhLScx3aWDk9U5eZFg1T4Ky7lFxNP7+o4FCFnEJcrqejCfxzIgRF4OUpOd
 VmLBNe3asFEFBl2pstjuCjcdNoIs9wGQI1vOmDpu+eDOAgXRTFuVGCzJ9RVGBqzC8DMX
 SEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770825218; x=1771430018;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fo7WKYebi3fAlOUB+zK2I6teKG+LDSaCT9sMVh6hilE=;
 b=d9Uybm+Vz0T+60GW8Gr247Z9fE2zOA4FRnUaXBM4w4CYWiaS3Z5ORd3K0iQ2UTv2L4
 SkXWRHD91WoZIZ+kMUiUyVBcGmFFhx+LfyAG/pGeQwPT8nb72mAi5NDeEkvSFozb/aF4
 l69SfswleYr8T/28PPMJrHWHbQKno8Q1z6Eafk0mxLeKHqrIbCHfGGkQKpIazM3AP/qx
 2GykMJ379iMEbfFOhS6Sf0syCuSYyfxRWo7FlWpRPDIgdF/o8fEvkfAENNmF3u5jH9OJ
 Nt5JiaIbwHLORoftQAEsHFE3g3jqZxLSDY/OczQ1Cmf8a0D+oMlMi1Ar62+z+fPsmRMq
 U21Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF/HDXkgphWjR47+WUxQsDLpFGmxiqzg100od5ngpS6l+qyzZifL8Ea9cABy1ioC7imqDjjr+PU8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGQRxtzzD5MyJjhf2/NLWo5l6qDSlojCdo4TPNASq4GgGXRG0I
 lIE9/h1VkmoQCzom2wwkeHE7YbVf5pTgiRwkhD4176jQeO/OFg76LAyIQQK++pQx21vWOdvqMAG
 +sfAcxIQZ5Kc4ULbWDw==
X-Received: from wmov20.prod.google.com ([2002:a05:600c:4714:b0:480:4a03:7b5c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d2:b0:47e:e2b8:66e6 with SMTP id
 5b1f17b1804b1-48350547564mr88179375e9.14.1770825218555; 
 Wed, 11 Feb 2026 07:53:38 -0800 (PST)
Date: Wed, 11 Feb 2026 15:53:37 +0000
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Mime-Version: 1.0
References: <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
 <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Message-ID: <aYymAR8BRNL-DVMh@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Gary Guo <gary@garyguo.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:gary@garyguo.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,garyguo.net,gmail.com,ffwll.ch,kernel.org,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 155C2125DBC
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:20:15PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> > > 
> > > Back to this particular job dependencies use case: we have to embed the
> > > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > > because DmaFences can be inserted in multiple of those lists in
> > > parallel.
> > 
> > Okay, if that's the case, then the linked list is *really* not the right
> > tool for the job.
> 
> We have to distinguish what we are talking about here.
> 
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.
> 
> Whether the driver has other clones of that fence in other list is not
> relevant because it's not the same list head.
> 
> JQ's lists and list heads are internal.
> 
> I don't see a problem.

I'm talking about this allocation:

    pub fn add_dependency(&mut self, fence: ARef<DmaFence<i32>>) -> Result {
        let dependency = Dependency::new(fence)?;

and this one:

    pub fn submit_job(&self, mut job: Pin<KBox<Job<T>>>) -> Result<ARef<DmaFence<i32>>> {
        [...]
        let wrapped_job = JobWrap::new(job)?;

Replacing `dependencies` with a KVec and `waiting_jobs` with xarray
would cause these to use less memory, fewer allocations, and be faster.
And it would solve the raw pointer in HwFenceWaker, as you can use the
address (or other ID) of the Job<T> as key to look up in the xarray.

For `dependencies` there's no need to worry about the vector growing too
large, because the vectors are not long-lived: when the fence signalled
the entire vector can be freed. As for waiting_jobs, the xarray
auto-shrinks its memory usage, so no problem there.

Alice
