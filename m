Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E464BAC9B66
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 16:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B969410E2D1;
	Sat, 31 May 2025 14:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GrDtsTy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D095810E140;
 Sat, 31 May 2025 14:45:43 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-234b122f2feso1866955ad.0; 
 Sat, 31 May 2025 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748702743; x=1749307543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4wSRF4D7tcqiDPh/zMgCb/oT5kl8g0v4lmEyYJjR80=;
 b=GrDtsTy2Oy5lZuP7xXbOJJdJUGPofnI8L7HtpYPu3yNnEZUZGMKwXDo7a6EPRHC+hd
 g/qCNCunqFFXhACKpC0yWtjnk224eYI5q4JD6f1DTB6Fp5Q0kpGP5oj6CEFxYAceRMPA
 l/AShXjq0ofIqgZtf4V9HCSEFQNVQ925Zb2cKgup4bGbvCboW5j0tVKMR4PIiESgcywR
 WNoDoetvFalhAVlERFiMqntCTUBIhuYMAvq2P21Xz8BZBG6QPPSOjssCnUxBP8CLkXVi
 nyU5m8n/UQTtdWXx0XKOKZWfISdy75GNFA0TKvOhL7ptkINLTZBxHKpz2PPX1h6T4vrt
 zc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748702743; x=1749307543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4wSRF4D7tcqiDPh/zMgCb/oT5kl8g0v4lmEyYJjR80=;
 b=U9x8yKp2hYOkLcm6S2rj2NxyUjlo43LioPe7UkcUxyyqzCwl5eIeLxtgAaV/N/lwLO
 lR5y4KwcuGe8u1Fm72lv/JmS0YNQ7bcxz2yP8xVgI6QOAuYqcRTt4otJhKp6xKu5mgg1
 1qEKpyaMBPZ9DL2f5kXt/CvFTPacTK07+zh4hueCuxFPaPdWFjhBIeG7Phkl8i6mIelA
 Fs8EThG8x941eticRH75V1xgYfaxLOIoaYFq0AeUUKeB8bKKY3rykRlAZ5xEE7o3KwmC
 UM+hw6DUqi4kjo5Gu6XQxSVHnsCcsf5iWKRIBW+B3Z43R/B9HqQri576avSY/mJdQyTR
 XI7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIzLiwezid1VVKKxhDakb4lbYww5ab/QfCyHBGCOZEEWaUxz4L5FfZ5+2ETnH+0FwABjpOoFYhWA==@lists.freedesktop.org,
 AJvYcCXiPp15/r/4LKv4Jc989sIDtTMozS4ljNdEkK5yrwsDxOLpzo4fLdCLnmjRVClV0y2a5kwpmGmAdIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyahKZbgXkbVFMSn8moiTqC6kb202+nfm8+I4+m3WsKrDIaYpWi
 ptWyEd5V4UgCixoE8rJJzuCMJiftTLzfUcWPgAAYrp4fEWsFZOo6sIQq2EgAv6v9N+/0+vR/qr8
 il3YDzh0zSdXc3ixw7PHEuTG1xOMgot4=
X-Gm-Gg: ASbGncswtRw+powlJKOvyruICR8tr3z/kjSllySvGTGak0TOM4ioU94cp3kk5lMoUbX
 hHVOtXcJzmjxhPs6tCHAxtbXqdchWi1Ph0bMfhDJadaPTee41/wxEmOVHE6aLp0m2LFRYQJxyPA
 Z/Nl1Toq3ti99q9NVnzAMluK1FMaV166Zh9LtcldT7KmQ=
X-Google-Smtp-Source: AGHT+IFimDKf0uhMz1Pm+sxkfWAXjxIQKSLG8ZsfEBVP66REKw0R8SSDLyW7zbCkypPq0nHPd0I5KL58g5NH5rGKm2U=
X-Received: by 2002:a17:902:f684:b0:235:1ae7:a9ab with SMTP id
 d9443c01a7336-235354f690amr32413915ad.3.1748702742699; Sat, 31 May 2025
 07:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
 <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
 <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
 <aDsUGGrjbJ_8KyrP@pollux>
In-Reply-To: <aDsUGGrjbJ_8KyrP@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 16:45:30 +0200
X-Gm-Features: AX0GCFuc_Ey-USita16CQWi2QDpIFG9DVBZbSOSdhPXU6kT0GjHTGnfskNlToTs
Message-ID: <CANiq72mebLFY7X4mRaN2An1sUAO4DuGko-1JPQ0Rnc7wgzKdug@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, May 31, 2025 at 4:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I agreed to take this code without waiting for those abstractions, but wi=
th a
> TODO to fix things up once they land.

That sounds good, yeah.

Cheers,
Miguel
