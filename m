Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMQ7ON9Dk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:20:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B158146098
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0A10E3BE;
	Mon, 16 Feb 2026 16:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="B4yPlamJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED3E10E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771258836; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EoEA20ToSh90rrByLbaVgbOnKe+vEJ0RThTX6JqduT5AO3hy2JyBGr9D6w/xVcPJ7URpBTGYGuMIxhTikLXQMb3qszqWh7udW9kaXxh0zX8tf7GS8LtU13Lpbi8tJbn24zTYJnJemgN/SqPCmoZuX6HgupgypR3i2h9ByvYINFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771258836;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=P2xroIIh/DM8tp91K7Cib803UTQjy6CguhTIfspWUfA=; 
 b=D1XD9NtKD25rF9gPU4Wr/fHjv8QyUAH8qxy6Puu4DcnZktp47eDgNuIbsl8noQIcf8EOWYfMFWbfbvmllcjdMTBk/+xy/rRVD0k5zQGp9tdKohLiLTQJlRbiUOsmrNXo9P2ARIPCU+srr+bckTLOIXn3PYXHXXFVOPmzhTenhgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771258836; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=P2xroIIh/DM8tp91K7Cib803UTQjy6CguhTIfspWUfA=;
 b=B4yPlamJ5+1HyYDPaa6uwLf2neNGAu6aFaS9rDnfCGuisxQNe2fhTxKqZ9Ld5jK3
 15eze8M7E5OHl5OvhInW0Gkwm+St8sO54VkBCSdQ1qdvpz3qEC9Elr7Mcq8FARtiNQF
 V19QgC2spoFTng33AlWrFCRbaLNKz9di+KaFKRhI=
Received: by mx.zohomail.com with SMTPS id 1771258835129346.09214209574554;
 Mon, 16 Feb 2026 08:20:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
Date: Mon, 16 Feb 2026 13:20:15 -0300
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3B158146098
X-Rspamd-Action: no action



> On 4 Feb 2026, at 17:40, Daniel Almeida <daniel.almeida@collabora.com> =
wrote:
>=20
> This series adds ARef<T> support for both regular and delayed work =
items.=20
>=20
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device =
that
>  dispatches the calls to the underlying T::Data.
>=20
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler =
OOM
> (out of memory) events. The current series sets the stage so that the =
above
> is possible in the future.
>=20
> This is currently based on v6.19-rc8. I hope we can land all four =
commits
> on a single tree, but otherwise let me know whether I should split the
> workqueue.rs changes from the drm::Device ones and rebase accordingly.
>=20
> ---
> Changes in v2:
> - Rebased on v6.19-rc8
> - Cc workqueue maintainers
> - Patch 2 kept the old import style, since drm/device.rs is not yet
>  converted.
> - Link to v1: =
https://lore.kernel.org/r/20260115-aref-workitem-v1-0-9883e00f0509@collabo=
ra.com
>=20
> ---
> Daniel Almeida (4):
>      rust: workqueue: add support for ARef<T>
>      rust: drm: dispatch work items to the private data
>      rust: workqueue: add delayed work support for ARef<T>
>      rust: drm: dispatch delayed work items to the private data
>=20
> rust/kernel/drm/device.rs | 66 ++++++++++++++++++++++++++++++--
> rust/kernel/workqueue.rs  | 96 =
++++++++++++++++++++++++++++++++++++++++++++---
> 2 files changed, 152 insertions(+), 10 deletions(-)
> ---
> base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
> change-id: 20260115-aref-workitem-0f57e4fb81ca
>=20
> Best regards,
> --=20
> Daniel Almeida <daniel.almeida@collabora.com>
>=20

Friendly ping for the workqueue maintainers here: any comments?=20

=E2=80=94 Daniel

