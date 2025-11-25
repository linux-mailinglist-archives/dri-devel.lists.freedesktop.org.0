Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE7C84F44
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03F10E3B0;
	Tue, 25 Nov 2025 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Q8HktAHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2576A10E3B4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:24:44 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-42b2b9c7ab6so2652815f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764073483; x=1764678283;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
 b=Q8HktAHLTk3TQAvd8Si3ddHbdhkGGX69x1Q1rX5qx2GksYyBXEEt7tzGdUGBy3ea3G
 V9jwxOOmwxAkME+RC6f9QGAsod7co6dMEV8jX64tmhCmQ2pH1SWXNal1i8U3mXURnEDr
 VWa4OpuvTyCRRy8UXot45x0yZ9vtsAP0rZHB0yK4ZNs90BRYLFEgv2onBQtKZO+KFQcp
 nOBPBNDFq76F2zyMCiLDIdzneWuAGfoWxXigNX6EHzrj5ATH3blhZooNEKN1MFPJY2pT
 b+dbvEvc9b7aMp8AzG0vCqBMYJfNIVBnSbQ5F609lxxPIUPuPNSqWaqr59WP0rBvZZC0
 SPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764073483; x=1764678283;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
 b=A8mZAnYY3mlZoJuIpMmEGNL4tibAcVz/Kdece+kUF6LBTLJ+uytF7VC/z1w0HhT5FR
 urb7EClYsz/Nb1eYm9ta/VcokvAKmTkzaJT3wboNgKVrJ/7L4WdR+Gszago+GoS0SU7c
 Ccxh2139XY8Eit885/CpuC+m+pNZVMwioHZJI4ga2076o1944R8tUfFQxJXZCo56NsOf
 XXot1UsayPnn1O8daPE9BpCH1R8MvidWN90wmpJhEuE2t8Bu2EHldMjRu14kMYfxN4+W
 wcDHnW4hlqvT0tyYk/3qiRiXa2+QdUmPJ1DdtVcwy9cRy/pZak1rlQNkkKDCBsupvY+d
 +88w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9s5D1K1TWxsA4/xPTjqbQsusOY2qEn7b6i2bffg7RGZekZ0m12gdowyW0Dk0Y5Qp0s8WfaiI4Ncc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztzH7/8sqOXtosj+tfoUxYNBt5WVJIOcq2Vysa3wbO9zCk6+D6
 gZNzzLxaMtpmBVpuo6UAfZopVTe6p1DQBoqVrpgdKRIU00AbPDhq7bicBEiJdYPh3QejhZFK7Wt
 lRP5InlC3xcEMWLJYQw==
X-Google-Smtp-Source: AGHT+IG2G97KKRtl5QTLxOePIordMgMh99WR16j540538wZ8wcvVCkUBTwb1GuKCnER5wu5hmB/vT2jtUiJeEds=
X-Received: from wrrt17.prod.google.com ([2002:a5d:42d1:0:b0:42b:29df:cc2c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d02:0:b0:42b:3339:c7ff with SMTP id
 ffacd0b85a97d-42cc1d19a16mr16939785f8f.43.1764073482439; 
 Tue, 25 Nov 2025 04:24:42 -0800 (PST)
Date: Tue, 25 Nov 2025 12:24:41 +0000
In-Reply-To: <20251123092438.182251-2-shankari.ak0208@gmail.com>
Mime-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-2-shankari.ak0208@gmail.com>
Message-ID: <aSWgCT0beyqaD4jE@google.com>
Subject: Re: [PATCH 01/10] drivers: android: binder: Update ARef imports from
 sync::aref
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, 
 "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
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

On Sun, Nov 23, 2025 at 02:54:29PM +0530, Shankari Anand wrote:
> Update call sites in binder files to import `ARef`
> from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Greg, please go ahead and pick up this one, thanks!

Acked-by: Alice Ryhl <aliceryhl@google.com>

