Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Pzg5NdmomWnQVwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 13:45:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9416CD74
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 13:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2310E00B;
	Sat, 21 Feb 2026 12:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MZonnIEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF5210E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 12:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771677901; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TWCeSHaXdySiDmuEfkC9Nrq/aGKv07Io2tkF6PEotPZMBJ1Ph6dA/xgkAZCNQgXJXWVc9KFxBNtQ7mNm8lioUzZQ3Q+NegirvpVjeM+fAbP8TkEUrsw70cFffBZz7z39k+VCUk80USOViZ6fS+qaaQukV2AcO9BcwXByoE7H+BU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771677901;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SgXlv7TllpBaP/d9E1ESGvy7DB77p/4obwqFzCoHZVU=; 
 b=kbRWPulYQnp1HWHCw9awO7r+F7fAz/ipNKJeLcK2+lQz3nDzvkP/03TcMt6Qhgk0Y33ju156DTeoQ39J+wbhpT5WInoi5WbTvXT/RINVHTy0RF7l1AfEGqc7VEva9ZDSFGHLs2DtczydvYCe0gCkPJ5kQdWu0UmyHRwyXiEU5/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771677901; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
 bh=SgXlv7TllpBaP/d9E1ESGvy7DB77p/4obwqFzCoHZVU=;
 b=MZonnIEQifgCPInkwSGPInoI5m5T3mxwfkrmsGh32w2KWgpeEopO049xeT5vuvtq
 oS/c1nnFKGzDNhj4yq8MA34gUNBBJJMz5YbdBHanvFIbSBJPHCPNAUxhqTW9ong4BZq
 BrX5ujlXMkkpsyJHws089d5Ev+n7foktFp0BjQI8=
Received: by mx.zohomail.com with SMTPS id 1771677899641129.55273493234313;
 Sat, 21 Feb 2026 04:44:59 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Date: Sat, 21 Feb 2026 09:44:45 -0300
Message-Id: <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
References: <aZmUJxyZM3taMvAC@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 beata.michalska@arm.com, lyude@redhat.com
In-Reply-To: <aZmUJxyZM3taMvAC@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: iPhone Mail (23D127)
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:beata.michalska@arm.com,m:lyude@redhat.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 28E9416CD74
X-Rspamd-Action: no action



> On 21 Feb 2026, at 08:17, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> =EF=BB=BFOn Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
>>> On Wed, 11 Feb 2026 17:37:08 -0800
>>> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
>>>=20
>>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>>=20
>>> Introduce a generic slot manager to dynamically allocate limited hardwar=
e
>>> slots to software "seats". It can be used for both address space (AS) an=
d
>>> command stream group (CSG) slots.
>>>=20
>>> The slot manager initially assigns seats to its free slots. It then
>>> continues to reuse the same slot for a seat, as long as another seat
>>> did not start to use the slot in the interim.
>>>=20
>>> When contention arises because all of the slots are allocated, the slot
>>> manager will lazily evict and reuse slots that have become idle (if any)=
.
>>>=20
>>> The seat state is protected using the LockedBy pattern with the same loc=
k
>>> that guards the SlotManager. This ensures the seat state stays consisten=
t
>>> across slot operations.
>>>=20
>>> Hardware specific behaviour can be customized using the slot manager's
>>> `SlotOperations` trait.
>>>=20
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>>> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>=20
>=20
>>> +type LockedSeat<T, const MAX_SLOTS: usize> =3D LockedBy<Seat, SlotManag=
er<T, MAX_SLOTS>>;
>>> +
>>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T=
, MAX_SLOTS> {}
>>=20
>> Do we really need to explicitly flag this type Unpin? I thought this
>> was the default if the struct is not pinned (and it's not AFAICT).
>=20
> It may be cleaner to add `#[pin_data]` to the struct and rely on the
> Unpin impl it generates.
>=20
> In general, the default Unpin implementation is to inherit from the
> fields. When you add #[pin_data], it's changed to only inherit from
> fields marked #[pin]. By adding #[pin_data] but not marking any fields
> #[pin], it will be Unpin unless any of the zero fields marked #[pin] are
> Unpin, i.e. it will always be Unpin.

Why do we need this if all fields are Unpin?

>=20
>>> +        // FIXME: Annoying manual copy. The original idea was to not ad=
d Copy+Clone to SeatInfo,
>>> +        // so that only slot.rs can change the seat state, but there mi=
ght be better solutions
>>> +        // to prevent that.
>>=20
>> Okay, I guess we want some inputs from Daniel and/or Alice on that one.
>=20
> You could consider only implementing Clone. That way, copies do not
> happen unless you do so explicitly. Or add a private method on the type
> that has the same function as Clone if you do not wish to expose it.
>=20
> Alice


Please check my solution where clone is not needed.

=E2=80=94 Daniel=

