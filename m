Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49265ACD013
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BFE10E6BC;
	Tue,  3 Jun 2025 22:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vR4WSSkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047C510E633;
 Tue,  3 Jun 2025 22:54:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 889924A519;
 Tue,  3 Jun 2025 22:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACD1C4CEED;
 Tue,  3 Jun 2025 22:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748991242;
 bh=/WogzThYcDrkaGD5+tbfG99pqzoVtuU8upkXweLfeGg=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=vR4WSSkwjWc7+MIDx5kQ7h1lUGN9qHfwZaooBTnk/6jljnxEf7hIBnCavCXqPy66J
 g3p0hWqc8Og46r80WqG/38Gq3HwyBJGBbnZGvS7uxDvo9oEymBi5+IiPpnP4+RXlx8
 Xp9ueXLfWQTAA3lrebMVjTL8OtM6F7hqMehMefM7GW8f3Y3QTmraILDfnmgE69LEe6
 fIqGDpAFMDB1U1poNrQaGZQZdkjFNd2zG/FHoioroboHQjxY24rMRAs2BT4ZKHOjYk
 BcbfQ/6yvZYiSRkNYVu62yPX9WrGdhc2ls2/hmsXxnlvL7VzsZqLwG+PD5YX/IIsXb
 A2O/oYXdRRVWA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 00:53:55 +0200
Message-Id: <DAD9NDFY2RXV.3LDMFVUYN0IKD@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org> <aD1xVkggDrCvA7ve@pollux>
In-Reply-To: <aD1xVkggDrCvA7ve@pollux>
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

On Mon Jun 2, 2025 at 11:39 AM CEST, Danilo Krummrich wrote:
> On Thu, May 29, 2025 at 09:27:33AM +0200, Benno Lossin wrote:
>> That's also fair, but we lose the constness of `next_multiple_of`, so
>> you can't use `align_up` in a const function. That might confuse people
>> and then they write their own const helper function... I'd prefer we use
>> all functions that are available in the stdlib.
>
> Considering that, what's the suggestion for this trait?
>
> I don't think we should have a trait with align_down() and fls() only and
> otherwise use next_multiple_of(), i.e. mix things up.

Agreed.

> I think we should either align with the Rust nomenclature - whatever this=
 means
> for fls() - or implement the trait with all three methods.

The longterm perspective would be to choose the Rust one. But I'd also
understand if people want the kernel's own terms used. Still I prefer
the Rust ones :)

---
Cheers,
Benno
