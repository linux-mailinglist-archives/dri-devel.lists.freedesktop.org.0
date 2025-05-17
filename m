Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE08ABA9B7
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4710E15B;
	Sat, 17 May 2025 11:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TXRbP8y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BE710E161
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 11:33:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAA9F449BD;
 Sat, 17 May 2025 11:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C45C4CEE3;
 Sat, 17 May 2025 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747481582;
 bh=nvUDJu0WsfpAmDEPoWyIWd0OXbpNQ42B2nsNajcEZ4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXRbP8y5eKIQFjde5fydfc9KTMZ4Sz8t07M/RWv5PyHUUejlp5nmUb7UF7yDdoWeu
 eMOej3/UZBvTwjdoXJlZXypad7tYRrtdvkoZADauhBGKTLFayyF6mOS9rTbk9vyOss
 ZbW5JAVSUWVAYH3FwFSJ8b0tY5nSIlqcuGGKKDrioda8cQo4mmc2z8wy+JMuRXWkLC
 7ATbts9u2mgx0tO+iT9bx2QQdKO/rUvp5RvESzY2cUB1OC6EKJQG4zrzz0n/YOocYH
 xtxYlpvqUsk+imzOTulU6px74UffzrgWmULhkR3qB1KYP2AW9loQlJYOG68nRsMVc2
 L+y0a/kzXmr1Q==
Date: Sat, 17 May 2025 13:32:55 +0200
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
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 2/4] rust: drm: gem: Add DriverObject type alias
Message-ID: <aChz53fBhYlf3DeM@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-3-lyude@redhat.com>
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

On Fri, May 16, 2025 at 01:09:17PM -0400, Lyude Paul wrote:
> Now that we've cleaned up the generics for gem objects a bit, we're still
> left with a bit of generic soup around referring to the Object
> implementation for a given driver. Let's clean this up a bit by re-using
> the DriverObject identifier we just freed up and turning it into a type
> alias for referring to a driver's gem object implementation.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
