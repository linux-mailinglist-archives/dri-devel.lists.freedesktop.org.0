Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC33A74D1F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE77110EA42;
	Fri, 28 Mar 2025 14:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pcjcLGtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5D10EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:51:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 91FEF43850;
 Fri, 28 Mar 2025 14:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9B1C4CEE4;
 Fri, 28 Mar 2025 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743173465;
 bh=eVYl2FITbsNzWUlMGbhJI76+W0jqC53/laOtHUJbfds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcjcLGtHVKe9pNmO19S8NvTaStYlWe6XRRWEjxFmZuKjAIPENF6hvUecJ58M/3f4o
 AkURM3qkvTa/VUakon/sIAnQVtwk95b7Xkmnp5uFiZ5/3E6ssloZh6rEsr9Rdn6G1N
 hQmL8iihckC0Kkyujgs8Ngu3g4ePzIdB/fFFrb7AXo6D0hktaUPZTDMxztJLUY0LNE
 e9oFPenGH/zIcalBR8bI9hWSO8ZUK54DsmwHws6F3VFD2HtqhLhI1xZMdrV9ERsjxb
 RM3R5tRYs1RwP5RwJln/dH1SgUw8suQ9sBsTXrW2kohPR8cyguD/9JIsANDIDf2IHB
 9suRJX3LbvLTA==
Date: Fri, 28 Mar 2025 15:50:58 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Message-ID: <Z-a3Ui6OqI0hGWt0@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-9-dakr@kernel.org>
 <20250328-pink-ferret-of-engineering-bf7818@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328-pink-ferret-of-engineering-bf7818@houat>
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

On Fri, Mar 28, 2025 at 03:49:20PM +0100, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:54:35AM +0100, Danilo Krummrich wrote:
> > Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index de46acc247c3..c704431f02aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
> >  F:	Documentation/devicetree/bindings/gpu/
> >  F:	Documentation/gpu/
> >  F:	drivers/gpu/
> > +F:	rust/kernel/drm/
> >  F:	include/drm/
> >  F:	include/linux/vga*
> >  F:	include/uapi/drm/
> 
> Our MAINTAINERS entry is pretty weird and kind of duplicated between drm
> and drm-misc, we should probably put it under drm-misc too?

Yeah, that also came to my mind meanwhile. :)
