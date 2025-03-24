Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB4A6DCA1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CBC10E42A;
	Mon, 24 Mar 2025 14:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="dgM8qoQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921B10E413
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 14:10:52 +0000 (UTC)
Date: Mon, 24 Mar 2025 10:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1742825449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5QavDf4YfF4g6incDfR8g3M+4C53fdbJxU8hmz4md/c=;
 b=dgM8qoQKNJIEi0dY32L6hBabt7HjG8XUm1NhIZaImSKprfR8JXsfBfhH9cTCPrcLg9wfGD
 o23+bo8cMWxTi36khM1fvKGG4apkYQpsaXdP8sgYZRtIQ6jZU1waJ/RfnEJxDXhZnj6hMt
 l4zSCzE8vSv3ylcINppjWvFaV7fjmBwjcieTx3E9R4I0dwULWMbcw+IcB7uU72j8Pi/ESl
 15pJTFdt9S+sGypIz635REFAIlyLDRUk/TZpfAg/E3oncgVQLclL0tPPh5xQu2kDhPTHMJ
 CFfNp00ClfbxNtP9JaOZCdso+fJ06mjS+jj+Drg6EAouBFLpdKHMNTre/Gp2cA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Message-ID: <Z-Fn4niI6_Yd06Ze@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <195b507d4b3.b25d0dad175771.7566427576910952468@collabora.com>
 <195b582682b.121ba4d5e219032.3109114844776468245@collabora.com>
 <Z-B6uc7EEAdBPXmt@blossom>
 <260D98E1-7204-4535-A84F-D55A4527FF7E@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <260D98E1-7204-4535-A84F-D55A4527FF7E@collabora.com>
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

> >>>> +    /** 
> >>>> +     * @DRM_ASAHI_BIND_SINGLE_PAGE: Map a single page of the BO repeatedly 
> >>>> +     * across the VA range. 
> >>>> +     * 
> >>>> +     * This is useful to fill a VA range with scratch pages or zero pages. 
> >>>> +     * It is intended as a mechanism to accelerate sparse. 
> >>>> +     */ 
> >>>> +    DRM_ASAHI_BIND_SINGLE_PAGE = (1L << 2),
> >> 
> >> Does this require the BO to be a single page? If so, does it require offset==0? Or does it just take whatever page is at the specified offset?
> > 
> > I believe the intention is that it takes whatever page is at the
> > specified offset and just maps that a bunch of times. HK doesn't use
> > this yet though it probably should (this was added to help reduce
> > overhead when emulating sparse with scratch/zero pages, which is still
> > very new functionality in hk).
> > 
> > Accelerating this properly involves GPUVM patches - although even without
> > that, moving the loop into the kernel so it's only a single ioctl
> > (user-kernel roundtrip) seems worth keeping the flag for.
> 
> FYI: I will be posting a patch for the GPUVM abstraction soon.

Great to hear :) Although in this case, I meant that accelerating
DRM_ASAHI_BIND_SINGLE_PAGE requires patches to extend the actual C
implementation of drm/gpuvm, not just the Rust abstraction. Which is a
bit annoying for non-essential functionality with regards to upstreaming
things...
