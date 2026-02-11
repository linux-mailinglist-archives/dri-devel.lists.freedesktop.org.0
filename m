Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKXmOT2ejGmPrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:20:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68708125913
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F1D10E617;
	Wed, 11 Feb 2026 15:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xTgqHzd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B4610E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:20:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fB2Dh5Zxpz9tWy;
 Wed, 11 Feb 2026 16:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770823220; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTgGY5t1tiQEA3xRP/E1qDqaOY/RX6s7WBtA9FHnE8Q=;
 b=xTgqHzd86l1fBq/XvQwSfMQlEy9l0E9lu+hFuJ0jbjZBNiC2NI6rjUvJJg1nNQCULxkTuP
 KpUroTCYkS4Cw1iZvayvqar2v4Xn/nMNnd7NIn2JUm+0dV5inkAUoqKqidvTRX9QkceKGc
 cZ/W3EEg4gHZ7pttpyrj2YdxQDRyOCXRdKZivZ4xb0EuBKjZXQx2ph9Bp8N0nwJYrRsP9O
 bfforcbFFNVZbNbx+bQhu6ivoq/QpguKy1Ch6Sy7++j9arxi+nl9Qae08LYKHryEdM23p/
 l+t2RKEfpA9QsFkEky8JZRBBz7ewEW3ZNMmtlXePusKgK6Ov9waO1szXrM2mxA==
Message-ID: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
To: Alice Ryhl <aliceryhl@google.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, phasta@kernel.org, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 16:20:15 +0100
In-Reply-To: <aYydpYzd4AzFoAvZ@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: hewsc3qaktj8f5da83wnbcajyab1kp5d
X-MBO-RS-ID: e7f4940d33158900651
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:gary@garyguo.net,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,gmail.com,ffwll.ch,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 68708125913
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> >=20
> > Back to this particular job dependencies use case: we have to embed the
> > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > because DmaFences can be inserted in multiple of those lists in
> > parallel.
>=20
> Okay, if that's the case, then the linked list is *really* not the right
> tool for the job.

We have to distinguish what we are talking about here.

For the JobQueue, it takes over a cloned DmaFence and stuffs that into
its own list. Problem solved.

Whether the driver has other clones of that fence in other list is not
relevant because it's not the same list head.

JQ's lists and list heads are internal.

I don't see a problem.

P.
