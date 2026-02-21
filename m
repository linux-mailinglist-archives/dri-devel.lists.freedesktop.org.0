Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PHbHy+UmWnRVAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:17:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D535C16CBEF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87FB10E028;
	Sat, 21 Feb 2026 11:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yqrEi5Zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FDF10E028
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 11:16:57 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836cc0b38eso31339285e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771672616; x=1772277416;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TPEdD6W9mbV8SmJ8ZUWtD/nrbbQE48InvPdgQtXLnW8=;
 b=yqrEi5ZiJKt9qwY2JTTvRozQ4TWfANfAnTUq4NcGNxEhkJIZD6K9r19k0cGavp+XNL
 K3s7NAx/U+A439+OXiM3jZ/biveE7Id0oXeggRkOJBFMADXUZ8mOFrhHJOiq3MJ7kTF7
 20AETeVn+aClOJBM9GGwfPrQBad6fkJ2BgV2jd4yS5qv8dEReGAjaKNLq9GsAxg772px
 Sg5g+/y2ehYi+Hod+MHNuUMv5nZI9ccaLmDGspQ41s2mkDLzaxhHbrng8TDQkAmyJIZN
 uB/bVoXlykxZzteJkbZlRDPau1YnEAIvhzrq8hK2vlneypPKfORaPXSHQGv1VXpJBpQ3
 LERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771672616; x=1772277416;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPEdD6W9mbV8SmJ8ZUWtD/nrbbQE48InvPdgQtXLnW8=;
 b=Kt+s8ZXiz/r2CN1OYfCn4YMr65PNLIY7d/IVOGH8ew0hibF5ghRXZnWQRUtJM1nmzV
 De5Q5XtZLFrl/GeQdNevGD/qG3QHraaECsxe1XjsjTS9xaZZrNxhZNWmToOtg/z4YjmF
 QDmBhsTNKterpZA2C2UCFr9aUhDphhtwG1eb1OqYd4zGNcxahn2VErpCByw+toKyYJoQ
 +ArJofoswp+mr0WcXx7G5jCVrdJmHZIeI1NaKVN0NGu7Z9p1SehrwjVP+4zo0UnAdDDO
 QUAVUr65jdmCJiqDTbrKBQp5aHwnhHKd3VIzIfdXS91tCOPiQpmKU9ZYLyFiPXBdS5UU
 /hbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfdHtOhq1dWowDgrlue/W3kCPLKhlHaurGs88pL0ttLSFgRMWcL+/Uc64t/gce5bwIxna8gl1u0sE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCYBxvN7r5SmnVjtZpg34YwTRrHjgefFHgoHh8iWQXHJB9gi5G
 6FfbCP/2cqM84Tub+6IfmhY9g8Qc8L9C5ryTXY73iHRKkQ+V/GDj9RtNLvsJNr5F7YHTKDdRay+
 1+cQ9werqvyUCkTmEOg==
X-Received: from wmby13.prod.google.com ([2002:a05:600c:c04d:b0:483:7c8d:ed1d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b02:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-483a95aa31dmr41813525e9.1.1771672615882; 
 Sat, 21 Feb 2026 03:16:55 -0800 (PST)
Date: Sat, 21 Feb 2026 11:16:55 +0000
In-Reply-To: <20260212111113.68778819@fedora>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com>
 <20260212111113.68778819@fedora>
Message-ID: <aZmUJxyZM3taMvAC@google.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email]
X-Rspamd-Queue-Id: D535C16CBEF
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


> > +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> > +
> > +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
> 
> Do we really need to explicitly flag this type Unpin? I thought this
> was the default if the struct is not pinned (and it's not AFAICT).

It may be cleaner to add `#[pin_data]` to the struct and rely on the
Unpin impl it generates.

In general, the default Unpin implementation is to inherit from the
fields. When you add #[pin_data], it's changed to only inherit from
fields marked #[pin]. By adding #[pin_data] but not marking any fields
#[pin], it will be Unpin unless any of the zero fields marked #[pin] are
Unpin, i.e. it will always be Unpin.

> > +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> > +        // so that only slot.rs can change the seat state, but there might be better solutions
> > +        // to prevent that.
> 
> Okay, I guess we want some inputs from Daniel and/or Alice on that one.

You could consider only implementing Clone. That way, copies do not
happen unless you do so explicitly. Or add a private method on the type
that has the same function as Clone if you do not wish to expose it.

Alice
