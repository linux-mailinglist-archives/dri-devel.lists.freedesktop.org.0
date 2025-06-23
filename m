Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23175AE3810
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3C410E0F6;
	Mon, 23 Jun 2025 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DC4A10E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD0B113E;
 Mon, 23 Jun 2025 01:14:23 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E9A3F63F;
 Mon, 23 Jun 2025 01:14:36 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:14:28 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFkM5NC-VL8oExwv@arm.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org> <aFRi8cqkIzOAIbeR@arm.com>
 <49BDC70A-7CBF-4C2F-955F-B680DA0BF30C@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49BDC70A-7CBF-4C2F-955F-B680DA0BF30C@collabora.com>
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

On Fri, Jun 20, 2025 at 10:42:09AM -0300, Daniel Almeida wrote:
> Hi Beata,
> 
> >  There is no concurrent access nor shared references, unless the
> > handler decides otherwise
> 
> It can’t do so in safe code. There is no way to manufacture a shared
> reference from a mutable one in safe code and if it passes that to C, then
> it’s already using a unsafe block for the ffi call.
> 
> Unless I missed something?
I do not think you have, though my comment wasn't meant to suggest anything
otherwise, merely emphasising that up to this point, the code upholds
Rust's safety guarantees.What the handler does afterward is a topic for
another time (change).

Hope that this makes the intent more clear (?)

---
BR
Beata

> 
> — Daniel
