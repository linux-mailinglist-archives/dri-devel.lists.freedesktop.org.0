Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE7BB7B87
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54310E950;
	Fri,  3 Oct 2025 17:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="JwFBJbaa";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="nE9vk/bI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0901D10E950;
 Fri,  3 Oct 2025 17:25:26 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 4AEA3EC0213;
 Fri,  3 Oct 2025 13:25:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Fri, 03 Oct 2025 13:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1759512326; x=1759598726; bh=80zTLlNJzL
 69CstAw641a6XukyfcEwp1lxsA+QkUUPA=; b=JwFBJbaaRt/nqg+vVt7bZic0JU
 1GG0iknvBOLM6mMBiNUTG+6a/3VwxL13MFucddigVSTFQ+js7H5k6qPjDDmDQFhn
 IRdBwg6gl9vWgBuYAL/a2w6XUNueG0AvPZNmvZza7DLsNXjEAu76gvpSJBSoTAqd
 7c7HZBx5DYxp+kY9ZYZTX6xenM1io/A3QZaI7k4gq4QN6UlzDmAw5Fl22TwXiLbP
 KxLxGIvDoShk0KeLFOvO2AdEhFpanCyKt0IHr37w+K/r7VMYJ9Zo3QPKIAxa4ofc
 Bl9TwdFP2OB05TfyraSog0OO7C+apf+TNVwYlZPMnW2/5qpOvkg4PAQc178A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1759512326; x=1759598726; bh=80zTLlNJzL69CstAw641a6XukyfcEwp1lxs
 A+QkUUPA=; b=nE9vk/bI9WxRJaqgCcF4FUfBATlqE/SIujNFseORpqgb9oGu0TU
 7a/FRpUlAU4Y3iMQeH9vUPIn/HdMCK+1DY+QWpa9231HXKe8ZijAnippqPiSLoYe
 J9XN6Zlp3YgM6Mg1fhy5Tmxf/TTdxFo/2qeiCqiX3ncWjiMsJsNWq8ioWyRvGIWL
 Z8f1BzjMAzcdrwX+KC1AKfCcuSXSwQ7PXaBITzSsDzxQaJeck9TUuZhDLukbd3Ja
 hmln0h3uQ2uYpdABdtfXE6H5y5tdvjhfq/ToVeSivSq4xqhq8+K1otHA5Q5SUGcS
 jIN9Gl6zdsLjh9cgiBvK71Mng34MOJmitZg==
X-ME-Sender: <xms:BQfgaK0s9bz71HRzDdcCzkofTBDXwamsY1LAuEdRlWPU4MGxnJUMGg>
 <xme:BQfgaIGE32EnaFYFnc000ieZYcqTNJqZvPQBJn4XLQOgSZTezVgqX985L-GZ7fwev
 uaxIt0F9qFXVFWy-NYsPoahcXBxuqFZV5tVb15bSvWilSHHP9JpgpU>
X-ME-Received: <xmr:BQfgaJij61ATHgaTelHGIeImqKgTwJ4QoAjywWu2tsiizeFXg_2QBA7kMLoA6WjWACrcVP26Qp4WamvThvbCYqU3N8gSJHu3Yp_kgu8W3sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekleeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepudefhf
 ehudetjeeutdfhvefhtdeltdfgheefkeefleegveevtedtveelfffhiedtnecuffhomhgr
 ihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvdeg
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrd
 horhhgpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphht
 thhopegrphhophhplhgvsehnvhhiughirgdrtghomhdprhgtphhtthhopehruhhsthdqfh
 horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhi
 qdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoh
 epuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpd
 hrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:BQfgaJdJuMiVM0mL5HUBuq92XcG0QHrRS6GLnSYY3bYcYfHiOOZ3_w>
 <xmx:BQfgaHwluiGRTue-YMovY9T9fTXhYYlyVDEZ7fA755zyfd8IPPIJeA>
 <xmx:BQfgaLaM4QgaUrIyiMc1a29mHZOq0oE1UWLcA7-ulbneamevMW4XxA>
 <xmx:BQfgaNK5hiDFUgAVrD-Ur6gAIlLUM_H9kkt3CdiR1VKl3xJLt1L2nQ>
 <xmx:BgfgaN_4owHecfQcS1nCMS0N6jNHBsF8eTLZL_QWqc7hrKrSnGFO3fcw>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 13:25:24 -0400 (EDT)
Date: Fri, 3 Oct 2025 19:25:17 +0200
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Message-ID: <20251003172517.GA1574227@robin.jannau.net>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
 <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
 <DD8TZ3TU57L3.2958OTC9UP4VF@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DD8TZ3TU57L3.2958OTC9UP4VF@kernel.org>
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

On Fri, Oct 03, 2025 at 06:34:12PM +0200, Benno Lossin wrote:
> On Thu Oct 2, 2025 at 3:49 PM CEST, Alexandre Courbot wrote:
> > Hi Alistair, (+Benno as this concerns the `init!` macros)
> >
> > On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
> >> Adds bindings and an in-place initialiser for the GspSystemInfo struct.
> >>
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >>
> >> ---
> >>
> >> It would be good to move to using the `init!` macros at some point, but
> >> I couldn't figure out how to make that work to initialise an enum rather
> >> than a struct as is required for the transparent representation.
> >
> > Indeed we have to jump through a few (minor) hoops.
> >
> > First the `init!` macros do not seem to support tuple structs. They
> > match a `{` after the type name, which is not present in
> > `GspSystemInfo`. By turning it into a regular struct with a single
> > field, we can overcome this, and it doesn't affect the layout the
> > `#[repr(transparent)]` can still be used.
> 
> Yeah that's the correct workaround at the moment. I'm tracking support
> for tuple structs in [1]. Essentially the problem is that it requires
> lots of effort to parse tuple structs using declarative macros. We will
> get `syn` this cycle, which will enable me to support several things,
> including tuple structs.
> 
> [1]: https://github.com/Rust-for-Linux/pin-init/issues/85
> 
> > Then, due to a limitation with declarative macros, `init!` interprets
> > `::` as a separator for generic arguments, so `bindings::GspSystemInfo`
> > also doesn't parse. Here the trick is to use a local type alias.
> 
> This one will also be solved when we switch to syn.

I was planning to submit
https://github.com/AsahiLinux/linux/commit/2d95fd3b6c359634a0976f27f7a3c667826256da
https://github.com/AsahiLinux/linux/commit/515638cb47cf0ebdac378686fcbbdc6a8364096a
from the asahi downstream tree after 6.18-rc1. Does that still make
sense timing wise?

Types with type paths are used extensively in the asahi driver but I can
initially work around that.

Janne
