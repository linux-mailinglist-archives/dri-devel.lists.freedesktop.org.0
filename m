Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F842C9ACCB
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E822110E526;
	Tue,  2 Dec 2025 09:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="u+PYXGoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131CE10E526
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 09:11:32 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47106720618so67768815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 01:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764666690; x=1765271490;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LOvIHNI7MzU0j+TsPPOAcJWACtA74NjlNLtzJ+lAxKo=;
 b=u+PYXGoyL93n0Rg5bUfXYbmuN18F41pzCPMzffyBXr03cDgT4SeA+uGDcAH4gFDhp2
 fzReC1YKUHHWSvXLUjfbqGC5w5N5jr7yXs2pBKwrcBUFgE7auJ52/3pRkhhXkuacO/WT
 G42Gb4y6dm/j8fRp7JCRCkMWebtrb/geGWLPd6aN1cl/tN4UUT13K6Y4KhTC1f3CjJIq
 JUFiWtmGWtu3YXuS7b+X7ogse5aL0V9G7xqnTT9IsZ1q14NWyyiMrIFdgt5vzrA7lpIy
 0/hO7uTTDJawRowsHzjB5PQKxN7exHFeal6UEK09cORalU/Wa1ghfpFJstZwmfcv1dNB
 /7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764666690; x=1765271490;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOvIHNI7MzU0j+TsPPOAcJWACtA74NjlNLtzJ+lAxKo=;
 b=YJNHqT7lZftIeOqxadCAWzpx3mFBlX8Zt1pRdRx76rsflLvESdpY7qxhqi6nBcxnI6
 mSuRInaUfg6+/zu9ixDCvvENGHj/DHLPeGbz74Qeg6Eki49mf06yEgSfFzRIFGMsXYYf
 J4RLK/ZtwQbPuaOfW5s6sRMX0NbpTSGKpzCkV4doaLx4SwVzB7VtWBMFx9ulUKDHN0eF
 te5/sZMZViFxmZUO7zzOGSKb7WKoytbnuFcfIH8ATYBacwSZj2Scp1Ptgu0q2EmAX8TP
 6sDwRyaGoztOfJt8qAsifQlhkfPcbvU4tP5Et5WDwcg2fK4JxUOqN/XHaqKJhzbd+eOD
 VpDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQBJjilOLMtKaQ3/NScVTW9Eys/HPe22GvC2ElTdK2qC3wgvTqeDmq58uEvPAVRKX5TavjFY+vQ/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfkMRdb0Ct2Y8S7oHt3NrhTAv0KhU8uaXFvUs/UWX9+xqT6GIw
 3YJuz9UxFLuuB0SDb8VJ0fIwyyk8D13SFfe0k/qy1Ggbz5JBtcgYix8NYfy4MMSrLZDjCHK8hxc
 kwIvqzOsvMOAxjBTdVQ==
X-Google-Smtp-Source: AGHT+IHWIN0YuGSOPLWLOEi5fZHz7mFlcCip2UWeGRVHC5HGPtIdyX2L/vf1Djqmp3KExq+e20Dc7WITCYj8+Ec=
X-Received: from wmin6.prod.google.com ([2002:a7b:cbc6:0:b0:475:d94e:4d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474b:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-477c01ee377mr415781115e9.27.1764666690595; 
 Tue, 02 Dec 2025 01:11:30 -0800 (PST)
Date: Tue, 2 Dec 2025 09:11:29 +0000
In-Reply-To: <20251201152759.16429-1-atharvd440@gmail.com>
Mime-Version: 1.0
References: <20251201152759.16429-1-atharvd440@gmail.com>
Message-ID: <aS6tQc8hPcignbjE@google.com>
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Lyude Paul <lyude@redhat.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Mon, Dec 01, 2025 at 08:57:58PM +0530, Atharv Dubey wrote:
> Replace the manual `unsafe { core::mem::zeroed() }` initialization of
> `bindings::file_operations` with `pin_init::zeroed()`. This removes the
> explicit unsafe
> 
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Thanks, I'll pick this up for drm-rust-next once the branch reopens in
two weeks.

Alice
