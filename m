Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC5FC1718D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C1310E675;
	Tue, 28 Oct 2025 21:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yaqv5Yoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47DE10E675
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:52:44 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-4298da9effcso4344521f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761688363; x=1762293163;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=gxvTcp57iqNZaGWW5QgrfrUxUlyacGTsuw9SR8IN/F8=;
 b=yaqv5Yoy5nxUMWDtM7kDMt3Q6JKyA+USbxTh3TDjS1R23hX+mmb2Y8vr3WMR2jpcBA
 Svvl0roOvcxcVLAijBRofrQvHeLm1tZ1Xh/DJPZzcZSexmJ4X7gbiXZxmsLDWzC3FgGe
 Lp/XpoD9+gFbB2rTJjcvwybPJi2OyOqdq7PLpZQcu0372IwcaCOH4MYq8NwjGTgFsxg2
 Q5XSb3uP8rBkw7GisVXET/rQkqfNXvNwxRwvlTQ7xnhinsr5NfDMWnBq6jsgwigPyZ/C
 ibzaUTOQ7rv8TaHnFxET4l03Rbah2rODsI0aW4XMnyLnTErbri3B742wXNtjeOh36WjT
 0tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761688363; x=1762293163;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gxvTcp57iqNZaGWW5QgrfrUxUlyacGTsuw9SR8IN/F8=;
 b=xLWzHfqEcuOeQsgVCdPYZKpTfKeiNWlZV1onxIhbQeGrBPvGhywLjsMp6DtbmwOzi0
 DY0uF0JcGlMzc2/I3VoALEti7pxncNJ3LmewNd1n+usLfrUz5rsoZBWhquECKS6bNN5w
 BcsGjYlJJGWxFJDDZ5TT7fIzIdfceYSTgXLlM5uE9QYNzo9Hqs4nS4Yg9SZCQ2ONnL6p
 sGsYEuNm++TEJjBRr1Ynf017CIUCPYv0uMrqdtRLyns5r+40L1kbdOHYZA43t/uw5ycR
 0/PDdrabH7P1F1hh0TEorcHV8ukraEBCF2zQ0XPOvAXA5M3byl/0OLj28YoLrhXRcw4H
 vwUw==
X-Gm-Message-State: AOJu0Ywa32oUCV5MKPBTdz+JHdrpBBCFZuTqs2vx0AaYELK++jVaTnbc
 c3zx9qfKGPif5QD9nUv/M3/QEb/ekJFOlbpteW5VsrnwhW/uuSv647W/O6qj2E6P7y9yZwUCM/s
 xUY+iC+fCBfqw9eMh9g==
X-Google-Smtp-Source: AGHT+IFqfPgRstRelzXH+amB/IjwATor/dkpPTNhB7q+WHWYQFrq8HCUWQ8G/CKZe92IMAQ4Z7r4uuvZpYk2Ums=
X-Received: from wmkg4.prod.google.com ([2002:a7b:c4c4:0:b0:46f:aa50:d70f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5250:b0:46d:9d28:fb5e with SMTP id
 5b1f17b1804b1-4771e16e471mr7732565e9.5.1761688363173; 
 Tue, 28 Oct 2025 14:52:43 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:52:42 +0000
In-Reply-To: <20251028211801.85215-1-lyude@redhat.com>
Mime-Version: 1.0
References: <20251028211801.85215-1-lyude@redhat.com>
Message-ID: <aQE7KliosIU_0Bll@google.com>
Subject: Re: [PATCH] rust/dma: Take &mut self in
 CoherentAllocation::field_write()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="utf-8"
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

On Tue, Oct 28, 2025 at 05:18:01PM -0400, Lyude Paul wrote:
> At the moment - CoherentAllocation::field_write() only takes an immutable
> reference to self. This means it's possible for a user to mistakenly call
> field_write() while Rust still has a slice taken out for the coherent
> allocation:
>=20
>   let alloc: CoherentAllocation<CoolStruct> =3D /* =E2=80=A6 */;
>=20
>   let evil_slice =3D unsafe { alloc.as_slice(/* =E2=80=A6 */)? };
>   dma_write!(alloc[1].cool_field =3D 42); /* UB! */
>=20
> Keep in mind: the above example is technically a violation of the safety
> contract of as_slice(), so luckily this detail shouldn't currently be
> causing any UB in the kernel. But, there's no reason we should be solely
> relying on the safety contract for enforcing this when we can just use a
> mutable reference and already do so in other parts of the API.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>

Didn't we do this intentionally so that it's possible to write to
different parts of the allocation without protecting the entire region
with a lock?

Alice
