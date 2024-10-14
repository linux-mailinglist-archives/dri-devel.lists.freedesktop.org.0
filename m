Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9499D51A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB1110E48E;
	Mon, 14 Oct 2024 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BQXbmJtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBA510E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:00:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20cb8954ec9so1199025ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728925207; x=1729530007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+IkmYOY1emvpWEhAH8hN1Dn1l4FLfVFJ+8YBVygnlo=;
 b=BQXbmJtbf8mVSPlWcQMT0MBzhuPC4iYpiF+q7BWdb/uinRyfWGVFVw/Dc1X2mHv+5O
 mvaSFakvkKz7Jzi4I1SlIuF80lcJebCwUHwg8LvjsZJJgWPOh/xgKkFCEYrUY4zq20Ha
 L8VR5zibgQK32Mc4WzepW7v3ysg3pApli+1s0M+Kr4I58topyIua5eYhZFZ7BPKRSFet
 0QjzgvXx5+xzf0Cu1gbYwV4Lv5AGlGv7iIsyBl6btjhdWpYXDN8pJGPFOni+cdYya1N/
 0CMZ9j2yfhPPsEDdhqx88Feqniaznq7v5H49UXDiFi2tRf1gMhFToVLmVOIG9bGbsLUr
 unUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728925207; x=1729530007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+IkmYOY1emvpWEhAH8hN1Dn1l4FLfVFJ+8YBVygnlo=;
 b=uWCxGkoet/kctHnPmPL8Sq4udhsP7oghpLvxTZ4knoMOxk+clI+LSQuBRd/sfHuPq8
 U94kLUE1mM4aQ1hQGc0vuiFPQP6kfBIcVu8yfccuXFsSfXb/AFoQGGfCQ+Q8M0SZ+Eaz
 u9zhL+T0+vutg31lRBvPhr7aOqV2F5Hb7m62R56TM+tP5ikyse6MavtXtdCDC1D/YF+u
 e1HbsVzmRX1xNsoTxzQOb2tnVLc8jLu6oCi4ydrYhK+e4UzguFIIEL28icUbch9a2tBB
 MKVjaK+dBAPB3Ea2odmL8xmHMn44Ec3aAryVqk6K0V3tymblcoQabn1BR/fGIpydHstf
 aB3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzU5C/bQh0nJepRASVKXAuNzcAVxAFjLS5Idtu7n2vPcmek6mG3nMyOcqCyc3FwHGDgyntxHue3y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKi0/Ag1gABY22AJVRbXga2Wh/3+/iOSK3hoNuD7aqtp4wS+qg
 XBThVk2kjkInhtrKPyJbWAasLBCKUWeETb3wKJWQqaft/Pr1r5YWpG4zbj+9mgUbKLnbHLsKrFB
 m16h5ThxD7eKOeK1ebuMgazYkKjI=
X-Google-Smtp-Source: AGHT+IHK7lgNU2cqHnJklHE865k53HsTuHdHwY3kT9CtZVScB0WjQJlMOR5ix+y9Y3xweVzDqJV2SHjwy23kRy1Rx0o=
X-Received: by 2002:a17:902:e845:b0:20c:92ce:35b3 with SMTP id
 d9443c01a7336-20ca1429fdbmr66874725ad.2.1728925206043; Mon, 14 Oct 2024
 10:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-6-witcher@wiredspace.de>
 <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
In-Reply-To: <13f6f904-bd2c-4b0a-914e-0715d22a7ff5@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Oct 2024 18:59:54 +0200
Message-ID: <CANiq72kE0QtiC6OjyV32r_0V2KxhtPk+-8mQGkCvtexif+04vg@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Oct 14, 2024 at 10:54=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> With the suggestions from Alice Ryhl to not introduce a return, and use
> expect:

+1 to both.

`expect` (here and the other ones I suggested) require `rust-next`, so
if this goes through DRM, then we can clean this up later. Otherwise,
if you prefer `rust-next`, we can change them to `expect` already.

Thanks!

Cheers,
Miguel
