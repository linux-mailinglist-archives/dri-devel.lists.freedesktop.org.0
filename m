Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AChwCNS1mWk8WQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 14:40:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7C16CEF7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 14:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2D910E02E;
	Sat, 21 Feb 2026 13:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jCladLlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB96110E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 13:40:30 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-65bf356457aso3376100a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771681229; x=1772286029;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/f6N+ixFwHqdQwhwMZ2WjnEQYVFUNTbw/BLHS4peY/4=;
 b=jCladLluZCsNW98eZg35glQNbO105KDv4PB7fxLW5YwrZsWXV8BEtADmtzbIc3XP0q
 ixeTC1w4PmsLMQ9HxFi5/LCk/+6b1mW2tbW2JWxq9q1xGb49RE2+IiWKOiLz0N5TAQco
 L52LnAwMbN959CnRzy+AxHITIJKwyGglJ5pzLmHEcDRiU9KaEN2vW0FlDgXoiVemsF3B
 Z1BN/Aj7w9PbRM/Lv6cjpTYphH+vu9Qj8HQCvT+mkYWJvYQ5RRmiCkZsLF9Ab31qK254
 fpUb15E8vzPpxkN9Qikm9NeAd7hzu8QsYef6u3VrekFYz/oI/alDT7NLMzi5xQ4127KR
 4wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771681229; x=1772286029;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/f6N+ixFwHqdQwhwMZ2WjnEQYVFUNTbw/BLHS4peY/4=;
 b=fJ7DtZQ3xfiV+HUXAK8S9zTZzocR3mI3bvr3bUUQ9ac2wrzsDMv8+0+4+51Z4xRFA6
 yGk/EakVBljAiumfHnEKljkFlx7MqQKLlf7wj8TOo+lfD1IVkqxufLhigUEwW16ADEqW
 F8jyruZX5NsBfB6yE964V67kmzjQo1wb9GwQgRxlGw/10nKaWYIveaXk1zB1Bm8AJ5ar
 eQ5ahi6mMMIpXsEsVYRFne6ndBC/g0X/td4Kws8fp8qXdCJA+dTPEZwEDZjL+OddQkB4
 I7lxuw46FnK9E1vrNiwWj4EpknDLKi9SkpbeKZPV7O2FFR2n+8k2STgZvlDkwOHHCCci
 cicg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8BkOvFHWsC35z5Ti0/vwEXfNTTi1omeIfe93GcyGyPqRNvjByk2IVQbVJ6764SkUECI5BCTeJr60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR3PamlPINycpagfV6h5q9RFIt/z7F6N0WegmqUBZ6ja2C159U
 1Bij1lJ0b1GAPa3Tn2+ondNvs1lRPj8HkfKquuICGNfhS6FH7JuWeB+Q3gdF2wGSIE5+4JQIprf
 WzCj4jlmRCrVCHtNsGg==
X-Received: from edbev27.prod.google.com ([2002:a05:6402:541b:b0:65a:10ff:4ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:380e:b0:64d:3b22:a5c2 with SMTP id
 4fb4d7f45d1cf-65ea4f24b94mr1700759a12.25.1771681229064; 
 Sat, 21 Feb 2026 05:40:29 -0800 (PST)
Date: Sat, 21 Feb 2026 13:40:28 +0000
In-Reply-To: <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
Mime-Version: 1.0
References: <aZmUJxyZM3taMvAC@google.com>
 <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
Message-ID: <aZm1zL1nA97zur0v@google.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, beata.michalska@arm.com, lyude@redhat.com
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
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 50D7C16CEF7
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 09:44:45AM -0300, Daniel Almeida wrote:
> 
> 
> > On 21 Feb 2026, at 08:17, Alice Ryhl <aliceryhl@google.com> wrote:
> > 
> > On Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
> >>> +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> >>> +
> >>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
> >> 
> >> Do we really need to explicitly flag this type Unpin? I thought this
> >> was the default if the struct is not pinned (and it's not AFAICT).
> > 
> > It may be cleaner to add `#[pin_data]` to the struct and rely on the
> > Unpin impl it generates.
> > 
> > In general, the default Unpin implementation is to inherit from the
> > fields. When you add #[pin_data], it's changed to only inherit from
> > fields marked #[pin]. By adding #[pin_data] but not marking any fields
> > #[pin], it will be Unpin unless any of the zero fields marked #[pin] are
> > Unpin, i.e. it will always be Unpin.
> 
> Why do we need this if all fields are Unpin?

Its fields are not necessarily Unpin. 'manager' could be any type,
including !Unpin types.

Adding #[pin_data] without marking any fields #[pin] is equivalent to
the explicit impl Unpin the patch has now.

> >>> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >>> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >>> +        // to prevent that.
> >> 
> >> Okay, I guess we want some inputs from Daniel and/or Alice on that one.
> > 
> > You could consider only implementing Clone. That way, copies do not
> > happen unless you do so explicitly. Or add a private method on the type
> > that has the same function as Clone if you do not wish to expose it.
> 
> Please check my solution where clone is not needed.

If you do not need to return it from the function, then that's fine too,
of course.

Alice
