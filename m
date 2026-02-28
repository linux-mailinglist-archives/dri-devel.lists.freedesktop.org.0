Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF+pHPg1omnR0wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:25:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE721BF68E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B6410E1DE;
	Sat, 28 Feb 2026 00:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="MFAuuNks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0CF10E1DE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772238320; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bhhgXAF8V1WoQuOwX2H4vC8T8a8L3JGzwuKnJQXTlDuw+us5o4OO/uuML1Ymp0adl5hvOOjzTD5ESyFjfd4+EjHvz+uSBJqV6XBAF5dhsLROn2iU4YrIlqk9iThMn9tG4qk5N+UOlILsKlHToo84L+38ClkUBs6FRff7IMfDx20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772238320;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/i4JmFWWBGtBpJWER42p/GsHdmwAspiRu1spi2tk5RY=; 
 b=BapHsID05Jhl5qW0n8Rf1NQAtuo7FoHvaZNgEOL5wzuKaw9bEvn9IVclm2Vusd1S77UdzZsI1fqkehNcW1AUe1FX93qmtOUikXYZkW1KTZe2WomCcPHCzs4welj3nnLQO+pV76V+FjUqXlEuJ3/x5ihvLt49u+LP0Tj/Xv2kRoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772238320; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=/i4JmFWWBGtBpJWER42p/GsHdmwAspiRu1spi2tk5RY=;
 b=MFAuuNksrVad0UnNBxXsmMSHgvwnw5BI9XNwldDeDNO6U8EMght3S46be4ulMzKJ
 KsjwfzFMI3/27bIc8eLCash0hfp8rRPWn5YKzwBn8Hq+yN7dZlWmEzwGYnW+D1vFY7M
 MbasZvMay2B5GNxMusa1cLtbtvpUrrQNm47UmulM=
Received: by mx.zohomail.com with SMTPS id 1772238318683515.6993453788301;
 Fri, 27 Feb 2026 16:25:18 -0800 (PST)
Date: Fri, 27 Feb 2026 16:25:18 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <aaI17jMbTDettC8L@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212111113.68778819@fedora>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,slot.rs:url]
X-Rspamd-Queue-Id: CBE721BF68E
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:08 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Introduce a generic slot manager to dynamically allocate limited hardware
> > slots to software "seats". It can be used for both address space (AS) and
> > command stream group (CSG) slots.
> > 
> > The slot manager initially assigns seats to its free slots. It then
> > continues to reuse the same slot for a seat, as long as another seat
> > did not start to use the slot in the interim.
> > 
> > When contention arises because all of the slots are allocated, the slot
> > manager will lazily evict and reuse slots that have become idle (if any).
> > 
> > The seat state is protected using the LockedBy pattern with the same lock
> > that guards the SlotManager. This ensures the seat state stays consistent
> > across slot operations.
> > 
> > Hardware specific behaviour can be customized using the slot manager's
> > `SlotOperations` trait.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/slot.rs | 359 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tyr/tyr.rs  |   1 +
> >  2 files changed, 360 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tyr/slot.rs
> > 
> > diff --git a/drivers/gpu/drm/tyr/slot.rs b/drivers/gpu/drm/tyr/slot.rs
> > new file mode 100644
> > index 000000000000..37bf8800a225
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/slot.rs
> > @@ -0,0 +1,359 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! Slot management abstraction for limited hardware resources.
> > +//!
> > +//! This module provides a generic [`SlotManager`] that assigns limited hardware
> > +//! slots to logical "seats". A seat represents an entity (such as a vm address
> > +//! space) that needs access to a hardware slot.
> > +//!
> > +//! The [`SlotManager`] tracks slot allocation using sequence numbers to detect
> > +//! when a seat's binding has been invalidated. When a seat requests activation,
> > +//! the manager will either reuse the seat's existing slot (if still valid),
> > +//! allocate a free slot (if any are available), or evict the oldest idle slot if any
> > +//! slots are idle.
> > +//!
> > +//! Hardware-specific behavior is customized by implementing the [`SlotOperations`]
> > +//! trait, which allows callbacks when slots are activated or evicted.
> > +//!
> > +//! This is primarily used for managing address space slots in the GPU, where
> > +//! the number of hardware address space slots is limited.
> 
> I'd probably mention that we intend to use it for other stuff (Csg
> slots), hence the generalization done here.

Ack.

> 
> > +//!
> > +//! [SlotOperations]: crate::slot::SlotOperations
> > +//! [SlotManager]: crate::slot::SlotManager
> 
> Thanks a lot for adding some docs to my barebone initial implementation
> and fixing the stuff I got wrong along the way. :D
> 
> > +#![allow(dead_code)]
> > +
> > +use core::{
> > +    mem::take,
> > +    ops::{
> > +        Deref,
> > +        DerefMut, //
> > +    }, //
> > +};
> > +
> > +use kernel::{
> > +    prelude::*,
> > +    sync::LockedBy, //
> > +};
> > +
> 
> Don't know what the doc rules are in rust, but for this sort of generic
> layer, maybe we should provide extensive docs around objects, fields
> and public functions. I see that most struct fields are documented, but
> not the struct themselves. the enum doesn't seem to be documented, and
> some of the public functions are not either. And that's all my fault,
> because I gave you this raw piece of code without much doc (you added a
> lot already). Just saying that, maybe now that things have settled
> down, is a good time to add proper doc where it's missing.

Ok i've got extensive documentation for this now and the whole rest of this
series and will include it in v2.

> 
> 
> /// Seat information.
> ///
> /// This can't be accessed directly by the element embedding a `Seat`,
> /// but is used by the generic slot manager logic to control residency
> /// of a certain object on a hardware slot.
> > +pub(crate) struct SeatInfo {
> > +    /// Slot used by this seat.
>        ///
>        /// This index is only valid if the slot pointed by this index
>        /// has its `SlotInfo::seqno` match SeatInfo::seqno. Otherwise,
>        /// it means the object has been evicted from the hardware slot,
>        /// and a new slot needs to be acquired to make this object
>        /// resident again.
> > +    slot: u8,
> > +
> > +    /// Sequence number encoding the last time this seat was active.
> > +    /// We also use it to check if a slot is still bound to a seat.
> > +    seqno: u64,
> > +}
> > +
> 
> /// Seat state
> ///
> /// This is meant to be embedded in the object that wants to acquire
> /// hardware slots. It also starts in the `Seat::NoSeat` state, and
> /// the slot manager will change the object value when an active/evict
> /// request to is issued. 
> > +#[derive(Default)]
> > +pub(crate) enum Seat {
> > +    #[expect(clippy::enum_variant_names)]
>        /// Resource is not resident.
>        ///
>        /// All objects start with a seat in that state. The seat also
>        /// gets back to that state if the user requests eviction. It
>        /// can also end up in that state next time an operation is done
>        /// on an `Seat::Idle` seat and the slot managers finds out this
>        /// object has been evicted from the slot.
> > +    #[default]
> > +    NoSeat,
> 
>        /// Resource is actively used and resident.
>        ///
>        /// When a seat is in that state, it can't be evicted, and the
>        /// slot pointed by `SlotInfo::slot` is guaranteed to be reserved
>        /// for this object as long as the seat stays active.
> > +    Active(SeatInfo),
> 
>        /// Resource is idle and might or might not be resident.
>        ///
>        /// When a seat is in that state, we can't know for sure if the
>        /// object is resident or evicted until the next request we issue
>        /// to the slot manager. This tells the slot manager it can
>        /// reclaim the underlying slot if needed.
>        /// In order for the hardware to use this object again, the seat
>        /// needs to be turned into an `Seat::Active` state again
>        /// with a `SlotManager::activate()` call.
> > +    Idle(SeatInfo),
> > +}
> > +
> > +impl Seat {
>        /// Get the slot index this seat is pointing to.
>        ///
>        /// If the seat is not `Seat::Active` we can't trust the
>        /// `SeatInfo`. In that case `None` is returned, otherwise
>        /// `Some(SeatInfo::slot)` is returned.
> > +    pub(super) fn slot(&self) -> Option<u8> {
> > +        match self {
> > +            Self::Active(info) => Some(info.slot),
> > +            _ => None,
> > +        }
> > +    }
> > +}
> > +
> 
> /// Trait describing the slot-related operations.
> > +pub(crate) trait SlotOperations {
> > +    type SlotData;
> > +
> > +    /// Called when a slot is being activated for a seat.
> > +    ///
> > +    /// This callback allows hardware-specific actions to be performed when a slot
> > +    /// becomes active, such as updating hardware registers or invalidating caches.
> > +    fn activate(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> > +        Ok(())
> > +    }
> > +
> > +    /// Called when a slot is being evicted and freed.
> > +    ///
> > +    /// This callback allows hardware-specific cleanup when a slot is being
> > +    /// completely freed, either explicitly or when an idle slot is being
> > +    /// reused for a different seat. Any hardware state should be invalidated.
> > +    fn evict(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> > +        Ok(())
> > +    }
> > +}
> > +
> 
> /// Data attached to a slot.
> > +struct SlotInfo<T> {
> > +    /// Type specific data attached to a slot
> > +    slot_data: T,
> > +
> > +    /// Sequence number from when this slot was last activated
> > +    seqno: u64,
> > +}
> > +
> 
> /// Slot state.
> > +#[derive(Default)]
> > +enum Slot<T> {
>     /// Slot is free.
>     ///
>     /// All slots start in this state when the slot manager is created.
> > +    #[default]
> > +    Free,
> 
>     /// Slot is active.
>     ///
>     /// When is that state, the slot is guaranteed to stay active
>     /// for as long as the resource bound to it has its seat in the
>     /// `Seat::Active` state. No new resource can be bound to it.
> > +    Active(SlotInfo<T>),
> 
>     /// Slot is idle.
>     ///
>     /// Happens when the underlying resource has been flagged
>     /// `Seat::Idle`. When in that state, the slot manager is allowed
>     /// to evict the resource and re-assign the slot to someone else.
>     /// This process involves updating the `SlotInfo::seqno` which
>     /// will be checked against the `SeatInfo::seqno` in case the idle
>     /// resource wants to become active again.
> > +    Idle(SlotInfo<T>),
> > +}
> > +
> 
> /// Generic slot manager object.
> ///
> /// It abstracts away all the churn around activeness/idleness tracking
> /// and let the implementer of the SlotOperations trait focus on how to
> /// make a resource active or evict it.
> > +pub(crate) struct SlotManager<T: SlotOperations, const MAX_SLOTS: usize> {
> > +    /// Manager specific data
> > +    manager: T,
> > +
> > +    /// Number of slots actually available
> > +    slot_count: usize,
> > +
> > +    /// Slots
> > +    slots: [Slot<T::SlotData>; MAX_SLOTS],
> > +
> > +    /// Sequence number incremented each time a Seat is successfully activated
> > +    use_seqno: u64,
> > +}
> > +
> > +// A `Seat` protected by the same lock that is used to wrap the `SlotManager`.
> 
> Should this be
> 
> /// A `Seat` ....
> 
> ?

I'll change it over to a document comment since it's an important point.

> 
> > +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
> 
> Do we really need to explicitly flag this type Unpin? I thought this
> was the default if the struct is not pinned (and it's not AFAICT).
> 

At some point we needed this to expressly impl Unpin, but now we don't,
so I've removed it in v2 and will otherwise rely on the default
behaviour for Unpin.

> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> SlotManager<T, MAX_SLOTS> {
>     /// Creates a new slot manager.
> > +    pub(crate) fn new(manager: T, slot_count: usize) -> Result<Self> {
> > +        if slot_count == 0 {
> > +            return Err(EINVAL);
> > +        }
> > +        if slot_count > MAX_SLOTS {
> > +            return Err(EINVAL);
> > +        }
> > +        Ok(Self {
> > +            manager,
> > +            slot_count,
> > +            slots: [const { Slot::Free }; MAX_SLOTS],
> > +            use_seqno: 1,
> > +        })
> > +    }
> > +
> > +    fn record_active_slot(
> > +        &mut self,
> > +        slot_idx: usize,
> > +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> > +        slot_data: T::SlotData,
> > +    ) -> Result {
> > +        let cur_seqno = self.use_seqno;
> > +
> > +        *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> > +            slot: slot_idx as u8,
> > +            seqno: cur_seqno,
> > +        });
> > +
> > +        self.slots[slot_idx] = Slot::Active(SlotInfo {
> > +            slot_data,
> > +            seqno: cur_seqno,
> > +        });
> > +
> > +        self.use_seqno += 1;
> > +        Ok(())
> > +    }
> > +
> > +    fn activate_slot(
> > +        &mut self,
> > +        slot_idx: usize,
> > +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> > +        slot_data: T::SlotData,
> > +    ) -> Result {
> > +        self.manager.activate(slot_idx, &slot_data)?;
> > +        self.record_active_slot(slot_idx, locked_seat, slot_data)
> > +    }
> > +
> > +    fn allocate_slot(
> > +        &mut self,
> > +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> > +        slot_data: T::SlotData,
> > +    ) -> Result {
> > +        let slots = &self.slots[..self.slot_count];
> > +
> > +        let mut idle_slot_idx = None;
> > +        let mut idle_slot_seqno: u64 = 0;
> > +
> > +        for (slot_idx, slot) in slots.iter().enumerate() {
> > +            match slot {
> > +                Slot::Free => {
> > +                    return self.activate_slot(slot_idx, locked_seat, slot_data);
> > +                }
> > +                Slot::Idle(slot_info) => {
> > +                    if idle_slot_idx.is_none() || slot_info.seqno < idle_slot_seqno {
> > +                        idle_slot_idx = Some(slot_idx);
> > +                        idle_slot_seqno = slot_info.seqno;
> > +                    }
> > +                }
> > +                Slot::Active(_) => (),
> > +            }
> > +        }
> > +
> > +        match idle_slot_idx {
> > +            Some(slot_idx) => {
> > +                // Lazily evict idle slot just before it is reused
> > +                if let Slot::Idle(slot_info) = &self.slots[slot_idx] {
> > +                    self.manager.evict(slot_idx, &slot_info.slot_data)?;
> > +                }
> > +                self.activate_slot(slot_idx, locked_seat, slot_data)
> > +            }
> > +            None => {
> > +                pr_err!(
> > +                    "Slot allocation failed: all {} slots in use\n",
> > +                    self.slot_count
> > +                );
> > +                Err(EBUSY)
> > +            }
> > +        }
> > +    }
> > +
> > +    fn idle_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> > +        let slot = take(&mut self.slots[slot_idx]);
> > +
> > +        if let Slot::Active(slot_info) = slot {
> > +            self.slots[slot_idx] = Slot::Idle(SlotInfo {
> > +                slot_data: slot_info.slot_data,
> > +                seqno: slot_info.seqno,
> > +            })
> > +        };
> > +
> > +        *locked_seat.access_mut(self) = match locked_seat.access(self) {
> > +            Seat::Active(seat_info) | Seat::Idle(seat_info) => Seat::Idle(SeatInfo {
> > +                slot: seat_info.slot,
> > +                seqno: seat_info.seqno,
> > +            }),
> > +            Seat::NoSeat => Seat::NoSeat,
> > +        };
> > +        Ok(())
> > +    }
> > +
> > +    fn evict_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> > +        match &self.slots[slot_idx] {
> > +            Slot::Active(slot_info) | Slot::Idle(slot_info) => {
> > +                self.manager.evict(slot_idx, &slot_info.slot_data)?;
> > +                take(&mut self.slots[slot_idx]);
> > +            }
> > +            _ => (),
> > +        }
> > +
> > +        *locked_seat.access_mut(self) = Seat::NoSeat;
> > +        Ok(())
> > +    }
> > +
> > +    // Checks and updates the seat state based on the slot it points to
> > +    // (if any). Returns a Seat with a value matching the slot state.
> > +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> > +        let new_seat = match locked_seat.access(self) {
> > +            Seat::Active(seat_info) => {
> > +                let old_slot_idx = seat_info.slot as usize;
> > +                let slot = &self.slots[old_slot_idx];
> > +
> > +                if kernel::warn_on!(
> > +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> > +                ) {
> > +                    Seat::NoSeat
> > +                } else {
> > +                    Seat::Active(SeatInfo {
> > +                        slot: seat_info.slot,
> > +                        seqno: seat_info.seqno,
> > +                    })
> > +                }
> > +            }
> > +
> > +            Seat::Idle(seat_info) => {
> > +                let old_slot_idx = seat_info.slot as usize;
> > +                let slot = &self.slots[old_slot_idx];
> > +
> > +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> > +                    Seat::NoSeat
> > +                } else {
> > +                    Seat::Idle(SeatInfo {
> > +                        slot: seat_info.slot,
> > +                        seqno: seat_info.seqno,
> > +                    })
> > +                }
> > +            }
> > +
> > +            _ => Seat::NoSeat,
> > +        };
> > +
> > +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> > +        // so that only slot.rs can change the seat state, but there might be better solutions
> > +        // to prevent that.
> 
> Okay, I guess we want some inputs from Daniel and/or Alice on that one.
> 
> > +        match &new_seat {
> > +            Seat::Active(seat_info) => {
> > +                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> > +                    slot: seat_info.slot,
> > +                    seqno: seat_info.seqno,
> > +                })
> > +            }
> > +            Seat::Idle(seat_info) => {
> > +                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> > +                    slot: seat_info.slot,
> > +                    seqno: seat_info.seqno,
> > +                })
> > +            }
> > +            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> > +        }
> > +
> > +        new_seat
> > +    }
> > +
> 
>     /// Make a resource active on any available/reclaimable slot.
>     ///
>     /// Will return an error if no slot is available/reclaimable, or if
>     /// the reclaim failed.
> > +    pub(crate) fn activate(
> > +        &mut self,
> > +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> > +        slot_data: T::SlotData,
> > +    ) -> Result {
> > +        let seat = self.check_seat(locked_seat);
> > +        match seat {
> > +            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
> > +                // With lazy eviction, if seqno matches, the hardware state is still
> > +                // valid for both Active and Idle slots, so just update our records
> > +                self.record_active_slot(seat_info.slot as usize, locked_seat, slot_data)
> > +            }
> > +            _ => self.allocate_slot(locked_seat, slot_data),
> > +        }
> > +    }
> > +
>     /// Flag a resource idle.
>     ///
>     /// The slot manager can decide to reclaim the slot this resource
>     /// was bound to at any point after function returns.
> > +    // The idle() method will be used when we start adding support for user VMs
> > +    #[expect(dead_code)]
> > +    pub(crate) fn idle(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> > +        let seat = self.check_seat(locked_seat);
> > +        if let Seat::Active(seat_info) = seat {
> > +            self.idle_slot(seat_info.slot as usize, locked_seat)?;
> > +        }
> > +        Ok(())
> > +    }
> > +
> > +    /// Evict a seat from its slot, freeing up the hardware resource.
> 
> I think I'd go:
> 
>     /// Evict a resource from its slot, and make this slot free again
>     /// for other users.
> 
> > +    pub(crate) fn evict(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> > +        let seat = self.check_seat(locked_seat);
> > +
> > +        match seat {
> > +            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
> > +                let slot_idx = seat_info.slot as usize;
> > +
> > +                self.evict_slot(slot_idx, locked_seat)?;
> > +            }
> > +            _ => (),
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> Deref for SlotManager<T, MAX_SLOTS> {
> > +    type Target = T;
> > +
> > +    fn deref(&self) -> &Self::Target {
> > +        &self.manager
> > +    }
> > +}
> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> DerefMut for SlotManager<T, MAX_SLOTS> {
> > +    fn deref_mut(&mut self) -> &mut Self::Target {
> > +        &mut self.manager
> > +    }
> > +}
> > diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> > index 6eaa2135fe07..f54b997355e0 100644
> > --- a/drivers/gpu/drm/tyr/tyr.rs
> > +++ b/drivers/gpu/drm/tyr/tyr.rs
> > @@ -12,6 +12,7 @@
> >  mod gem;
> >  mod gpu;
> >  mod regs;
> > +mod slot;
> >  
> >  kernel::module_platform_driver! {
> >      type: TyrPlatformDeviceData,
> 
