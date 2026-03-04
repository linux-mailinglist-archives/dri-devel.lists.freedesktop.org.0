Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFbcDmu5qGniwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:59:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7E208CFC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADFF10E0FC;
	Wed,  4 Mar 2026 22:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FI/KdKyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355B610EAD1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772665161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQJKrk8XMECCDXVxSiN+Dh5yVEEjUi/YG3j9kEQW3dA=;
 b=FI/KdKynhlzbSmqDBciMIO9SLsCqh/it6X/FJVghbTZSkDv/RaSFjk2RK0/8evOdFMRHqC
 HWWCZtvP6W725txAaTE9/1uIRkaZW9xvQV5Mks4SR6yi72fZKy8DiA8VU0erplj2/HVUuu
 7ZJZb7tBMuhjRmfpgRILMsxbsJE8LBg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-EXEHir42NcOQX6_8BsFBLQ-1; Wed, 04 Mar 2026 17:59:20 -0500
X-MC-Unique: EXEHir42NcOQX6_8BsFBLQ-1
X-Mimecast-MFC-AGG-ID: EXEHir42NcOQX6_8BsFBLQ_1772665160
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb403842b6so5154741185a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772665160; x=1773269960;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ut8h8kvGLZt/HvXnTiTmBBsoftW01FQ+qBcjZ1kIy7M=;
 b=oTf642wAYgwGkR24X3LB7gmv99pd1VbgvGV0LYM5F6ZCUD24PbiLtZT4eHsMFLGvCJ
 TO4FYyW/dq2xOM2i0ISZBFfNMHd/J/OTub58ccAug0qZbnFwyG6MX/ZwtgLlcZI5xFRJ
 Sxe21Nk+xKwjzZUf3XTrjnWb3cGfDowoZuAbRHdongrmqERzc/XAzc2/yxZ9O1lc7bZ3
 6pTQbWSfLzFkaSVUubr8XtS9irEcIV46KS4fS17t0j9LCR1NLDSylf5hiLvCavuL/WC4
 3TzmZz2LBE0ocSp/JPZRpq7IBEncgFKCkBhzxHZgvhxyHKEt2FVb0O3yY/Yp78iRXN7y
 wxdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV77qPZhaVwpF6Ks5stnNO99LAqLK3fHaA4ucPbIC/p9pXK86Y4XDrF6mvEGpHcJJw5qQ1jCjuze/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL4yMTNuxZNUO6CDwUmmTJGILze8Y5svbKbPL6JVEKGtQL5S7x
 G/TB+JtObkcyre3kcSTHo5vVR0hPe9x0jCO2jro4gepTr4Y4rxYYXO7WgoDMBXD0xxwI+EcitgK
 iWPao35qT1LJ/hlfytwevewMDirpN7Q1RCcLJqsf3NUScQVG2/GQ88REPIxP+tg+sLG7RAw==
X-Gm-Gg: ATEYQzwhF4ifrIPwxGzl5NSuCkU8chTOKVxkqtgRiE+vRryLzKgn9Pna4y8GJgu6M4K
 PLX/o1TbPVI5FjCrdELeSqfSwnF0UY3K9x0r8NqWKJlxkX6pB1VyHvNv3KYpyfkQwX6nRuaVU4+
 3J0H+RVbpNsjX/s/tXaxjvShwPVxKtJfhr9AXqdYOqNxFhsyTwse2ZxjBo39QJfJt+0dMx/UXqM
 qckgnn1R1VDANBpEFtc53Kn+PTS9AJVqoKnwIv++Sm4xDTBPg/VpFWYkPjQj5qbtorIL9NoaPb3
 Yrj8EgByE/h14CtF0ORV0UK26f71L2fc3GhDrfdblCXWx60zkMmkCy01Dn37nvy9pZc6XSiB+Q0
 tGOAwrKmQLk1L9DKHsA==
X-Received: by 2002:a05:620a:3727:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cd5afaa369mr465924285a.65.1772665159782; 
 Wed, 04 Mar 2026 14:59:19 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8b2:ea5a:4149 with SMTP id
 af79cd13be357-8cd5afaa369mr465921185a.65.1772665159209; 
 Wed, 04 Mar 2026 14:59:19 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a1fecc2bcsm13349476d6.42.2026.03.04.14.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 14:59:18 -0800 (PST)
Message-ID: <e1c53700bdf4db6c2246a9b9e7098cb6db905797.camel@redhat.com>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 nouveau@lists.freedesktop.org, Daniel Almeida
 <daniel.almeida@collabora.com>,  Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,  Janne Grunau
 <j@jannau.net>
Date: Wed, 04 Mar 2026 17:59:18 -0500
In-Reply-To: <aY6FbSjQpGFk8oWK@um790>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-7-lyude@redhat.com> <aY6FbSjQpGFk8oWK@um790>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6NpwerSme1nwInury4tImcHNLQmdfYIgY22GpLrCZ_o_1772665160
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 22A7E208CFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:lossin@kernel.org,m:acourbot@nvidia.com,m:j@jannau.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,timers.target:url]
X-Rspamd-Action: no action

Hey! Sorry for the long delay in response

Would you mind sending me the size/offset numbers you used here? My
unit tests should have caught issues like this, so if they're happening
I definitely should add it to the testcases I've got to make sure
there's no problems

On Thu, 2026-02-12 at 17:59 -0800, Deborah Brouwer wrote:
> Hi Lyude,
>=20
> On Fri, Feb 06, 2026 at 05:34:30PM -0500, Lyude Paul wrote:
> > This introduces a set of bindings for working with iosys_map in
> > rust code
> > using the new Io traits.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> >=20
> > ---
> > V5:
> > - Fix incorrect field size being passed to iosys_map_memcpy_to()
> > - Add an additional unit test, basic_macro(), which can
> > successfully catch
> > =C2=A0 the above issue so it doesn't happen again in the future.
> > V6:
> > - Drop as_slice/as_mut_slice (Alice Rhyl)
> > V7:
> > - Start using Alexandre Courbot's wonderful Io, IoCapable and
> > IoKnownSize
> > =C2=A0 traits instead of trying to roll our own IO accessors. This also
> > changes
> > =C2=A0 the following:
> > =C2=A0 - We don't have a custom AsBytes/FromBytes type that we carry
> > around any
> > =C2=A0=C2=A0=C2=A0 longer with maps
> > =C2=A0 - We now have optional compile-time size checking
> > =C2=A0 - We don't need our own unit tests anymore
> > =C2=A0 - RawIoSysMap can be used for unsafe IO operations, because why
> > not.
> > =C2=A0 - IoSysMapRef::new() can fail now since it needs to ensure SIZE
> > is valid.
> > =C2=A0 - We don't implement Deref<RawIoSysMap> for IoSysMapRef any
> > longer. The
> > =C2=A0=C2=A0=C2=A0 main reason for this is that we want to avoid users =
having to
> > manually
> > =C2=A0=C2=A0=C2=A0 specify if they want the RawIoSysMap or IoSysMapRef =
variant
> > functions
> > =C2=A0=C2=A0=C2=A0 like io_read()/io_write().
> > =C2=A0=C2=A0=C2=A0 This is fine IMHO, but to make sure things remain ea=
sy for APIs
> > that
> > =C2=A0=C2=A0=C2=A0 wrap around iosys map we make IoSysMapRef.raw_map pu=
b(crate).
> >=20
> > =C2=A0rust/helpers/helpers.c=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0rust/helpers/iosys_map.c |=C2=A0 34 +++++++
> > =C2=A0rust/kernel/iosys_map.rs | 211
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A0rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > =C2=A04 files changed, 247 insertions(+)
> > =C2=A0create mode 100644 rust/helpers/iosys_map.c
> > =C2=A0create mode 100644 rust/kernel/iosys_map.rs
> >=20
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 1d3333cc0d2a8..bd8ad237aa02e 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -31,6 +31,7 @@
> > =C2=A0#include "irq.c"
> > =C2=A0#include "fs.c"
> > =C2=A0#include "io.c"
> > +#include "iosys_map.c"
> > =C2=A0#include "jump_label.c"
> > =C2=A0#include "kunit.c"
> > =C2=A0#include "maple_tree.c"
> > diff --git a/rust/helpers/iosys_map.c b/rust/helpers/iosys_map.c
> > new file mode 100644
> > index 0000000000000..6861d4ec48a4b
> > --- /dev/null
> > +++ b/rust/helpers/iosys_map.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/iosys-map.h>
> > +#include <linux/types.h>
> > +
> > +#define
> > rust_iosys_map_rd(type__)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=09__rust_helper
> > type__=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09rust_helper_iosys_map_rd_ ## type__(const struct iosys_map
> > *map, size_t offset) \
> > +=09{=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09=09return iosys_map_rd(map, offset,
> > type__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09}
> > +#define
> > rust_iosys_map_wr(type__)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +=09__rust_helper
> > void=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > +=09rust_helper_iosys_map_wr_ ## type__(const struct iosys_map
> > *map, size_t offset, \
> > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 type__
> > value)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09{=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09=09iosys_map_wr(map, offset, type__,
> > value);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=09}
> > +
> > +rust_iosys_map_rd(u8);
> > +rust_iosys_map_rd(u16);
> > +rust_iosys_map_rd(u32);
> > +
> > +rust_iosys_map_wr(u8);
> > +rust_iosys_map_wr(u16);
> > +rust_iosys_map_wr(u32);
> > +
> > +#ifdef CONFIG_64BIT
> > +rust_iosys_map_rd(u64);
> > +rust_iosys_map_wr(u64);
> > +#endif
> > +
> > +#undef rust_iosys_map_rd
> > +#undef rust_iosys_map_wr
> > diff --git a/rust/kernel/iosys_map.rs b/rust/kernel/iosys_map.rs
> > new file mode 100644
> > index 0000000000000..2070f0fb42cb8
> > --- /dev/null
> > +++ b/rust/kernel/iosys_map.rs
> > @@ -0,0 +1,211 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! IO-agnostic memory mapping interfaces.
> > +//!
> > +//! This crate provides bindings for the `struct iosys_map` type,
> > which provides a common interface
> > +//! for memory mappings which can reside within coherent memory,
> > or within IO memory.
> > +//!
> > +//! C header: [`include/linux/iosys-
> > map.h`](srctree/include/linux/pci.h)
> > +
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 error::code::*,
> > +=C2=A0=C2=A0=C2=A0 io::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Io,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IoCapable,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IoKnownSize, //
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 prelude::*, //
> > +};
> > +use bindings;
> > +use core::marker::PhantomData;
> > +
> > +/// Raw unsized representation of a `struct iosys_map`.
> > +///
> > +/// This struct is a transparent wrapper around `struct
> > iosys_map`. The C API does not provide the
> > +/// size of the mapping by default, and thus this type also does
> > not include the size of the
> > +/// mapping. As such, it cannot be used for actually accessing the
> > underlying data pointed to by the
> > +/// mapping.
> > +///
> > +/// With the exception of kernel crates which may provide their
> > own wrappers around `RawIoSysMap`,
> > +/// users will typically not interact with this type directly.
> > +#[repr(transparent)]
> > +pub struct RawIoSysMap<const SIZE: usize =3D
> > 0>(bindings::iosys_map);
> > +
> > +impl<const SIZE: usize> RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a raw `bindings::iosys_map`.
> > +=C2=A0=C2=A0=C2=A0 #[expect(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn from_raw(val: bindings::iosys_map) ->=
 Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(val)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Returns whether the mapping is within IO memory=
 space or
> > not.
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub fn is_iomem(&self) -> bool {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.is_iomem
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a `RawIoSysMap<SIZE>` to a raw
> > `bindings::iosys_map` ref.
> > +=C2=A0=C2=A0=C2=A0 #[expect(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn as_raw(&self) -> &bindings::iosys_map=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self.0
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Convert from a `RawIoSysMap<SIZE>` to a raw mut=
able
> > `bindings::iosys_map` ref.
> > +=C2=A0=C2=A0=C2=A0 #[allow(unused)]
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn as_raw_mut(&mut self) -> &mut
> > bindings::iosys_map {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &mut self.0
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Returns the address pointed to by this iosys ma=
p.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Note that this address is not guaranteed to be =
valid, and
> > may or may not reside in I/O
> > +=C2=A0=C2=A0=C2=A0 /// memory.
> > +=C2=A0=C2=A0=C2=A0 #[inline]
> > +=C2=A0=C2=A0=C2=A0 pub fn addr(&self) -> usize {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (if self.is_iomem() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: We confirmed above that this iosys map is
> > contained within iomem, so it's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
safe to read vaddr_iomem
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe { self.0.__bindgen_anon_1.vaddr_iomem }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
SAFETY: We confirmed above that this iosys map is
> > not contaned within iomem, so it's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
safe to read vaddr.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe { self.0.__bindgen_anon_1.vaddr }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }) as usize
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: As we make no guarantees about the validity of the
> > mapping, there's no issue with sending
> > +// this type between threads.
> > +unsafe impl<const SIZE: usize> Send for RawIoSysMap<SIZE> {}
> > +
> > +impl<const SIZE: usize> Clone for RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0 fn clone(&self) -> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(self.0)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +macro_rules! impl_raw_iosys_map_io_capable {
> > +=C2=A0=C2=A0=C2=A0 ($ty:ty, $read_fn:ident, $write_fn:ident) =3D> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 impl<const SIZE: usize> IoC=
apable<$ty> for
> > RawIoSysMap<SIZE> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[i=
nline(always)]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe fn io_read(&self, address: usize) -> $ty {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: By the trait invariant `address` is a
> > valid address for iosys map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // operations.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::$read_fn(&self.0, address) }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #[i=
nline(always)]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
afe fn io_write(&self, value: $ty, address: usize)
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // SAFETY: By the trait invariant `address` is a
> > valid address for iosys map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // operations.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::$write_fn(&self.0, address,
> > value) };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 };
> > +}
> > +
>=20
> I think there might be a mismatch between the absolute address being
> passed to these read and write functions and the bindings helpers
> that expect an offset argument.
>=20
> This crashed Tyr when I tried to write the firmware in u8 chunks at
> incremental offsets. But if i just calculated the offset and passed
> that
> instead of the absolute address, this worked fine:
>=20
> =C2=A0 let offset =3D address - self.addr();
> =C2=A0 unsafe { bindings::$write_fn(&self.0, offset, value) };
>=20
> Here's some of the call trace:
>=20
> [=C2=A0=C2=A0 31.553727] tyr fb000000.gpu: supply sram not found, using d=
ummy
> regulator
> [=C2=A0=C2=A0 31.555096] tyr fb000000.gpu: mali-unknown id 0xa867 major 0=
x67
> minor 0x0 status 0x5
> [=C2=A0=C2=A0 31.555778] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0=
x809
> Mem:0x301 MMU:0x2830 AS:0xff
> [=C2=A0=C2=A0 31.556521] tyr fb000000.gpu: shader_present=3D0x00000000000=
50005
> l2_present=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [=C2=A0=C2=A0 31.557868] stackdepot: allocating hash table of 524288 entr=
ies
> via kvcalloc
> [=C2=A0 OK=C2=A0 ] Started systemd-tmpfiles-clean.tim=E2=80=A6y Cleanup o=
f Temporary
> Directories.
> [=C2=A0=C2=A0 31.562424] stackdepot: allocating space for 8192 stack pool=
s via
> kvcalloc
> [=C2=A0 OK=C2=A0 ] Reached target timers.target - Timer Units.
> [=C2=A0=C2=A0 31.563676] tyr: Firmware protected mode entry not supported=
,
> ignoring
> [=C2=A0=C2=A0 31.571391] Unable to handle kernel paging request at virtua=
l
> address 0000000000800069
> [=C2=A0=C2=A0 31.572762] Mem abort info:
> [=C2=A0=C2=A0 31.573027]=C2=A0=C2=A0 ESR =3D 0x0000000096000021
> [=C2=A0=C2=A0 31.573402]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> [=C2=A0=C2=A0 31.573878]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0=C2=A0 31.574157]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0=C2=A0 31.574442]=C2=A0=C2=A0 FSC =3D 0x21: alignment fault
> [=C2=A0 OK=C2=A0 ] Listening on dbus.socket - D-Bus System Message Bus So=
cket.
> [=C2=A0=C2=A0 31.593348] Data abort info:
> [=C2=A0=C2=A0 31.593628]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000021, ISS2 =
=3D 0x00000000
> [=C2=A0=C2=A0 31.594117]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagA=
ccess =3D 0
> [=C2=A0=C2=A0 31.594567]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> [=C2=A0=C2=A0 31.595042] user pgtable: 4k pages, 48-bit VAs,
> pgdp=3D0000000105e50000
> [=C2=A0=C2=A0 31.595613] [0000000000800069] pgd=3D0000000000000000,
> p4d=3D0000000000000000
> [=C2=A0=C2=A0 31.596434] Internal error: Oops: 0000000096000021 [#1]=C2=
=A0 SMP
> [=C2=A0=C2=A0 31.596936] Modules linked in: snd tyr(+) soundcore sha256
> cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
> [=C2=A0=C2=A0 31.597830] CPU: 3 UID: 0 PID: 241 Comm: (udev-worker) Not t=
ainted
> 6.19.0-rc5 #282 PREEMPT
> [=C2=A0=C2=A0 31.598561] Hardware name: Radxa ROCK 5B (DT)
> [=C2=A0=C2=A0 31.598944] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT =
-SSBS
> BTYPE=3D--)
> [=C2=A0=C2=A0 31.599554] pc : __d_lookup_rcu+0xbc/0x168
> [=C2=A0=C2=A0 31.599921] lr : __d_lookup_rcu+0x60/0x168
> [=C2=A0=C2=A0 31.600283] sp : ffff800081ebba00
> [=C2=A0=C2=A0 31.600574] x29: ffff800081ebba00 x28: 0000000000000049 x27:
> ffff00010d07002b
> [=C2=A0=C2=A0 31.601205] x26: 0000000000000081 x25: 000000000006915e x24:
> ffff0002f6600000
> [=C2=A0=C2=A0 31.601848] x23: ffff00010396a040 x22: ffff000102098460 x21:
> 000000036915e207
> [=C2=A0=C2=A0 31.601859] x20: ffff000101e10af8 x19: ffff800081ebbcac x18:
> 2f64662f666c6573
> [=C2=A0=C2=A0 31.601867] x17: ffffff00666c6573 x16: 00000000fffffffc x15:
> 0000000000003431
> [=C2=A0=C2=A0 31.601875] x14: 000000000000000f x13: 0080205100800107 x12:
> 0000000000800069
> [=C2=A0=C2=A0 31.601882] x11: ffffffffffffffff x10: 0000000000000018 x9 :
> 0000000000000003
> [=C2=A0=C2=A0 31.601890] x8 : 00000000008000a1 x7 : ffffb9d13df173c8 x6 :
> 0000000000000000
> [=C2=A0=C2=A0 31.601897] x5 : 0000000000000000 x4 : 0000000000000010 x3 :
> ffffffffffff0a00
> [=C2=A0=C2=A0 31.601905] x2 : ffff800081ebbcac x1 : ffffb9d1406be718 x0 :
> 0000000000000001
> [=C2=A0=C2=A0 31.601913] Call trace:
> [=C2=A0=C2=A0 31.601915]=C2=A0 __d_lookup_rcu+0xbc/0x168 (P)
> [=C2=A0=C2=A0 31.601922]=C2=A0 lookup_fast+0x98/0x174
> [=C2=A0=C2=A0 31.601929]=C2=A0 link_path_walk+0x280/0x528
> [=C2=A0=C2=A0 31.601935]=C2=A0 path_lookupat+0x60/0x1f0
> [=C2=A0=C2=A0 31.601941]=C2=A0 do_o_path+0x34/0xb4
> [=C2=A0=C2=A0 31.601947]=C2=A0 path_openat+0xccc/0xe34
> [=C2=A0=C2=A0 31.601953]=C2=A0 do_filp_open+0xc0/0x170
> [=C2=A0=C2=A0 31.601958]=C2=A0 do_sys_openat2+0x88/0x10c
> [=C2=A0=C2=A0 31.601963]=C2=A0 __arm64_sys_openat+0x70/0x9c
> [=C2=A0=C2=A0 31.601968]=C2=A0 invoke_syscall+0x40/0xcc
> [=C2=A0=C2=A0 31.601974]=C2=A0 el0_svc_common+0x80/0xd8
> [=C2=A0=C2=A0 31.601979]=C2=A0 do_el0_svc+0x1c/0x28
> [=C2=A0=C2=A0 31.601984]=C2=A0 el0_svc+0x54/0x1d4
> [=C2=A0=C2=A0 31.601991]=C2=A0 el0t_64_sync_handler+0x84/0x12c
> [=C2=A0=C2=A0 31.601997]=C2=A0 el0t_64_sync+0x198/0x19c
> [=C2=A0=C2=A0 31.602005] Code: 14000003 f9400108 b4000428 d100e10c (88dff=
d8c)
> [=C2=A0=C2=A0 31.602009] ---[ end trace 0000000000000000 ]---
> [=C2=A0 OK=C2=A0 ] Listening on sshd-unix-local.socke=E2=80=A6temd-ssh-ge=
nerator,
> AF_UNIX Local).
> [=C2=A0=C2=A0 31.620067] mc: Linux media interface: v0.10
> [=C2=A0=C2=A0 31.623483] [drm] Initialized panthor 1.5.0 for fb000000.gpu=
 on
> minor 0
> [=C2=A0=C2=A0 31.623765] Unable to handle kernel paging request at virtua=
l
> address 00802a4d0080284d
> [=C2=A0=C2=A0 31.624285] tyr fb000000.gpu: Tyr initialized correctly.
> [=C2=A0=C2=A0 31.624752] Mem abort info:
> [=C2=A0=C2=A0 31.624754]=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> [=C2=A0=C2=A0 31.625847]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> [=C2=A0=C2=A0 31.626310]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0=C2=A0 31.626578]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0=C2=A0 31.626853]=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fa=
ult
> [=C2=A0=C2=A0 31.627277] Data abort info:
> [=C2=A0=C2=A0 31.627529]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =
=3D 0x00000000
> [=C2=A0=C2=A0 31.628006]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagA=
ccess =3D 0
> [=C2=A0=C2=A0 31.628447]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> [=C2=A0=C2=A0 31.628910] [00802a4d0080284d] address between user and kern=
el
> address ranges
> [=C2=A0=C2=A0 31.629535] Internal error: Oops: 0000000096000004 [#2]=C2=
=A0 SMP
> [=C2=A0=C2=A0 31.630030] Modules linked in: mc drm_client_lib snd tyr sou=
ndcore
> sha256 cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
> [=C2=A0=C2=A0 31.631017] CPU: 4 UID: 0 PID: 225 Comm: systemd-udevd Taint=
ed:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.19.0-rc5 #282 PREEMPT
> [=C2=A0=C2=A0 31.631877] Tainted: [D]=3DDIE
> [=C2=A0=C2=A0 31.632129] Hardware name: Radxa ROCK 5B (DT)
> [=C2=A0=C2=A0 31.632506] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT =
-SSBS
> BTYPE=3D--)
> [=C2=A0=C2=A0 31.633111] pc : ___d_drop+0xd8/0x144
> [=C2=A0=C2=A0 31.633433] lr : d_invalidate+0x3c/0x110
> [=C2=A0=C2=A0 31.633776] sp : ffff800081d3ba70
> [=C2=A0=C2=A0 31.634064] x29: ffff800081d3ba90 x28: 0000000000000001 x27:
> ffffb9d140bfa000
> [=C2=A0=C2=A0 31.634685] x26: ffff0001039b5108 x25: ffff00010396a000 x24:
> ffffb9d140166275
> [=C2=A0=C2=A0 31.635305] x23: ffffb9d140bfa000 x22: ffffb9d140152f3a x21:
> ffff000104076000
> [=C2=A0=C2=A0 31.635925] x20: ffff00010e520098 x19: ffff00010396a000 x18:
> 0000000000000000
> [=C2=A0=C2=A0 31.636545] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> [=C2=A0=C2=A0 31.637165] x14: 0000000000000000 x13: ffff00010792b8f0 x12:
> 000000000000017a
> [=C2=A0=C2=A0 31.637785] x11: 00000000008000a1 x10: 00802a4d0080284d x9 :
> ffff0002f6604010
> [=C2=A0=C2=A0 31.638405] x8 : ffff000105bfcd40 x7 : 0000000000000000 x6 :
> ffffb9d13e272c60
> [=C2=A0=C2=A0 31.639026] x5 : 0000000000000000 x4 : 0000000000000001 x3 :
> 0000000000000000
> [=C2=A0=C2=A0 31.639646] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff00010396a000
> [=C2=A0=C2=A0 31.640266] Call trace:
> [=C2=A0=C2=A0 31.640479]=C2=A0 ___d_drop+0xd8/0x144 (P)
> [=C2=A0=C2=A0 31.640800]=C2=A0 d_invalidate+0x3c/0x110
> [=C2=A0=C2=A0 31.641113]=C2=A0 proc_invalidate_siblings_dcache+0x244/0x2b=
8
> [=C2=A0=C2=A0 31.641577]=C2=A0 proc_flush_pid+0x1c/0x28
> [=C2=A0=C2=A0 31.641897]=C2=A0 release_task+0x560/0x668
> [=C2=A0=C2=A0 31.642218]=C2=A0 wait_consider_task+0x5a0/0xb44
> [=C2=A0=C2=A0 31.642582]=C2=A0 __do_wait+0x154/0x1f0
> [=C2=A0=C2=A0 31.642879]=C2=A0 do_wait+0x84/0x16c
> [=C2=A0=C2=A0 31.643154]=C2=A0 __arm64_sys_waitid+0xac/0x218
> [=C2=A0=C2=A0 31.643512]=C2=A0 invoke_syscall+0x40/0xcc
> [=C2=A0=C2=A0 31.643833]=C2=A0 el0_svc_common+0x80/0xd8
> [=C2=A0=C2=A0 31.644152]=C2=A0 do_el0_svc+0x1c/0x28
> [=C2=A0=C2=A0 31.644441]=C2=A0 el0_svc+0x54/0x1d4
> [=C2=A0=C2=A0 31.644718]=C2=A0 el0t_64_sync_handler+0x84/0x12c
> [=C2=A0=C2=A0 31.645090]=C2=A0 el0t_64_sync+0x198/0x19c
> [=C2=A0=C2=A0 31.645412] Code: 5280002a f85f83a0 17fffff1 a944280b (f9400=
14c)
> [=C2=A0=C2=A0 31.645941] ---[ end trace 0000000000000000 ]---
>=20
> thanks,
> Deborah

