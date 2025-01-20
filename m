Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BFA17459
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 22:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5881510E499;
	Mon, 20 Jan 2025 21:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPafCv8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9E310E499
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 21:54:02 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-218c8ac69faso11103985ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737409982; x=1738014782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Vbw7KU/hZTJSqblA6qabU/ThVTNhHylD1j7iTQi1h0=;
 b=XPafCv8JaQ4CxVFJPzHsNY7U0FK8/puDIp43fM2OVMU3iYkBpJj2oryR/Ga25oMoP5
 CtptynmoHyJx1UyKJ2rDpZKKYBDh1JmbV9valh+K77oj70x18fwDUoUfoDIwdO/WZhAO
 oSsNspu4xC3hKlYYU9xgvprpY23s47o4v52/NskCaGkYdAWNv81gpSjeWAIHw5TwU5Ic
 NhieKuC3eE048SN4I06cJEmmuOV/h5yNyVPynpyT1woIag5Zrui75TApXBjW4cSWTTaP
 6+UaAnnGnzga1te8BdypZdnGsaIZygASaGZ/3OvshvyB0YVqCT+vODOCpdc7bXjF8qaC
 uMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737409982; x=1738014782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Vbw7KU/hZTJSqblA6qabU/ThVTNhHylD1j7iTQi1h0=;
 b=ksKQaS1SG8WmAviRmvYEshufXP9+GszWrv/x//O3tVgyGgBmtDe04oyAxpcUlfJI+i
 drmzxnJEL9nU3Xi70OXn1G9CB2BGDUxKTs80SHwNRoxWXXU0E1Oi/5+R5cE0lYechZyV
 2/EC/o/oDUKq8j96+5PbO55GfgqYCVveKvJqWCkX5r3RQdEz/M611xb8M8nSauSb9EOH
 skdVeCxUmbr0VN74wRpl5Nl4+qdGJ5RAZc96CMkpLyWPYydZhzjmwKEd82I9jF81ZQZM
 j87B6LUGpgePfXpt/T5RAGk4O87/d6B2Llpyj7koXb0tPqEBJmo4GifQnSO1k1k9Zz6B
 0Jdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYcdRbCc+E+7gtUisV/Iw1HMzZ9Gwmqwb8a+wpIo43BkzpgKLTZInQNopDImZjwbab1VR258ZJIGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTUwde7j8OfV80roKmc4YwnH1LN05SKRXshe3NRyxSTPScRauk
 ctLBcCXMgs9R0Px5h9ASxLL6kschzWPnxPtVRcqtVWjH48h2kAwfSlMQ4ZdlVLFNDRJM3Y7YBWN
 QsNFXSfZbtrdT0xSJlcdPcr38Qc4=
X-Gm-Gg: ASbGncuAglJwReGWMbLqqfHjwNEEaBFzt6+slqsx4WKO5+oRddP5CPoLieZUzUfR+MX
 t2sKr5GQl7EjVbWOedm9VW0oVsHUKm0O7I8PRPaJXAsxL/AuV8XI=
X-Google-Smtp-Source: AGHT+IEBFfoREvwPsyAWhU6KI6Sj3YXP+bME90dJ+3K+zVF2Ba9Y0tsVR1FviFh6Y7cffgrMh+5FSIjsqdqa+EVs+bs=
X-Received: by 2002:a17:902:fc87:b0:215:9d47:4897 with SMTP id
 d9443c01a7336-21c353ef373mr82155455ad.4.1737409980859; Mon, 20 Jan 2025
 13:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
In-Reply-To: <20250120124531.2581448-1-linkmauve@linkmauve.fr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Jan 2025 22:52:48 +0100
X-Gm-Features: AbW1kvbipA64WZgr9Xm7SsOvkVvkgqJp9cEZabKMYD5JD0up8QBoKASUAMMavBM
Message-ID: <CANiq72n1YpUowTh3Hdjo5auOmTTUU1-8d2FTL3e=Oyu3Q=-BkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: fix compilation issue on ARM
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Jocelyn Falempe <jfalempe@redhat.com>
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

Hi Emmanuel,

On Mon, Jan 20, 2025 at 1:45=E2=80=AFPM Emmanuel Gil Peyrot
<linkmauve@linkmauve.fr> wrote:
>
> In C, the char type is specified with =E2=80=9CThe implementation shall d=
efine char to
> have the same range, representation, and behavior as either signed char o=
r
> unsigned char.=E2=80=9D
>
> On x86 it defaults to signed char, and on ARM it defaults to unsigned cha=
r.
> This carries over to Rust=E2=80=99s FFI, which aliases its c_char type to=
 i8 on x86,
> and to u8 on ARM.

In the kernel `-funsigned-char` is used, see commit 3bc753c06dd0
("kbuild: treat char as always unsigned").

In any case, the change is fine, because we want to use the proper
type, but this is already in the Rust PR for this cycle, which should
land in mainline in some days, see commit 27c7518e7f1c ("rust: finish
using custom FFI integer types") in rust-next.

However, I am nevertheless confused, because in mainline
`crate::ffi::c_char` is `core::ffi::c_char` which is `i8` in both
arm64 and x86_64 and thus there is no build issue there.

If by ARM you mean 32-bit, then we don't have support for it yet in
mainline, so you shouldn't be able to see it there either.

Could you please clarify? Are you using patches on top of mainline,
e.g. the 32-bit arm support one?

Thanks!

Cheers,
Miguel
