Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCytAKxap2kThAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:03:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852941F7D43
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE44910E078;
	Tue,  3 Mar 2026 22:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ctwkj3Xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6910E078;
 Tue,  3 Mar 2026 22:03:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6836F60097;
 Tue,  3 Mar 2026 22:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E164CC19425;
 Tue,  3 Mar 2026 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772575398;
 bh=Sk2JKtIHDvQurEEWouMfvz+cHNgcAnRyc1bQSMn+1lY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Ctwkj3XumUq7AeupEpmrvj6P7ij2aVenRXPJpQdjTSr/wLoZRs6f81RXxAWibsli3
 Etyf6sg0QMaJujUpLJjaPdKT5q8BhnIIxEez+/hCVUCg0UO3hfebjRjittFayAGEn2
 BLUt/UedCud0h6MguzRzATsNFG7B4hWj8no0EMvrZp1A9uZ4o7THhliLRCxISp3SR0
 oc2dlMxa/fEolNyUdjAF0OPIRmEdVL9wfidCgKtj5W43pRUvcn7C29Em12zidHYrUl
 gQo771D+DHiJCSMN6N6tKp+ybFFQx7oRu7tLwsOjwUVQDP07w2QMFoaxXecDkdLWZs
 FCUYfEe2rm5VQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 23:03:13 +0100
Message-Id: <DGTHJ9WTIIMY.14J3QXBSDAE6D@kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
Cc: "Dave Airlie" <airlied@gmail.com>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <arunpravin.paneerselvam@amd.com>,
 <joel@joelfernandes.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
 <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
In-Reply-To: <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: 852941F7D43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,garyguo.net,google.com,umich.edu,redhat.com,lists.freedesktop.org,nvidia.com,amd.com,joelfernandes.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 10:43 PM CET, Dave Airlie wrote:
> On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote=
:
>>
>> Hi Danilo,
>>
>> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
>> > >
>> > > +RUST [GPU BUDDY]
>> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
>> > > +L: dri-devel@lists.freedesktop.org
>> > > +L: rust-for-linux@vger.kernel.org
>> > > +S: Maintained
>> > > +F: rust/helpers/gpu.c
>> > > +F: rust/kernel/gpu/
>> >
>> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Mayb=
e you can
>> > offer Matthew and Arun your help.
>> >
>> > Also, this wouldn't be a subentry of "RUST", but the rust version of G=
PU BUDDY,
>> > so it would be "GPU BUDDY [RUST]".
>> >
>> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRA=
STRUCTURE
>> > [RUST]" entry.
>>
>> Both these additions sound good to me. Just to list all the options belo=
w
>> so we save time on what we all agree on:
>>
>> 1. New GPU BUDDY [RUST] entry.
>>
>> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>>    [RUST]"
>>
>> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>>    myself and Alex as R:/M:
>>
>
> Number 3 please,

Just in case it wasn't clear from my suggestion above, please also do 2 in
addition.

Thanks,
Danilo
