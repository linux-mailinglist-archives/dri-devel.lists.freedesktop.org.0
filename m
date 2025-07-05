Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED522AF9FC6
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 13:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167110E20B;
	Sat,  5 Jul 2025 11:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aafTTmDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3026410E0FD
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 11:06:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D52CFA51FFE;
 Sat,  5 Jul 2025 11:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0E3C4CEE7;
 Sat,  5 Jul 2025 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751713588;
 bh=9mv0UxhGjH2mL6KMOypiQnTrOj6P8HKSW5WCnLKIHyo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aafTTmDmBLWRKGomxX2C4LHrmnv/oV98ZkaEj/FkfFxKgK4ZeAx3vbutrx+H1jDfV
 oDBvmttYEiCi/VTvZ0DTba295JD/uAOcDTkzCkD9HIYvXG/aTMWDXOL7+JISi/B/+C
 IYjv4VznW8PA3o6bBBYNiS2sX13T5FqW03KM/YQp4iDMN6CgPuybf09N9pO5kwDblQ
 /Lad6++1ZQ9PzfmpuUX8AT8Z8Rc8GMX1lqnnpfAyxWRBmYGiI+wRd0PwZ6x8Sfhkpj
 RmWqx4TlyUj0ffFYalN0H2yybq79thzskSWo9Hv00Zji5g6oY0NkUwccJIapo18hqM
 r4xu14tfn231g==
Message-ID: <07058db5-e56f-4771-9d6d-93c5e853af6d@kernel.org>
Date: Sat, 5 Jul 2025 13:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: drm: remove unnecessary imports
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250704-cstr-include-drm-v1-1-a279dfc4d753@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/4/25 9:50 PM, Tamir Duberstein wrote:
> `kernel::str::CStr` is included in the prelude.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-misc-next, thanks!
