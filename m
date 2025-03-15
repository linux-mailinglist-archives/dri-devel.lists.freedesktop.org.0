Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A3A62AB0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 11:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648FC10E14E;
	Sat, 15 Mar 2025 10:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="I0bXoVB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC110E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742033405; x=1742292605;
 bh=+Tktglt/oH5/YnWGKr/OddZjWfCWSqMjnQ64O9FHmDM=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=I0bXoVB+OWHVNgc3HMgIuPVU+p/6bThJWO1NkdGbQPljgBWSImAcyTx1hGOIyVouk
 ffVw0k2EjyPfXvzHFcI9V9aCXxUnOibwaXlobiEs1L5cOb80iAP81Mp0klnZ2iCIt+
 k/ChR26PSebdG0O+02NtqXozMb75veZkQ7Cvfe4bCYZm5sC1ahnAEWPS7FgsnGA0QW
 k3vzLET9v6+VC2UYuJNL1Ppm65Q6KcnOJPwLoBt/6BSXZQCp84BYzCxwQJRa4A6B4d
 PNSwgLObwJnq7+f4Jot97HHE9tQjcG/rwXboNAYh28maa6PFrjcnKWsJDofesPCgtl
 2jxHYqvoAG0ow==
Date: Sat, 15 Mar 2025 10:10:00 +0000
To: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH 2/3] rust: alloc: add Vec::resize method
Message-ID: <D8GRASU6UVLX.3C8EMGGXM35O0@proton.me>
In-Reply-To: <20250315024235.5282-3-andrewjballance@gmail.com>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
 <20250315024235.5282-3-andrewjballance@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0b0b71ccc623222af72834b86048786342382325
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat Mar 15, 2025 at 3:42 AM CET, Andrew Ballance wrote:
> implemnts the equivalent of the rust std's Vec::resize
> on the kernel's Vec type.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/alloc/kvec.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

