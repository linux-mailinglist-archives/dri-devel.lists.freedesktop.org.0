Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C3B11091
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 19:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA41110E109;
	Thu, 24 Jul 2025 17:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SQ3PRlaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD82B10E109;
 Thu, 24 Jul 2025 17:57:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234b122f2feso117485ad.0; 
 Thu, 24 Jul 2025 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753379874; x=1753984674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8UvJuIn0OPJI+DjMgO3jk5kaVoeuzRgCCA1dECQ/gA=;
 b=SQ3PRlaVBom8q1NBcjyZwOtUwsUei+ujjxQ7fE2bx0w9mCWfxMTZ7jn+Fz8dMt5Gfv
 o1NmTkY7VF+x5n7YQ70GrJ4qbMqzXBfhJPKmUjycaLLKP2gl2iJAJf8wJcDt9XGkFWW1
 gGcqzM61p3Z8JAMf4ZEX/CG36qK07tJLF3GUTbeS7qbftV2Od/YhJBmqECWIQq5feBYr
 SU+vLBoFU93l6Ea8asOxHM+PdmiGdzeAFUBC9lLZ8txjmt9OVDxxPwiFLu9f9qMcZtgw
 F3iqCnWKlT52hQOLEnekmpjtQxrFCNAJzHr2yxQsoasAT9r5ryPu+Ewn/AHz7ZGKmEDc
 rUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753379874; x=1753984674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8UvJuIn0OPJI+DjMgO3jk5kaVoeuzRgCCA1dECQ/gA=;
 b=BLT8X+Yfup4rbzaFtLZcZ3cotsxd6uy3XNnT6PgsiCXr4K0HpnaIQYJrbQICsAtbtE
 K4o/hQXn4wUBUA/ye+eZnXJZHiqIm+ixzWugucBWlgjotfRNIlbETNdFggOSF82redTg
 DwVBbwMNwb6P13afukHSJ8PCxobLHnWRau5OTURs9RmEDyh2ClAWnarqP9S8+Dw6ffu0
 Pwj0e4vf12M8pPho9lEBc3P9d7YbqC6On65B+dA4VZqryf6vY08OHiPina7dYK4VOQ8e
 Q2x8Xk9RS71PFw//fTNOckVL381ZAkDBL3a0GVYlLMULTIPVZsYZ76VFFAt4etdOG39n
 ftow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoR2zpO3E/eRkgk8q4JztNf8fnTFEtsk/V3owaS9sAYSB74SpbfXv8T02nB3OgnmXkQpAUWKCGSzM=@lists.freedesktop.org,
 AJvYcCXqG6tU25ExDNdYtjjHgO3pfw7f32FR4zxbGrzROdQwMzmXOSA/GtklOOKr8Q8aUnS7x5nRqQTzmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytmSsLY+nxCxmkMS9Ge2J2Mgm0aWrT8Yfst8/UFWnQG+u68lfn
 QMRk/k9/S9DbDvs1jtbCxDP1rPdu0jYy9kMcBKxLGW9t+LfExJngXtoNFYYyvqhNrFu1I/qzCUL
 sH7XYw5ly7Cm6JtNv2aQCdN+0hcMVo1Q=
X-Gm-Gg: ASbGnctZN5LYNoUPjJWt1G7hCKQZyyuz1xzNawrH1wYUjbDJQBpRtledBI/KO66uSXv
 FVlXR2lZ+DH62LZX2UUbLmOLrO1u5O3tM+WkQAjkE49Zcq7OHJhjmTQmVYNGOqSsomt5pwVbsap
 KO75Std3LlbhYglUCIZi26ICPdpqXNPBUl53Y1xD6CKOolaFfRivM7cHunvsOApATULmzvYZHzB
 wHPSmyB
X-Google-Smtp-Source: AGHT+IEAhOyud9kcbqXxowjJUbxNlqWbJT7GJpdyKPEF2m9XE+mf16rjfgmV2MlnEZtVjRLDvU7+lrC48/cD3la2z1c=
X-Received: by 2002:a17:903:1aac:b0:23f:9aae:6f0d with SMTP id
 d9443c01a7336-23f9aae7183mr37615165ad.6.1753379873956; Thu, 24 Jul 2025
 10:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250724165441.2105632-1-ojeda@kernel.org>
 <DBKG6CA32OO0.368N1Y6VMIUTL@kernel.org>
In-Reply-To: <DBKG6CA32OO0.368N1Y6VMIUTL@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Jul 2025 19:57:40 +0200
X-Gm-Features: Ac12FXwN0CMehniS1G7J0FWaHdQIDWYqXa1YTpgsiVMs45pPNA405NE1QlSsAHI
Message-ID: <CANiq72ktx9JsTXN_HTfjGWHxpBh430tkxHE2xL_1BQB2yb16rA@mail.gmail.com>
Subject: Re: [PATCH] drm: nova-drm: fix 32-bit arm build
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Thu, Jul 24, 2025 at 7:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I think I will follow up with a function to perform the conversion in a s=
ingle
> place, but I really like the idea of a special clippy annotation to tell =
clippy
> to not warn about unnecessary into() conversions for a specific type alia=
s, such
> as ResourceSize.
>
> Do we agree that we want something like this? Do we even have a feature r=
equest
> for this already?

I think we should at least ask -- done here:

    https://github.com/rust-lang/rust-clippy/issues/15337

Though, thinking about it, an explicit function may provide value
nevertheless to clearly see where this happens, and it also means that
when we see `into()` we know it cannot be a no-op.

Having said that, regardless of what we do for that lint, giving more
information to the compiler is generally a good idea, even if only for
notes/diagnostics etc.

Cheers,
Miguel
