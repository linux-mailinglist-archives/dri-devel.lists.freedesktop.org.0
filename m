Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257E92B426
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B034110E4D1;
	Tue,  9 Jul 2024 09:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fapimXiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A836D10E4D1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:41:19 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2c967e21888so3337280a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720518079; x=1721122879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVroGXjljN7UKU/yhFIYpLiSd6PbIzKS4cUQFOHvuWw=;
 b=fapimXiBE5Azsy0B5YEkQ+uR6l4TbIsERCh6HSS8XBwR5ANxvSKgoUXRexKJFejHhX
 TW+vIT4A1GYrl446p4vhz3Yzthqvy0O23zZyeI84Wfo7bx2PU399GWNCiP8F4l6H5Nid
 ywttxyy8x+GOW5LhgRyKX/1XcyjtXtb1bUEu+ybzdXE2EvszN/lOe3RDUNS6Xj6yFDw9
 h/OWakaA94D0iboWpadjGe3+o8fvtuJcBi4hug7lh2hMHi5Kj8FGz3zDcVwwcan5dlHd
 ZppviUwUn+PxC4edyKajO+JP9rJKDUBqHwB3UxQmSJU0pl4bXBq8Ix8HSex7lhTbnhVn
 criw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720518079; x=1721122879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVroGXjljN7UKU/yhFIYpLiSd6PbIzKS4cUQFOHvuWw=;
 b=l2rYyCJk9Owi2epvwQ/0A+z/7JwzfdQo02+4OH1f81EGMvs8X5tS/+Njy3xOQB5u4f
 3JlYLUI2IcOb7xIL4ndBC5g+C+R6tKe1HPB7JOXjE3oi3rdl/6V4EJmlXV2oG+zA2ryH
 3hZqGtnYiAY2Ou3DhdPHIxyVaR5UietEiyCjQGGbSHjZiKpKY/2J3TWkzjcDlmzEHCSa
 6yiLFo6YY/Wes/L8lKBuvACozHkVdmKI9iLCCX8+7D5CDkqLh5Rfr7FWGBUHt1eGr6Kq
 KVBqNlfg4cMfYM8WCZ72UXzDVzrkOGQ1TDc3KUMWWHYsCPAihiI0iWc2hgdDj/IonsBk
 jTiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL2yNRU5mmFr9rRXMX1BsGsHMMLHd+w08zeGu1BDRSxOXbtn9jIq+LhhzgHrA0hveFzkL+b7MYE1sDDmAxyiwL07xCa7US1NBGW+fDmrid
X-Gm-Message-State: AOJu0YxarWEoXFy0iBtNvSgM3K6Dqs8kV+VWgr4pY+RykMuUBCUkzH1E
 dXaLBlzfwbwfVclUnWqmOWCzG8wZ8I3aawTdB/ghME9Bok5L5fpkX9OFiY1Vbb2urkPj+paf9pY
 H3qC0kaC7YzlAGhHEXpLrHppLBKc=
X-Google-Smtp-Source: AGHT+IF8ZjDYhseE4Khi5hh3/IVLxfQ67v9J2c5cotmB0Lq+rDdIDmRbQdZ5yWgqnTKcX7faKxVbS2/+f/aXqcOR3ns=
X-Received: by 2002:a17:90b:1e05:b0:2c8:1f30:4e04 with SMTP id
 98e67ed59e1d1-2ca35d48f74mr1921776a91.36.1720518079028; Tue, 09 Jul 2024
 02:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
In-Reply-To: <20240709084458.158659-5-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 11:41:06 +0200
Message-ID: <CANiq72kS2fAgRnR8yNfpN69tMG+UPfgfytaA8sE=tYH+OQ_L6A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
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

Hi Jocelyn,

A quick docs-only review of the Rust side (some of these apply in
several cases -- I just wanted to give an overview for you to
consider).

On Tue, Jul 9, 2024 at 10:45=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> +//! This is a simple qr encoder for DRM panic.
> +//!
> +//! Due to the Panic constraint, it doesn't allocate memory and does all

Perhaps clarify "Panic constraint" here?

> +//! the work on the stack or on the provided buffers. For
> +//! simplification, it only supports Low error correction, and apply the

"applies"?

> +//! first mask (checkboard). It will draw the smallest QRcode that can

"QR code"? "QR-code"?

In other places "QR-code" is used -- it would be ideal to be
consistent. (Although, isn't the common spelling "QR code"?)

> +//! contain the string passed as parameter. To get the most compact
> +//! QR-code, the start of the url is encoded as binary, and the

Probably "URL".

> +//! compressed kmsg is encoded as numeric.
> +//!
> +//! The binary data must be a valid url parameter, so the easiest way is
> +//! to use base64 encoding. But this waste 25% of data space, so the

"wastes"

> +//! whole stack trace won't fit in the QR-Code. So instead it encodes
> +//! every 13bits of input into 4 decimal digits, and then use the

"uses"

> +//! efficient numeric encoding, that encode 3 decimal digits into
> +//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
> +//! into 40bits in the QR-Code, so wasting only 2.5%. And numbers are
> +//! valid url parameter, so the website can do the reverse, to get the

"And the numbers are valid URL parameters"?

> +//! Inspired by this 3 projects, all under MIT license:

"these"

> +// Generator polynomials for QR Code, only those that are needed for Low=
 quality

If possible, please remember to use periods at the end for both
comments and docs. It is very pedantic, but if possible we would like
to try to be consistent across subsystems on how the documentation
looks etc. If everything looks the same, it is also easy to
remember/check how to do it for new files and so on.

> +/// QRCode parameter for Low quality ECC:
> +/// - Error Correction polynomial
> +/// - Number of blocks in group 1
> +/// - Number of blocks in group 2
> +/// - Block size in group 1
> +/// (Block size in group 2 is one more than group 1)

We typically leave a newline after a list.

> +    // Return the smallest QR Version than can hold these segments
> +    fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {

Should be docs, even if private? i.e. `///`?

Also third person and period.

> +// padding bytes
> +const PADDING: [u8; 2] =3D [236, 17];

`///`?

> +/// get the next 13 bits of data, starting at specified offset (in bits)

Please capitalize.

> +        // b is 20 at max (bit_off <=3D 7 and size <=3D 13)

Please use Markdown for comments too.

> +/// EncodedMsg will hold the data to be put in the QR-Code, with correct=
 segment
> +/// encoding, padding, and Error Code Correction.

Missing newline? In addition, for the title (i.e. first paragraph), we
try to keep it short/simple, e.g. you could perhaps say something
like:

    /// Data to be put in the QR code (with correct segment encoding,
padding, and error code correction).

> +/// QrImage
> +///
> +/// A QR-Code image, encoded as a linear binary framebuffer.

Please remove the title -- the second paragraph should be the title.

> +/// Max width is 177 for V40 QR code, so u8 is enough for coordinate.

`u8`

> +/// drm_panic_qr_generate()

You can remove this title.

> +/// C entry point for the rust QR Code generator.
> +///
> +/// Write the QR code image in the data buffer, and return the qrcode si=
ze, or 0
> +/// if the data doesn't fit in a QR code.
> +///
> +/// * `url` The base url of the QR code. It will be encoded as Binary se=
gment.

Typically we would write a colon. after the key, e.g.

    /// * `url`: the base URL of the QR code.

> +/// # Safety
> +///
> +/// * `url` must be null or point at a nul-terminated string.
> +/// * `data` must be valid for reading and writing for `data_size` bytes=
.
> +/// * `data_len` must be less than `data_size`.
> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.

It would be nice to mention for which duration these need to hold,
e.g. the call or something else.

> +        // Safety: url must be a valid pointer to a nul-terminated strin=
g.

Please use the `// SAFETY: ` prefix instead, since it is how we tag
these (i.e. differently from from the `# Safety` section).

> +/// * `version` QR code version, between 1-40.

If something like this happens to be used in several places, you may
want to consider using transparent newtypes for them. This would allow
you to avoid having to document each use point and it would enrich the
signatures.

Thanks!

Cheers,
Miguel
