Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FCBFAD3E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A15710E6E4;
	Wed, 22 Oct 2025 08:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="W3zTPzuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084510E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:14:34 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4710d174c31so66574805e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761120873; x=1761725673;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7ogsn3X1mobn8/e1uiGkS9XQJsz3R6ivSIjiDXFm3+Q=;
 b=W3zTPzuH1UzZUfTPZxiccNTj2DRlCTN2SS97lJp4ixeOnKIUmzB4DNjhk0oR6Fvp9V
 WotW0OuDGsBx2DUMQ3IpZK5swBpM8iuetIoi2aDrwLGn+to61gahLgqRjrwSywSCbkF4
 jXV9xlw2hyb1MUE+g/GqTbqQI/g6cKJP3baObVV1IiB00uqv689ZpjeN4Pvr75WlndHb
 zKAqyGjZqmwnjYa1nB6AyzfOgDgRBbdf5FGJRu4Vuy0PP7X13usc2ztsqz4EXSCBgT7x
 WbAk189fK9+5IT7nQW1WsdHebqyadhJwHw1dTD2gPrMZl+Y2wgEAmu5qCXe7uOyBPuun
 AWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761120873; x=1761725673;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ogsn3X1mobn8/e1uiGkS9XQJsz3R6ivSIjiDXFm3+Q=;
 b=CMwDoSlFiTTiVhcC3+39VJp7+tJVv1M8vcm7y7AwYxadpQWVAhHRfAam9e6I2DQWYV
 0RWJ4cUOcFxy9tzbiNVVej6aC1/PXmxAFzWpEYgD8EMPv93lFC3yrpE5KdMQvFI+7Aw+
 uG2Vl+XFBf6Na3fMrSnmIGDZQsMnDpX/WgO1d2DyU32V+gp6CwId0aQB0NzPD08WcCJ8
 OEQu9yPPqQ9u0kKBVXK+PE33gxMzfrHuqt0Fzartij0oDO1N/bz41nQ9G/CdA8Ngr+RX
 r2aEWwN7zNyw/wToVTn5aREWp9OQeJtgAxTcLdEGcqt9XeGhc/3eGpYQksdhAgUxbnxH
 T66w==
X-Gm-Message-State: AOJu0YxY+I7OPa6z4Pp9Za/dJ8vX6VUqC+j12TZm7dIuPlgzk1Kr+6FV
 FRpD2OGtORMtEWZghXkytM3i1JRgGLn9o0p2kwKf0gxnN77wuvgeQncobsDpOZTmKXNpSZIqLE3
 zo4584N7iBjm7Wyd/XA==
X-Google-Smtp-Source: AGHT+IHVymDPMVFRxtz+pEpsqCDA+1l2F++eBCPDtyYxS79P5clFYGmutl6mMG3GyLc2Iqc0bUnGJy61wcbICgU=
X-Received: from wmwr3.prod.google.com ([2002:a05:600d:8383:b0:46e:1f9e:6471])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b03:b0:471:15df:9fc7 with SMTP id
 5b1f17b1804b1-47117906a72mr141554885e9.26.1761120872959; 
 Wed, 22 Oct 2025 01:14:32 -0700 (PDT)
Date: Wed, 22 Oct 2025 08:14:31 +0000
In-Reply-To: <25717cdeac76376fbcf7ba10a1b2e855800d3778.camel@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-3-lyude@redhat.com>
 <aPJDGqsRFzuARlgP@google.com>
 <25717cdeac76376fbcf7ba10a1b2e855800d3778.camel@redhat.com>
Message-ID: <aPiSZ_CGLD4o755q@google.com>
Subject: Re: [PATCH v4 2/9] rust/drm: Add gem::impl_aref_for_gem_obj!
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
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

On Tue, Oct 21, 2025 at 01:33:00PM -0400, Lyude Paul wrote:
> On Fri, 2025-10-17 at 13:22 +0000, Alice Ryhl wrote:
> > 1. Annotated with #[macro_export]
> > 2. Export with `pub use impl_aref_for_gem_obj`
> 
> I assume you meant pub(crate) here? (Since we don't really want to expose
> impl_aref_for_gem_object! to users outside of the drm crate).

We will probably need it to be pub later when we split up kernel, but
feel free to put pub(crate).

Alice
