Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3873A815B6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E410E17F;
	Tue,  8 Apr 2025 19:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l7uwt9Jn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A610E725
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 19:18:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38B4343DF4;
 Tue,  8 Apr 2025 19:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E84C4CEE8;
 Tue,  8 Apr 2025 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744139891;
 bh=OFp36ZrwylnM8HdDNF4FJoUbKWi2vaQLcRpFjCDvDlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7uwt9Jn536qNHg5xlaKPEyqnkqiAnhx3rbol2BZk7jKQ+5WUxF0E44LeT9amX0Zv
 zy+mYfpJ1Yovn9fVEaJiQjesdX+QhF69DBZw+gGr/RTmwD9LcX/U0G4gJZ8FWXIpLt
 FFH8hohies+hZGu1mzDWU184QLZhEfoM2XBEol+s7sgOkB/B5aK2laN7yFunWvSGl5
 4YDNbe0xdxHN4unGgt3xvPlsStLwtwxtwhlMUifsDFmb0fjXBUZvteicrwIvssBve0
 1lFp58VVyeGnHC2ARoH69WamCgS2/jNpYmY6zwx9qTQ6zOXU3f1xV1d2r03sFwcZLj
 iTPHm5S/J6rEg==
Date: Tue, 8 Apr 2025 21:17:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] DRM Rust abstractions
Message-ID: <Z_V2ZxIZxI_HiHM5@cassiopeiae>
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
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

On Wed, Apr 09, 2025 at 03:06:38AM +0900, Asahi Lina wrote:
> On 4/9/25 2:04 AM, Danilo Krummrich wrote:
> > On Wed, Apr 09, 2025 at 01:29:35AM +0900, Asahi Lina wrote:
> >> On 3/26/25 8:54 AM, Danilo Krummrich wrote:
> > 
> > You said "use it/submit it in any way".
> 
> I thought keeping authorship is an implied part of kernel etiquette.
> Usually when you submit code someone else wrote, you keep them as
> primary author... I want you and others to use the code, that doesn't
> mean I want you to put your name on it as if you wrote most of it.

The broader context of the private mail was about you stepping back on kernel
development. You did so with a few more details (which I'm not going to
disclose), that made it clear to me that you don't want to be bothered with
kernel development any more.

In combination with you giving permission to "use it/submit it in any way", I
thought it's better to just pick a safe path to not misrepresent you given all
the changes I made.

I do still credit you on all corresponding patches though.

> >> I'm really tired of kernel politics and I don't want to spend more brain
> >> cycles looking at all the other patches or having to argue (in fact I
> >> usually don't look at patch emails at all recently), but I would
> >> appreciate if you keep my authorship for files that I did largely author
> >> myself. After everything I've been going through the past weeks (some of
> >> the people on Cc know what that's about...) this feels like yet another
> >> slap in the face.
> > 
> > As mentioned, please diff the correct thing and then just tell me where you'd
> > like to have primary authorship changed.
> 
> I don't even know what tree this series is supposed to apply onto (tried
> drm-misc next, torvalds/master, v6.15-rc1) so I'm just going to take
> drm-misc/topic/rust-drm and assume that's what this series includes.
> 
> $ diff -urN rust/kernel/drm/drv.rs ../uplinux/rust/kernel/drm/driver.rs
> | grep '^+' | wc -l
> 45
> 
> So I'm diffing the correct thing now and the result is essentially
> identical.
> 
> Meanwhile, device.rs has many additions... but a big chunk of those is
> code that was just moved from drv.rs (like drm_legacy_fields and the
> code that uses it).

Except drm_legacy_fields! and VTABLE (which is just trival boilerplate code)
device.rs changed fundamentally, i.e. I switched the device abstraction to use
the subclassing pattern.

If you look further you will find that I really changed a lot of things.

I have *nothing* to hide, here's the overall diff for all the changes I made:

	[1] https://pastebin.com/FT4tNn5d

> 
> Again, I don't have the spoons to make some deep analysis here, you
> should know how much of the code you changed, added, or just moved
> around. I'm not going to litigate this further. If you think splitting
> up a commit into multiple commits and moving code around warrants taking
> over primary authorship of a project I've been working on for years now,
> so be it.

You just said you "don't have the spoons to make some deep analysis here" and
right below you acuse me of just "moving code around".

Which means that you do so *without* evidence. And again, I have *nothing* to
hide, see [1].

Besides that I also told you that I'm fine to change primary authership, if you
tell me where you think it would be appropriate (even though I do think my
changes do justify how things are currently).

> I'm just disappointed.

That's where you are maneuvering *yourself* into.

You could have easily just asked me to change things for patch #X, #Y and #Z.

Instead you outright started with accusing me of things. I also feel like you
intentionally try to misrepresent what I am doing and what my intentions are.

I neither have the time, nor am I willing to deal with random drama like this.

If you want something changed, just go ahead and tell me what, *without* more
drama and without more accusing me of things.
