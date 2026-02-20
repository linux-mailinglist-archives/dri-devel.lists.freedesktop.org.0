Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPDGHTKKmGlwJgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 17:22:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F3A1694D1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 17:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389010E813;
	Fri, 20 Feb 2026 16:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sk2CUaN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021FA10E811
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771604518;
 bh=/iTkbOlo95o8ULuOB9RjJvT03w3SCR+vlTsMK0p3xbs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sk2CUaN2DuPxu2s2xoWWJ46P4XJucj1sdmH8QBnC5EGEjVt4Ejr/NajyDdomvjuGK
 fj2ZQx0p61zi1ItPV4ErlX3fN+Qzj1fzxEpaTTcV3vhWxQhfmaxourSIJEONnmBw2Z
 WXJgP+vyuGm5eZ3S93kBpjXDFhgibYmQhOMMxWwHIIV2NyK5E3i8+zKohUp1ZoWl4h
 vkC2zMJcxi4aqj5DjY+8xUaeJp+QRs96q3ixVQz+xsuME25stDryezF6+eFL0TLOXE
 6WMikYio6l3qBccKBUTO7FtmsOGEQ8Ia8mBGJnQ2DiJshu65x17l5fs8OvGgv4tqeP
 UegObxNgC02fA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0908817E0E6A;
 Fri, 20 Feb 2026 17:21:57 +0100 (CET)
Date: Fri, 20 Feb 2026 17:21:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
Message-ID: <20260220172154.4fe93c6d@fedora>
In-Reply-To: <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
 <1B40312F-694C-4154-ABF7-F96CE5576C0E@collabora.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 00F3A1694D1
X-Rspamd-Action: no action

On Fri, 20 Feb 2026 12:25:43 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> >> +
> >> +    // Checks and updates the seat state based on the slot it points to
> >> +    // (if any). Returns a Seat with a value matching the slot state.
> >> +    fn check_seat(&mut self, locked_seat: &LockedSeat<T, MAX_SLOTS>) -> Seat {
> >> +        let new_seat = match locked_seat.access(self) {
> >> +            Seat::Active(seat_info) => {
> >> +                let old_slot_idx = seat_info.slot as usize;
> >> +                let slot = &self.slots[old_slot_idx];
> >> +
> >> +                if kernel::warn_on!(
> >> +                    !matches!(slot, Slot::Active(slot_info) if slot_info.seqno == seat_info.seqno)
> >> +                ) {
> >> +                    Seat::NoSeat
> >> +                } else {
> >> +                    Seat::Active(SeatInfo {
> >> +                        slot: seat_info.slot,
> >> +                        seqno: seat_info.seqno,
> >> +                    })
> >> +                }
> >> +            }
> >> +
> >> +            Seat::Idle(seat_info) => {
> >> +                let old_slot_idx = seat_info.slot as usize;
> >> +                let slot = &self.slots[old_slot_idx];
> >> +
> >> +                if !matches!(slot, Slot::Idle(slot_info) if slot_info.seqno == seat_info.seqno) {
> >> +                    Seat::NoSeat
> >> +                } else {
> >> +                    Seat::Idle(SeatInfo {
> >> +                        slot: seat_info.slot,
> >> +                        seqno: seat_info.seqno,
> >> +                    })
> >> +                }
> >> +            }
> >> +
> >> +            _ => Seat::NoSeat,
> >> +        };
> >> +
> >> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >> +        // to prevent that.  
> > 
> > Okay, I guess we want some inputs from Daniel and/or Alice on that one.  
> 
> Hm, I'd say we shouldn't implement Clone to avoid any possibility of holding on
> to stale state by duplicating it.

Okay, so basically what we have now.

> 
> Why do we need to return Seat from this function? Can't we simply write
> locked_seat in place and not return anything?

We do both actually. IIRC, the reason is that LockedBy borrows &self if
we want to read the locked_seat, which prevents us from calling methods
taking a &mut ref from a `match(locked_seat.access())`.

> 
> >   
> >> +        match &new_seat {
> >> +            Seat::Active(seat_info) => {
> >> +                *locked_seat.access_mut(self) = Seat::Active(SeatInfo {
> >> +                    slot: seat_info.slot,
> >> +                    seqno: seat_info.seqno,
> >> +                })
> >> +            }
> >> +            Seat::Idle(seat_info) => {
> >> +                *locked_seat.access_mut(self) = Seat::Idle(SeatInfo {
> >> +                    slot: seat_info.slot,
> >> +                    seqno: seat_info.seqno,
> >> +                })
> >> +            }
> >> +            _ => *locked_seat.access_mut(self) = Seat::NoSeat,
> >> +        }
> >> +
> >> +        new_seat
> >> +    }
> >> +  
> 

