Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAF4B51A00
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B7710E933;
	Wed, 10 Sep 2025 14:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ydi+fp1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B602410E933
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:47:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C32944C60;
 Wed, 10 Sep 2025 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F3FC4CEEB;
 Wed, 10 Sep 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757515655;
 bh=zTgMOjpepBy/l2UTo0fo6Ntsz4DK/OWhGhpf4R9a+4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ydi+fp1Jt87eJIKw8OFpw6tqu5Ch9Xe+ed5u5rKbNYXbeiJj01R2EEYYCcZvVED7Z
 kCSgvu08M9lTjNORFJ/abqMnjgCBSymroRe2aYkpEIDXk1sr4LJ0QKUq5EUxXQZZIh
 EfocJdkvV8gq15uqw5vP8eGlUphjSvBoOBUhWc39RlNXVcY4j136finQanDvzcSTVO
 XAmmLe890dR7Yg9Yg77vM9J49jXZ0ZLYyjmzcZT3M2VdyBlO6mcBPg4KO9zwcKfJ0q
 qXkCreeNAnKE4gYgtruK9cBQ/wXwLnyvYhW1te+QoT32dkdJ8KcfEflTZVaL+YjfSX
 CKcGg8txQGOOg==
Message-ID: <a82b9810-c3f5-4351-a796-e639c937f4d7@kernel.org>
Date: Wed, 10 Sep 2025 16:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 Steven Price <steven.price@arm.com>, Jeffrey Vander Stoep
 <jeffv@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
References: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
 <b44ca395-102e-4780-949d-9d656ba18ec0@kernel.org>
 <50CC05D3-CCF5-44AA-9E8A-71DA8733B78E@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <50CC05D3-CCF5-44AA-9E8A-71DA8733B78E@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/10/25 4:43 PM, Daniel Almeida wrote:
> Fair enough, perhaps a quick v4 then?

In case this remains to be the only change you could also fix it up on apply.
