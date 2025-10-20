Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D02BF0AF1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411CA10E036;
	Mon, 20 Oct 2025 10:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sl+esGa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104D410E036;
 Mon, 20 Oct 2025 10:55:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B68C844434;
 Mon, 20 Oct 2025 10:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E61CC4CEF9;
 Mon, 20 Oct 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760957741;
 bh=uC+F4hjC0D1yhlt0xsyozjJVS3Lpb6RusO1r43Kgmj0=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=sl+esGa/8myi9GoV2OwltDRjEP3W8XhZRukTK6MVfYJWxfSewD1LzNBRT71i7r+nQ
 2JfTaxOsjv4jcHMgEBCoZmmr6NHMCxUxu77EcXN8wS7GOrDrg+onshf1IMbLrywhGg
 Zr8fQBf0hTpP/2+hKQh/xaawB76xvCMnUm89uWBewG639WlVUEhxQytoVRxQhNjGV5
 x+MzntxDUiNmDbMhCpxUN+bfwQ9rOgK2N8u1DJIxrsUkfLqPs1kjf4K6L7DR35U6ni
 128SHWV4bKciaxud6D/03l2yDFU/ly36gJbtFlj3Eb9nwe54gSer62C4gTPH2VIwQS
 lbcty+XTZKbtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 12:55:35 +0200
Message-Id: <DDN3F3P3OW77.1BXSJUPMQ0MWN@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Cc: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDMWPMS0U5PK.3IW61GCOI3GZB@nvidia.com>
 <DDN2ITDOVCEV.50CEULQSFLVO@kernel.org>
 <DDN3BGP9270Q.28ZV9MAWO3CUC@nvidia.com>
In-Reply-To: <DDN3BGP9270Q.28ZV9MAWO3CUC@nvidia.com>
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

On Mon Oct 20, 2025 at 12:50 PM CEST, Alexandre Courbot wrote:
> On Mon Oct 20, 2025 at 7:13 PM JST, Danilo Krummrich wrote:
>> On Mon Oct 20, 2025 at 7:40 AM CEST, Alexandre Courbot wrote:
>>> The alternative would be to have const functions like `usize_to_u64`. I=
t
>>> doesn't look as smooth as the extention trait, but can be used in const
>>> contexts.
>>
>> That's what I thought of, exactly for the reason of being usable in cons=
t
>> contexts (at least for a quick fix in nova-core).
>>
>> Whether we want an extention trait and a separate temporary const_usize_=
to_u64()
>> etc. can be discussed in the context of making it common infrastructure.
>
> Thanks - so IIUC the idea would be to keep this local to nova-core in a
> first time? If so I guess I can produce this fast (and convert our many
> uses of `as` in the driver so far).

Yeah, I think that's reasonable. We can do both in parallel.
