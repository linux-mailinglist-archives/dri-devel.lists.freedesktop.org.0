Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHx2KR4yi2kFRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:26:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DD11B337
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 14:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55110E57A;
	Tue, 10 Feb 2026 13:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XnWENXLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302810E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 13:26:51 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-480711d09f1so17188255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770730009; x=1771334809;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FdusrkF1rdhhHjrXLuahuHjKwfdA8TDoSd3qb4xa01Y=;
 b=XnWENXLuf8jqdr5Ab+vB11qFL9Jy7T8YVx6122PK7xbdrZ9wHgiUAdFz7IQQwAj7is
 g+5NE19t5QFsvCvi46XCtaSRlJIreSkRDwKuhxDe8GhC10xEymnAZeY2kqCl9jnM0Rlq
 hILlOKilK1Ps7FK4TEOrTkBX+qGpv2eygTfGRVVmAx8i90+q9QunUHbeWxll4be/Pc1k
 cQjYKE8wsXBJ/NEqYZCGECwRBD3lTy30tJmNyCYOr3a/asL5SxaA5uIJNrRhpXbo9m/Z
 Q1u4qKEQc/imHZmRi7jfpVvxYLUUm+8srJdvipbATyKBMkyi1l5vaJTlway45Q5i8J3c
 73JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770730009; x=1771334809;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FdusrkF1rdhhHjrXLuahuHjKwfdA8TDoSd3qb4xa01Y=;
 b=Zo/hCk+WCuy5lY4cqay3Lbzme08JFUvWB0TZipJdbpfMYGD9FTF65T9jHGWgywDJ35
 62jYSeH24B6TsQYzzyPoMtOUU/+jy19q8dUKnuBcDwP58DtbT0E+nteGCyk+itn5UUEw
 i1dgteo8ItgB1rR8GocpPOp1lvwRHo7mnhz65AsOP9KIkI1SQXgKENawbxb4OLN3tsZY
 23hxXeyYYkDIsdBBo5w+PZAnQQELVezz2ZeQJlkz+7Docnjhk1Xg0S628JvYOEGCvf31
 hYGztnnhHvan3PmbCDmiwTcBxCbYavjqtscLjoiVEiKoV6VCEX/lNECecAs1G0DZYV41
 +pAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtzoV39TX7DWgHbHF2lbxkhVj5qIo9vWtSX5pyJM8mm9U/y9fp5dBARkbQrkRI3Gkf8GrGQAhBXLA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWItEpwC+N880r+LhNg7S3n7AKmJF6gO0TgoVmVVLDOsVNh4LC
 O5b9+ngKr/2nnNoV+piJ0iAp0KpA6YHTh4hERwUr4S/eehIKQuHb//IKbWAb9IEBYtLHrqcSXuH
 /9xAWN3JoYe74lKAChw==
X-Received: from wmjf25.prod.google.com ([2002:a7b:cd19:0:b0:480:4a03:7b5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8a:b0:480:1dc6:269c with SMTP id
 5b1f17b1804b1-48320231241mr195023655e9.37.1770730009431; 
 Tue, 10 Feb 2026 05:26:49 -0800 (PST)
Date: Tue, 10 Feb 2026 13:26:48 +0000
In-Reply-To: <20260210134913.33cb674f@fedora>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
Message-ID: <aYsyGAwy4rq-H7Hd@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 2F5DD11B337
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > /// The owner of this value must ensure that this fence is signalled.
> > struct MustBeSignalled<'fence> { ... }
> > /// Proof value indicating that the fence has either already been
> > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > /// up the proof value.
> > struct WillBeSignalled<'fence> { ... }
> 
> Sorry, I have more questions, unfortunately. Seems that
> {Must,Will}BeSignalled are targeting specific fences (at least that's
> what the doc and 'fence lifetime says), but in practice, the WorkItem
> backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> met, and N > 1 if more than one job is ready). Similarly, an IRQ
> handler can signal 0-N fences (can be that the IRQ has nothing to do we
> job completion, or, it can be that multiple jobs have completed). How
> is this MustBeSignalled object going to be instantiated in practice if
> it's done before the DmaFenceWorkItem::run() function is called?

The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
that ensures a specific fence is signalled. If you have code that
manages a collection of fences and invokes code for specific fences
depending on outside conditions, then that's a different matter.

After all, transfer_to_wq() has two components:
1. Logic to ensure any spawned workqueue job eventually gets to run.
2. Once the individual job runs, logic specific to the one fence ensures
   that this one fence gets signalled.
And {Must,Will}BeSignalled exists to help model part (2.). But what you
described with the IRQ callback falls into (1.) instead, which is
outside the scope of {Must,Will}BeSignalled (or at least requires more
complex APIs).

Alice
