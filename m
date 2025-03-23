Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA3A6D148
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 22:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49D310E074;
	Sun, 23 Mar 2025 21:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2924F10E074
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 21:44:35 +0000 (UTC)
Date: Sun, 23 Mar 2025 17:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1742766271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjI5CAIKnyK0cdKaefRJI+q3uIG7lhr68HrdHr6otHQ=;
 b=nZ9Le3K9grAmT8NSqrDY7VgqawNr/XTrJxRvN1cnBj5rG5ctGZFQCbYbmgaahOqfE4y8X6
 9KiTK78LgpYvRwVN+5zFnyPVfkywDFasGxtxhKNwLwWoFJmI3aEZJwku1/EAvQL4segCBL
 GKMhFQ9tW6Sie6nKkCQzSyxkQg/G91JQl5JBVLihPfSOBgK0Rw9zfLdsp5oL61XNAM2K4y
 EOadBxaZValTGWpyOOX2ozW/iNrMvBnfzLdCp+xW/A4nUucYKeDqrqta/rfKTlhwkGNgDe
 CZGYYmPXcuH8jntdQWJIvZ7MVHpgdSGE0X7sP901OWfGmctB8KHsZb9uFe7BFA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?=22Bj=F6rn_Roy_Baron=22?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Jonathan Corbet <corbet@lwn.net>, Sergio Lopez Pascual <slp@sinrega.org>,
 Ryan Houdek <sonicadvance1@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 asahi <asahi@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-doc <linux-doc@vger.kernel.org>, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CAtz-D-CslvABE@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
X-Migadu-Flow: FLOW_OUT
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

>  >  > +struct drm_asahi_queue_create { 
>  >  > +    /** @flags: MBZ */ 
>  >  > +    __u32 flags; 
>  >  > + 
>  >  > +    /** @vm_id: The ID of the VM this queue is bound to */ 
>  >  > +    __u32 vm_id; 
>  >  > + 
>  >  > +    /** @queue_caps: Bitmask of DRM_ASAHI_QUEUE_CAP_* */ 
>  >  > +    __u32 queue_caps; 
>  >  > + 
>  >  > +    /** @priority: Queue priority, 0-3 */ 
>  >  > +    __u32 priority; 
> 
> Is one of these priorities REALTIME and only usable by privileged apps? If so, maybe document that and/or have an enum?

Actually, I've reserved realtime&high but always deny right now to make
sure Mesa doesn't assume it can use them, then we can relax in the
future once the kernel permission gating is there. (Needs rust
bindings.)
