Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6686A7352E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 16:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1837E10E068;
	Thu, 27 Mar 2025 15:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BE710E068
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 15:01:23 +0000 (UTC)
Date: Thu, 27 Mar 2025 11:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1743087681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IcvekZQH+j+p97YeB4/yEpAZzvs9KIEsKULl/WK/9vQ=;
 b=PBKCEw+kRjk95sKh2ZN02rlprYFY1nx3B1WFeMmw7eLoMLXmyGrSSLAxXkStIsfagZ8zmt
 T0udX4ZTrsEPWsOGQl/xc4tctgdpgepLyZMh4KsRJGGfbfNGtotW+VZAuorJzQRKIjTMky
 GQ4SPU30Sh6aswM8Z8+OQya2j/4jo57b6G1LEc/9Ay2kuP0t0c9lluUYtYgCAvhMalgSUI
 HHvev9srG7jpm8+sI+1kgVsJ96knrCfxNuQyGHO3kTVcCGx9BJt0XOPYxUr8EERyuaen9S
 hKKn/BEI08vUpHLo7MJAJJmATNahJhpRf5mDypvOmC/qWx+5yc61WPwQX31eLw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neal Gompa <neal@gompa.dev>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Jonathan Corbet <corbet@lwn.net>, Sergio Lopez Pascual <slp@sinrega.org>,
 Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5] drm: Add UAPI for the Asahi driver
Message-ID: <Z-VoO7l5xzuN5RUX@blossom>
References: <20250326-agx-uapi-v5-1-04fccfc9e631@rosenzweig.io>
 <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg-Je9G23mXWTHbnuozsrRY8+03tfq7uT=St+KgLvq1RggzmA@mail.gmail.com>
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

> > https://github.com/alyssarosenzweig/linux/commits/agx-uapi-v5 contains
> > the DRM driver implementing this proposed UAPI.
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33984 contains
> > the Mesa patches to implement this proposed UAPI.
> >
> > That Linux and Mesa branch together give a complete graphics/compute
> > stack on top of this UAPI.
> 
> Do we want these links to be present in the commit message? I doubt
> they'll stick around permanently...

Permanently, no. But by the time they go dark, the relevant code will
hopefully be upstream in both kernel & Mesa. So I'm not worried. Not
really weirder than any other links in commit messages we have.

> This looks good to me, and the referenced integration code also looks good.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>

Thanks!
