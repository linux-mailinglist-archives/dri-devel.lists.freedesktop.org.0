Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A569C92B42E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03AF10E4DB;
	Tue,  9 Jul 2024 09:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QqswLLJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B59D10E4DA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:41:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-367a183df54so3027682f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720518102; x=1721122902;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAZt8GtzurYosVReDcWXFfiP8YdX7GkjA3wsNUYSUA0=;
 b=QqswLLJ3oEcRIwXXl8uGe+N13cJpM2lu1iZK7CsBXLlK8B2VFzFCc2pNUkH8GUcdvX
 M62/5tGq3fl3RZ3wWLRF/n7Qmgc049brrWZY2uYTrJRW8xI9qv+HLt+6pbCDMUsX1s/z
 RTprymuN33AlSc7XHZA00h0t7bYYZboPpVrq8TDPhMz4n0ufGeCbIOJsuaRI8FPdokqi
 B07xqSDMw1Q+VBQgLwyfm/9N7WjtmCOa3g+wYr2dB5GDjGh2UE6t4ZXTxdPQ9UNEAAoE
 ZNfVsMd4GFyKOsUc2gLsxwRfLpokjz2z5OgwEIytubrBjzUBhy0TmoKIdr1257ORhBk0
 +hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720518102; x=1721122902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAZt8GtzurYosVReDcWXFfiP8YdX7GkjA3wsNUYSUA0=;
 b=JXRpIMs5GuJ29Fk/9PeJOffZWOWr0pD2N4aUbOASm3cAyi5H2BIgw7BN+d9SxYmJY1
 MDGrEH8qLBPYQ77Bm7tg+eYz/Xdopq67jm0mLBJblzDDrDqMAcmfywlu1F69Zqd2npc2
 nBr7vTvosBFaGZod727IeY59pk+AIM/ffUBPeUbwTnTsWOL6XR0Z3/8wr+yPwYqufHse
 pIthw86qWFJIuPejISCz8kVl2C8ys3FF/zkXAQUN3aE/oq1D6SRLoNy+uK6jp3nYjMSS
 U5rL3OuYC1iUqQiNQ0NoAVXTeZCmgXrG9tQtj9aDTlDJv+p8AIirfJEb9Xfjtxl0mm8H
 /97w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+k6qbL7u6ZSpO9+p21jRdtBSrF6JbB2uA4QTYTiRGC1AIvbiXiLzBwsdBP3EU2doVCcdMPCM3tOXKl/UZiPwZpoS8TdbVIW6to1FIvGrd
X-Gm-Message-State: AOJu0YwQj20ja1zzyYhuhUYTp7ERtC1Wic6H/8MGrHyVsRhs+/aX7y/S
 cLndl5WGnJ1Z97UVG1WzIuu7TRkfQRUMLSmXZQg9UFYEv93CLoqwkG5mpNw0obwSWAJwDFzm8Sb
 6zy/EMDb7mZM1DQn/3qARopy2e02/Pxgka/SS
X-Google-Smtp-Source: AGHT+IGR9yHQ5VjkQb02n11rV5m/nD2z1+GzQbrI8bQfIRwcFNZ5ZAorDCFB5Yu93sLbwZrEWDDYx07QGU+HUmU2sGI=
X-Received: by 2002:adf:fecc:0:b0:362:40cd:1bc with SMTP id
 ffacd0b85a97d-367cea73537mr1228764f8f.24.1720518102260; Tue, 09 Jul 2024
 02:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
In-Reply-To: <20240709084458.158659-5-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Jul 2024 11:41:29 +0200
Message-ID: <CAH5fLgh5fb_NYUNPPXYepJg=pbmHAb+-+sOrCxc0n=fiNjTFTw@mail.gmail.com>
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
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@redhat.com>
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

On Tue, Jul 9, 2024 at 10:45=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> This patch adds a new panic screen, with a QR code and the kmsg data
> embedded.
> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
> compressed with zlib and encoded as a numerical segment, and appended
> to the url as a url parameter. This allows to save space, and put
> about ~7500 bytes of kmsg data, in a V40 QR code.
> Linux distributions can customize the url, and put a web frontend to
> directly open a bug report with the kmsg data.
>
> Otherwise the kmsg data will be encoded as binary segment (ie raw
> ascii) and only a maximum of 2953 bytes of kmsg data will be
> available in the QR code.
>
> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>
> v2:
>  * Rewrite the rust comments with Markdown (Alice Ryhl)
>  * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>  * Use CStr directly, and remove the call to as_str_unchecked()
>    (Alice Ryhl)
>  * Add a check for data_len <=3D data_size (Greg KH)
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

[...]

> +/// drm_panic_qr_generate()
> +///
> +/// C entry point for the rust QR Code generator.
> +///
> +/// Write the QR code image in the data buffer, and return the qrcode si=
ze, or 0
> +/// if the data doesn't fit in a QR code.
> +///
> +/// * `url` The base url of the QR code. It will be encoded as Binary se=
gment.
> +/// * `data` A pointer to the binary data, to be encoded. if url is NULL=
, it
> +///    will be encoded as binary segment, otherwise it will be encoded
> +///    efficiently as a numeric segment, and appended to the url.
> +/// * `data_len` Length of the data, that needs to be encoded.
> +/// * `data_size` Size of data buffer, it should be at least 4071 bytes =
to hold
> +///    a V40 QR-code. It will then be overwritten with the QR-code image=
.
> +/// * `tmp` A temporary buffer that the QR-code encoder will use, to wri=
te the
> +///    segments and ECC.
> +/// * `tmp_size` Size of the temporary buffer, it must be at least 3706 =
bytes
> +///    long for V40.
> +///
> +/// # Safety
> +///
> +/// * `url` must be null or point at a nul-terminated string.
> +/// * `data` must be valid for reading and writing for `data_size` bytes=
.
> +/// * `data_len` must be less than `data_size`.
> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.

You don't allow data_len =3D=3D data_size?

> +#[no_mangle]
> +pub unsafe extern "C" fn drm_panic_qr_generate(
> +    url: *const i8,
> +    data: *mut u8,
> +    data_len: usize,
> +    data_size: usize,
> +    tmp: *mut u8,
> +    tmp_size: usize,
> +) -> u8 {
> +    if data_size <=3D 4071 || tmp_size <=3D 3706 || data_len > data_size=
 {
> +        return 0;
> +    }

Since you explicitly check the data_len, it does not *need* to be a
safety requirement (but it can be). Even if it's wrong, violating the
requirement does not lead to memory safety.

> +    // Safety: data must be a valid pointer for reading and writing data=
_size bytes.
> +    let data_slice: &mut [u8] =3D unsafe { core::slice::from_raw_parts_m=
ut(data, data_size) };
> +    // Safety: tmp must be a valid pointer for reading and writing tmp_s=
ize bytes.
> +    let tmp_slice: &mut [u8] =3D unsafe { core::slice::from_raw_parts_mu=
t(tmp, tmp_size) };

These safety comments explain why these calls are dangerous, but
that's not what safety comments should do. They should explain why
this particular call is okay. In this case, it's because the caller of
drm_panic_qr_generate must follow the documented safety requirements
of the current function. The wording could look like this:

// SAFETY: Due to the safety requirements on this function, the caller
ensures that tmp is a valid pointer for reading and writing tmp_size
bytes.

The wording is not much different, but it's an important distinction.

(Also, safety comments are written SAFETY: not Safety:)

> +    if url.is_null() {
> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len=
])], tmp_slice) {
> +            None =3D> 0,
> +            Some(em) =3D> {
> +                let qr_image =3D QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    } else {
> +        // Safety: url must be a valid pointer to a nul-terminated strin=
g.
> +        let url_cstr: &CStr =3D unsafe { CStr::from_char_ptr(url) };

// SAFETY: The caller ensures that url is a valid pointer to a
nul-terminated string.

> +        let segments =3D &[
> +            &Segment::Binary(url_cstr.as_bytes()),
> +            &Segment::Numeric(&data_slice[0..data_len]),
> +        ];
> +        match EncodedMsg::new(segments, tmp_slice) {
> +            None =3D> 0,
> +            Some(em) =3D> {
> +                let qr_image =3D QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    }
> +}

Alice
