Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FjWKqrxmGmnOQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:43:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F416B6CD
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15410E852;
	Fri, 20 Feb 2026 23:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="akoM+guz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F210E852;
 Fri, 20 Feb 2026 23:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DFF0A60123;
 Fri, 20 Feb 2026 23:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1CFC116C6;
 Fri, 20 Feb 2026 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771631011;
 bh=AYjchzzoyLOBMqiFo72PIrY6DUb60UnluRtgVjVXLLk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=akoM+guzkSTD0GY5Z6qkvYPbymswvNkiW9PlLdzyAKaTZ/Y8DloAvXb2sb+PFxdAw
 /Wh4f51MB6r7/zJtTlVEYZIvGubkPVWJOa8GrSAhG8fynC7ZcyhYRuWL3arrhumFqs
 uSO9JifNmrt48lWDZ0rNKj4cY49PrxH33sIwP4cDTdbMQgnvhoT9LnUQlU00VwjoOI
 dOPfLDC/UNRDWSYwAGXJqMu0QhCnXynq5eFcsx0RGiVgrXmfQbO69/nKtR8gXb0zYk
 BatyUUs5cD9jlHjJC8l3HL3ClcdRd+dAcodT51lJMuj2Leu7amW15xphrTM5APbntk
 YQVqn/dCrhWsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 00:43:26 +0100
Message-Id: <DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
 <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
 <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
In-Reply-To: <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,buddy.rs:url]
X-Rspamd-Queue-Id: 2D3F416B6CD
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 10:20 PM CET, Joel Fernandes wrote:
>
>
> On 2/20/2026 10:53 AM, Danilo Krummrich wrote:
>> On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>>>
>>>
>>> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy =
*mm,
>>>>> +						   struct gpu_buddy_block *block)
>>>>> +{
>>>>> +	return gpu_buddy_block_size(mm, block);
>>>>> +}
>>>>> +
>>>>
>>>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>>>> doesn't appear to be used in buddy.rs.
>>>
>>> I think it is worth keeping because it is a pretty basic API the underl=
ying
>>> infrastructure. Finding the size of a block can be important in the fut=
ure
>>> IMO. It is only few lines, no?
>>=20
>> The helper should be added with the code using it.
>
> I will add this as a test case to exercise it and include it in that patc=
h.

A test case for a helper? Or do you mean you will add the actual abstractio=
n?
