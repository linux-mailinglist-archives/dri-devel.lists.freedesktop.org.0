Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xa6GJx0KfmkAVAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:56:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A10C2167
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 14:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A1510E227;
	Sat, 31 Jan 2026 13:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxtdhDRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9310E227;
 Sat, 31 Jan 2026 13:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 52C99434BD;
 Sat, 31 Jan 2026 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349E6C4CEF1;
 Sat, 31 Jan 2026 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769867800;
 bh=Va3K+D30hZz0SN78oYxnmFtW/3mJg2NP0XZBLy7kYno=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=XxtdhDRaTFlFWArBkMQIoiYLwTVbVvlnRVj+oPvTRh6VHhtPmeTeAg0yCVPFs1tTm
 2a35Vw6bDtIhUW5ADup/M9vKLuZZNdl1jqsnaoKnsmKbXgJN9jt2zqiACkxr48wgs1
 1mEXdiwB2feodPC0/3tYGW9twh2lDcqpJuNzlTWf7JYwEuZBGxg70IRb+TJ9YgiPtv
 T75RMvNu5A7rE/1lU0Z9SzPj4GFsBzXQHKhz/KVE2PJPUkwGrqW8nAqhIDOUnV4kp/
 6N7dzdNBXZh23OKUXsG5ACyh72nzOcTPkU8bmgvP4VRojpviA3rPogml3K+ggpRe99
 SFvPWcNLbzQtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 14:56:34 +0100
Message-Id: <DG2TRSA2LOJ4.3PMICD9ORSB5R@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
 <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
In-Reply-To: <DG2SXGUZPEUW.3SYUJHY0GZUWT@nvidia.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,ffwll.ch,gmail.com,collabora.com,arm.com,kernel.org,garyguo.net,protonmail.com,umich.edu,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 20A10C2167
X-Rspamd-Action: no action

(Cc: Lyude)

I assume something odd is going on with your mail client for people that ha=
ve
been added to a thread later on?

On Sat Jan 31, 2026 at 2:16 PM CET, Alexandre Courbot wrote:
> On Sat Jan 31, 2026 at 9:27 PM JST, Danilo Krummrich wrote:
>> We've just generalized I/O to support arbitrary I/O backends (busses, ba=
cking
>> storage, etc.).
>>
>> With this we can wire up the I/O traits to DMA and generalize the dma_re=
ad() and
>> dma_write() macros accordingly. I.e. we can extend the I/O traits with
>> field_write() and field_read().
>
> With the caveat that the I/O traits for now only support accessing
> primitive types; is the plan to add a function to read any type
> implementing `FromBytes`?

That's exactly what I say above: generalize the dma_read!() and dma_write!(=
)
macros by adding field_write() and field_read() to the I/O traits. :)

For reference, this is where I brought this up originally [1].

[1] https://lore.kernel.org/all/DFOP5BY09539.AFY5L5FV1HNV@kernel.org/

>> (Lyude is going to work on this as a more integrated alternative to iosy=
s_map.
>> It would be good to align with her regarding this work.)
>
> Heads up, I am also doing some plumbing in `io.rs` related to the
> register macro. Maybe we should have a thread on Zulip to discuss what
> everyone is working on.

Done!

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/Generic.20I.2FO.20backends/with/571198078

>> This has the advantage that we don't have to duplicate all this infrastr=
ucture
>> for I/O memory, DMA, etc.
>>
>> I also think that CoherentSlice is too specific of a type. I'd rather ha=
ve a
>> generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backe=
nd for
>> accesses.
>
> For me the main appeal of this patchset is that it provides a way to
> work infallibly with a single object or a fixed-size array. I hope
> that's something we can preserve.

Of course, the generic I/O backend infrastructure is based on the distincti=
on
between compile-time and run-time.
