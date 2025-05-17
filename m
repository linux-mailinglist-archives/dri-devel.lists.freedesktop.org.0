Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A7ABA9C0
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CD010E161;
	Sat, 17 May 2025 11:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XDbKXMGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFD510E161
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 11:38:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B8E65C10AE;
 Sat, 17 May 2025 11:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16928C4CEE3;
 Sat, 17 May 2025 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747481881;
 bh=XDH5YfoUIxo8cwAdSIiAAjMA2NdaDkqxL/tY8At99M4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XDbKXMGT0o5EQJy+NPbLUoh7ZMK2L1aOFf4URQWdtZyujtyPSxerVcaEy4TojPjRB
 xVFjgiD24YXe22P7XC/n6UG3TA921X5kXcIiReborgp3wKx42ZkEydzNrUZoq2S6Gs
 5DZ9+C5R5qHfq13NGU2UongsbYJcgYwLMH7w12FT0eaTlTPlFT0WAE6Wps/POdJZIX
 fRjteMPOxofvukTJ7K+DvQ1VoB44OfFVnKHDQmHnMbN7+0VW4l62+HpRkYsd48u/L0
 dRfYp4lHhG5JMjKPJjiTsX1T4tGd1ojBN1L1V86Jp48pkkYlbyE/cpUkVYqqmwFOSo
 LnpJu8oCqQdPw==
Date: Sat, 17 May 2025 13:37:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v2 4/4] rust: drm: gem: Drop Object::SIZE
Message-ID: <aCh1ElBmXs6ZKYQ2@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-5-lyude@redhat.com>
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

On Fri, May 16, 2025 at 01:09:19PM -0400, Lyude Paul wrote:
> Drive-by fix, it doesn't seem like anything actually uses this constant
> anymore.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
