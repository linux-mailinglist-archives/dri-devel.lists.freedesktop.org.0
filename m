Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMn6GUynjWkK5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:11:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7B12C4B7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EFB10E71E;
	Thu, 12 Feb 2026 10:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QR4Q5cXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AC310E71C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770891078;
 bh=VprCGkuFxTOByIMTnEJQf/qSW/TfAt3oIFF+fOrLCKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QR4Q5cXm+3vjKB54R+J3qt96H2yTRdTBjL+RvTh5PP+SufqhI3qt9KTb7BIBqsnmO
 pOodo1vgngLUchWoSTRA3AtuHM7DVbm0m7bP4hHZvg94H2PGo+53Qk0nQ2mitY7bLy
 7XJnFV/ySaPrVEHOYd20m3fs1M5eypiWJp2fa9j8JwMJ8j9ej58dVZEpaQuhkH9bbj
 ydLkahTsy4WcGEJx8AH/DUcf9WO3NYUTSgELT+6WdSxlDiDSYe5kk/gtqMW7m9T3ue
 Hl7pzEEbIYUepxZcy8o/pFCAtWETe5r9KjlaAugge3KfOiLDd0E3YO3hpAo2fituq+
 gVpUG2umxk52Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 52FDF17E110D;
 Thu, 12 Feb 2026 11:11:18 +0100 (CET)
Date: Thu, 12 Feb 2026 11:11:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <20260212111113.68778819@fedora>
In-Reply-To: <20260212013713.304343-8-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: C1C7B12C4B7
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:08 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Introduce a generic slot manager to dynamically allocate limited hardware
> slots to software "seats". It can be used for both address space (AS) and
> command stream group (CSG) slots.
> 
> The slot manager initially assigns seats to its free slots. It then
> continues to reuse the same slot for a seat, as long as another seat
> did not start to use the slot in the interim.
> 
> When contention arises because all of the slots are allocated, the slot
> manager will lazily evict and reuse slots that have become idle (if any).
> 
> The seat state is protected using the LockedBy pattern with the same lock
> that guards the SlotManager. This ensures the seat state stays consistent
> across slot operations.
> 
> Hardware specific behaviour can be customized using the slot manager's
> `SlotOperations` trait.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/slot.rs | 359 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tyr/tyr.rs  |   1 +
>  2 files changed, 360 insertions(+)
>  create mode 100644 drivers/gpu/drm/tyr/slot.rs
> 
> diff --git a/drivers/gpu/drm/tyr/slot.rs b/drivers/gpu/drm/tyr/slot.rs
> new file mode 100644
> index 000000000000..37bf8800a225
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/slot.rs
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! Slot management abstraction for limited hardware resources.
> +//!
> +//! This module provides a generic [`SlotManager`] that assigns limited hardware
> +//! slots to logical "seats". A seat represents an entity (such as a vm address
> +//! space) that needs access to a hardware slot.
> +//!
> +//! The [`SlotManager`] tracks slot allocation using sequence numbers to detect
> +//! when a seat's binding has been invalidated. When a seat requests activation,
> +//! the manager will either reuse the seat's existing slot (if still valid),
> +//! allocate a free slot (if any are available), or evict the oldest idle slot if any
> +//! slots are idle.
> +//!
> +//! Hardware-specific behavior is customized by implementing the [`SlotOperations`]
> +//! trait, which allows callbacks when slots are activated or evicted.
> +//!
> +//! This is primarily used for managing address space slots in the GPU, where
> +//! the number of hardware address space slots is limited.

I'd probably mention that we intend to use it for other stuff (Csg
slots), hence the generalization done here.

> +//!
> +//! [SlotOperations]: crate::slot::SlotOperations
> +//! [SlotManager]: crate::slot::SlotManager

Thanks a lot for adding some docs to my barebone initial implementation
and fixing the stuff I got wrong along the way. :D

> +#![allow(dead_code)]
> +
> +use core::{
> +    mem::take,
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    }, //
> +};
> +
> +use kernel::{
> +    prelude::*,
> +    sync::LockedBy, //
> +};
> +

Don't know what the doc rules are in rust, but for this sort of generic
layer, maybe we should provide extensive docs around objects, fields
and public functions. I see that most struct fields are documented, but
not the struct themselves. the enum doesn't seem to be documented, and
some of the public functions are not either. And that's all my fault,
because I gave you this raw piece of code without much doc (you added a
lot already). Just saying that, maybe now that things have settled
down, is a good time to add proper doc where it's missing.


/// Seat information.
///
/// This can't be accessed directly by the element embedding a `Seat`,
/// but is used by the generic slot manager logic to control residency
/// of a certain object on a hardware slot.
> +pub(crate) struct SeatInfo {
> +    /// Slot used by this seat.
       ///
       /// This index is only valid if the slot pointed by this index
       /// has its `SlotInfo::seqno` match SeatInfo::seqno. Otherwise,
       /// it means the object has been evicted from the hardware slot,
       /// and a new slot needs to be acquired to make this object
       /// resident again.
> +    slot: u8,
> +
> +    /// Sequence number encoding the last time this seat was active.
> +    /// We also use it to check if a slot is still bound to a seat.
> +    seqno: u64,
> +}
> +

/// Seat state
///
/// This is meant to be embedded in the object that wants to acquire
/// hardware slots. It also starts in the `Seat::NoSeat` state, and
/// the slot manager will change the object value when an active/evict
/// request to is issued. 
> +#[derive(Default)]
> +pub(crate) enum Seat {
> +    #[expect(clippy::enum_variant_names)]
       /// Resource is not resident.
       ///
       /// All objects start with a seat in that state. The seat also
       /// gets back to that state if the user requests eviction. It
       /// can also end up in that state next time an operation is done
       /// on an `Seat::Idle` seat and the slot managers finds out this
       /// object has been evicted from the slot.
> +    #[default]
> +    NoSeat,

       /// Resource is actively used and resident.
       ///
       /// When a seat is in that state, it can't be evicted, and the
       /// slot pointed by `SlotInfo::slot` is guaranteed to be reserved
       /// for this object as long as the seat stays active.
> +    Active(SeatInfo),

       /// Resource is idle and might or might not be resident.
       ///
       /// When a seat is in that state, we can't know for sure if the
       /// object is resident or evicted until the next request we issue
       /// to the slot manager. This tells the slot manager it can
       /// reclaim the underlying slot if needed.
       /// In order for the hardware to use this object again, the seat
       /// needs to be turned into an `Seat::Active` state again
       /// with a `SlotManager::activate()` call.
> +    Idle(SeatInfo),
> +}
> +
> +impl Seat {
       /// Get the slot index this seat is pointing to.
       ///
       /// If the seat is not `Seat::Active` we can't trust the
       /// `SeatInfo`. In that case `None` is returned, otherwise
       /// `Some(SeatInfo::slot)` is returned.
> +    pub(super) fn slot(&self) -> Option<u8> {
> +        match self {
> +            Self::Active(info) => Some(info.slot),
> +            _ => None,
> +        }
> +    }
> +}
> +

/// Trait describing the slot-related operations.
> +pub(crate) trait SlotOperations {
> +    type SlotData;
> +
> +    /// Called when a slot is being activated for a seat.
> +    ///
> +    /// This callback allows hardware-specific actions to be performed when a slot
> +    /// becomes active, such as updating hardware registers or invalidating caches.
> +    fn activate(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> +        Ok(())
> +    }
> +
> +    /// Called when a slot is being evicted and freed.
> +    ///
> +    /// This callback allows hardware-specific cleanup when a slot is being
> +    /// completely freed, either explicitly or when an idle slot is being
> +    /// reused for a different seat. Any hardware state should be invalidated.
> +    fn evict(&mut self, _slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> +        Ok(())
> +    }
> +}
> +

/// Data attached to a slot.
> +struct SlotInfo<T> {
> +    /// Type specific data attached to a slot
> +    slot_data: T,
> +
> +    /// Sequence number from when this slot was last activated
> +    seqno: u64,
> +}
> +

/// Slot state.
> +#[derive(Default)]
> +enum Slot<T> {
    /// Slot is free.
    ///
    /// All slots start in this state when the slot manager is created.
> +    #[default]
> +    Free,

    /// Slot is active.
    ///
    /// When is that state, the slot is guaranteed to stay active
    /// for as long as the resource bound to it has its seat in the
    /// `Seat::Active` state. No new resource can be bound to it.
> +    Active(SlotInfo<T>),

    /// Slot is idle.
    ///
    /// Happens when the underlying resource has been flagged
    /// `Seat::Idle`. When in that state, the slot manager is allowed
    /// to evict the resource and re-assign the slot to someone else.
    /// This process involves updating the `SlotInfo::seqno` which
    /// will be checked against the `SeatInfo::seqno` in case the idle
    /// resource wants to become active again.
> +    Idle(SlotInfo<T>),
> +}
> +

/// Generic slot manager object.
///
/// It abstracts away all the churn around activeness/idleness tracking
/// and let the implementer of the SlotOperations trait focus on how to
/// make a resource active or evict it.
> +pub(crate) struct SlotManager<T: SlotOperations, const MAX_SLOTS: usize> {
> +    /// Manager specific data
> +    manager: T,
> +
> +    /// Number of slots actually available
> +    slot_count: usize,
> +
> +    /// Slots
> +    slots: [Slot<T::SlotData>; MAX_SLOTS],
> +
> +    /// Sequence number incremented each time a Seat is successfully activated
> +    use_seqno: u64,
> +}
> +
> +// A `Seat` protected by the same lock that is used to wrap the `SlotManager`.

Should this be

/// A `Seat` ....

?

> +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> +
> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}

Do we really need to explicitly flag this type Unpin? I thought this
was the default if the struct is not pinned (and it's not AFAICT).

> +
> +impl<T: SlotOperations, const MAX_SLOTS: usize> SlotManager<T, MAX_SLOTS> {
    /// Creates a new slot manager.
> +    pub(crate) fn new(manager: T, slot_count: usize) -> Result<Self> {
> +        if slot_count == 0 {
> +            return Err(EINVAL);
> +        }
> +        if slot_count > MAX_SLOTS {
> +            return Err(EINVAL);
> +        }
> +        Ok(Self {
> +            manager,
> +            slot_count,
> +            slots: [const { Slot::Free }; MAX_SLOTS],
> +            use_seqno: 1,
> +        })
> +    }
> +
> +    fn record_active_slot(
> +        &mut self,
> +        slot_idx: usize,
> +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> +        slot_data: T::SlotData,
> +    ) -> Result {
> +        let cur_seqno = self.use_seqno;
> +
> +        *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> +            slot: slot_idx as u8,
> +            seqno: cur_seqno,
> +        });
> +
> +        self.slots[slot_idx] = Slot::Active(SlotInfo {
> +            slot_data,
> +            seqno: cur_seqno,
> +        });
> +
> +        self.use_seqno += 1;
> +        Ok(())
> +    }
> +
> +    fn activate_slot(
> +        &mut self,
> +        slot_idx: usize,
> +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> +        slot_data: T::SlotData,
> +    ) -> Result {
> +        self.manager.activate(slot_idx, &slot_data)?;
> +        self.record_active_slot(slot_idx, locked_seat, slot_data)
> +    }
> +
> +    fn allocate_slot(
> +        &mut self,
> +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> +        slot_data: T::SlotData,
> +    ) -> Result {
> +        let slots = &self.slots[..self.slot_count];
> +
> +        let mut idle_slot_idx = None;
> +        let mut idle_slot_seqno: u64 = 0;
> +
> +        for (slot_idx, slot) in slots.iter().enumerate() {
> +            match slot {
> +                Slot::Free => {
> +                    return self.activate_slot(slot_idx, locked_seat, slot_data);
> +                }
> +                Slot::Idle(slot_info) => {
> +                    if idle_slot_idx.is_none() || slot_info.seqno < idle_slot_seqno {
> +                        idle_slot_idx = Some(slot_idx);
> +                        idle_slot_seqno = slot_info.seqno;
> +                    }
> +                }
> +                Slot::Active(_) => (),
> +            }
> +        }
> +
> +        match idle_slot_idx {
> +            Some(slot_idx) => {
> +                // Lazily evict idle slot just before it is reused
> +                if let Slot::Idle(slot_info) = &self.slots[slot_idx] {
> +                    self.manager.evict(slot_idx, &slot_info.slot_data)?;
> +                }
> +                self.activate_slot(slot_idx, locked_seat, slot_data)
> +            }
> +            None => {
> +                pr_err!(
> +                    "Slot allocation failed: all {} slots in use\n",
> +                    self.slot_count
> +                );
> +                Err(EBUSY)
> +            }
> +        }
> +    }
> +
> +    fn idle_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> +        let slot = take(&mut self.slots[slot_idx]);
> +
> +        if let Slot::Active(slot_info) = slot {
> +            self.slots[slot_idx] = Slot::Idle(SlotInfo {
> +                slot_data: slot_info.slot_data,
> +                seqno: slot_info.seqno,
> +            })
> +        };
> +
> +        *locked_seat.access_mut(self) = match locked_seat.access(self) {
> +            Seat::Active(seat_info) | Seat::Idle(seat_info) => Seat::Idle(SeatInfo {
> +                slot: seat_info.slot,
> +                seqno: seat_info.seqno,
> +            }),
> +            Seat::NoSeat => Seat::NoSeat,
> +        };
> +        Ok(())
> +    }
> +
> +    fn evict_slot(&mut self, slot_idx: usize, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> +        match &self.slots[slot_idx] {
> +            Slot::Active(slot_info) | Slot::Idle(slot_info) => {
> +                self.manager.evict(slot_idx, &slot_info.slot_data)?;
> +                take(&mut self.slots[slot_idx]);
> +            }
> +            _ => (),
> +        }
> +
> +        *locked_seat.access_mut(self) = Seat::NoSeat;
> +        Ok(())
> +    }
> +
> +    // Checks and updates the seat state based on the slot it points to
> +    // (if any). Returns a Seat with a value matching the slot state.
> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> +        let new_seat = match locked_seat.access(self) {
> +            Seat::Active(seat_info) => {
> +                let old_slot_idx = seat_info.slot as usize;
> +                let slot = &self.slots[old_slot_idx];
> +
> +                if kernel::warn_on!(
> +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> +                ) {
> +                    Seat::NoSeat
> +                } else {
> +                    Seat::Active(SeatInfo {
> +                        slot: seat_info.slot,
> +                        seqno: seat_info.seqno,
> +                    })
> +                }
> +            }
> +
> +            Seat::Idle(seat_info) => {
> +                let old_slot_idx = seat_info.slot as usize;
> +                let slot = &self.slots[old_slot_idx];
> +
> +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> +                    Seat::NoSeat
> +                } else {
> +                    Seat::Idle(SeatInfo {
> +                        slot: seat_info.slot,
> +                        seqno: seat_info.seqno,
> +                    })
> +                }
> +            }
> +
> +            _ => Seat::NoSeat,
> +        };
> +
> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> +        // so that only slot.rs can change the seat state, but there might be better solutions
> +        // to prevent that.

Okay, I guess we want some inputs from Daniel and/or Alice on that one.

> +        match &new_seat {
> +            Seat::Active(seat_info) => {
> +                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> +                    slot: seat_info.slot,
> +                    seqno: seat_info.seqno,
> +                })
> +            }
> +            Seat::Idle(seat_info) => {
> +                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> +                    slot: seat_info.slot,
> +                    seqno: seat_info.seqno,
> +                })
> +            }
> +            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> +        }
> +
> +        new_seat
> +    }
> +

    /// Make a resource active on any available/reclaimable slot.
    ///
    /// Will return an error if no slot is available/reclaimable, or if
    /// the reclaim failed.
> +    pub(crate) fn activate(
> +        &mut self,
> +        locked_seat: &LockedSeat<T, MAX_SLOTS>,
> +        slot_data: T::SlotData,
> +    ) -> Result {
> +        let seat = self.check_seat(locked_seat);
> +        match seat {
> +            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
> +                // With lazy eviction, if seqno matches, the hardware state is still
> +                // valid for both Active and Idle slots, so just update our records
> +                self.record_active_slot(seat_info.slot as usize, locked_seat, slot_data)
> +            }
> +            _ => self.allocate_slot(locked_seat, slot_data),
> +        }
> +    }
> +
    /// Flag a resource idle.
    ///
    /// The slot manager can decide to reclaim the slot this resource
    /// was bound to at any point after function returns.
> +    // The idle() method will be used when we start adding support for user VMs
> +    #[expect(dead_code)]
> +    pub(crate) fn idle(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> +        let seat = self.check_seat(locked_seat);
> +        if let Seat::Active(seat_info) = seat {
> +            self.idle_slot(seat_info.slot as usize, locked_seat)?;
> +        }
> +        Ok(())
> +    }
> +
> +    /// Evict a seat from its slot, freeing up the hardware resource.

I think I'd go:

    /// Evict a resource from its slot, and make this slot free again
    /// for other users.

> +    pub(crate) fn evict(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Result {
> +        let seat = self.check_seat(locked_seat);
> +
> +        match seat {
> +            Seat::Active(seat_info) | Seat::Idle(seat_info) => {
> +                let slot_idx = seat_info.slot as usize;
> +
> +                self.evict_slot(slot_idx, locked_seat)?;
> +            }
> +            _ => (),
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
> +impl<T: SlotOperations, const MAX_SLOTS: usize> Deref for SlotManager<T, MAX_SLOTS> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.manager
> +    }
> +}
> +
> +impl<T: SlotOperations, const MAX_SLOTS: usize> DerefMut for SlotManager<T, MAX_SLOTS> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.manager
> +    }
> +}
> diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> index 6eaa2135fe07..f54b997355e0 100644
> --- a/drivers/gpu/drm/tyr/tyr.rs
> +++ b/drivers/gpu/drm/tyr/tyr.rs
> @@ -12,6 +12,7 @@
>  mod gem;
>  mod gpu;
>  mod regs;
> +mod slot;
>  
>  kernel::module_platform_driver! {
>      type: TyrPlatformDeviceData,

