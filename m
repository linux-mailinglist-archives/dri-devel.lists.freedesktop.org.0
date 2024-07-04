Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8209272BC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D6410EA51;
	Thu,  4 Jul 2024 09:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P9WeIilN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com
 [209.85.208.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEE810EA51
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:11:14 +0000 (UTC)
Received: by mail-lj1-f202.google.com with SMTP id
 38308e7fff4ca-2ee4e9b77c1so3895361fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720084272; x=1720689072;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/k5yW7njE2R/PfLs7fU8DbQAAwgkp7DP3LCTZqCvZqE=;
 b=P9WeIilNRcWmxhNI8ykJWgEfUNZIyWUxVHdBIBzvKYTzJJb6wqco9eViz4zgtJZw9F
 i3mjWjI8QVEcduugpqr/tasJrPcSCisJnnIFWFfeksnrulOL6wd7q6jJ3mTqBnNBb6je
 scFOIo1Zl4FTAWbnST3GpGdZlxiDFa0LP+Z+XM1As038YEtNnQrv83+jTxAeFK1nsb69
 Mft0NymRi+30W+x9CNwtvooCc6aLFv5NV5kcfT5bQ49eaiuDbRcIYuaeHa3QpvU/akp1
 CYws3Rt/HHx3AoXg9kqwgFQDtAI3tJdQ58tOaeV4wtTNkULl2aKL2hi6Tz3dBc7JeObV
 CAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720084272; x=1720689072;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/k5yW7njE2R/PfLs7fU8DbQAAwgkp7DP3LCTZqCvZqE=;
 b=TnjrUNXAkoOgdjbK0Usq42wUtCI+DpkeUTc080tcap6pkD90lRW0UTyahteht339PP
 NtlYjmJVZeGxMPqATXNUvH9BIENngDWRn60qrX5Yd9/5y5Z0+2GNWBKenw9tepGvWA+N
 3nChhrFeYpvFBwL+Os2WDFRZ98gJB/DhkloLJrPZEk9yRjyPt9+sYhEhF7p5Hlc9nUSb
 PAYWela+3/keEENMAyI9Y1HREeqGzZbfXDxBVdCh53SP5xOoR8h0uoWv+9BEvmlYtA7A
 30UvlVfuasoltliRd0d/0qvngr27wym/qtVgeUerD+zyu67Z27cnTIQgeV2HDF/dNsr1
 OiFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpRM/1uiDtFhFcy0V8/bc64lqCiGhXHj9PDO6SttjmI/C/8ntI9f126Cg7g2pOEEVFP++o9uKNAzEL2uSaZ58ATmK6F2QpS2axqkwj9WXD
X-Gm-Message-State: AOJu0Yw9aHKLm7S/F1Gofv03rNSaYTDTt767VfL1+EF/Yr/pO4glcWm7
 cyiAckt7tATIuL7PKJ2kVK81SPgBuI3SoAucQt6Rn7yOYQlpcvexxrmzJIwc7UfyfTSU16BRZ9j
 ZVykkuLS9iadQvA==
X-Google-Smtp-Source: AGHT+IHIX3KAnppFnXG7zdcgIKEUqgww4g00ahMarsdngiYYBW2KQq/OnHyNv9pyh3EqBSNmwomqScUE04WUSOE=
X-Received: from aliceryhl2.c.googlers.com
 ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:9608:0:b0:2ee:8cd4:63d4 with SMTP id
 38308e7fff4ca-2ee8f2e4020mr8141fa.4.1720084271688; Thu, 04 Jul 2024 02:11:11
 -0700 (PDT)
Date: Thu,  4 Jul 2024 09:11:09 +0000
In-Reply-To: <20240703154309.426867-5-jfalempe@redhat.com>
Mime-Version: 1.0
References: <20240703154309.426867-5-jfalempe@redhat.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240704091109.1453809-1-aliceryhl@google.com>
Subject: Re: [PATCH 4/4] drm/panic: Add a qr_code panic screen
From: Alice Ryhl <aliceryhl@google.com>
To: jfalempe@redhat.com
Cc: a.hindborg@samsung.com, airlied@gmail.com, alex.gaynor@gmail.com, 
 aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, dakr@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, gary@garyguo.net, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
 tzimmermann@suse.de, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
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

Jocelyn Falempe <jfalempe@redhat.com> wrote:
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
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

This is pretty cool! The Rust code looks reasonable, and it's really
nice that you've isolated all of the unsafe code to a single place. That
makes it much easier to review.

I have a few comments on Rust style below:

> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> new file mode 100644
> index 000000000000..f4d7a3b8a01e
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -0,0 +1,989 @@
> +// SPDX-License-Identifier: MIT
> +
> +//! This is a simple qr encoder for DRM panic
> +//! Due to the Panic constraint, it doesn't allocate memory and does all the work
> +//! on the stack or on the provided buffers.
> +//! For simplification, it only supports Low error correction, and apply the
> +//! first mask (checkboard). It will draw the smallest QRcode that can contain
> +//! the string passed as parameter.
> +//! To get the most compact QR-code, the start of the url is encoded as binary,
> +//! and the compressed kmsg is encoded as numeric.
> +//! The binary data must be a valid url parameter, so the easiest way is to use
> +//! base64 encoding. But this waste 25% of data space, so the whole stack trace
> +//! won't fit in the QR-Code. So instead it encodes every 13bits of input into
> +//! 4 decimal digits, and then use the efficient numeric encoding, that encode 3
> +//! decimal digits into 10bits. This makes 39bits of compressed data into 12
> +//! decimal digits, into 40bits in the QR-Code, so wasting only 2.5%.
> +//! And numbers are valid url parameter, so the website can do the reverse, to
> +//! get the binary data.
> +//!
> +//! Inspired by this 3 projects, all under MIT license:
> +//! https://github.com/kennytm/qrcode-rust
> +//! https://github.com/erwanvivien/fast_qr
> +//! https://github.com/bjguillot/qr

Generally, documentation under //! or /// comments should be written
using markdown. In markdown, line breaks are ignored and do not actually
show up as a line break in the rendered documentation. If you want an
actual line break, then you need an empty line.

I would format it like this:

//! This is a simple qr encoder for DRM panic.
//!
//! Due to the Panic constraint, it doesn't allocate memory and does all
//! the work on the stack or on the provided buffers. For
//! simplification, it only supports Low error correction, and apply the
//! first mask (checkboard). It will draw the smallest QRcode that can
//! contain the string passed as parameter. To get the most compact
//! QR-code, the start of the url is encoded as binary, and the
//! compressed kmsg is encoded as numeric.
//!
//! The binary data must be a valid url parameter, so the easiest way is
//! to use base64 encoding. But this waste 25% of data space, so the
//! whole stack trace won't fit in the QR-Code. So instead it encodes
//! every 13bits of input into 4 decimal digits, and then use the
//! efficient numeric encoding, that encode 3 decimal digits into
//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
//! into 40bits in the QR-Code, so wasting only 2.5%. And numbers are
//! valid url parameter, so the website can do the reverse, to get the
//! binary data.
//!
//! Inspired by this 3 projects, all under MIT license:
//!
//! * https://github.com/kennytm/qrcode-rust
//! * https://github.com/erwanvivien/fast_qr
//! * https://github.com/bjguillot/qr

> +/// drm_panic_qr_generate()
> +///
> +/// C entry point for the rust QR Code generator
> +///
> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
> +/// if the data doesn't fit in a QR code.
> +///
> +/// url: the base url of the QR code. will be encoded as Binary segment.
> +/// data: pointer to the binary data, to be encoded. if url is NULL, it will be
> +///       encoded as Binary segment. otherwise it will be encoded efficiently as
> +///       Numeric segment, and appendended to the url.
> +/// data_len: length of the data, that needs to be encoded.
> +/// data_size: size of data buffer, it should be at least 4071 bytes to hold a
> +///            V40 QR-code. it will then be overwritten with the QR-code image.
> +/// tmp: a temporary buffer that the QR-code encoder will use, to write the
> +///      segments data and ECC.
> +/// tmp_size: size of the tmp buffer, it must be at least 3706 bytes long for V40

The same applies here. When rendered using markdown, the above will be
rendered like this:

url: the base url of the QR code. will be encoded as Binary segment.
data: pointer to the binary data, to be encoded. if url is NULL, it will
be encoded as Binary segment. otherwise it will be encoded efficiently
as Numeric segment, and appendended to the url. data_len: length of the
data, that needs to be encoded. data_size: size of data buffer, it
should be at least 4071 bytes to hold a V40 QR-code. it will then be
overwritten with the QR-code image. tmp: a temporary buffer that the
QR-code encoder will use, to write the segments data and ECC. tmp_size:
size of the tmp buffer, it must be at least 3706 bytes long for V40

I don't think that's what you wanted.

> +#[no_mangle]
> +pub extern "C" fn drm_panic_qr_generate(
> +    url: *const i8,
> +    data: *mut u8,
> +    data_len: usize,
> +    data_size: usize,
> +    tmp: *mut u8,
> +    tmp_size: usize,
> +) -> u8 {
> +    if data_size <= 4071 || tmp_size <= 3706 {
> +        return 0;
> +    }
> +    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
> +    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
> +    if url.is_null() {
> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
> +            None => 0,
> +            Some(em) => {
> +                let qr_image = QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    } else {
> +        let url_str: &str = unsafe { CStr::from_char_ptr(url).as_str_unchecked() };
> +        let segments = &[
> +            &Segment::Binary(url_str.as_bytes()),
> +            &Segment::Numeric(&data_slice[0..data_len]),
> +        ];
> +        match EncodedMsg::new(segments, tmp_slice) {
> +            None => 0,
> +            Some(em) => {
> +                let qr_image = QrImage::new(&em, data_slice);
> +                qr_image.width
> +            }
> +        }
> +    }
> +}

It's very nice that you've isolated all of the unsafe code to this
function. That makes it very easy to review.

A few comments:

First, all unsafe blocks must be annotated with a safety comment. For
example:

// SAFETY: The caller ensures that `data` is valid for `data_size`
// bytes, and that it is valid for writing.
let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };

Unsafe functions are those that can trigger memory safety problems if
you call them incorrectly, and you must annotate calls with a safety
comment that explains why this call cannot result in memory safety
issues. In this case, you can just say that the caller promises to pass
you reasonable arguments.


The next unsafe block is a bit more interesting.

> +        let url_str: &str = unsafe { CStr::from_char_ptr(url).as_str_unchecked() };

Here, you call two unsafe functions:

* `CStr::from_char_ptr`
* `CStr::as_str_unchecked`

If you read the documentation, you will find these safety requirements:

/// # Safety
///
/// `ptr` must be a valid pointer to a `NUL`-terminated C string, and it must
/// last at least `'a`. When `CStr` is alive, the memory pointed by `ptr`
/// must not be mutated.

/// # Safety
///
/// The contents must be valid UTF-8.

Your unsafe block *must* have a safety comment that explains why the
above things are satisfied. The requirements of `from_char_ptr` are
okay, but is it really the case that `url` is necessarily valid UTF-8?

You never actually use the fact that it's UTF-8 anywhere, so you can
just not call `as_str_unchecked`. The `CStr` type also has an `as_bytes`
method, so there's no reason to go through the `&str` type.



Finally, `drm_panic_qr_generate` should really be marked unsafe. By not
marking it unsafe, you are saying that no matter what the arguments are,
calling the function will not result in memory safety problems. That's
not really true. If I call it with `data` being a null pointer, you're
going to have a bad time.

You probably want something along these lines:

/// # Safety
///
/// * `url` must be null or point at a nul-terminated string.
/// * `data` must be valid for reading and writing for `data_size` bytes.
/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
#[no_mangle]
pub unsafe extern "C" fn drm_panic_qr_generate(

As long as the above requirements are satisfied, calling
`drm_panic_qr_generate` should never cause memory unsafety, so this is
an appropriate list of safety requirements.

(You also require that `data_len <= data_size`, but if this is violated
you get a kernel panic which isn't a memory safety problem, so it does
not need to be listed in the safety requirements.)

Alice
