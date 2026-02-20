Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJq/ABB9mGkdJQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:26:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9F168E47
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45B110E362;
	Fri, 20 Feb 2026 15:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DTDEv1Ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641C710E80D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 15:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771601160; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gruBr0a1CgF0aNEwBg8xaERZ3J+UvT2lILruIGD3ZraHO9LoP4J7mPpAjZKtnrHGEjDp0HhZGxV8NNjxLCu8NwaPFh6HM5HC7GFhMp1Jnka6C2b19tCIkyVEEEuR9WBObQS+SYptcvJKttCr7E4g1Ny7QTR6AfIurfRO6nYdo5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771601160;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=znzzeceeUQqCmKR8RB/TELJEuA4gFruXjGydO8WO/+g=; 
 b=VIKddxrcuFvuBVXhTDLkLOo2nFharCa4fNHSjSRyj2eiLI7bxUVtSauGK6nxaJQQs5AoYJz1kIBslP68Rr3bQlHDpo1LKxtOT141beP7us2uZBZQJgh6bna2oojAFhW51jIwj6lVw9Sc0orwx1KUIVtbq1+y36XvWoEw57oAYPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771601160; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=znzzeceeUQqCmKR8RB/TELJEuA4gFruXjGydO8WO/+g=;
 b=DTDEv1EcBoimwh3EadM9Ef7MuI2cx/4+czGurGEQ/utLs3qkS0SH2xsrTrGNqr7y
 Vyjij/2Re63mBMgcaOxqPHfw3mehRWgBo3KIMhweDUIhUREghmPjnYy5jdg5HkgS5lU
 5BkoxlNK4Y7WzcqCrelwUiQ07AQ7MQTB/yEIboos=
Received: by mx.zohomail.com with SMTPS id 1771601158815941.7198006495784;
 Fri, 20 Feb 2026 07:25:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212111113.68778819@fedora>
Date: Fri, 20 Feb 2026 12:25:43 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[slot.rs:url]
X-Rspamd-Queue-Id: 56C9F168E47
X-Rspamd-Action: no action



> On 12 Feb 2026, at 07:11, Boris Brezillon =
<boris.brezillon@collabora.com> wrote:
>=20
>=20
>> +type LockedSeat<T, const MAX_SLOTS: usize> =3D LockedBy<Seat, =
SlotManager<T, MAX_SLOTS>>;
>> +
>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for =
SlotManager<T, MAX_SLOTS> {}
>=20
> Do we really need to explicitly flag this type Unpin? I thought this
> was the default if the struct is not pinned (and it's not AFAICT).

We don=E2=80=99t.

Note that =E2=80=9CUnpin=E2=80=9D and =E2=80=9Cnot pinned=E2=80=9D are =
distinct concepts. Unpin
means, in more informal terms,  =E2=80=9Cthis type does not care if it =
is
moved=E2=80=9D, but it does not preclude you from putting it into Pin<T> =
or
kernel::sync::Arc<T>. If by =E2=80=9Cnot pinned=E2=80=9D you mean no =
#[pin_data] or
#[pin], then also note that deriving this macro is distinct from "being
pinned".

The relevant rule here is that a type is Unpin if all its fields are =
Unpin.
This is the case for all non-generic types in SlotManager, so it is =
Unpin as
long as the generic types T and T::SlotData are also Unpin.


>> +
>> +    // Checks and updates the seat state based on the slot it points =
to
>> +    // (if any). Returns a Seat with a value matching the slot =
state.
>> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) =
-> Seat {
>> +        let new_seat =3D match locked_seat.access(self) {
>> +            Seat::Active(seat_info) =3D> {
>> +                let old_slot_idx =3D seat_info.slot as usize;
>> +                let slot =3D &self.slots[old_slot_idx];
>> +
>> +                if kernel::warn_on!(
>> +                    !matches!(slot, Slot::Active(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno)
>> +                ) {
>> +                    Seat::NoSeat
>> +                } else {
>> +                    Seat::Active(SeatInfo {
>> +                        slot: seat_info.slot,
>> +                        seqno: seat_info.seqno,
>> +                    })
>> +                }
>> +            }
>> +
>> +            Seat::Idle(seat_info) =3D> {
>> +                let old_slot_idx =3D seat_info.slot as usize;
>> +                let slot =3D &self.slots[old_slot_idx];
>> +
>> +                if !matches!(slot, Slot::Idle(slot_info) if =
slot_info.seqno =3D=3D seat_info.seqno) {
>> +                    Seat::NoSeat
>> +                } else {
>> +                    Seat::Idle(SeatInfo {
>> +                        slot: seat_info.slot,
>> +                        seqno: seat_info.seqno,
>> +                    })
>> +                }
>> +            }
>> +
>> +            _ =3D> Seat::NoSeat,
>> +        };
>> +
>> +        // FIXME: Annoying manual copy. The original idea was to not =
add Copy+Clone to SeatInfo,
>> +        // so that only slot.rs can change the seat state, but there =
might be better solutions
>> +        // to prevent that.
>=20
> Okay, I guess we want some inputs from Daniel and/or Alice on that =
one.

Hm, I'd say we shouldn't implement Clone to avoid any possibility of =
holding on
to stale state by duplicating it.

Why do we need to return Seat from this function? Can't we simply write
locked_seat in place and not return anything?

>=20
>> +        match &new_seat {
>> +            Seat::Active(seat_info) =3D> {
>> +                *locked_seat.access_mut(self) =3D =
Seat::Active(SeatInfo {
>> +                    slot: seat_info.slot,
>> +                    seqno: seat_info.seqno,
>> +                })
>> +            }
>> +            Seat::Idle(seat_info) =3D> {
>> +                *locked_seat.access_mut(self) =3D =
Seat::Idle(SeatInfo {
>> +                    slot: seat_info.slot,
>> +                    seqno: seat_info.seqno,
>> +                })
>> +            }
>> +            _ =3D> *locked_seat.access_mut(self) =3D Seat::NoSeat,
>> +        }
>> +
>> +        new_seat
>> +    }
>> +

