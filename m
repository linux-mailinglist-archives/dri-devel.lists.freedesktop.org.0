Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBOzGD7CiWmVBwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 12:17:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD910E949
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 12:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BF10E0AC;
	Mon,  9 Feb 2026 11:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VQRjsVLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B9C10E0AC;
 Mon,  9 Feb 2026 11:17:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A158444E9;
 Mon,  9 Feb 2026 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC116C6;
 Mon,  9 Feb 2026 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770635832;
 bh=rkjWDYmA+Gv4imCPiiPARsynkjj0DK/cDi4XGUpA6Ms=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=VQRjsVLjLWT1MrF1DBlVdjjWR6ga2Wp+NvD/EvTo8QihVuxkXVa0xYQXZQf5ntODl
 aI4IQ1KP67cTrRkYwbZmUHlQ/m8i3A/TsTB8dKV6p2eGJu1ydQ+pa8xuU9wjG8DPVs
 qsB1f6jk4rJJpmaNFylLSsuTQCBA4fUeJ2NRd/zuAbjH2gaU6wNtY/1Xgg4qIB9A2q
 ROQiA1j//1vQK6AUMjJGKB0oLZYMbIDmj0OvKXRu4iKk3EOR2B02yGBFL3Xp8zgDgX
 cz6pjeA2TdjFpA8Fobu8O7w30a4wcxDCL+oHMcpB/9I4mM/8buOxn7hQUo4rM9749S
 ATD+qcWiAUaJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 12:17:08 +0100
Message-Id: <DGAE0M87A8X8.3OWL23XSZF7I6@kernel.org>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>,
 "Benno Lossin" <lossin@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Janne Grunau" <j@jannau.net>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-7-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-7-lyude@redhat.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D6AD910E949
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 11:34 PM CET, Lyude Paul wrote:
> +/// Raw unsized representation of a `struct iosys_map`.
> +///
> +/// This struct is a transparent wrapper around `struct iosys_map`. The =
C API does not provide the
> +/// size of the mapping by default, and thus this type also does not inc=
lude the size of the
> +/// mapping. As such, it cannot be used for actually accessing the under=
lying data pointed to by the
> +/// mapping.
> +///
> +/// With the exception of kernel crates which may provide their own wrap=
pers around `RawIoSysMap`,
> +/// users will typically not interact with this type directly.
> +#[repr(transparent)]
> +pub struct RawIoSysMap<const SIZE: usize =3D 0>(bindings::iosys_map);

I'm still against using struct iosys_map as a common frontend for I/O memor=
y and
system memory.

Exposing this as another I/O backend instead of just having a Rust structur=
e as
frontend for a "real" abstraction around the Rust backends has various
downsides.

  (1) We are limited to the features of struct iosys_map. The corresponding=
 Rust
      backends may provide additional functionality, which we can't access =
with
      struct iosys_map. For instance, they Mmio will provide a relaxed() me=
thod
      providing access to a borrowed backend providing relaxed ordering
      accessors.

  (2) We loose out on the capability to consider compile time checks regard=
ing
      the guaranteed minimum size of the mapping. (To be fair this could be
      implemented on `IoSysMap` itself as well, but it would duplicate code=
 that
      we already have in the corresponding backends.)

  (3) You have to duplicate the safety requirements of the backends that st=
ruct
      iosys_map wraps. In fact, this series ignores that if the backend is =
I/O
      memory we have to guarantee the it is revoked when the device this I/=
O
      memory originates from is unbound.

Having a look at patch 7, it should be possible to read `is_iomem` and `vad=
dr` /
`vaddr_iomem` from the struct iosys_map and just construct the "real" `Mmio=
`
backend from it. We also have to create a backend for normal system memory,=
 but
that should be trivial. :)
