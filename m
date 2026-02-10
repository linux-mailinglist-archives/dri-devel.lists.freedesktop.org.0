Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLgMECYZi2ljPgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:40:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C59F11A56C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 12:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8454E10E558;
	Tue, 10 Feb 2026 11:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ylOlWMUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992ED10E558
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:40:17 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-435ab907109so4070532f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 03:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770723616; x=1771328416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=BL/Brk5QbdNFqoBa7MV+E1OKdJabyWc32ZkmSjvJq90=;
 b=ylOlWMUbpSBbA7H6QJ4uPxy9Z30nG8GZzSj+IiLoc4el34cqH9rW7Nt8ZcitYyZTVE
 Rjm35xrsPc/Xfti2lK7w0psEs1QlVcZ4BGykXDPDg1ZZcERrli/fS96UTD7PiVQK/lp/
 6grOrQ3wTgSN127dwHGVP7Ue2frZOjalZqUGyiJh6JF4aYb1tO3cXlgDnNWEsvNyYTIX
 V59bKVYkhtEXTrQI6/0rNwW/WatHBdwzFjmLGqGxwE9m5VKuoBUY50YqmbFtZd6hgoo9
 vWzYKJW9tQfOHXynUBpy6k1zWepn6ySpukqEdd8p01P5hXsd/ocLQPssCof2T7/cuM5i
 4A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770723616; x=1771328416;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BL/Brk5QbdNFqoBa7MV+E1OKdJabyWc32ZkmSjvJq90=;
 b=SzsOPNAhOZjEjQi8/w3WPiqvlRdbCgUeZQ9JFFzwQtIgmTIHHqHA0uZl5YaKMtrPQK
 NDNeRjmf7FVDPGgfVANo0nfyb3r7/EC59/v8p2GEygQXsoj8Y2LWRWSkqAT/cUvPvikC
 XuiwsHB9kTC6j86NAh4y0g5FECjtzOU+7v066l2vBM1MHbJuvmlhmuSPfYEr/U3JmRSk
 Y78n7g9kVgLbfpCFh3Xhhn0f3HCrVrGPldtppTpjcfNp+8EnOm5uv3+t31ai//HahKHZ
 vTWCmcddzYJrARfI70qkH97GkNTbL+DFx/ygDQqJ59xvsoeskmb4ASojTaQgOn7XO2E5
 4M7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5YBEIbmUE4xhS6/vVlmpwcnE7pUyry0itHRxnydUiM8vDvjo03uRlvLFzh2OoOvAtM9oxmGR8r2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHozrwPuoKzVHhdWUhh10T7ufVNlzh+TPPN1+JRva8KUcyfP9F
 RWD3Y3L6SjuHSzSEGvzLVTwdOCxRznNmTAWf00kffy32qc7hTaYyEUXQgSMjw4U+dkOOdtYXTTa
 lNxw1fUVfWu5tTQJc2w==
X-Received: from wrbee12.prod.google.com
 ([2002:a05:6000:210c:b0:436:24d0:695f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2507:b0:436:1872:63d0 with SMTP id
 ffacd0b85a97d-43629651e21mr19897651f8f.2.1770723616117; 
 Tue, 10 Feb 2026 03:40:16 -0800 (PST)
Date: Tue, 10 Feb 2026 11:40:14 +0000
In-Reply-To: <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
Mime-Version: 1.0
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
Message-ID: <aYsZHhX2IVO2kOSm@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,mailbox.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 8C59F11A56C
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 11:36, Danilo Krummrich wrote:
> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
> >> One way you can see this is by looking at what we require of the
> >> workqueue. For all this to work, it's pretty important that we never
> >> schedule anything on the workqueue that's not signalling safe, since
> >> otherwise you could have a deadlock where the workqueue is executes so=
me
> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
> >> meaning that the VM_BIND job never gets scheduled since the workqueue
> >> is never freed up. Deadlock.
> >=20
> > Yes, I also pointed this out multiple times in the past in the context =
of C GPU
> > scheduler discussions. It really depends on the workqueue and how it is=
 used.
> >=20
> > In the C GPU scheduler the driver can pass its own workqueue to the sch=
eduler,
> > which means that the driver has to ensure that at least one out of the
> > wq->max_active works is free for the scheduler to make progress on the
> > scheduler's run and free job work.
> >=20
> > Or in other words, there must be no more than wq->max_active - 1 works =
that
> > execute code violating the DMA fence signalling rules.

Ouch, is that really the best way to do that? Why not two workqueues?

> *And* the workqueue must be created with WQ_MEM_RECLAIM so that work
> items can also start under memory pressure and not potentially cycle
> back into the memory management to wait for a dma_fence to signal.
>=20
> But apart from that your explanation is perfectly correct, yes.

Ah, interesting point.

Alice
