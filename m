Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74765BE8C30
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC6810EBE7;
	Fri, 17 Oct 2025 13:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="d77FL7UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A2310EBE4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:11:10 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-47113dfdd20so6912075e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760706669; x=1761311469;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=qBN/Cw+eQnfQcCTA3O6NXKqQGjAglVYeOYNDpCPHrj4=;
 b=d77FL7UGEO/f1kQzlbLE/Mb/Afh/4YWHXhrHgBATES+lA7/LUQpE4Paq5IM9j25h70
 PJwbTRgpWgjKrWPPHvxi3l1ijpK9MrtrSWGBNxNNmZ91H4NWR9UO5EIWewMb7DMBf3IY
 gf+PoOn7+UmR3x77AHb6lqsVmG5nDiPDkKbsMeihThlLOgSFhv7tbPsDL0XVB533445u
 JQtyv56I1UIz6o+pV9EFiraw7iebvmG6vmVY3rZnTipFDHwjdZgzLWjVJf0J+9H6oe6b
 UH+lliT0opvBGoo5Nt7IGy4CPeGl+g8jYxEpRBQOoLRzSc7NDTBgXiIIeJOQO7gnQGnE
 kutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706669; x=1761311469;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qBN/Cw+eQnfQcCTA3O6NXKqQGjAglVYeOYNDpCPHrj4=;
 b=XkNatqCumOxQ9DQFFEULz59aE7p2mIs2r+2fuXmPG59b5sz/jBGKq5qwUPjdGh1zbS
 tM3nHZyr3rH9HXeWpPqxF6gxZRBmNqddyZRvvkmG7LT45xpQP78E1tQ98aizLXqwfiGe
 UQiuL1up/8Z8U7HE+fU37ndyn83wx0hj7W3yddLXtGKuwVSexZRBYG7KlAljbDBr18Al
 19rtCxn5PHyrAJUdPcJa9F9Xy93cQ5pGCaJUCleMUfpCk+FLVTlYZf08l0iWeY2BDPPZ
 N9OgBfl7cpKCeG1XfzyITbWyu6RhuVdUVgRJ28qc8vmgiGdF66z2BxklCGJZZeYwXJjI
 li6g==
X-Gm-Message-State: AOJu0Yz7ShVJLBkftntqnga8ptpBfJLDcy/V9q8nmemMhUGHTe8odfqM
 gW6hByxpf/NUND3rAxjZb0T8NVNKm8TX+NWMJ/7ndznE4gW+gZFHd/gZVoR0U7WNxrdx+bzfI1Z
 tB6xknwl40neQcJNbRg==
X-Google-Smtp-Source: AGHT+IHTktQkfKYsYJzw3V7qNFgXkgcqW3EHTpsr3Q8Lq0rXDd9Msb8bUuMxcu07kxcMNJQaoB+wGtgg8MCddxA=
X-Received: from wmgp5.prod.google.com ([2002:a05:600c:2045:b0:46e:684e:1977])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19d4:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-47117907234mr32563835e9.19.1760706669430; 
 Fri, 17 Oct 2025 06:11:09 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:11:08 +0000
In-Reply-To: <20251016210955.2813186-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com>
 <20251016210955.2813186-2-lyude@redhat.com>
Message-ID: <aPJAbHz33FPpYGG5@google.com>
Subject: Re: [PATCH v4 1/9] Partially revert "rust: drm: gem: Implement
 AlwaysRefCounted for all gem objects automatically"
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

On Thu, Oct 16, 2025 at 05:08:14PM -0400, Lyude Paul wrote:
> Currently in order to implement AlwaysRefCounted for gem objects, we use =
a
> blanket implementation:
>=20
>   unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T { =E2=80=A6 }
>=20
> While this technically works, it comes with the rather unfortunate downsi=
de
> that attempting to create a similar blanket implementation in any other
> kernel crate will now fail in a rather confusing way.
>=20
> Using an example from the (not yet upstream) rust DRM KMS bindings, if we
> were to add:
>=20
>   unsafe impl<T: RcModeObject> AlwaysRefCounted for T { =E2=80=A6 }
>=20
> Then the moment that both blanket implementations are present in the same
> kernel tree, compilation fails with the following:
>=20
>    error[E0119]: conflicting implementations of trait `types::AlwaysRefCo=
unted`
>       --> rust/kernel/drm/kms.rs:504:1
>        |
>    504 | unsafe impl<T: RcModeObject> AlwaysRefCounted for T {
>        | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ conflicting =
implementation
>        |
>       ::: rust/kernel/drm/gem/mod.rs:97:1
>        |
>    97  | unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
>        | ---------------------------------------------------- first imple=
mentation here
>=20
> So, revert these changes for now. The proper fix for this is to introduce=
 a
> macro for copy/pasting the same implementation of AlwaysRefCounted around=
.
>=20
> This reverts commit 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V2:
> * Rewrite the commit message to explain a bit more why we don't want a
>   blanket implementation for this.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
